//
//  HotelData.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import Foundation

struct HotelData: Decodable {
    var id: Int
    var title: String
    var description: String
    var address: String
    var postcode: String
    var phoneNumber: String
    var latitude: String
    var longitude: String
    
    
}
