import PackageDescription

let package = Package(
  name: "Spinner",
  targets: [
    Target(name: "Spinner"),
    Target(name: "SpinnerDemo", dependencies: ["Spinner"]),
  ],
  dependencies: [
  ],
  exclude: [
     // "Sources/SpinnerDemo"
  ]
)
