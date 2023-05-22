//
//  UIApplication.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import Foundation
import SwiftUI

extension UIApplication {
	
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
}
