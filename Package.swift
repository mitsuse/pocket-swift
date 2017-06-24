import PackageDescription

let package = Package(
    name: "Pocket",
    dependencies: [
        .Package(
            url: "https://github.com/ishkawa/APIKit.git",
            majorVersion: 3,
            minor: 1
        ),
        .Package(
            url: "https://github.com/ikesyo/Himotoki.git",
            majorVersion: 3,
            minor: 1
        ),
    ]
)
