//
//  BaseCollectionCellModel.swift
//  CustomCollectionViews
//
//  Created by Vikas Goyal on 18/09/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CustomCollectionViews


class SimpleCollectionCellModel: BaseCollectionCellModel {
    
    override init() {
        super.init();
    }
    
    override class func cellIdentifier() -> String {
        return "BasicCollectionCell" // Override
    }
    
    override func cellClass() -> BaseCollecitonCell.Type {
        return BasicCollectionCell.self
    }
}