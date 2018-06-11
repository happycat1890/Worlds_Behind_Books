//
//  CoverViewController.swift
//  Worlds_Behind_Books
//
//  Created by Molly's Work Account on 6/11/18.
//  Copyright © 2018 Molly's Work Account. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedCover: String?
    @IBOutlet var imageView: UIImageView!
    
    var mediaTypes: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCover
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedCover {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        let tableChildView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height, width: self.view.frame.width, height: self.view.frame.height)) // 'let' because never mutated but may change
        tableChildView.register(UITableViewCell.self, forCellReuseIdentifier: "MediaType")
        tableChildView.dataSource = self
        tableChildView.delegate = self
        self.view.addSubview(tableChildView)
        
       /* let tableChild = storyboard?.instantiateViewController(withIdentifier: "tableChild")
        self.addChildViewController(tableChild!)
        self.view.addSubview(tableChild?.view ?? self.view)
        tableChild?.didMove(toParentViewController: self) */
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaTypes?.count ?? 0 //when the 'optional unwrapping' error is persistent
                                    // make sure that '?' and '??' are both implemented
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
