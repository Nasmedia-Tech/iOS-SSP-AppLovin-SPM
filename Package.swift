// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AdMixerMediationAppLovin",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AdMixerMediationAppLovin",
            targets: ["iOS_SSP_AppLovin_SPM"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            "13.3.1"..<"13.5.2"
        ),
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.3.6"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "iOS_SSP_AppLovin_SPM",
            dependencies: [
                "AdMixerMediationAppLovinBinary",
                .product(name: "AppLovinSDK",
                         package: "AppLovin-MAX-Swift-Package"),
                .product(name: "AdMixerMediation",
                         package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-AppLovin-SPM"
        ),
        .binaryTarget(
            name: "AdMixerMediationAppLovinBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-AppLovin-SPM/releases/download/1.0.7/AdMixerMediationAppLovin1.0.7.xcframework.zip",
            checksum: "e62d1182435de40e35b8e616a1abb8804231594ad6baab1f1227ead14e1e205c"
        )
    ]
)
