//
//  BikeStationModel.swift
//  BikeStationTest
//
//  Created by Kacper Kowalski on 01.08.2018.
//  Copyright © 2018 Kacper Kowalski. All rights reserved.
//

import Foundation

struct BikesStation {
    
    let title: String
    let bike: String
    let bikeRacks: String
    let freeBikeRacks: String
}

extension BikesStation {
    
    struct Key {
        static let properties = "properties"
        static let label = "label"
        static let freeBikeRacks = "free_racks"
        static let bikes = "bikes"
        static let bikeRacks = "bike_racks"
    }
    
    init?(json: [String: AnyObject]) {
        guard let properties = json[Key.properties] as? [String : AnyObject],
            let title = properties[Key.label] as? String,
            let freeBikeRacks = properties[Key.freeBikeRacks] as? String,
            let bikes = properties[Key.bikes] as? String,
            let bikeRacks = properties[Key.bikeRacks] as? String
            
            else {
                return nil
        }
        
        self.title = title
        self.bike = bikes
        self.bikeRacks = bikeRacks
        self.freeBikeRacks = freeBikeRacks
        
    }
}
