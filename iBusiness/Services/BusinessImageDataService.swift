//
//  BusinessImageDataService.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import Foundation
import SwiftUI
import Combine

class BusinessImageDataService {
	
	@Published var image: UIImage? = nil
	private var imageSubscription: AnyCancellable?

	init(imageUrl: String) {
		getBusinessImage(imageUrl: imageUrl)
	}
	
	private func getBusinessImage(imageUrl: String) {
		guard let url = URL(string: imageUrl) else {
			print("Invalid URL")
			return
		}
		
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ data -> UIImage? in
				return UIImage(data: data)
			})
			.sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedImage in
				self?.image = returnedImage
				self?.imageSubscription?.cancel()
			})
		
	}
	
}
