use dioxus::prelude::{to_owned, UnboundedReceiver, UseState};
use futures_util::{StreamExt, TryStreamExt};
use shared::{App, Capabilities, Core, Effect, Event, ViewModel};
use std::rc::Rc;
use wasm_bindgen_futures::spawn_local;

use crate::{http, sse};

pub fn new() -> Rc<Core<Effect, App>> {
    Rc::new(Core::new::<Capabilities>())
}

pub async fn core_service(
    core: &Rc<Core<Effect, App>>,
    mut rx: UnboundedReceiver<Event>,
    view: UseState<ViewModel>,
) {
    while let Some(event) = rx.next().await {
        update(core, event, &view);
    }
}

pub fn update(core: &Rc<Core<Effect, App>>, event: Event, view: &UseState<ViewModel>) {
    log::debug!("event: {:?}", event);
    for effect in core.process_event(event) {
        process_effect(core, effect, view);
    }
}

pub fn process_effect(core: &Rc<Core<Effect, App>>, effect: Effect, view: &UseState<ViewModel>) {
    log::debug!("effect: {:?}", effect);
    match effect {
        Effect::Render(_) => {
            view.set(core.view());
        }
        Effect::Http(mut request) => {
            spawn_local({
                to_owned![core, view];
                async move {
                    let response = http::request(&request.operation).await.unwrap();
                    for effect in core.resolve(&mut request, response) {
                        process_effect(&core, effect, &view);
                    }
                }
            });
        }
        Effect::ServerSentEvents(mut request) => {
            spawn_local({
                to_owned![core, view];
                async move {
                    let mut stream = sse::request(&request.operation).await.unwrap();

                    while let Ok(Some(response)) = stream.try_next().await {
                        for effect in core.resolve(&mut request, response) {
                            process_effect(&core, effect, &view);
                        }
                    }
                }
            });
        }
    };
}