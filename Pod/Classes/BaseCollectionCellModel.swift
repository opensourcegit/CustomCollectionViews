//
//  BaseCollectionCellModel.swift
//  Pods
//
//  Created by Vikas Goyal on 18/09/15.
//
//

import Foundation
import UIKit


public class BaseCollectionCellModel {
    
    public init(){
        
    }
    
   public  class func cellIdentifier() -> String {
        return "cell" // Override
    }
    
    public func cellClass() -> BaseCollecitonCell.Type {
        return BaseCollecitonCell.self
    }
}