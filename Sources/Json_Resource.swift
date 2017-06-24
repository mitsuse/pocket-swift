import Himotoki

public enum ResourceJson: String {
    case notContained = "0"
    case contained = "1"
    case itself = "2"
}

extension ResourceJson: Decodable {
}
