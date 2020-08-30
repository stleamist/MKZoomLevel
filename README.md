<p align="center">
    <img src="/Docs/Images/MKZoomLevel-Icon.svg">
    <img src="/Docs/Images/MKZoomLevel-Logotype.svg">
</p>

<p align="center">
    <a href="https://github.com/stleamist/MKZoomLevel/releases/latest">
        <img src="https://img.shields.io/github/v/tag/stleamist/MKZoomLevel?label=version&labelColor=303840" alt="version">
    </a>
    <a href="https://swift.org/">
        <img src="https://img.shields.io/badge/Swift-5.0+-F05138?labelColor=303840" alt="Swift: 5.0+">
    </a>
    <a href="https://www.apple.com/ios/">
        <img src="https://img.shields.io/badge/iOS-9.0+-007AFF?labelColor=303840" alt="iOS: 9.0+">
    </a>
    <a href="https://www.apple.com/macos/">
        <img src="https://img.shields.io/badge/macOS-10.11+-007AFF?labelColor=303840" alt="macOS: 10.11+">
    </a>
    <a href="https://developer.apple.com/tvos/">
        <img src="https://img.shields.io/badge/tvOS-9.2+-007AFF?labelColor=303840" alt="tvOS: 9.2+">
    </a>
    <br>
    <a href="https://github.com/stleamist/MKZoomLevel/actions?query=workflow%3A%22Build+on+Xcode+%28latest%29%22">
        <img src="https://github.com/stleamist/MKZoomLevel/workflows/Build%20on%20Xcode%20(latest)/badge.svg" alt="Build on Xcode (latest)">
    </a>
    <a href="https://github.com/stleamist/MKZoomLevel/actions?query=workflow%3A%22Build+on+Xcode+%2812+beta%29%22">
        <img src="https://github.com/stleamist/MKZoomLevel/workflows/Build%20on%20Xcode%20(12%20beta)/badge.svg" alt="Build on Xcode (12 beta)">
    </a>
    <br>
    <a href="https://swift.org/package-manager/">
        <img src="https://img.shields.io/badge/SwiftPM-compatible-29CC52?labelColor=303840" alt="SwiftPM: compatible">
    </a>
    <a href="/LICENSE">
            <img src="https://img.shields.io/github/license/stleamist/MKZoomLevel?color=blue&labelColor=303840" alt="license">
        </a>
    <a href="https://twitter.com/stleamist">
        <img src="https://img.shields.io/badge/contact-@stleamist-1DA1F2?labelColor=303840" alt="contact: @stleamist">
    </a>
</p>

# MKZoomLevel
MKZoomLevel is an implementation of zoom level getter & setter for MKMapView that works exactly the same as the private `_zoomLevel` property without resetting the camera angle.

## Features
- It returns exactly the same value as the internal `_zoomLevel` value as well as when the orientation or the angle is changed, which is in the `MKMapView`’s private API.
- It preserves the value of `heading` and `pitch` of the `camera` property for a new zoom level as they are, rather than resetting the camera angle.
- It returns the latest zoom level even when the animation of region change is not finished, in contrast with the `camera` property.

## Usage
```swift
import MapKit
import MKZoomLevel

let mapView = MKMapView()

// Get the zoom level
mapView.zoomLevel

// Set the zoom level
mapView.zoomLevel = 16.0

// Set the zoom level with an animation
mapView.setZoomLevel(16.0, animated: true)
```

## Installation
### Swift Package Manager
Add this repository as a dependency in your [`Package.swift`](https://developer.apple.com/documentation/swift_packages/package):

```swift
// swift-tools-version:5.1

import PackageDescription

let package = Package(
    ...,
    dependencies: [
        .package(url: "https://github.com/stleamist/MKZoomLevel.git", .upToNextMajor(from: "1.0.0"))
    ],
    ...
)
```

### Xcode
Select File \> Swift Packages \> Add Package Dependency, then enter the following URL:

```
https://github.com/stleamist/MKZoomLevel.git
```

For more details, see [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## License
MKZoomLevel is released under the MIT license. See [LICENSE](/LICENSE) for details.
