//
//  CoverViewController.swift
//  Worlds_Behind_Books
//
//  Created by Molly's Work Account on 6/9/18.
//  Copyright © 2018 Molly's Work Account. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController {

    var selectedCover: String?
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCover
        
        navigationItem.largeTitleDisplayMode = .never //look up more info on navigationItem
        
        if let coverToLoad = selectedCover { //mandatory check + distributing the pictures
            imageView.image = UIImage(named: coverToLoad)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
