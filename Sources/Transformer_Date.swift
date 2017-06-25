import Foundation
import Himotoki

private let gmtDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter
}()

let gmtDateTransformer = Transformer<String, Date?> { s throws -> Date? in
    guard s != "0000-00-00 00:00:00" else { return nil }
    switch gmtDateFormatter.date(from: s) {
    case let .some(date): return date
    case .none: throw customError("Invalid string to translate: \(s)")
    }
}
