import XCTest
import RxBlocking

@testable import Pocket

final class PostAddTest: XCTestCase {
    static var allTests: [(String, (PostAddTest) -> () throws -> Void)] {
        return [
            ("testAddWithoutOptional", testAddWithoutOptional),
        ]
    }

    func testAddWithoutOptional() {
        let url = URL(string: "https://github.com/mitsuse/pocket-swift")!
        let client = ClientDefault(consumerKey: Environment.consumerKey)
        do {
            let response =
                try client
                    .postAdd(accessToken: Environment.accessToken, url: url, title: nil, tags: nil, tweetId: nil)
                    .toBlocking()
                    .first()
            XCTAssertNotNil(response)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
