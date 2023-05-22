//
//  DetailView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import SwiftUI
import MapKit

struct DetailView: View {
	
	@StateObject var vm: DetailViewModel
	
	init(urlString: String) {
		_vm = StateObject(wrappedValue: DetailViewModel(urlString: urlString))
	}
	
    var body: some View {
		 ScrollView {
			 VStack(spacing: 20) {
				 if((vm.business) != nil) {
					 TabView {
						 ForEach(vm.business?.photos ?? [], id: \.self) { index in
							 BusinessImageView(imageUrl: index)
						 }
					 }
					 .frame(height: 300)
					 .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
					 .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
					 
					 VStack(spacing: 20) {
						 overview
						 addressTitle
						 Divider()
						 addressView
						 Divider()
						 phoneView
						 hourTitle
						 hourView
						 
					 }
					 .padding()
					 
				 } else {
					 VStack {
						 Spacer()
						 ProgressView()
						 Spacer()
					 }
				 }
				 
				 Spacer()
				 
					 .navigationTitle(vm.business?.name ?? "")
					 .navigationBarTitleDisplayMode(.inline)
			 }
		 }
    }
	
}

extension DetailView {
	
	private var addressTitle: some View {
		Text("Address")
			.font(.title)
			.bold()
			.foregroundColor(Color.theme.accent)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	private var phoneView: some View {
		HStack {
			VStack {
				Text("Phone")
					.font(.title)
					.bold()
					.foregroundColor(Color.theme.accent)
					.frame(maxWidth: .infinity, alignment: .leading)
				Text(vm.business?.displayPhone ?? "")
					.font(.body)
					.foregroundColor(Color.theme.accent)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			Image(systemName: "phone.circle")
				.font(.largeTitle)
				.foregroundColor(Color.theme.accent)
				.frame(width: 50, height: 50)
		}
	}
	
	private var overview: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(vm.business?.name ?? "")
				.font(.title)
				.foregroundColor(Color.theme.accent)
			
			HStack() {
				StarRatingView(rating: vm.business?.rating ?? 0.0)
				
				HStack {
					Text("\(vm.business?.reviewCount ?? 0) reviews")
						.font(.body)
						.foregroundColor(Color.theme.accent)
				}
			}
			.font(.caption)
			
			HStack {
				Text(vm.business?.isClaimed ?? false ? "Claimed" : "Unclaimed")
					.foregroundColor(Color.theme.accent)
				
				Text("•")
					.foregroundColor(Color.theme.accent)
				
				Text(vm.business?.price ?? "")
					.foregroundColor(Color.theme.accent)
				
				Text("•")
					.foregroundColor(Color.theme.accent)
				
				HStack {
					ForEach(vm.business?.categories ?? [], id: \.self) { index in
						Text(index.title)
							.foregroundColor(Color.theme.accent)
					}
				}
			}
			.font(.caption)
			
			HStack {
				Text(vm.business?.hours[0].isOpenNow ?? true ? "Open" : "Closed")
					.font(.body)
					.foregroundColor(vm.business?.hours[0].isOpenNow ?? true ? Color.theme.green : Color.theme.red)
				Text(
					"\(vm.business?.hours[0].open[0].start.separate(every: 2, with: ":") ?? "00:00") - \(vm.business?.hours[0].open[0].end.separate(every: 2, with: ":") ?? "00:00")"
				)
					.font(.body)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	private var addressView: some View {
		VStack {
			HStack(spacing: 8) {
				VStack(alignment: .leading) {
					ForEach(vm.business?.location?.displayAddress ?? [], id: \.self) { index in
						Text(index)
							.font(.body)
							.foregroundColor(Color.theme.accent)
					}
				}
				mapLayer
				
			}
			Button {
				let latitude = vm.business?.coordinates.latitude ?? 0.0
				let longitude = vm.business?.coordinates.longtitude ?? 0.0
				let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
				
				if UIApplication.shared.canOpenURL(url!) {
					UIApplication.shared.open(url!, options: [:], completionHandler: nil)
				}
			} label: {
				Text("Get Direction")
					.frame(maxWidth: .infinity)
					.font(.title2)
					.foregroundColor(Color.theme.background)
					.padding(.vertical)
					.background(Color.theme.accent)
					.cornerRadius(10)
			}
		}
	}
	
	private var mapLayer: some View {
		Map(
			coordinateRegion: $vm.mapRegion,
			annotationItems: vm.mapLocations,
			annotationContent: { location in
				MapAnnotation(coordinate: vm.mapCoordinates) {
					LocationMapAnnotationView()
				}
			}
		)
			.frame(height: 100)
//		Map(coordinateRegion: $vm.mapRegion,
//			 annotationItems: vm.locations,
//			 annotationContent: { location in
//			MapAnnotation(coordinate: location.coordinates) {
//				LocationMapAnnotationView()
//					.scaleEffect(vm.mapLocation == location ? 1 : 0.7)
//					.shadow(radius: 10)
//					.onTapGesture {
//						vm.showNextLocation(location: location)
//					}
//			}
//		})
	}
	
	private var hourTitle: some View {
		Text("Hours")
			.font(.title)
			.bold()
			.foregroundColor(Color.theme.accent)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	private var hourView: some View {
		VStack(spacing: 10) {
			ForEach(vm.business?.hours ?? [], id: \.self) { hour in
				ForEach(hour.open, id: \.self) { data in
					HStack {
						Text(vm.days[data.day])
							.frame(maxWidth: .infinity, alignment: .leading)
						Text("\(data.start.separate(every: 2, with: ":")) - \(data.end.separate(every: 2, with: ":"))")
							.frame(maxWidth: .infinity, alignment: .leading)
					}
				}
			}
		}
	}
	
	
	
}
