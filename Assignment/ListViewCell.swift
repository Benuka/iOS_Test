//
//  ListViewCell.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    
//    func setHotels(hotels: HotelData ){
//        nameLbl.text = hotels.title
//    }
    
    func setVideo(video: Video) {
        nameLbl.text = video.title
    }
}
