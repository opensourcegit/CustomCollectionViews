//
//  BasicCollectionViewController.swift
//  CustomCollectionViews
//
//  Created by opensourcegit on 18/09/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CustomCollectionViews

class BasicCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: SimpleCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.collectionView.registerNib(UINib(nibName: SimpleCollectionCellModel.cellIdentifier(), bundle: nil), forCellWithReuseIdentifier: SimpleCollectionCellModel.cellIdentifier());
        self.collectionView.registerNib(UINib(nibName: "BasicCollectionSection", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "BasicCollectionSection");
        
        let section1 = BaseCollectionSectionModel();
        section1.setItems(getitem(15));
        section1.identifer = "BasicCollectionSection";
        
        let section2 = BaseCollectionSectionModel();
        section2.setItems(getitem(15));
        section2.identifer = "BasicCollectionSection";

        let section3  = BaseCollectionSectionModel();
        section3.setItems(getitem(15));
        section3.identifer = "BasicCollectionSection";

        let section4  = BaseCollectionSectionModel();
        section4.setItems(getitem(15));
        section4.identifer = "BasicCollectionSection";

        let section5  = BaseCollectionSectionModel();
        section5.setItems(getitem(15));
        section5.identifer = "BasicCollectionSection";

        let section6  = BaseCollectionSectionModel();
        section6.setItems(getitem(15));
        section6.identifer = "BasicCollectionSection";

        self.collectionView.setCollectionViewData([section1,section2,section3,section4,section5,section6]);
    }
    func getitem(number:Int)->[SimpleCollectionCellModel]{
        var arrary = Array<SimpleCollectionCellModel>();
        for _ in 0...number{
            arrary.append(SimpleCollectionCellModel());
        }
        return arrary;
    }
    
}
