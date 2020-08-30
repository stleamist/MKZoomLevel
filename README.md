<p align="center">
    <img src="/Docs/Images/MKZoomLevel-Icon.svg">
    <img src="/Docs/Images/MKZoomLevel-Logotype.svg">
</p>

# MKZoomLevel

[![Build on Xcode (latest)](https://github.com/stleamist/MKZoomLevel/workflows/Build%20on%20Xcode%20(latest)/badge.svg)](https://github.com/stleamist/MKZoomLevel/actions?query=workflow%3A%22Build+on+Xcode+%28latest%29%22)
[![Build on Xcode (12 beta)](https://github.com/stleamist/MKZoomLevel/workflows/Build%20on%20Xcode%20(12%20beta)/badge.svg)](https://github.com/stleamist/MKZoomLevel/actions?query=workflow%3A%22Build+on+Xcode+%2812+beta%29%22)

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
