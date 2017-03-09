//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 08/03/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var dataSource : [(String? , Double?)] = [
        ("E o vento levou", 10.0),
        ("Titanic",9.0),
        ("Matrix",10.0),
        ("Homem-Aranha",8.5),
        ("Superman",9.5),
        ("O Cubo",10.0),
        (nil,10.0),
        (nil,8.5),
        ("Superman",9.5),
        ("O Cubo",10.0),
        ("O Cubo",10.0),
        ("Homem-Aranha",8.5),
        ("Superman",9.5),
        (nil,10.0),
        ("O Cubo",10.0),
        ("O Cubo",nil),
        ("O Cubo",nil),
        ("O Cubo",nil),
        ("O Cubo",10.0)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Methods
    func loadLocalJSON(){
        if let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json"){
            let data: Data = try! Data(contentsOf: jsonURL)
            
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
            for item in json {
                let title = item["title"] as! String
                let duration = item["duration"] as! String
                let summary = item["summary"] as! String
                let imageName = item["image_name"] as! String
                let rating = item["rating"] as! Double
                let movie = Movie(title: title, rating: rating, summary: summary, duration: duration, imageName: imageName)
                movie.categories = item["categories"] as! [String]
                
            }
        }
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.detailTextLabel?.text = ""
        cell.textLabel?.text = ""
        if let title = dataSource[indexPath.row].0{
            cell.textLabel?.text = title
        }
        if let rating = dataSource[indexPath.row].1 {
            cell.detailTextLabel?.text = "\(rating)"
        }
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
