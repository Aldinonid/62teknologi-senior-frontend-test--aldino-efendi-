//
//  HomeViewModel.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
	
	@Published var searchText: String = ""
	@Published var disabledSearchText: String = ""
	@Published var showSearchView: Bool = false
	@Published var searchedBusiness: [BusinessModel] = []
	@Published var NYCBusinesses: [BusinessModel] = []
	@Published var nearBusinesses: [BusinessModel] = []
	
	private let dataService = BusinessDataService()
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		addSubscribers()
	}
	
	func addSubscribers() {
		dataService.$NYCBusinesses
			.sink { [weak self] (returnedBusinesses) in
				self?.NYCBusinesses = returnedBusinesses
			}
			.store(in: &cancellables)
		
		dataService.$nearBusinesses
			.sink { [weak self] (returnedBusinesses) in
				self?.nearBusinesses = returnedBusinesses
			}
			.store(in: &cancellables)
		
		$searchText
			.debounce(for: 0.5, scheduler: RunLoop.main)
			.sink { text in
				if !text.isEmpty {
					self.searchBusinesses(query: text)
				}
			}
			.store(in: &cancellables)
			
	}
	
	func searchBusinesses(query: String, params: String = "") {
		guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?location=\(query)") else { return }
		
		let _ = NetworkingManager.download(url: url)
			.decode(type: BusinessResponseModel.self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedBusiness in
				self?.searchedBusiness = returnedBusiness.businesses
			})
	}
	
}
