//
//  SocialMTViewController.swift
//  Worlds_Behind_Books
//
//  Created by Molly's Work Account on 6/21/18.
//  Copyright © 2018 Molly's Work Account. All rights reserved.
//

import UIKit

class SocialMTViewController: UIViewController {
    
    var selectedMT: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedMT

        // Do any additional setup after loading the view.
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
