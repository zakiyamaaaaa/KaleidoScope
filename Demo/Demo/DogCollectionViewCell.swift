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
    
    static var nib: UINib {
        return UINib(nibName: DogCollectionViewCell.cellIdentifier, bundle: nil)
    }
    
    var imgUrl: String? {
        didSet {
            guard let imgUrl = imgUrl, let url = URL(string: imgUrl) else { return }
            imageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // Initialization code
    }

}
