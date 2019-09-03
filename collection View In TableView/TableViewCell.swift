//
//  TableViewCell.swift
//  collection View In TableView
//
//  Created by apple on 8/14/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit



class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray = [Any]()
   
    weak var getValObj:getVal?
    
   // var delegate:message?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imageArray = [UIImage.init(named: "1.jpeg"),UIImage.init(named: "2.jpeg"),UIImage.init(named: "3.jpeg"),UIImage.init(named: "4.jpeg"),UIImage.init(named: "5.jpeg"),UIImage.init(named: "6.jpeg"),UIImage.init(named: "7.jpeg"),UIImage.init(named: "8.jpeg"),UIImage.init(named: "9.jpeg"),UIImage.init(named: "10.jpeg")] as! [UIImage]
//       imageArray = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg","7.jpeg","8.jpeg","9.jpeg","10.jpeg"]
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
        // Configure the view for the selected state
    }
    
    
    
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
    {
        let randomNumber = Int(arc4random_uniform(UInt32(imageArray.count)))
        cell.imageView.image = imageArray[indexPath.row] as! UIImage
        //cell.imageView.image = UIImage(named: imageArray[randomNumber])
        
         cell.backgroundColor = UIColor.red
        return cell
    }
return UICollectionViewCell()
}
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 150, height: 150)
        return size
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
          //self.delegate?.indexPath(indexPath:indexPath.item)
        
        var saveData = NSMutableDictionary()
        saveData.setValue(imageArray[indexPath.row], forKey: "imageKey")

          NotificationCenter.default.post(name: Notification.Name(rawValue: "myNotification"), object: nil, userInfo: ["message" : saveData])
            
        
        
        }
      
    
    
    
    
    
    
}// end of the class
protocol getVal: class {
    func getImg(img:UIImage)
}
