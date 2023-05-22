//
//  BusinessImageView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import SwiftUI

struct BusinessImageView: View {
	
	@StateObject var vm: BusinessImageViewModel
	
	init(imageUrl: String) {
		_vm = StateObject(wrappedValue: BusinessImageViewModel(imageUrl: imageUrl))
	}
	
    var body: some View {
		 ZStack {
			 if let image = vm.image {
				 Image(uiImage: image)
					 .resizable()
					 .scaledToFill()
			 } else if vm.isLoading {
				 ProgressView()
			 } else {
				 Image(systemName: "questionmark")
					 .foregroundColor(Color.theme.secondaryText)
			 }
		 }
    }
}
