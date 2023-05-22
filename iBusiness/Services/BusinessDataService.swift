//
//  BusinessDataService.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-19.
//

import Foundation
import CoreLocation
import Combine

class BusinessDataService {
	
	@Published var NYCBusinesses: [BusinessModel] = []
	@Published var nearBusinesses: [BusinessModel] = []
	@Published var searchedBusinesses: [BusinessModel] = []
	var businessSubscription: AnyCancellable?
	
	init() {
		getAllBusinessesNYC()
	}
	
	private func getAllNearBusinessses() {
		guard let latitude = CLLocationManager().location?.coordinate.latitude else {
			print("Latitude can't found")
			return
		}
		
		guard let longitude = CLLocationManager().location?.coordinate.longitude else {
			print("Longitutde can't found")
			return
		}
		
		guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)") else {
			print("Invalid URL")
			return
		}
		
		businessSubscription = NetworkingManager.download(url: url)
			.decode(type: BusinessResponseModel.self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedBusiness in
				self?.nearBusinesses = returnedBusiness.businesses
				self?.businessSubscription?.cancel()
			})
		
	}
	
	private func getAllBusinessesNYC() {
		guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?location=NYC") else {
			print("Invalid URL")
			return
		}

		businessSubscription = NetworkingManager.download(url: url)
			.decode(type: BusinessResponseModel.self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedBusiness in
				self?.NYCBusinesses = returnedBusiness.businesses
				self?.businessSubscription?.cancel()
			})
	}
	
}
