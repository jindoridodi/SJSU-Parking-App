//
//  ContentView.swift
//  SJSU Parking
//
//  Created by Brian Ou on 5/19/26.
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {
    // Map Position
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3361257, longitude: -121.8812224),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.005)
        )
    )
    
    // Map Style

    // Display Map
    var body: some View {
        Map(position: $position)
            .edgesIgnoringSafeArea(.all) // Fills the entire screen
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
