//
//  ExpandableCollectionSectionModel.swift
//  Pods
//
//  Created by Vikas Goyal on 18/09/15.
//
//

import Foundation
import UIKit

public class ExpandableCollectionSectionModel: BaseCollectionSectionModel {
    private var orginalItems:[BaseCollectionCellModel] = [BaseCollectionCellModel]();
    var isExpanded = true;
    public override func setItems(items: [BaseCollectionCellModel]) {
        self.orginalItems = items;
        if isExpanded{
            super.setItems(items);
            return;
        }
        super.setItems([BaseCollectionCellModel]());
    }
    
    func setExpand(expand:Bool){
        self.isExpanded = expand;
        if expand{
            super.setItems(self.orginalItems);
            return;
        }
        super.setItems([BaseCollectionCellModel]());
    }
    
}