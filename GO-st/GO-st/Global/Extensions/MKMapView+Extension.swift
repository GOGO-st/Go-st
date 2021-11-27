//
//  MKMapView+Extension.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import MapKit

extension MKMapView {
    
    // CLLocationDistance 값이 작을수록 줌인
    func centerToLocation(_ location: CLLocationCoordinate2D, regionRadius: CLLocationDistance = 300) { //200
        let coordinateRegion = MKCoordinateRegion(
            center: location,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
    
    // MARK: - 줌 아웃 제한
    // 이정도면 수도권까지 줌아웃 가능
    func setZoom(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        self.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        self.setCameraZoomRange(zoomRange, animated: true)
    }
}
