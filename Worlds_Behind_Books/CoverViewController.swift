//
//  CoverViewController.swift
//  Worlds_Behind_Books
//
//  Created by Molly's Work Account on 6/11/18.
//  Copyright © 2018 Molly's Work Account. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UIScrollViewDelegate {
    
    
    var selectedCover: String?
    @IBOutlet var imageView: UIImageView!
    var containerView: UIView!
    var scrollView: UIScrollView!
    
    var tableBottomAnchor: NSLayoutConstraint?
    //var textBottomAnchor: NSLayoutConstraint?
    var tableChildView: UITableView!
    
    var mediaTypes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCover
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedCover {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        //containerView = UIView()
        
    
        
        //no scroll view by default, just treat it as with any other object
        self.scrollView = UIScrollView()
        scrollView.delegate = self
        //works!
         //but is content size required or can we just use the frame
        self.scrollView.contentSize = self.view.frame.size
        self.view.addSubview(scrollView)
       // self.scrollView.addSubview(containerView)
        //containerView.isUserInteractionEnabled = true
      //  containerView.addSubview(imageView)
        
        
        imageView.contentMode = .scaleToFill
        
        let textChildView = UITextView(frame: CGRect(x: 0, y: 480, width: self.view.frame.width, height: 100))
        textChildView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //constraints here
        //delete them from IB first
        
        textChildView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        textChildView.delegate = self
        //do we need to formally register this view - would make sense
        //not now because it's already included in the interface builder
        //save for another branch
        textChildView.isUserInteractionEnabled = false
        
    
        
       self.view.addSubview(textChildView)
        //scrollView.addSubview(textChildView) need to get this to work
       // containerView.addSubview(textChildView)
        
        
        tableChildView = UITableView()
         mediaTypes += ["Art", "Music" , "Environment", "Social Backgrounds","Video Clips"]
        
      
        tableChildView = UITableView(frame: CGRect(x: 0, y: 590, width: self.view.frame.width, height: 200))
          //textChildView.bottomAnchor.constraint(equalTo: tableChildView.topAnchor, constant: 10).isActive = true
        
        //add constraints here
        
        tableChildView.translatesAutoresizingMaskIntoConstraints = false;
      // tableChildView.topAnchor.constraint(equalTo: textChildView.bottomAnchor).isActive = true
        
      
        
        tableChildView.dataSource = self
        tableChildView.delegate = self
        //storyboard no longer required!!
        tableChildView.register(UITableViewCell.self, forCellReuseIdentifier: "mediaType")
        
        
        //formally add
        
        self.view.addSubview(tableChildView)
        
       
        //containerView.addSubview(tableChildView)
    }
    
    
    override func viewDidLayoutSubviews() {
        tableBottomAnchor = tableChildView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20)
        tableBottomAnchor?.isActive = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaType", for: indexPath)
        //distinguish the contents of the cell object
        cell.textLabel?.text = mediaTypes[indexPath.row]
        return cell
    }
        
        //mediaTypes.append("Art")
        
      /* let tableChildView = UITableView(frame: CGRect(x: 0, y: 591, width: self.view.frame.width, height: 200)) // 'let' because never mutated but may change
        tableChildView.register(UITableViewCell.self, forCellReuseIdentifier: "MediaType")
        
        tableChildView.dataSource = self
        tableChildView.delegate = self
        self.view.addSubview(tableChildView)
        
       // self.mediaTypes.append("Art")
       // self.mediaTypes.append("Music")
        
       /* tableChildView.beginUpdates()
        tableChildView.insertRows(at: [IndexPath.init(row: self.mediaTypes.count-1, section: 0)], with: .automatic)
        tableChildView.endUpdates() */
        
        
        
        //getting rid of persistent keyboard
      /*  let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)) //odd fix */
        
        //essential step to a tap
        /*view.addGestureRecognizer(tap) */
        
      
        
    }
    
   /* func dismissKeyboard() {
        view.endEditing(true)
    } */
    
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
        return mediaTypes.count //when the 'optional unwrapping' error is persistent
                                    // make sure that '?' and '??' are both implemented
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaType", for: indexPath)
        //distinguish the contents of the cell object
        cell.textLabel?.text = mediaTypes[indexPath.row]
        return cell
    } */

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


