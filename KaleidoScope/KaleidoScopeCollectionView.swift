//
//  GridCollectionView.swift
//  KaleidoScopeSample
//
//  Created by shoichiyamazaki on 2018/08/15.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit

open class KaleidoScopeCollectionView: UICollectionView {
    
    private var layout: KaleidoScopeCollectionViewFlowLayout!
    public var isEmphasis: Bool = true {
        didSet {
            layout.isEmphasis = isEmphasis
        }
    }
    
    public var intermediateRows: Int = 2 {
        didSet {
            layout.intermediateRows = intermediateRows
        }
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.layout = KaleidoScopeCollectionViewFlowLayout()
        collectionViewLayout = self.layout
    }
    
    init(frame: CGRect) {
        layout = KaleidoScopeCollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layout = KaleidoScopeCollectionViewFlowLayout()
        collectionViewLayout = layout
    }

}
