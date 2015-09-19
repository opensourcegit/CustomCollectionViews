//
//  ExpandableCollectionView.swift
//  Pods
//
//  Created by Vikas Goyal on 18/09/15.
//
//

import Foundation
import UIKit

public class ExpandableCollectionView: BaseCollectionView,UIGestureRecognizerDelegate,ExpandableCollectionSectionCallBack {
    private var tabGestureRecognizer:UITapGestureRecognizer?;
    override public func setCollectionViewData(data: [BaseCollectionSectionModel]) {
        super.setCollectionViewData(data);
    }
    override func setup() {
        super.setup();
       // let gestureRecognizer = getGestureRecognizer();
        //addGestureRecognizer(gestureRecognizer);
        //self.tabGestureRecognizer = gestureRecognizer;
        print("")
    }
    func getGestureRecognizer()->UITapGestureRecognizer{
        if let tabGesture = self.tabGestureRecognizer{
            return tabGesture;
        }
        let selector:Selector = "handleTapGestuer:";
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: selector);
        gestureRecognizer.numberOfTapsRequired = 1;
        gestureRecognizer.delegate = self;
        return gestureRecognizer;
    }

    func indexPathsForSection(section:Int)->[NSIndexPath]{
        var indexpaths = [NSIndexPath]();
        let sectionModel = data[section] as! ExpandableCollectionSectionModel;
        var count = sectionModel.numberOfitems() ;//self.dataSource?.collectionView(self, numberOfItemsInSection: section);
        count = count-1;
        for i in 0...count{
            indexpaths.append(NSIndexPath(forItem: i, inSection: section));
        }
        return indexpaths;
    }
    
public override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let view = super.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, atIndexPath: indexPath) as! ExpandableCollectionSection;
        view.tag = indexPath.section;
        view.sectionDelegate = self;
        return view;
    }
//MARK: gestureRecognizer delegates
   public func  gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if(gestureRecognizer === self.tabGestureRecognizer){
            if(gestureRecognizer.state == UIGestureRecognizerState.Possible){
                return true;
            }
            return false;
        }
        return true;
    }
   //ExpandableCollectionSectionCallBackDelegate
    func onClick(sectionView: ExpandableCollectionSection) {
        let viewK = sectionView;
        let tappedSection = viewK.tag;//tappedCellPath.section;
        let sectionModel = data[tappedSection] as! ExpandableCollectionSectionModel;
        let willOpen = !sectionModel.isExpanded;
        let indexpaths = self.indexPathsForSection(tappedSection);
        self.performBatchUpdates({ () -> Void in
            if(willOpen){
                //                self.deleteItemsAtIndexPaths(self.)
                self.insertItemsAtIndexPaths(indexpaths);
            }else{
                self.deleteItemsAtIndexPaths(indexpaths);
            }
            sectionModel.setExpand(willOpen);
            }) { (done) -> Void in
                
        };
    }
}