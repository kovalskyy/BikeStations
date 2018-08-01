//
//  UIView+Shadow.swift
//  BikeStationTest
//
//  Created by Kacper Kowalski on 01.08.2018.
//  Copyright © 2018 Kacper Kowalski. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize.zero
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
}
