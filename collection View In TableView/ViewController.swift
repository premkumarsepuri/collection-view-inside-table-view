//
//  ViewController.swift
//  collection View In TableView
//
//  Created by apple on 8/14/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
  
//  
//    func image(imageView2: String) {
//        let next = self.storyboard?.instantiateViewController(withIdentifier: "second") as! secondViewController
//   
//        self.present(next, animated: true, completion: nil)
//        
//    }
//    
  
    
 
    
 

    @IBOutlet weak var secondTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        secondTableView.delegate = self
        secondTableView.dataSource = self
        secondTableView.estimatedRowHeight = 150
       // secondTableView.tableFooterView = UIView()
       
        NotificationCenter.default.addObserver(self, selector: #selector(showDataReceivedFromVC2(notification:)) , name: Notification.Name(rawValue: "myNotification"), object: nil)
        
       
       
        
}
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Title \(section)"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
        
        var cell = secondTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
  
        return cell!
   
    }
    
  
    @objc func showDataReceivedFromVC2(notification: Notification)  {
        if let message = notification.userInfo{
            var data = message as! NSDictionary
          //  print(data)
            var messages = data.object(forKey:"message") as! NSDictionary
          //  print(message)
            var data3 = messages["imageKey"]
            print(data3)
            let next = self.storyboard?.instantiateViewController(withIdentifier: "second") as! secondViewController
            next.retrivedImage = data3 as! UIImage
            self.present(next, animated: true, completion: nil)
        
            
         }
        
  
   
    

    
    
    
} // end of the class
}
