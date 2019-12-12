//
//  MapView.swift
//  SwiftUITest
//
//  Created by My MacBook Pro on 2019/12/12.
//  Copyright © 2019 SHSwift. All rights reserved.
//

import SwiftUI
import MapKit
//UIViewRepresentable 只能在iOS13.0 和 TVOS 13.0使用
struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context:Context) {
        let location = CLLocationCoordinate2D(latitude: 40.0049, longitude: 116.2896)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
