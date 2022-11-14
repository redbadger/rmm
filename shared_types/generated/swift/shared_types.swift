import Serde


public struct CatImage: Hashable {
    @Indirect public var file: String

    public init(file: String) {
        self.file = file
    }

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        try serializer.serialize_str(value: self.file)
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> CatImage {
        try deserializer.increase_container_depth()
        let file = try deserializer.deserialize_str()
        try deserializer.decrease_container_depth()
        return CatImage.init(file: file)
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> CatImage {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

indirect public enum Msg: Hashable {
    case none
    case getPlatform
    case platform(PlatformMsg)
    case clear
    case get
    case fetch
    case restore
    case setState([UInt8]?)
    case setFact([UInt8])
    case setImage([UInt8])
    case currentTime(String)

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        switch self {
        case .none:
            try serializer.serialize_variant_index(value: 0)
        case .getPlatform:
            try serializer.serialize_variant_index(value: 1)
        case .platform(let x):
            try serializer.serialize_variant_index(value: 2)
            try x.serialize(serializer: serializer)
        case .clear:
            try serializer.serialize_variant_index(value: 3)
        case .get:
            try serializer.serialize_variant_index(value: 4)
        case .fetch:
            try serializer.serialize_variant_index(value: 5)
        case .restore:
            try serializer.serialize_variant_index(value: 6)
        case .setState(let x):
            try serializer.serialize_variant_index(value: 7)
            try serialize_option_vector_u8(value: x, serializer: serializer)
        case .setFact(let x):
            try serializer.serialize_variant_index(value: 8)
            try serialize_vector_u8(value: x, serializer: serializer)
        case .setImage(let x):
            try serializer.serialize_variant_index(value: 9)
            try serialize_vector_u8(value: x, serializer: serializer)
        case .currentTime(let x):
            try serializer.serialize_variant_index(value: 10)
            try serializer.serialize_str(value: x)
        }
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> Msg {
        let index = try deserializer.deserialize_variant_index()
        try deserializer.increase_container_depth()
        switch index {
        case 0:
            try deserializer.decrease_container_depth()
            return .none
        case 1:
            try deserializer.decrease_container_depth()
            return .getPlatform
        case 2:
            let x = try PlatformMsg.deserialize(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .platform(x)
        case 3:
            try deserializer.decrease_container_depth()
            return .clear
        case 4:
            try deserializer.decrease_container_depth()
            return .get
        case 5:
            try deserializer.decrease_container_depth()
            return .fetch
        case 6:
            try deserializer.decrease_container_depth()
            return .restore
        case 7:
            let x = try deserialize_option_vector_u8(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .setState(x)
        case 8:
            let x = try deserialize_vector_u8(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .setFact(x)
        case 9:
            let x = try deserialize_vector_u8(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .setImage(x)
        case 10:
            let x = try deserializer.deserialize_str()
            try deserializer.decrease_container_depth()
            return .currentTime(x)
        default: throw DeserializationError.invalidInput(issue: "Unknown variant index for Msg: \(index)")
        }
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> Msg {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

indirect public enum PlatformMsg: Hashable {
    case get
    case set(String)

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        switch self {
        case .get:
            try serializer.serialize_variant_index(value: 0)
        case .set(let x):
            try serializer.serialize_variant_index(value: 1)
            try serializer.serialize_str(value: x)
        }
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> PlatformMsg {
        let index = try deserializer.deserialize_variant_index()
        try deserializer.increase_container_depth()
        switch index {
        case 0:
            try deserializer.decrease_container_depth()
            return .get
        case 1:
            let x = try deserializer.deserialize_str()
            try deserializer.decrease_container_depth()
            return .set(x)
        default: throw DeserializationError.invalidInput(issue: "Unknown variant index for PlatformMsg: \(index)")
        }
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> PlatformMsg {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

public struct Request: Hashable {
    @Indirect public var uuid: [UInt8]
    @Indirect public var body: RequestBody

    public init(uuid: [UInt8], body: RequestBody) {
        self.uuid = uuid
        self.body = body
    }

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        try serialize_vector_u8(value: self.uuid, serializer: serializer)
        try self.body.serialize(serializer: serializer)
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> Request {
        try deserializer.increase_container_depth()
        let uuid = try deserialize_vector_u8(deserializer: deserializer)
        let body = try RequestBody.deserialize(deserializer: deserializer)
        try deserializer.decrease_container_depth()
        return Request.init(uuid: uuid, body: body)
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> Request {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

indirect public enum RequestBody: Hashable {
    case time
    case http(String)
    case platform
    case kVRead(String)
    case kVWrite(String, [UInt8])
    case render

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        switch self {
        case .time:
            try serializer.serialize_variant_index(value: 0)
        case .http(let x):
            try serializer.serialize_variant_index(value: 1)
            try serializer.serialize_str(value: x)
        case .platform:
            try serializer.serialize_variant_index(value: 2)
        case .kVRead(let x):
            try serializer.serialize_variant_index(value: 3)
            try serializer.serialize_str(value: x)
        case .kVWrite(let x0, let x1):
            try serializer.serialize_variant_index(value: 4)
            try serializer.serialize_str(value: x0)
            try serialize_vector_u8(value: x1, serializer: serializer)
        case .render:
            try serializer.serialize_variant_index(value: 5)
        }
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> RequestBody {
        let index = try deserializer.deserialize_variant_index()
        try deserializer.increase_container_depth()
        switch index {
        case 0:
            try deserializer.decrease_container_depth()
            return .time
        case 1:
            let x = try deserializer.deserialize_str()
            try deserializer.decrease_container_depth()
            return .http(x)
        case 2:
            try deserializer.decrease_container_depth()
            return .platform
        case 3:
            let x = try deserializer.deserialize_str()
            try deserializer.decrease_container_depth()
            return .kVRead(x)
        case 4:
            let x0 = try deserializer.deserialize_str()
            let x1 = try deserialize_vector_u8(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .kVWrite(x0, x1)
        case 5:
            try deserializer.decrease_container_depth()
            return .render
        default: throw DeserializationError.invalidInput(issue: "Unknown variant index for RequestBody: \(index)")
        }
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> RequestBody {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

public struct Response: Hashable {
    @Indirect public var uuid: [UInt8]
    @Indirect public var body: ResponseBody

    public init(uuid: [UInt8], body: ResponseBody) {
        self.uuid = uuid
        self.body = body
    }

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        try serialize_vector_u8(value: self.uuid, serializer: serializer)
        try self.body.serialize(serializer: serializer)
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> Response {
        try deserializer.increase_container_depth()
        let uuid = try deserialize_vector_u8(deserializer: deserializer)
        let body = try ResponseBody.deserialize(deserializer: deserializer)
        try deserializer.decrease_container_depth()
        return Response.init(uuid: uuid, body: body)
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> Response {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

indirect public enum ResponseBody: Hashable {
    case http([UInt8])
    case time(String)
    case platform(String)
    case kVRead([UInt8]?)
    case kVWrite(Bool)

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        switch self {
        case .http(let x):
            try serializer.serialize_variant_index(value: 0)
            try serialize_vector_u8(value: x, serializer: serializer)
        case .time(let x):
            try serializer.serialize_variant_index(value: 1)
            try serializer.serialize_str(value: x)
        case .platform(let x):
            try serializer.serialize_variant_index(value: 2)
            try serializer.serialize_str(value: x)
        case .kVRead(let x):
            try serializer.serialize_variant_index(value: 3)
            try serialize_option_vector_u8(value: x, serializer: serializer)
        case .kVWrite(let x):
            try serializer.serialize_variant_index(value: 4)
            try serializer.serialize_bool(value: x)
        }
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> ResponseBody {
        let index = try deserializer.deserialize_variant_index()
        try deserializer.increase_container_depth()
        switch index {
        case 0:
            let x = try deserialize_vector_u8(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .http(x)
        case 1:
            let x = try deserializer.deserialize_str()
            try deserializer.decrease_container_depth()
            return .time(x)
        case 2:
            let x = try deserializer.deserialize_str()
            try deserializer.decrease_container_depth()
            return .platform(x)
        case 3:
            let x = try deserialize_option_vector_u8(deserializer: deserializer)
            try deserializer.decrease_container_depth()
            return .kVRead(x)
        case 4:
            let x = try deserializer.deserialize_bool()
            try deserializer.decrease_container_depth()
            return .kVWrite(x)
        default: throw DeserializationError.invalidInput(issue: "Unknown variant index for ResponseBody: \(index)")
        }
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> ResponseBody {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

public struct ViewModel: Hashable {
    @Indirect public var fact: String
    @Indirect public var image: CatImage?
    @Indirect public var platform: String

    public init(fact: String, image: CatImage?, platform: String) {
        self.fact = fact
        self.image = image
        self.platform = platform
    }

    public func serialize<S: Serializer>(serializer: S) throws {
        try serializer.increase_container_depth()
        try serializer.serialize_str(value: self.fact)
        try serialize_option_CatImage(value: self.image, serializer: serializer)
        try serializer.serialize_str(value: self.platform)
        try serializer.decrease_container_depth()
    }

    public func bcsSerialize() throws -> [UInt8] {
        let serializer = BcsSerializer.init();
        try self.serialize(serializer: serializer)
        return serializer.get_bytes()
    }

    public static func deserialize<D: Deserializer>(deserializer: D) throws -> ViewModel {
        try deserializer.increase_container_depth()
        let fact = try deserializer.deserialize_str()
        let image = try deserialize_option_CatImage(deserializer: deserializer)
        let platform = try deserializer.deserialize_str()
        try deserializer.decrease_container_depth()
        return ViewModel.init(fact: fact, image: image, platform: platform)
    }

    public static func bcsDeserialize(input: [UInt8]) throws -> ViewModel {
        let deserializer = BcsDeserializer.init(input: input);
        let obj = try deserialize(deserializer: deserializer)
        if deserializer.get_buffer_offset() < input.count {
            throw DeserializationError.invalidInput(issue: "Some input bytes were not read")
        }
        return obj
    }
}

func serialize_option_CatImage<S: Serializer>(value: CatImage?, serializer: S) throws {
    if let value = value {
        try serializer.serialize_option_tag(value: true)
        try value.serialize(serializer: serializer)
    } else {
        try serializer.serialize_option_tag(value: false)
    }
}

func deserialize_option_CatImage<D: Deserializer>(deserializer: D) throws -> CatImage? {
    let tag = try deserializer.deserialize_option_tag()
    if tag {
        return try CatImage.deserialize(deserializer: deserializer)
    } else {
        return nil
    }
}

func serialize_option_vector_u8<S: Serializer>(value: [UInt8]?, serializer: S) throws {
    if let value = value {
        try serializer.serialize_option_tag(value: true)
        try serialize_vector_u8(value: value, serializer: serializer)
    } else {
        try serializer.serialize_option_tag(value: false)
    }
}

func deserialize_option_vector_u8<D: Deserializer>(deserializer: D) throws -> [UInt8]? {
    let tag = try deserializer.deserialize_option_tag()
    if tag {
        return try deserialize_vector_u8(deserializer: deserializer)
    } else {
        return nil
    }
}

func serialize_vector_u8<S: Serializer>(value: [UInt8], serializer: S) throws {
    try serializer.serialize_len(value: value.count)
    for item in value {
        try serializer.serialize_u8(value: item)
    }
}

func deserialize_vector_u8<D: Deserializer>(deserializer: D) throws -> [UInt8] {
    let length = try deserializer.deserialize_len()
    var obj : [UInt8] = []
    for _ in 0..<length {
        obj.append(try deserializer.deserialize_u8())
    }
    return obj
}



public extension [Request] {
  static func bcsDeserialize(input: [UInt8]) throws -> [Request] {
    let deserializer = BcsDeserializer(input: input)
    try deserializer.increase_container_depth()
    let length = try deserializer.deserialize_len()

    var requests: [Request] = []
    for _ in 0 ..< length {
      while deserializer.get_buffer_offset() < input.count {
        let req = try Request.deserialize(deserializer: deserializer)
        requests.append(req)
      }
    }
    deserializer.decrease_container_depth()

    return requests
  }
}