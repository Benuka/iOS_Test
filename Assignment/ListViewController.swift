//
//  ListViewController.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = []
    var hotels = [HotelData]()
    
    class FullResponse : Decodable{
        let data : [HotelData]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos = createArray()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        /*downloadJSON {
            print("Successful")
        }*/
    }
    
    func createArray() -> [Video] {
        var tempVideos: [Video] = []
        
        let video1 = Video(title: "SuperMan")
        let video2 = Video(title: "BatMan")
        let video3 = Video(title: "SpiderMan")
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        
        return tempVideos

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
                        print(self.hotels[0].id)
                        
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

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelCell") as! ListViewCell
        
        cell.setVideo(video: video)
        return cell
    
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
