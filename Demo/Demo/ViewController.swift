//
//  ViewController.swift
//  KaleidoScopeSample
//
//  Created by shoichiyamazaki on 2018/08/11.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
///Users/shoichiyamazaki/Desktop/KaleidoScope/Source/KaleidoCollectionView.swift

import UIKit

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = KaleidoScopeCollectionView(frame: view.bounds)
        collectionView.dataSource = self
        collectionView.register(SimpleCollectionViewCell.self, forCellWithReuseIdentifier: SimpleCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    let numberofCells = 30
    fileprivate var dogImageUrlList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        
    }

}

// MARK: - UICollectionDataSource
extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberofCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleCollectionViewCell.cellIdentifier, for: indexPath) as? SimpleCollectionViewCell else { return UICollectionViewCell() }
        cell.label.text = indexPath.row.description
        return cell
    }

}

