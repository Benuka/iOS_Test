//
//  ListViewController.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var name = ["fefevf","feev","fefefe","fwevev"]
    var hotels = [HotelData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        downloadJSON {
            print("Successful")
        }
    }
    
    func downloadJSON(completed: @escaping () -> ()){
        let url = URL(string: "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do{
                    self.hotels = try JSONDecoder().decode([HotelData].self, from: data!)
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

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var name = ["fefevf","feev","fefefe","fwevev"]
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListViewCell
        var name = ["fefevf","feev","fefefe","fwevev"]
        cell?.nameLbl.text = name[indexPath.row]
        return cell!
    }

}
