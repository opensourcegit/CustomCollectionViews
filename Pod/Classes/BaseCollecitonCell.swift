//
//  BaseCollecitonCell.swift
//  Pods
//
//  Created by opensourcegit on 18/09/15.
//
//

import Foundation
import UIKit

public class BaseCollecitonCell:UICollectionViewCell,ReactiveView {
   public func bindViewModel(viewModel: AnyObject) {
        //implement
    }
   public  func horizontalFittingPriority()->UILayoutPriority{
        return 1000;
    }
    public func verticalFittingPriority()-> UILayoutPriority{
        return 50;
    }
   public  func sizeForItem()->CGSize{
        return CGSizeZero;
    }
    
    
    
}