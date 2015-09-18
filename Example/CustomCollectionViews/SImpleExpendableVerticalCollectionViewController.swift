//
//  SImpleExpendableVerticalCollectionViewController.swift
//  CustomCollectionViews
//
//  Created by Vikas Goyal on 18/09/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CustomCollectionViews

class SImpleExpendableVerticalCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: ExpandableCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        
        self.collectionView.registerNib(UINib(nibName: SimpleCollectionCellModel.cellIdentifier(), bundle: nil), forCellWithReuseIdentifier: SimpleCollectionCellModel.cellIdentifier());
        self.collectionView.registerNib(UINib(nibName: "BasicCollectionSection", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "BasicCollectionSection");
        
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout;
        
        let section1 = ExpandableCollectionSectionModel();
        section1.setItems(getitem(15));
        section1.identifer = "BasicCollectionSection";
        
        let section2 = ExpandableCollectionSectionModel();
        section2.setItems(getitem(15));
        section2.identifer = "BasicCollectionSection";
        
        let section3  = ExpandableCollectionSectionModel();
        section3.setItems(getitem(15));
        section3.identifer = "BasicCollectionSection";
        
        let section4  = ExpandableCollectionSectionModel();
        section4.setItems(getitem(15));
        section4.identifer = "BasicCollectionSection";
        
        let section5  = ExpandableCollectionSectionModel();
        section5.setItems(getitem(15));
        section5.identifer = "BasicCollectionSection";
        
        let section6  = ExpandableCollectionSectionModel();
        section6.setItems(getitem(15));
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