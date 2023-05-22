//
//  LocationMapAnnotationView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
	
	var body: some View {
		VStack {
			Image(systemName: "map.circle.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 30)
				.font(.headline)
				.foregroundColor(.white)
				.padding(6)
				.background(Color.theme.accent)
				.clipShape(Circle())
			
			Image(systemName: "triangle.fill")
				.resizable()
				.scaledToFit()
				.foregroundColor(Color.theme.accent)
				.frame(width: 10, height: 10)
				.rotationEffect(Angle(degrees: 180))
				.offset(y: -3)
				.padding(.bottom, 40)
		}
	}
	
}
