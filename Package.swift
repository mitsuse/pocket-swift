import PackageDescription

let package = Package(
    name: "Pocket",
    dependencies: [
        .Package(
            url: "https://github.com/mitsuse/APIKit.git",
            Version(
                3,
                1,
                2,
                buildMetadataIdentifier: "linux"
            )
        ),
        .Package(
            url: "https://github.com/ikesyo/Himotoki.git",
            majorVersion: 3,
            minor: 1
        ),
    ]
)
