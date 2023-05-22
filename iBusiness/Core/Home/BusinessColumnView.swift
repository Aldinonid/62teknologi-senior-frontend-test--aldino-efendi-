//
//  BusinessColumnView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import SwiftUI

struct BusinessColumnView: View {
	
	let business: BusinessModel
	
	var body: some View {
		VStack(alignment: .leading) {
			BusinessImageView(imageUrl: business.imageUrl)
				.frame(width: 200, height: 200)
				.roundedCorner(10, corners: [.topLeft, .topRight])
			VStack(alignment: .leading) {
				Text(business.name)
					.font(.headline)
					.foregroundColor(Color.theme.accent)
				Text(business.isClosed ? "Closed" : "Open")
					.font(.subheadline)
					.foregroundColor(business.isClosed ? Color.theme.red : Color.theme.green)
			}
			.padding([.leading, .bottom, .top], 10)
		}
		.background(
			RoundedRectangle(cornerRadius: 25)
				.fill(Color.theme.background)
				.shadow(
					color: Color.theme.accent.opacity(0.15),
					radius: 10, x: 0, y: 0
				)
		)
	}
	
}

