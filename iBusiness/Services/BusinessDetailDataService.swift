//
//  BusinessDetailDataService.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import Foundation
import Combine

class BusinessDetailDataService {
	
	@Published var businessDetail: BusinessDetailModel? = nil
	var businessDetailSubscription: AnyCancellable?
	
	init(urlString: String) {
		getBusinessDetail(urlString: urlString)
	}
	
	private func getBusinessDetail(urlString: String) {
		guard let url = URL(string: "https://api.yelp.com/v3/businesses/\(urlString)") else {
			print("Invalid URL")
			return
		}
		
		businessDetailSubscription = NetworkingManager.download(url: url)
			.decode(type: BusinessDetailModel.self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedBusinessDetail in
				self?.businessDetail = returnedBusinessDetail
				self?.businessDetailSubscription?.cancel()
			})
		
	}
	
}
