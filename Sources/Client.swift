import Foundation
import RxSwift

public protocol Client {
    func postAdd(accessToken: String, url: URL, title: String?, tags: String?, tweetId: String?) -> Single<PostAddResponse>
}
