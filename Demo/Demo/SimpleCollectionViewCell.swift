//
//  SimpleCollectionViewCell.swift
//  Demo
//
//  Created by shoichiyamazaki on 2018/08/22.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit

class SimpleCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "SimpleCollectionViewCell"
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
}
