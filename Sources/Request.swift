import Foundation
import APIKit
import Himotoki

public protocol Request: APIKit.Request {
}

extension Request {
    public var baseURL: URL { return URL(string: "https://getpocket.com")! }

    public var headerFields: [String: String] {
        return [
            "Accept": "application/json, */*",
        ]
    }

    public var dataParser: DataParser { return JSONDataParser(readingOptions: []) }
}

extension Request where Response: Decodable {
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}

public protocol Authorized {
    var consumerKey: String { get }
    var accessToken: String { get }
    var additionalParameters: [String: Any] { get }
}

extension Request where Self: Authorized {
    public var bodyParameters: BodyParameters? {
        let authorizationParameters: [String: Any] = [
            "consumer_key": consumerKey,
            "access_token": accessToken,
        ]
        return JSONBodyParameters(JSONObject: merge(authorizationParameters, additionalParameters))
    }
}
