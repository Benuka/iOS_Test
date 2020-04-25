//
//  HotelData.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import Foundation

struct HotelData: Decodable {
    let id: Int
    let title: String
    let description: String
    let address: String
    let postcode: String
    let phoneNumber: String
    let latitude: String
    let longitude: String
    
    
}
