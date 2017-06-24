import Foundation
import APIKit
import Himotoki

struct AddRequest: Request, Authorized {
    typealias Response = AddResponse

    let method: HTTPMethod = .post
    let path = "/v3/add"

    let consumerKey: String
    let accessToken: String
    let url: URL
    let title: String?
    let tags: String?
    let tweetId: String?

    var additionalParameters: [String: Any] {
        var parameters: [String: Any] = [
            "url": url.absoluteString,
        ]
        if let value = title { parameters["title"] = value }
        if let value = tags { parameters["tags"] = value }
        if let value = tweetId { parameters["tweetId"] = value }
        return parameters
    }
}

public struct AddResponse {
    public let item: ItemJson
    public let status: Int
}

extension AddResponse: Decodable {
    public static func decode(_ e: Extractor) throws -> AddResponse {
        return try AddResponse(
            item: e <| "item",
            status: e <| "status"
        )
    }
}
