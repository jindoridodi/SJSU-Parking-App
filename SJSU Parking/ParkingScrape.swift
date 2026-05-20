//
//  ParkingScrape.swift
//  SJSU Parking
//
//  Created by Brian Ou on 5/19/26.
//

import Foundation
import SwiftSoup

final class ParkingScrape {
    // Function to get HTML of SJSU Parking Website
    func getHTML() async -> [Int]? {
        // SJSU Webpage
        guard let url = URL(string: "https://sjsuparkingstatus.sjsu.edu/")
        else {
            return nil
        }

        do {
            // Get HTML
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let html = String(data: data, encoding: .utf8) else {
                return nil
            }

            // Parse document
            let document = try SwiftSoup.parse(html)

            // Get Garage Parking
            let garageFullness = try document.select("span.garage__fullness")

            // Add to array
            var garageFullnessArray = [Int]()
            for garage in garageFullness {
                let digits = try garage.text().filter { $0.isNumber }
                if let number = Int(digits) {
                    garageFullnessArray.append(number)
                }
            }

            // Print array
            print("Garage Fullness Array:")
            for garageFullness in garageFullnessArray {
                print(garageFullness)
            }

            // Return Fullness Array
            // [North Garage, West Garage, South Garage, South Campus Garage]
            return garageFullnessArray
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
