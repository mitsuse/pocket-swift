## Unreleased

- Improve tests for `PostAddRequest`.
- Fix: A value `"0000-00-00 00:00:00"` cannot be transformed into `Date`. It should be treated as `nil`.


## 0.1.5

- Avoid to cancel `URLSessionTask` on disposing subscription. Cancellation is not supported yet on Linux.


## 0.1.4

- Remove APIKit from dependencies to compile on Linux.
- Fix: `ClientDefault` should conform `Client` protocol.


## 0.1.3

- Fix: A parameter `tweetId` for `Client.postAdd` should be optional.


## 0.1.2

- `Client` type is added. All requests are sent via implementation of `Client`.
- `AddRequest` is renamed to `PostAddRequest`.


## 0.1.0

- Support `POST /v3/add`.
