//
//  ViewController.swift
//  Worlds_Behind_Books
//
//  Created by Molly's Work Account on 6/9/18.
//  Copyright © 2018 Molly's Work Account. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var bookImageTitles = [String]()
    var bookImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let fm = FileManager.default
        let path = Bundle.main.resourcePath! //force unwrapping still required
        
        let bookTitleItems = try! fm.contentsOfDirectory(atPath: path)
        
        //distinguish item in bundle
        
        for item in bookTitleItems {
            if item.hasPrefix("book_cover") {
                print("item confirmed")
                bookImageTitles.append(item)
                print(item)
                //all the work that has to be done here
                    //rest has to be done in table-specific methods
            }
        }
 
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookImageTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //distinguish a cell object from the table view and index path
        let cell = tableView.dequeueReusableCell(withIdentifier: "cover", for: indexPath)
        //distinguish the contents of the cell object
        cell.textLabel?.text = bookImageTitles[indexPath.row]
        
        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cvScreen = storyboard?.instantiateViewController(withIdentifier: "Cover") as? CoverViewController  {
            cvScreen.selectedCover = bookImageTitles[indexPath.row]
            
            //have to include a 'push' action from navigation controller to move to other screen
            //for now, will just include image of book cover
            navigationController?.pushViewController(cvScreen, animated: true)
            print("pushed")
        }
    }
    
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

