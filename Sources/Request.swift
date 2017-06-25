import Foundation
import Himotoki

protocol Request {
    associatedtype Response

    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headerFields: [String: String] { get }
    var bodyParameters: [String: Any] { get }
    var bodyEncoder: BodyEncoder { get }
    var bodyDecoder: BodyDecoder { get }

    func decode(responseBody object: Any, urlResponse: URLResponse) throws -> Response
}

extension Request {
    var baseURL: URL { return URL(string: "https://getpocket.com")! }
    var bodyParameters: [String: Any] { return [:] }
}

extension Request where Response: Decodable {
    func decode(responseBody object: Any, urlResponse: URLResponse) throws -> Response {
        return try decodeValue(object)
    }
}

public protocol Authorized {
    var consumerKey: String { get }
    var accessToken: String { get }
    var additionalBodyParameters: [String: Any] { get }
}

extension Request where Self: Authorized {
    var bodyParameters: [String: Any] {
        let authorizationParameters: [String: Any] = [
            "consumer_key": consumerKey,
            "access_token": accessToken,
        ]
        return merge(authorizationParameters, additionalBodyParameters)
    }
}
