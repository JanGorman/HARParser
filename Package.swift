// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "HARParser",
  products: [
    .library(
      name: "HARParser",
      targets: ["HARParser"]),
    ],
  targets: [
    .target(
      name: "HARParser",
      dependencies: []),
    .testTarget(
      name: "HARParserTests",
      dependencies: ["HARParser"]),
    ]
)
