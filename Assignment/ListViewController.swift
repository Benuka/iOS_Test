//
//  ListViewController.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var name = ["fefevf","feev","fefefe","fwevev"]
    var hotels = [HotelData]()
    
    class FullResponse : Decodable{
        let data : [HotelData]
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ListViewCell")
        // Do any additional setup after loading the view.
        /*downloadJSON {
            print("Successful")
        }*/
    }
    
    func downloadJSON(completed: @escaping () -> ()){
        let urlstring = "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels";
        let url = URL(string:urlstring)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                do{
                    let a = try JSONDecoder().decode(FullResponse.self, from: data!)
                    self.hotels = a.data;
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath)// as! ListViewCell;
        cell.textLabel?.text = "ifhaam";
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var name = ["fefevf","feev","fefefe","fwevev"]
        return 5
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
