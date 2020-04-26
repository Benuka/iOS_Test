//
//  ListViewController.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit
import SDWebImage

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var name = ["fefevf","feev","fefefe","fwevev"]
    var hotels : [HotelData] = []
    
    class FullResponse : Decodable{
        let data : [HotelData]
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(ListViewCell.self, forCellReuseIdentifier: "ListViewCell")
        tableView.delegate = self;
        tableView.dataSource = self;
        // Do any additional setup after loading the view.
        downloadJSON {
            self.tableView.reloadData()
            print("Successful")
        }
    }
    
    func downloadJSON(completed: @escaping () -> ()){
        let urlstring = "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels";
        let url = URL(string:urlstring)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                do{
                    let a = try JSONDecoder().decode(FullResponse.self, from: data!)
                    self.hotels.append(contentsOf: a.data)
                    print(self.hotels.count)
                    
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("Error: " + error.localizedDescription)
                }
            }
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hotel = self.hotels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListViewCell;
        cell.nameLbl?.text = hotel.title
        cell.addresslbl?.text = hotel.address
//        WebImage(url: URL(string:hotel.image.small))
//            .onSuccess{image,cacheType in
//                cell.img.image = image
//            }
//        .onFailure{ error in
//            print(error)
//        }
        cell.imageView?.sd_setImage(with: URL(string:hotel.image.small), completed: { image, error, cachType, url in
            cell.imageView?.image = image
        })
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var name = ["fefevf","feev","fefefe","fwevev"]
        return self.hotels.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

//extension ViewController: UITableViewDelegate,UITableViewDataSource{
//
//
//    /*func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListViewCell
//        var name = ["fefevf","feev","fefefe","fwevev"]
//        cell?.nameLbl.text = name[indexPath.row]
//        return cell!
//    }*/
//
//
//
//}
