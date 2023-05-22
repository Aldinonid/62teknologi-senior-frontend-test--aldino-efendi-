//
//  DetailViewModel.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import Foundation
import SwiftUI
import MapKit
import Combine

class DetailViewModel: ObservableObject {
	
	@Published var business: BusinessDetailModel? = nil
	@Published var mapLocations: [Location] = []
	
	@Published var days: [String] = [
		"Monday",
		"Tuesday",
		"Wednesday",
		"Thursday",
		"Friday",
		"Saturday",
		"Sunday"
	]
	
	// Current region on map
	@Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
	var mapCoordinates = CLLocationCoordinate2D()
	var mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
	
	private let detailService: BusinessDetailDataService
	private var cancellables = Set<AnyCancellable>()
	
	init(urlString: String) {
		self.detailService = BusinessDetailDataService(urlString: urlString)
		self.addSubscribers()
	}
	
	func addSubscribers() {
		detailService.$businessDetail
			.sink { (returnedBusinessDetail) in
				self.business = returnedBusinessDetail
				self.mapCoordinates.latitude = returnedBusinessDetail?.coordinates.latitude ?? 0.1
				self.mapCoordinates.longitude = returnedBusinessDetail?.coordinates.longtitude ?? 0.1
				self.updateLocation(location: returnedBusinessDetail?.coordinates ?? Coordinate(latitude: 0.0, longtitude: 0.0))
				self.updateMapRegion()
			}
			.store(in: &cancellables)
	}
	
	private func updateLocation(location: Coordinate) {
		mapLocations.append(Location(coordinate: CLLocationCoordinate2D(latitude: location.latitude ?? 0.0, longitude: location.longtitude ?? 0.0)))
	}

	private func updateMapRegion() {
		withAnimation(.easeInOut) {
			mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapSpan)
		}
	}
	
	
}
