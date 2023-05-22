//
//  BusinessImageViewModel.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import Foundation
import SwiftUI
import Combine

class BusinessImageViewModel: ObservableObject {
	
	@Published var image: UIImage? = nil
	@Published var isLoading: Bool = false
	
	private let dataService: BusinessImageDataService
	private var cancellables = Set<AnyCancellable>()
	
	init(imageUrl: String) {
		self.dataService = BusinessImageDataService(imageUrl: imageUrl)
		self.addSubscribers()
		self.isLoading = true
	}
	
	private func addSubscribers() {
		
		dataService.$image
			.sink { [weak self] _ in
				self?.isLoading = false
			} receiveValue: { [weak self] returnedImage in
				self?.image = returnedImage
			}
			.store(in: &cancellables)
		
	}
	
}
