(function() {
    var implementors = Object.fromEntries([["crux",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux/config/struct.Core.html\" title=\"struct crux::config::Core\">Core</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux/config/struct.Shell.html\" title=\"struct crux::config::Shell\">Shell</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux/config/struct.Workspace.html\" title=\"struct crux::config::Workspace\">Workspace</a>"]]],["crux_core",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_core/capability/enum.Never.html\" title=\"enum crux_core::capability::Never\">Never</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_core/render/struct.RenderOperation.html\" title=\"struct crux_core::render::RenderOperation\">RenderOperation</a>"],["impl&lt;Eff&gt; <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_core/bridge/struct.Request.html\" title=\"struct crux_core::bridge::Request\">Request</a>&lt;Eff&gt;<div class=\"where\">where\n    Eff: <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> + <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a>,</div>"]]],["crux_http",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_http/enum.HttpError.html\" title=\"enum crux_http::HttpError\">HttpError</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_http/protocol/enum.HttpResult.html\" title=\"enum crux_http::protocol::HttpResult\">HttpResult</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_http/protocol/struct.HttpHeader.html\" title=\"struct crux_http::protocol::HttpHeader\">HttpHeader</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_http/protocol/struct.HttpRequest.html\" title=\"struct crux_http::protocol::HttpRequest\">HttpRequest</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_http/protocol/struct.HttpResponse.html\" title=\"struct crux_http::protocol::HttpResponse\">HttpResponse</a>"],["impl&lt;Body&gt; <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_http/struct.Response.html\" title=\"struct crux_http::Response\">Response</a>&lt;Body&gt;<div class=\"where\">where\n    Body: <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a>,</div>"]]],["crux_kv",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_kv/enum.KeyValueOperation.html\" title=\"enum crux_kv::KeyValueOperation\">KeyValueOperation</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_kv/enum.KeyValueResponse.html\" title=\"enum crux_kv::KeyValueResponse\">KeyValueResponse</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_kv/enum.KeyValueResult.html\" title=\"enum crux_kv::KeyValueResult\">KeyValueResult</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_kv/error/enum.KeyValueError.html\" title=\"enum crux_kv::error::KeyValueError\">KeyValueError</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_kv/value/enum.Value.html\" title=\"enum crux_kv::value::Value\">Value</a>"]]],["crux_platform",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_platform/struct.PlatformRequest.html\" title=\"struct crux_platform::PlatformRequest\">PlatformRequest</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_platform/struct.PlatformResponse.html\" title=\"struct crux_platform::PlatformResponse\">PlatformResponse</a>"]]],["crux_time",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_time/enum.TimeRequest.html\" title=\"enum crux_time::TimeRequest\">TimeRequest</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_time/enum.TimeResponse.html\" title=\"enum crux_time::TimeResponse\">TimeResponse</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"enum\" href=\"crux_time/error/enum.TimeError.html\" title=\"enum crux_time::error::TimeError\">TimeError</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_time/duration/struct.Duration.html\" title=\"struct crux_time::duration::Duration\">Duration</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_time/instant/struct.Instant.html\" title=\"struct crux_time::instant::Instant\">Instant</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"crux_time/struct.TimerId.html\" title=\"struct crux_time::TimerId\">TimerId</a>"]]],["doctest_support",[["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"doctest_support/compose/capabilities/capability_one/struct.OpOne.html\" title=\"struct doctest_support::compose::capabilities::capability_one::OpOne\">OpOne</a>"],["impl <a class=\"trait\" href=\"https://docs.rs/serde/1.0.217/serde/ser/trait.Serialize.html\" title=\"trait serde::ser::Serialize\">Serialize</a> for <a class=\"struct\" href=\"doctest_support/compose/capabilities/capability_two/struct.OpTwo.html\" title=\"struct doctest_support::compose::capabilities::capability_two::OpTwo\">OpTwo</a>"]]]]);
    if (window.register_implementors) {
        window.register_implementors(implementors);
    } else {
        window.pending_implementors = implementors;
    }
})()
//{"start":57,"fragment_lengths":[799,1213,1909,1385,609,1649,706]}