//
//  iBusinessApp.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import SwiftUI

@main
struct iBusinessApp: App {
	
	@StateObject var vm = HomeViewModel()
	
    var body: some Scene {
        WindowGroup {
			  NavigationStack {
				  HomeView()
					  .environmentObject(vm)
			  }
        }
    }
}
