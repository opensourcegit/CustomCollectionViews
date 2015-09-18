//
//  BaseCollectionSectionModel.swift
//  Pods
//
//  Created by opensourcegit on 18/09/15.
//
//

import Foundation
import UIKit

public class BaseCollectionSectionModel {
    var items = [BaseCollectionCellModel]();
   public var identifer:String? ;
   public var shouldShow:Bool = true;
    public init(){
    }
   public func setItems(items:[BaseCollectionCellModel]){
        self.items = items;
    }
}