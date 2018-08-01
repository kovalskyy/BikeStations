//
//  BikeStationViewModel.swift
//  BikeStationTest
//
//  Created by Kacper Kowalski on 01.08.2018.
//  Copyright © 2018 Kacper Kowalski. All rights reserved.
//

import Foundation

struct BikeStationViewModel {
    
    let title: String
    let bike: String
    let bikeRacks: String
    let freeBikeRacks: String
    
    init(model: BikesStation) {
        self.title = model.title.uppercased()
        self.bike = model.bike
        self.bikeRacks = model.bikeRacks
        self.freeBikeRacks = model.freeBikeRacks
    }
}
