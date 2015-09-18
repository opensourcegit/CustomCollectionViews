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
        
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout;
        
        let section1 = BaseCollectionSectionModel();
        section1.items = getitem(15);
        section1.identifer = "BasicCollectionSection";
        
        let section2 = BaseCollectionSectionModel();
        section2.items = getitem(20);
        section2.identifer = "BasicCollectionSection";

        let section3  = BaseCollectionSectionModel();
        section3.items = getitem(10);
        section3.identifer = "BasicCollectionSection";

        let section4  = BaseCollectionSectionModel();
        section4.items = getitem(20);
        section4.identifer = "BasicCollectionSection";

        let section5  = BaseCollectionSectionModel();
        section5.items = getitem(14);
        section5.identifer = "BasicCollectionSection";

        let section6  = BaseCollectionSectionModel();
        section6.items = getitem(10);
        section6.identifer = "BasicCollectionSection";

        self.collectionView.setCollectionViewData([section1,section2,section3,section4,section5,section6]);
    }
    func getitem(number:Int)->[SimpleCollectionCellModel]{
        var arrary = Array<SimpleCollectionCellModel>();
        for index in 0...number{
            arrary.append(SimpleCollectionCellModel());
        }
        return arrary;
    }
    
}
