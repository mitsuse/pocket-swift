public enum Error: Swift.Error {
    case invalidRequest(Swift.Error)
    case invalidResponse(Swift.Error)
    case notConnected(Swift.Error)
}
