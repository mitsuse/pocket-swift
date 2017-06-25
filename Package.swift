import PackageDescription

let package = Package(
    name: "Pocket",
    dependencies: [
        .Package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            majorVersion: 3,
            minor: 5
        ),
        .Package(
            url: "https://github.com/ikesyo/Himotoki.git",
            majorVersion: 3,
            minor: 1
        ),
    ]
)
