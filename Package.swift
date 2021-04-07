// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxItemArchitecture",
	platforms: [
		.iOS(.v11),
		.macOS(SupportedPlatform.MacOSVersion.v10_12)
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RxItemArchitecture",
            targets: ["RxItemArchitecture"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
		.package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
		.package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.1.0")),
		.package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", from: "5.0.1")
    ],
    targets: [
        .target(
            name: "RxItemArchitecture",
            dependencies: [
				"SnapKit",
				"RxSwift",
				.product(name: "RxCocoa", package: "RxSwift"),
				"RxDataSources"
			],
			path: "Sources"
		)
    ],
	swiftLanguageVersions: [.v5]
)
