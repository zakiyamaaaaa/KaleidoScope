//
//  KaleidoScopeCollectionViewFlowLayout.swift
//  Demo
//
//  Created by shoichiyamazaki on 2018/08/16.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit

class KaleidoScopeCollectionViewFlowLayout: UICollectionViewFlowLayout {

    public var isEmphasis                  = true
    public var cellColumns                 = 3
    public var intermediateRows            = 2
    private var cellPositionPattern = [(cellSizeScale: CGFloat, column: CGFloat, row: CGFloat)]()
    private var sectionCells        = [[CGRect]]()
    private var contentSize         = CGSize.zero
    
    private func setUpLayout(numberOfCells: Int) {
        
        sectionCells = [[CGRect]]()
        
        var column: CGFloat = 0
        var row: CGFloat = 0
        let numberOfCycle = 2*(cellColumns + intermediateRows*cellColumns)
        let cellSize: CGFloat = isEmphasis ? 2.0 : 1.0
        
        for i in 0..<numberOfCells {
            if Int(column) == cellColumns {
                column = 0
                row += 1
            }
            
            if isEmphasis {
                switch i%numberOfCycle {
                case 1:
                    cellPositionPattern.append((cellSizeScale: cellSize, column: column, row: row))
                    row += 1
                    column = 0
                case 3:
                    column = 0
                    row += 1
                    cellPositionPattern.append((cellSizeScale: 1, column: column, row: row))
                    column += 1
                case 3 + intermediateRows*cellColumns:
                    cellPositionPattern.append((cellSizeScale: cellSize, column: 0, row: row))
                    column = 2
                case 5 + intermediateRows*cellColumns:
                    column = 2
                    cellPositionPattern.append((cellSizeScale: 1, column: column, row: row))
                    column = 0
                    row += 1
                default:
                    cellPositionPattern.append((cellSizeScale: 1, column: column, row: row))
                    column += 1
                }
            } else {
                cellPositionPattern.append((cellSizeScale: 1, column: column, row: row))
                column += 1
            }
        }
        
        if let collectionView = self.collectionView {
            contentSize = CGSize(width: collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right, height: 0)
            let smallCellSideLength: CGFloat = (contentSize.width - super.sectionInset.left - super.sectionInset.right - (super.minimumInteritemSpacing * (CGFloat(cellColumns) - 1.0))) / CGFloat(cellColumns)
            
            for section in 0..<collectionView.numberOfSections {
                var cells = [CGRect]()
                let numberOfCellsInSection = collectionView.numberOfItems(inSection: section)
                var height = contentSize.height
                
                for i in 0..<numberOfCellsInSection {
                    let position = i  % numberOfCellsInSection
                    let cellPosition = position % cellPositionPattern.count
                    let cell = cellPositionPattern[cellPosition]
                    let originX = cell.column * (smallCellSideLength + super.minimumInteritemSpacing) + super.sectionInset.left
                    let originY = cell.row * (smallCellSideLength + super.minimumLineSpacing) + contentSize.height + super.sectionInset.top
                    let cellwidth = cell.cellSizeScale * smallCellSideLength + cell.cellSizeScale * super.minimumInteritemSpacing
                    let cellheight = cellwidth
                    let cellRect = CGRect(x:originX, y: originY, width: cellwidth, height: cellheight)
                    cells.append(cellRect)
                    
                    if height < cellRect.origin.y + cellRect.height {
                        height = cellRect.origin.y + cellRect.height
                    }
                }
                contentSize = CGSize(width: contentSize.width, height: height)
                sectionCells.append(cells)
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        if let collectionView = self.collectionView {
            let numberOfCellsInSection = collectionView.numberOfItems(inSection: 0)
            self.setUpLayout(numberOfCells: numberOfCellsInSection)
            for j in 0..<numberOfCellsInSection {
                let indexPath = IndexPath(row: j, section: 0)
                if let attributes = layoutAttributesForItem(at: indexPath), rect.intersects(attributes.frame) {
                    layoutAttributes.append(attributes)
                }
            }
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = super.layoutAttributesForItem(at: indexPath)
        attributes?.frame = sectionCells[indexPath.section][indexPath.row]
        
        return attributes
    }
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
}
