//
//  BusinessRowView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import SwiftUI

struct BusinessRowView: View {
	
	let business: BusinessModel
	
    var body: some View {
		 HStack(spacing: 18) {
			 BusinessImageView(imageUrl: business.imageUrl)
				 .frame(width: 50, height: 50)
				 .cornerRadius(10)
			 VStack(alignment: .leading) {
				 Text(business.name)
					 .font(.title2)
					 .foregroundColor(Color.theme.accent)
				 Text(business.isClosed ? "Closed" : "Open")
					 .font(.subheadline)
					 .foregroundColor(business.isClosed ? Color.theme.red : Color.theme.green)
			 }
			 Spacer()
		 }
    }
}

