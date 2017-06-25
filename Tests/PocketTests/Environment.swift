import Foundation

enum Environment {
    static let consumerKey = ProcessInfo.processInfo.environment["POCKET_CONSUMER_KEY"]!
    static let accessToken = ProcessInfo.processInfo.environment["POCKET_ACCESS_TOKEN"]!
}
