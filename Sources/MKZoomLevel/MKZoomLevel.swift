import MapKit

public extension MKMapView {
    
    // MARK: Zoom Level Getter & Setter
    
    var zoomLevel: CGFloat {
        get {
            let longitudeDeltaAtRightAngle = MKZoomLevel.longitudeDeltaAtRightAngle(of: self.camera, in: self.bounds)
            return zoomLevel(from: longitudeDeltaAtRightAngle)
        }
        set {
            self.setZoomLevel(newValue, animated: false)
        }
    }
    
    func setZoomLevel(_ zoomLevel: CGFloat, animated: Bool) {
        let longitudeDeltaAtRightAngle = longitudeDelta(from: zoomLevel)
        let longitudeDistanceAtRightAngle = CLLocation(latitude: centerCoordinate.latitude, longitude: longitudeDeltaAtRightAngle).distance(from: CLLocation(latitude: centerCoordinate.latitude, longitude: 0))
        
        let region = MKCoordinateRegion(center: centerCoordinate, latitudinalMeters: 0, longitudinalMeters: longitudeDistanceAtRightAngle)
        
        let centerCoordinateDistance = MKZoomLevel.centerCoordinateDistanceAtRightAngle(of: region, in: self.bounds)
        
        let camera = MKMapCamera(
            lookingAtCenter: self.camera.centerCoordinate,
            fromDistance: centerCoordinateDistance,
            pitch: self.camera.pitch,
            heading: self.camera.heading
        )
        
        self.setCamera(camera, animated: animated)
    }
    
    // MARK: Unit Conversion
    
    private func zoomLevel(from longitudeDelta: CLLocationDegrees) -> CGFloat {
        return log2(360 * self.frame.size.width / (128 * CGFloat(longitudeDelta)))
    }
    
    private func longitudeDelta(from zoomLevel: CGFloat) -> CLLocationDegrees {
        return CLLocationDistance(360 * self.frame.size.width / (128 * exp2(zoomLevel)))
    }
}

// MARK: Calculation

struct MKZoomLevel {
    
    static private var computingMapView = MKMapView()
    static private var lock = NSLock()
    
    static func longitudeDeltaAtRightAngle(of camera: MKMapCamera, in bounds: CGRect) -> CLLocationDegrees {
        lock.lock(); defer { lock.unlock() }
        computingMapView.bounds = bounds
        computingMapView.camera = MKMapCamera(lookingAtCenter: camera.centerCoordinate, fromDistance: camera.centerCoordinateDistance, pitch: 0, heading: 0)
        return computingMapView.region.span.longitudeDelta
    }
    
    static func centerCoordinateDistanceAtRightAngle(of region: MKCoordinateRegion, in bounds: CGRect) -> CLLocationDistance {
        lock.lock(); defer { lock.unlock() }
        computingMapView.bounds = bounds
        computingMapView.region = region
        return computingMapView.camera.centerCoordinateDistance
    }
}
