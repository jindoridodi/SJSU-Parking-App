//
//  GarageViewModel.swift
//  SJSU Parking
//
//  Created by Brian Ou on 5/19/26.
//

import Combine
import Foundation
import MapKit

@MainActor
class GarageViewModel: ObservableObject {

    @Published var garages: [ParkingGarage] = [
        // North Garage
        ParkingGarage(
            name: "North Garage",
            coordinate: CLLocationCoordinate2D(
                latitude: 37.33932954409773,
                longitude: -121.88073030375321
            ),
            fullness: nil
        ),

        // West Garage
        ParkingGarage(
            name: "West Garage",
            coordinate: CLLocationCoordinate2D(
                latitude: 37.33237013261376,
                longitude: -121.88303287047128
            ),
            fullness: nil
        ),

        // South Garage
        ParkingGarage(
            name: "South Garage",
            coordinate: CLLocationCoordinate2D(
                latitude: 37.33312823069481,
                longitude: -121.88079438211923
            ),
            fullness: nil
        ),

        // South Campus Garage
        ParkingGarage(
            name: "South Campus Garage",
            coordinate: CLLocationCoordinate2D(
                latitude: 37.32080508257742,
                longitude: -121.86531552951844
            ),
            fullness: nil
        ),
    ]

    func loadParkingData() async {
        let scraper = ParkingScrape()

        if let fullness = await scraper.getParking() {
            for i in garages.indices {
                if i < fullness.count {
                    garages[i].fullness = fullness[i]
                }
            }
        }
    }
}
