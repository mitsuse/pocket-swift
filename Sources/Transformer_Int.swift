import Foundation
import Himotoki

let stringToIntTransformer = Transformer<String, Int> { s throws -> Int in
    switch Int(s) {
    case let .some(x): return x
    case .none: throw customError("Invalid string to traslate: \(s)")
    }
}
