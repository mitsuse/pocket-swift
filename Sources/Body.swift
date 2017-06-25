import Foundation

protocol BodyEncoder {
    func encode(_ object: Any) throws -> Data
}

protocol BodyDecoder {
    func decode(_ data: Data) throws -> Any
}

struct JsonBodyEncoder: BodyEncoder {
    func encode(_ object: Any) throws -> Data {
        return try JSONSerialization.data(withJSONObject: object)
    }
}

struct JsonBodyDecoder: BodyDecoder {
    func decode(_ data: Data) throws -> Any {
        return try JSONSerialization.jsonObject(with: data)
    }
}
