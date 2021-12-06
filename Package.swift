// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TVShowsAsyncAwaitService",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TVShowsAsyncAwaitService",
            targets: ["TVShowsAsyncAwaitService"]),
    ],
    dependencies: [
      .package(url: "https://github.com/Alamofire/Alamofire.git", branch: "master"),
      .package(url: "https://github.com/mihaelamj/RequestAdapter.git", from: "0.2.0"),
      .package(url: "https://github.com/mihaelamj/TVShowsEndpoint.git", branch: "main"),
      .package(url: "https://github.com/mihaelamj/TVShowsResponseResults.git", branch: "main"),
      .package(url: "https://github.com/mihaelamj/TVShowsModels.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TVShowsAsyncAwaitService",
            dependencies: ["Alamofire", "RequestAdapter", "TVShowsEndpoint", "TVShowsResponseResults", "TVShowsModels"]),
        .testTarget(
            name: "TVShowsAsyncAwaitServiceTests",
            dependencies: ["TVShowsAsyncAwaitService"]),
    ]
)
