//
//  BikeStationListViewController.swift
//  BikeStationTest
//
//  Created by Kacper Kowalski on 01.08.2018.
//  Copyright © 2018 Kacper Kowalski. All rights reserved.
//

import UIKit

class BikeStationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    let networkService = BikeStationNetworkService()
    
    private var bikeStationArray = [BikesStation]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "BikeStationTableViewCell", bundle: nil), forCellReuseIdentifier: "BikeStationTableViewCell")
        getMovies(fromService: networkService)
    }
    
    // MARK: - Network
    
    private func getMovies<S: Gettable>(fromService service: S) where S.T == Array<BikesStation?> {
        
        networkService.get { [weak self] (result) in
            switch result {
            case .Success(let stations):
                var tempStations = [BikesStation]()
                for station in stations {
                    if let station = station {
                        tempStations.append(station)
                    }
                }
                self?.bikeStationArray = tempStations
            case .Error(let error):
                print(error)
            }
        }
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikeStationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "BikeStationTableViewCell") as! BikeStationTableViewCell
        
        let bike = bikeStationArray[indexPath.row]
        let bikeStationViewModel = BikeStationViewModel(model: bike)
        cell.displayMovieInCell(using: bikeStationViewModel)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

