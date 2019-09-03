//
//  secondViewController.swift
//  collection View In TableView
//
//  Created by apple on 8/14/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    var retrivedImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        print(retrivedImage)
        
        secondImage.image = retrivedImage
        //self.datasource = homeViewDatasource

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
   
}
