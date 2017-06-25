import Foundation
import Himotoki

struct PostAddRequest: Request, Authorized {
    typealias Response = PostAddResponse

    let method: HTTPMethod = .post
    let path = "/v3/add"

    let consumerKey: String
    let accessToken: String
    let url: URL
    let title: String?
    let tags: String?
    let tweetId: String?

    var headerFields: [String: String] {
        return [
            "Accept": "application/json, */*",
            "Content-Type": "application/json",
        ]
    }

    var bodyEncoder: BodyEncoder { return JsonBodyEncoder() }
    var bodyDecoder: BodyDecoder { return JsonBodyDecoder() }

    var additionalBodyParameters: [String: Any] {
        var parameters: [String: Any] = [
            "url": url.absoluteString,
        ]
        if let value = title { parameters["title"] = value }
        if let value = tags { parameters["tags"] = value }
        if let value = tweetId { parameters["tweetId"] = value }
        return parameters
    }
}

public struct PostAddResponse {
    public let item: ItemJson
    public let status: Int
}

extension PostAddResponse: Decodable {
    public static func decode(_ e: Extractor) throws -> PostAddResponse {
        return try PostAddResponse(
            item: e <| "item",
            status: e <| "status"
        )
    }
}
