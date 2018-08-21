//
//  ViewController.swift
//  KaleidoScopeSample
//
//  Created by shoichiyamazaki on 2018/08/11.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
///Users/shoichiyamazaki/Desktop/KaleidoScope/Source/KaleidoCollectionView.swift

import UIKit

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView! = {
        let collectionView = KaleidoScopeCollectionView(frame: self.view.bounds)
        collectionView.dataSource = self
        collectionView.register(DogCollectionViewCell.nib, forCellWithReuseIdentifier: DogCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    fileprivate var dogImageUrlList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        
        fetchData { (dogs) in
            guard let dogs = dogs else { return }
            self.dogImageUrlList = dogs.imageUrl
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

}

extension ViewController {
    
    fileprivate func fetchData(completion: @escaping((Dog?) -> Void)) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random/50") else {
            completion(nil)
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, _) in
            guard let data = data, let dogs = try? JSONDecoder().decode(Dog.self, from: data) else { return }
            
            print(dogs)
            completion(dogs)
        }.resume()
    }
    
}

// MARK: - UICollectionDataSource
extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogImageUrlList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogCollectionViewCell.cellIdentifier, for: indexPath) as? DogCollectionViewCell else { return UICollectionViewCell() }
        cell.imgUrl = dogImageUrlList[indexPath.row]
        return cell
    }

}

