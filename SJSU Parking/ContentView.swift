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
            center: CLLocationCoordinate2D(latitude: 37.3354742, longitude: -121.8825412),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
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
