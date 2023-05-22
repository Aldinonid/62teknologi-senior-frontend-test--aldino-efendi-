//
//  BusinessDetailModel.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-21.
//

import Foundation
import CoreLocation

// JSON Data
/*
 URL:
 https://api.yelp.com/v3/businesses/nRO136GRieGtxz18uD61DA
 
 Response:
 {
 "id": "nRO136GRieGtxz18uD61DA",
 "alias": "eleven-madison-park-new-york",
 "name": "Eleven Madison Park",
 "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/s_H7gm_Hwmz--O6bo1iU-A/o.jpg",
 "is_claimed": true,
 "is_closed": false,
 "url": "https://www.yelp.com/biz/eleven-madison-park-new-york?adjust_creative=DSj6I8qbyHf-Zm2fGExuug&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=DSj6I8qbyHf-Zm2fGExuug",
 "phone": "+12128890905",
 "display_phone": "(212) 889-0905",
 "review_count": 2397,
 "categories": [
 {
 "alias": "newamerican",
 "title": "American (New)"
 },
 {
 "alias": "french",
 "title": "French"
 },
 {
 "alias": "cocktailbars",
 "title": "Cocktail Bars"
 }
 ],
 "rating": 4.5,
 "location": {
 "address1": "11 Madison Ave",
 "address2": "",
 "address3": "",
 "city": "New York",
 "zip_code": "10010",
 "country": "US",
 "state": "NY",
 "display_address": [
 "11 Madison Ave",
 "New York, NY 10010"
 ],
 "cross_streets": "24th St"
 },
 "coordinates": {
 "latitude": 40.7416907417333,
 "longitude": -73.9872074872255
 },
 "photos": [
 "https://s3-media1.fl.yelpcdn.com/bphoto/s_H7gm_Hwmz--O6bo1iU-A/o.jpg",
 "https://s3-media3.fl.yelpcdn.com/bphoto/fBVmBzznkQAqrOrj7tCDZQ/o.jpg",
 "https://s3-media1.fl.yelpcdn.com/bphoto/0RAiS972PfpogOeJiFoOZg/o.jpg"
 ],
 "price": "$$$$",
 "hours": [
 {
 "open": [
 {
 "is_overnight": false,
 "start": "1730",
 "end": "2200",
 "day": 0
 },
 {
 "is_overnight": false,
 "start": "1730",
 "end": "2200",
 "day": 1
 },
 {
 "is_overnight": false,
 "start": "1730",
 "end": "2200",
 "day": 2
 },
 {
 "is_overnight": false,
 "start": "1700",
 "end": "2300",
 "day": 3
 },
 {
 "is_overnight": false,
 "start": "1700",
 "end": "2300",
 "day": 4
 },
 {
 "is_overnight": false,
 "start": "1200",
 "end": "1400",
 "day": 5
 },
 {
 "is_overnight": false,
 "start": "1700",
 "end": "2300",
 "day": 5
 },
 {
 "is_overnight": false,
 "start": "1700",
 "end": "2300",
 "day": 6
 }
 ],
 "hours_type": "REGULAR",
 "is_open_now": false
 }
 ],
 "transactions": []
 }
 
 */

enum SortDirection {
	case asc
	case desc
}

struct BusinessDetailModel: Identifiable, Codable {
	let id, alias, name, price, phone, displayPhone: String
	let imageUrl, url: String
	let reviewCount: Int
	let isClosed, isClaimed: Bool
	let rating, distance: Double?
	let transactions: [String]?
	let categories: [BusinessCategory]
	let coordinates: Coordinate
	let location: BusinessLocation?
	let photos: [String]
	let hours: [BusinessHour]
	
	enum CodingKeys: String, CodingKey {
		case id, alias, name, price, phone, url, categories, rating, coordinates, location, distance, transactions, hours, photos
		case displayPhone = "display_phone"
		case imageUrl = "image_url"
		case isClaimed = "is_claimed"
		case isClosed = "is_closed"
		case reviewCount = "review_count"
	}
}

struct HourOpen: Hashable, Codable {
	let isOvernight: Bool
	let start: String
	let end: String
	let day: Int
	
	enum CodingKeys: String, CodingKey {
		case start, end, day
		case isOvernight = "is_overnight"
	}
}

struct BusinessHour: Hashable, Codable {
	let open: [HourOpen]
	let hoursType: String
	let isOpenNow: Bool
	
	enum CodingKeys: String, CodingKey {
		case open
		case hoursType = "hours_type"
		case isOpenNow = "is_open_now"
	}
}

struct BusinessCategory: Hashable, Codable {
	let alias, title: String
}

struct Location: Identifiable {
	let id = UUID()
	let coordinate: CLLocationCoordinate2D
}

struct Coordinate: Codable {
	let latitude, longtitude: Double?
}

struct BusinessLocation: Hashable, Codable {
	let city, zipCode, country, state: String?
	let displayAddress: [String]
	
	enum CodingKeys: String, CodingKey {
		case city, country, state
		case displayAddress = "display_address"
		case zipCode = "zip_code"
	}
}
