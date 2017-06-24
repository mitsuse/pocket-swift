import Foundation
import APIKit
import Himotoki

public struct AddRequest: Request, Authorized {
    public typealias Response = AddResponse

    public let method: HTTPMethod = .post
    public let path = "/v3/add"

    public let consumerKey: String
    public let accessToken: String
    public let url: URL
    public let title: String?
    public let tags: String?
    public let tweetId: String?

    public init(
        consumerKey: String,
        accessToken: String,
        url: URL,
        title: String?,
        tags: String?,
        tweetId: String?
    ) {
        self.consumerKey = consumerKey
        self.accessToken = accessToken
        self.url = url
        self.title = title
        self.tags = tags
        self.tweetId = tweetId
    }

    public var additionalParameters: [String: Any] {
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
