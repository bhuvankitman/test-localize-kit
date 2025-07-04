// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LocalizationKit",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v17)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "LocalizationKit",
      targets: ["LocalizationKit"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2)
    )
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "LocalizationKit",
      dependencies: [],
      resources: [
        .process("Resources")
      ],
      plugins: [
//        Plugins.swiftgen
      ]
    ),
    .testTarget(
      name: "LocalizationKitTests",
      dependencies: ["LocalizationKit"]
    ),
  ]
)

// MARK: - Plugins
enum Plugins {
  static let swiftgen = Target.PluginUsage.plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
}
