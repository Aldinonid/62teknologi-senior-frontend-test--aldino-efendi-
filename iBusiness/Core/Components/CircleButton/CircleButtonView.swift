//
//  CircleButtonView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import SwiftUI

struct CircleButtonView: View {
	
	let iconName: String
	
    var body: some View {
        Image(systemName: iconName)
			 .font(.headline)
			 .foregroundColor(Color.theme.accent)
			 .frame(width: 50, height: 50)
			 .background(
					Circle()
						.foregroundColor(Color.theme.background)
			 )
			 .shadow(
				color: Color.theme.accent.opacity(0.25),
				radius: 10, x: 0, y: 10
			 )
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
		 CircleButtonView(iconName: "slider.horizontal.3")
			 .previewLayout(.sizeThatFits)
    }
}
