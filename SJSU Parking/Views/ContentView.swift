//
//  ContentView.swift
//  SJSU Parking
//
//  Created by Brian Ou on 5/19/26.
//

import MapKit
import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = GarageViewModel()

    // Map Position
    @State private var position = MapCameraPosition.region(
        // SJSU
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 37.3361257,
                longitude: -121.8812224
            ),
            // Zoom
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.005)
        )
    )

    // Display Map
    var body: some View {
        Map(position: $position, interactionModes: [])  // interactionModes: [] disables user map movement
        {
            ForEach(viewModel.garages) {
                garage in
                Annotation(garage.name, coordinate: garage.coordinate) {
                    VStack(spacing: 4) {
                        Text(
                            garage.fullness != nil
                                ? "\(garage.fullness!)%"
                                : "--"
                        )
                        .font(.headline)
                        .padding(8)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)  // Fills the entire screen
        .mapStyle(
            .standard(
                elevation: .realistic,
                pointsOfInterest: .including(.university, .parking),
                showsTraffic: true
            )
        )
        .preferredColorScheme(.dark)  // Dark Mode
        .task {
            await viewModel.loadParkingData()
        }

    }
}

#Preview {
    ContentView()
}
