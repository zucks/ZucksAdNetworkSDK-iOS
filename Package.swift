// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ZucksAdNetworkSDK",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        .library(
            name: "ZucksAdNetworkSDK",
            targets: ["ZucksAdNetworkSDK"]
        ),
    ],
    targets: [
        // 依存先のシステムフレームワークはXCFramework内のmodule mapで `link framework` として宣言している為、
        // ここで `linkerSettings` を指定する必要はない
        .binaryTarget(
            name: "ZucksAdNetworkSDK",
            path: "ZucksAdNetworkSDK.xcframework"
        ),
    ]
)
