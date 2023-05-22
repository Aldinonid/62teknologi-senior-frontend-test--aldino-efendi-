//
//  BusinessModel.swift
//  iBusiness
//
//  Created by Aldino Efendi on 2023-05-17.
//

import Foundation

// Yelp Business API info

// URL
/*
 URL:
	https://api.yelp.com/v3/businesses/search
 
 JSON Response:
 {
	"businesses": [
	 {
		 "id": "nRO136GRieGtxz18uD61DA",
		 "alias": "eleven-madison-park-new-york",
		 "name": "Eleven Madison Park",
		 "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/s_H7gm_Hwmz--O6bo1iU-A/o.jpg",
		 "is_closed": false,
		 "url": "https://www.yelp.com/biz/eleven-madison-park-new-york?adjust_creative=DSj6I8qbyHf-Zm2fGExuug&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=DSj6I8qbyHf-Zm2fGExuug",
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
		 "coordinates": {
			 "latitude": 40.7416907417333,
			 "longitude": -73.9872074872255
		 },
		 "transactions": [],
		 "price": "$$$$",
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
			 ]
		 },
		 "phone": "+12128890905",
		 "display_phone": "(212) 889-0905",
		 "distance": 3892.073000575764
		},
		{
		 "id": "VvsZAnEwU4c8Xkyrzx05Nw",
		 "alias": "anytime-kitchen-new-york-2",
		 "name": "Anytime Kitchen ",
		 "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/qXbHL3jcCR0G0ivt-MEYhw/o.jpg",
		 "is_closed": false,
		 "url": "https://www.yelp.com/biz/anytime-kitchen-new-york-2?adjust_creative=DSj6I8qbyHf-Zm2fGExuug&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=DSj6I8qbyHf-Zm2fGExuug",
		 "review_count": 2595,
		 "categories": [
		 {
		 "alias": "korean",
		 "title": "Korean"
		 },
		 {
		 "alias": "tapasmallplates",
		 "title": "Tapas/Small Plates"
		 },
		 {
		 "alias": "bbq",
		 "title": "Barbeque"
		 }
		 ],
		 "rating": 4.5,
		 "coordinates": {
		 "latitude": 40.74776270790539,
		 "longitude": -73.9867793576711
		 },
		 "transactions": [
		 "restaurant_reservation",
		 "pickup",
		 "delivery"
		 ],
		 "price": "$$",
		 "location": {
		 "address1": "23 W 32nd St",
		 "address2": "Fl 3",
		 "address3": "",
		 "city": "New York",
		 "zip_code": "10001",
		 "country": "US",
		 "state": "NY",
		 "display_address": [
		 "23 W 32nd St",
		 "Fl 3",
		 "New York, NY 10001"
		 ]
		 },
		 "phone": "+16466697733",
		 "display_phone": "(646) 669-7733",
		 "distance": 4552.5038684374595
	 },
	]
 }
 
 */

struct BusinessResponseModel: Codable {
	let businesses: [BusinessModel]
}

struct BusinessModel: Identifiable, Codable {
	let id, name, imageUrl: String
	let isClosed: Bool
	
	enum CodingKeys: String, CodingKey {
		case id, name
		case imageUrl = "image_url"
		case isClosed = "is_closed"
	}
}
