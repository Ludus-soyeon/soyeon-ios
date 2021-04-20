//
//  TagListLayout.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

protocol TagListLayoutDelegate: class {
    func spacingForLine() -> CGFloat
    func spacingForItem() -> CGFloat
    func sizeForTag(at indexPath: IndexPath) -> CGSize
}

final class TagListLayout: UICollectionViewLayout {
    
    weak var delegate: TagListLayoutDelegate?

    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    private var contentHeight: CGFloat = 0
    private var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let spacingForLine = delegate?.spacingForLine() ?? .zero
        let spacingForItem = delegate?.spacingForItem() ?? .zero
        
        cachedAttributes.removeAll()
        contentHeight = 0
        
        var offset: CGPoint = .zero
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let cellSize = delegate?.sizeForTag(at: indexPath) ?? .zero
            if offset.x + cellSize.width > contentWidth {
                offset.x = .zero
                offset.y += spacingForLine + cellSize.height
            }
            let frame = CGRect(origin: offset,
                               size: cellSize)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cachedAttributes.append(attributes)
            contentHeight = max(contentHeight, frame.maxY)
            offset.x += cellSize.width + spacingForItem
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cachedAttributes {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
}
