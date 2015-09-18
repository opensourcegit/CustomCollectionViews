//
//  BasicCollectionCell.swift
//  CustomCollectionViews
//
//  Created by Vikas Goyal on 18/09/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CustomCollectionViews


class BasicCollectionCell: BaseCollecitonCell {
    override func awakeFromNib() {
        super.awakeFromNib();
        self.backgroundColor = randomColor();
    }
    override func sizeForItem() -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

 func randomColor() -> UIColor {
    let red = CGFloat(Double(arc4random() % 256) / 256.0)
    let green = CGFloat(Double(arc4random() % 256) / 256.0)
    let blue = CGFloat(Double(arc4random() % 256) / 256.0)
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}