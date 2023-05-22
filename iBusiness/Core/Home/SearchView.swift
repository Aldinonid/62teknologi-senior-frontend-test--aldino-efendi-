//
//  SearchView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-22.
//

import SwiftUI

struct SearchView: View {
	
	@EnvironmentObject var vm: HomeViewModel
	@Binding var showNewScreen: Bool
	
    var body: some View {
		 ZStack(alignment: .topLeading) {
			 Color.theme.background
				 .ignoresSafeArea()
			 
			 VStack(spacing: 20) {
				 HStack {
					 Button {
						 vm.searchText = ""
						 vm.searchedBusiness = []
						 showNewScreen.toggle()
					 } label: {
						 Image(systemName: "chevron.down")
							 .foregroundColor(Color.theme.accent)
							 .font(.largeTitle)
							 .padding(10)
					 }
					 
					 SearchBarView(searchText: $vm.searchText)
				 }
				 
				 if (!vm.searchedBusiness.isEmpty) {
					 VStack(spacing: 20) {
						 HStack {
							 Button {
								 vm.searchBusinesses(query: vm.searchText, params: "&open_now=false")
							 } label: {
								 Text("Open now")
									 .font(.body)
									 .padding(5)
									 .foregroundColor(Color.theme.background)
									 .background(Color.theme.accent)
									 .cornerRadius(8)
							 }
							 
							 Button {
								 
							 } label: {
								 Text("Restaurant")
									 .font(.body)
									 .padding(5)
									 .foregroundColor(Color.theme.background)
									 .background(Color.theme.accent)
									 .cornerRadius(8)
							 }
							 
							 Button {
								 
							 } label: {
								 Text("Japanese")
									 .font(.body)
									 .padding(5)
									 .foregroundColor(Color.theme.background)
									 .background(Color.theme.accent)
									 .cornerRadius(8)
							 }
							 
							 Button {
								 
							 } label: {
								 Text("Nighlife")
									 .font(.body)
									 .padding(5)
									 .foregroundColor(Color.theme.background)
									 .background(Color.theme.accent)
									 .cornerRadius(8)
							 }
						 }
						 
						 List(vm.searchedBusiness) { business in
							 NavigationLink {
								 DetailView(urlString: business.id)
							 } label: {
								 BusinessRowView(business: business)
							 }
						 }
						 .listStyle(.plain)
					 }
				 } else {
					 Text("Search a business to get a lists of business 🔍")
						 .font(.callout)
						 .foregroundColor(Color.theme.accent)
						 .fontWeight(.medium)
						 .multilineTextAlignment(.center)
						 .padding(50)
				 }
			 }
			 
			 .padding()
			 .navigationTitle("Search Business")
			 .navigationBarTitleDisplayMode(.inline)
		 }
    }
}
