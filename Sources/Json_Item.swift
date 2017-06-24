import Foundation
import Himotoki

public struct ItemJson {
    public let itemId: String
    public let normalUrl: URL
    public let resolvedId: String
    public let resolvedUrl: URL
    public let domainId: String
    public let originDomainId: String
    public let responseCode: String
    public let mimeType: String
    public let encoding: String
    public let dateResolved: Date
    public let datePublished: Date
    public let title: String
    public let excerpt: String
    public let hasImage: ResourceJson
    public let hasVideo: ResourceJson

    // NOTE: `content_length` and `word_count` is string but they represent number substantially.
    public let contentLength: Int
    public let wordCount: Int

    // NOTE: `is_index` and `is_article` is string but they represent bool substantially.
    public let isIndex: Bool
    public let isArticle: Bool

    // TODO: support decoding `authors`, `images` and `videos`.
    // public let authors: [?]
    // public let images: [?]
    // public let videos: [?]
}

extension ItemJson: Decodable {
    public static func decode(_ e: Extractor) throws -> ItemJson {
        return try ItemJson(
            itemId: e <| "item_id",
            normalUrl: urlTransformer.apply(e <| "normal_url"),
            resolvedId: e <| "resolved_id",
            resolvedUrl: urlTransformer.apply(e <| "resolved_url"),
            domainId: e <| "domain_id",
            originDomainId: "origin_domain_id",
            responseCode: e <| "response_code",
            mimeType: e <| "mime_type",
            encoding: e <| "encoding",
            dateResolved: gmtDateTransformer.apply(e <| "date_resolved"),
            datePublished: gmtDateTransformer.apply(e <| "date_published"),
            title: e <| "title",
            excerpt: e <| "excerpt",
            hasImage: e <| "has_image",
            hasVideo: e <| "has_video",
            contentLength: stringToIntTransformer.apply(e <| "content_length"),
            wordCount: stringToIntTransformer.apply(e <| "word_count"),
            isIndex: stringToBoolTransformer.apply(e <| "is_index"),
            isArticle: stringToBoolTransformer.apply(e <| "is_article")
        )
    }
}
