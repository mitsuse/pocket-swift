import Foundation
import RxSwift

public struct ClientDefault: Client {
    fileprivate let consumerKey: String
    fileprivate let session: URLSession

    public init(consumerKey: String, session: URLSession = .shared) {
        self.consumerKey = consumerKey
        self.session = session
    }

    fileprivate func send<Request: Pocket.Request>(_ request: Request) -> Single<Request.Response> {
        let session = self.session
        return Single.create { subscribe in
            var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path))
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.allHTTPHeaderFields = request.headerFields
            do {
                urlRequest.httpBody = try request.bodyEncoder.encode(request.bodyParameters)
            } catch {
                subscribe(.error(Error.invalidRequest(error)))
                return Disposables.create()
            }
            let task = session.dataTask(with: urlRequest) { data, urlResponse, error in
                switch error {
                case let .some(error):
                    subscribe(.error(Error.notConnected(error)))
                case .none:
                    do {
                        let body = try request.bodyDecoder.decode(data!)
                        let response = try request.decode(responseBody: body, urlResponse: urlResponse!)
                        subscribe(.success(response))
                    } catch {
                        subscribe(.error(Error.invalidResponse(error)))
                    }
                }
            }
            task.resume()
            return Disposables.create { [weak task] in task?.cancel() }
        }
    }
}

extension ClientDefault {
    public func postAdd(accessToken: String, url: URL, title: String?, tags: String?, tweetId: String?) -> Single<PostAddResponse> {
        return send(
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
