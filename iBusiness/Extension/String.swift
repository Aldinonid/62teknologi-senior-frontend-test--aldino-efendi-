//
//  String.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-22.
//

import Foundation

extension String {
	func separate(every stride: Int = 4, with separator: Character = " ") -> String {
		return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
	}
}
