import Foundation
import RxSwift
import APIKit

public protocol Client {
    func postAdd(accessToken: String, url: URL, title: String?, tags: String?, tweetId: String) -> Single<PostAddResponse>
}

public struct ClientDefault {
    private let consumerKey: String
    private let session: Session

    public init(consumerKey: String, session: Session = .shared) {
        self.consumerKey = consumerKey
        self.session = session
    }

    public func postAdd(accessToken: String, url: URL, title: String?, tags: String?, tweetId: String) -> Single<PostAddResponse> {
        return self.session.rx.send(
            PostAddRequest(
                consumerKey: self.consumerKey,
                accessToken: accessToken,
                url: url,
                title: title,
                tags: tags,
                tweetId: tweetId
            )
        )
    }
}
