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
    func getHTML() async {
        // SJSU Webpage
        guard let url = URL(string: "https://sjsuparkingstatus.sjsu.edu/") else {
            return
        }

        do {
            // Get HTML
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let html = String(data: data, encoding: .utf8) else { return }

            // Parse document
            let document = try SwiftSoup.parse(html)

            // Get Garage Parking
            let garageFullness = try document.select("span.garage__fullness")
            
            // Print to terminal
            print("Garage Fullness:")
            for garage in garageFullness{
                print(try garage.text())
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
