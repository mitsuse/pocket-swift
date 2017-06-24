func merge<Key: Hashable, Value>(_ x: [Key: Value], _ y: [Key: Value]) -> [Key: Value] {
    var dictionary = x
    y.forEach { key, value in dictionary[key] = value }
    return dictionary
}
