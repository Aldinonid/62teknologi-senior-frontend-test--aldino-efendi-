//
//  ContentView.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import SwiftUI

struct HomeView: View {
	
	@EnvironmentObject var vm: HomeViewModel
	
    var body: some View {
		 ZStack {
			 Color.theme.background
				 .ignoresSafeArea()
			 
			 VStack {
				 Button {
					 vm.showSearchView.toggle()
				 } label: {
					 SearchBarView(searchText: $vm.disabledSearchText)
						 .allowsHitTesting(false)
						 .padding()
				 }
				 
				 VStack(alignment: .leading, spacing: 10) {
					 Text("Business location in NYC")
						 .padding(.leading)
						 .font(.headline)
						 .foregroundColor(Color.theme.accent)
					 
					 ScrollView(.horizontal, showsIndicators: false) {
						 HStack(spacing: 18) {
							 ForEach(vm.NYCBusinesses) { index in
								 NavigationLink {
									 DetailView(urlString: index.id)
								 } label: {
									 BusinessColumnView(business: index)
								 }
							 }
						 }
						 .padding()
					 }
				 }
				 
				 VStack(alignment: .leading, spacing: 10) {
					 Text("Business location near me")
						 .padding(.leading)
						 .font(.headline)
						 .foregroundColor(Color.theme.accent)
					 
					 ScrollView(.horizontal, showsIndicators: false) {
						 HStack(spacing: 18) {
							 ForEach(vm.nearBusinesses) { index in
								 NavigationLink {
									 DetailView(urlString: index.id)
								 } label: {
									 BusinessColumnView(business: index)
								 }
							 }
						 }
						 .padding()
					 }
				 }

				 Spacer()
				 
//				 List {
//					 ForEach(vm.searchedBusiness) { index in
//						 NavigationLink {
//							 DetailView(business: index)
//						 } label: {
//							 BusinessRowView(business: index)
//								 .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
//								 .listRowBackground(Color.theme.background)
//						 }
//					 }
//				 }
//				 .listStyle(PlainListStyle())
			 }
			 .fullScreenCover(isPresented: $vm.showSearchView, content: {
				 NavigationStack {
					 SearchView(showNewScreen: $vm.showSearchView)
						 .environmentObject(vm)
				 }
			 })
			 .navigationTitle(Text("iBusiness"))
		 }
    }
}
