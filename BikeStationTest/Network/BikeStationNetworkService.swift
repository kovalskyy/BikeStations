//
//  BikeStationNetworkService.swift
//  BikeStationTest
//
//  Created by Kacper Kowalski on 01.08.2018.
//  Copyright © 2018 Kacper Kowalski. All rights reserved.
//

import Foundation

struct BikeStationService: Gettable {
    
    let endpoint: String = "http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"
    
    let downloader = JSONDownloader()
    
    typealias CurrentCompletionHandler = (Result<[BikesStation?]>) -> ()
    
    func get(completion: @escaping CurrentCompletionHandler) {
        
        guard let url = URL(string: self.endpoint) else {
            completion(.Error(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .Error(let error):
                    completion(.Error(error))
                    return
                case .Success(let json):
                    guard let entryArray = json["features"] as? [[String: AnyObject]] else {
                        completion(.Error(.jsonParsingFailure))
                        return
                    }
                    
                    let bikeStationArray = entryArray.map{BikesStation(json: $0)}
                    completion(.Success(bikeStationArray))
                }
            }
        }
        task.resume()
    }
}

protocol Gettable {
    associatedtype T
    func get(completion: @escaping (Result<T>) -> Void)
}

