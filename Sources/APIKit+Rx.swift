import APIKit
import RxSwift

extension Session: ReactiveCompatible {
}

extension Reactive where Base: Session {
    func send<Request: APIKit.Request>(_ request: Request) -> Single<Request.Response> {
        return Single.create { subscribe in
            let task = self.base.send(request) { result in
                switch result {
                case let .success(response): subscribe(.success(response))
                case let .failure(error): subscribe(.error(error))
                }
            }
            return Disposables.create { task?.cancel() }
        }
    }
}
