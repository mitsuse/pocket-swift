import Foundation
import Himotoki

let stringToBoolTransformer = Transformer<String, Bool> { s throws -> Bool in
    switch s {
    case "0": return false
    case "1": return true
    default: throw customError("Invalid string to traslate: \(s)")
    }
}
