//
//  DogCollectionViewCell.swift
//  KaleidoScopeSample
//
//  Created by shoichiyamazaki on 2018/08/14.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit
import SDWebImage

class DogCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "DogCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imgUrl: String? {
        didSet {
            guard let imgUrl = imgUrl, let url = URL(string: imgUrl) else { return }
            imageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.white.cgColor
        // Initialization code
    }

}
