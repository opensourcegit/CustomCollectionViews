//
//  BasicCollectionSection.swift
//  CustomCollectionViews
//
//  Created by opensourcegit on 18/09/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class BasicCollectionSection: UICollectionReusableView {
    override func awakeFromNib() {
        super.awakeFromNib();
        self.backgroundColor = randomColor();
    }
}