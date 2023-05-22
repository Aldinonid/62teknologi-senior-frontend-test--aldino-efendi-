//
//  StarRatingView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import SwiftUI

struct StarRatingView: View {
	
	@State var rating: Double
	
	var body: some View {
		ZStack {
			starsView
				.overlay(overlayView.mask(starsView))
		}
	}
	
	private var overlayView: some View {
		GeometryReader { geometry in
			ZStack(alignment: .leading) {
				Rectangle()
					.foregroundColor(.yellow)
					.frame(width: CGFloat(rating) / 5 * geometry.size.width)
			}
		}
		.allowsHitTesting(false)
	}
	
	private var starsView: some View {
		HStack {
			ForEach(1..<6) { index in
				Image(systemName: "star.fill")
					.font(.body)
					.foregroundColor(Color.gray)
			}
		}
	}
}

struct MaskBootcamp_Previews: PreviewProvider {
	static var previews: some View {
		StarRatingView(rating: 4.5)
			.previewLayout(.sizeThatFits)
	}
}
