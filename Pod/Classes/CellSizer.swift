//
//  CellSizer.swift
//  Pods
//
//  Created by opensourcegit on 18/09/15.
//
//

import Foundation
import UIKit

public class CellSizer {
    
  public static let shared : CellSizer = CellSizer()
    private init() {}
    
    private var sizingCells = [String : UICollectionViewCell]()
    
    public func sizeThatFits<T: BaseCollecitonCell>(size: CGSize, viewModel: AnyObject, cellClass: T.Type) -> CGSize {
        let className = NSStringFromClass(cellClass)
        var sizingCell : T? = sizingCells[className] as? T
        
        if sizingCell == nil {
            sizingCell = UINib(nibName: className.pathExtension, bundle: nil).instantiateWithOwner(nil, options: nil)[0] as? T
            sizingCells[className] = sizingCell
        }
        
        sizingCell!.bindViewModel(viewModel)
        var size = sizingCell!.sizeForItem();
        
        if size == CGSizeZero{
            size = sizingCell!.contentView.systemLayoutSizeFittingSize(size, withHorizontalFittingPriority: sizingCell!.horizontalFittingPriority(), verticalFittingPriority: sizingCell!.verticalFittingPriority());
        }
        return size
    }
    
}