//
//  ParkingGarage.swift
//  SJSU Parking
//
//  Created by Brian Ou on 5/19/26.
//

import Foundation
import MapKit

// Struct for a parking garage
struct ParkingGarage: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    var fullness: Int?
}
