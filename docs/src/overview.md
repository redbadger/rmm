# Overview

Crux is an **experimental** approach to building cross-platform applications with better testability, higher code and behaviour reuse, better safety, security, and more joy from better tools.

It splits the application into two distinct parts, a Core built in Rust, which drives as much of the business logic as possible, and a Shell, built in the platform native language (Swift, Kotlin, TypeScript), which provides all interfaces with the external world, including the human user, and acts as a platform on which the core runs.

![Crux](./crux.png)

The interface between the two is a native FFI (Foreign Function Interface) with cross-language type checking and message passing semantics, where simple data structures are passed across the boundary.

To get playing with it quickly, follow the [Getting Started](./getting_started/core.md) steps. If you prefer to read more about it first, read the [Development Guide](./guide/hello_world.md).

## Design

![Architecture](./architecture.png)

The architecture is event-driven, based on [event sourcing](https://martinfowler.com/eaaDev/EventSourcing.html). The Core holds the majority of state, which is updated in response to events happening in the Shell. The interface between the Core and the Shell is messaged based.

The user interface layer is built natively, with modern declarative UI frameworks such as Swift UI, Jetpack Compose and React/Vue or a WASM based framework on the web. The UI layer is as thin as it can be, and all other application logic is performed by the shared Core. The one restriction is that the Core is side–effect free. This is both a technical requirement (to be able to target WebAssembly), and an intentional design goal, to separate logic from effects and make them both easier to test in isolation.

The core requests side-effects from the Shell through common [capabilities](./guide/capabilities.md). The basic concept is that instead of _doing_ the asynchronous work, the core _describes_ the intent for the work with data, and passes this to the Shell to be performed. The Shell performs the work, and returns the outcomes back to the Core. This approach is inspired by [Elm](https://elm-lang.org/), and similar to how other purely functional languages deal with effects and I/O (e.g. the IO monad in Haskell). It is also similar to how iterators work in Rust.

The Core exports types for the messages it can understand. The Shell can call the Core and pass one of the messages. In return, it receives a set of side-effect requests to perform. When the work is completed, the Shell sends the result back into the Core, which responds with further requests if necessary.

Updating the user interface is considered one of the side-effects the Core can request. The entire interface is strongly typed and breaking changes in the core will result in build failures in the Shell.

## Goals

We set out to prove this architecture to find a better way of building apps across platforms. You can read more [about our motivation](./motivation.md). The overall goals of RMM are to:

- Build the majority of the application code once, in Rust
- Follow the [Onion Architecture]() to get all its benefits
- Encapsulate the _behaviour_ of the app in the Core for reuse
- Separate the behaviour from the look and feel and interaction design
- Push side-effects to the edge, to make the behaviour of the Core easy to test
- Use the native UI tool kits to create user experience that is the best fit for a given platform