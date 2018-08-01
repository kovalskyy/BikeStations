//
//  BikeStationTableViewCell.swift
//  BikeStationTest
//
//  Created by Kacper Kowalski on 01.08.2018.
//  Copyright © 2018 Kacper Kowalski. All rights reserved.
//

import UIKit

class BikeStationTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var bikeImageView: UIImageView!
    @IBOutlet weak var bikeLabel: UILabel!
    @IBOutlet weak var bikeCounterLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var lockCounterLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configure()
        self.prepareView()
    }
    
    
    private func configure() {
        shadowView.layer.cornerRadius = 4.0
        shadowView.applyShadow()
    }
    
    private func prepareView() {
        stationLabel.text = "Bukowska"
        distanceLabel.text = "500m Bukowska 44"
        bikeImageView.image = UIImage(named: "Bike")
        bikeLabel.text = "Available Bikes"
        bikeCounterLabel.text = "15"
        lockImageView.image = UIImage(named: "Lock")
        lockLabel.text = "Available Places"
        lockCounterLabel.text = "10"
    }
    
    func displayMovieInCell(using viewModel: BikeStationViewModel) {
        stationLabel.text = viewModel.title
        bikeCounterLabel.text = viewModel.bike
        lockCounterLabel.text = viewModel.freeBikeRacks
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
