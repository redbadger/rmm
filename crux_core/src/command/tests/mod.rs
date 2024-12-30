mod effects {
    use serde::{Deserialize, Serialize};

    use super::super::Command;
    use crate::{capability::Operation, Request};

    #[derive(Debug, PartialEq, Clone, Serialize)]
    struct AnOperation;
    #[derive(Debug, PartialEq, Deserialize)]
    struct AnOperationOutput;

    impl Operation for AnOperation {
        type Output = AnOperationOutput;
    }

    enum Effect {
        AnEffect(Request<AnOperation>),
    }

    impl From<Request<AnOperation>> for Effect {
        fn from(request: Request<AnOperation>) -> Self {
            Self::AnEffect(request)
        }
    }

    #[derive(Debug, PartialEq)]
    enum Event {
        Start,
        Completed(AnOperationOutput),
    }

    #[test]
    fn done_can_be_created() {
        let cmd: Command<Effect, Event> = Command::done();

        assert!(cmd.is_done())
    }

    #[test]
    fn notify_can_be_created_with_an_operation() {
        let cmd: Command<Effect, Event> = Command::notify_shell(AnOperation);

        assert!(!cmd.is_done())
    }

    #[test]
    fn notify_effect_can_be_inspected() {
        let mut cmd: Command<_, Event> = Command::notify_shell(AnOperation);

        let mut effects = cmd.effects();

        assert!(!effects.is_empty());

        let Effect::AnEffect(request) = effects.remove(0);

        assert_eq!(request.operation, AnOperation)
    }

    #[test]
    fn request_effect_can_be_inspected() {
        let mut cmd = Command::request_from_shell(AnOperation, Event::Completed);

        let mut effects = cmd.effects();

        assert!(!effects.is_empty());

        let Effect::AnEffect(request) = effects.remove(0);

        assert_eq!(request.operation, AnOperation)
    }

    #[test]
    fn request_effect_can_be_resolved() {
        let mut cmd = Command::request_from_shell(AnOperation, Event::Completed);

        let mut effects = cmd.effects();

        assert!(cmd.events().is_empty());

        let Effect::AnEffect(mut request) = effects.remove(0);

        assert_eq!(request.operation, AnOperation);

        request
            .resolve(AnOperationOutput)
            .expect("Resolve should succeed");

        let mut events = cmd.events();

        assert!(matches!(
            events.remove(0),
            Event::Completed(AnOperationOutput)
        ));

        assert!(cmd.is_done())
    }

    #[test]
    fn stream_effect_can_be_resolved_multiple_times() {
        let mut cmd = Command::stream_from_shell(AnOperation, Event::Completed);

        let mut effects = cmd.effects();

        assert!(cmd.events().is_empty());

        let Effect::AnEffect(mut request) = effects.remove(0);

        assert_eq!(request.operation, AnOperation);

        request
            .resolve(AnOperationOutput)
            .expect("Resolve should succeed");

        let mut events = cmd.events();

        assert!(matches!(
            events.remove(0),
            Event::Completed(AnOperationOutput)
        ));

        assert!(cmd.effects().is_empty());
        assert!(cmd.events().is_empty());
        assert!(!cmd.is_done());

        request
            .resolve(AnOperationOutput)
            .expect("Resolve should succeed");

        let mut events = cmd.events();

        assert!(matches!(
            events.remove(0),
            Event::Completed(AnOperationOutput)
        ));
    }

    #[test]
    fn event_can_be_created() {
        let mut cmd: Command<Effect, _> = Command::event(Event::Start);

        let events = cmd.events();

        assert_eq!(events[0], Event::Start);
    }
}
