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
    func handleTapGestuer(sender:AnyObject){
//        if(sender.state != UIGestureRecognizerState.Ended){
//            return;
//        }
//        let viewK = sender.view;
//        let tappedSection = viewK!!.tag;//tappedCellPath.section;
//        let sectionModel = data[tappedSection] as! ExpandableCollectionSectionModel;
//        let willOpen = !sectionModel.isExpanded;
//        let indexpaths = self.indexPathsForSection(tappedSection);
//        self.performBatchUpdates({ () -> Void in
//                    if(willOpen){
//                        //                self.deleteItemsAtIndexPaths(self.)
//                        self.insertItemsAtIndexPaths(indexpaths);
//                    }else{
//                        self.deleteItemsAtIndexPaths(indexpaths);
//                    }
//                    sectionModel.setExpand(willOpen);
//            }) { (done) -> Void in
//                
//        };
        
//        if(willOpen){
//            let lastItemIndexPath = NSIndexPath(forItem: self.numberOfItemsInSection(tappedCellPath.section)-1, inSection: tappedCellPath.section)
//            let firstItem = self.cellForItemAtIndexPath(tappedCellPath);
//            let lastItemOptional = self.cellForItemAtIndexPath(lastItemIndexPath);
//            let lastItem = lastItemOptional!;
//            
//            let firstItemTop = firstItem?.frame.origin.y;
//            let lastItemBottom = lastItem.frame.origin.y + lastItem.frame.size.height;
//            let height = self.bounds.size.height;
//            
//            if(lastItemBottom - self.contentOffset.y > height){
//                if(lastItemBottom - firstItemTop! > height ){
//                self.setContentOffset(CGPoint(x: 0, y: firstItemTop!), animated: true);
//            }else{
//                self.setContentOffset(CGPoint(x: 0, y: lastItemBottom - height), animated: true);
//                }
//            }
//        }
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
    
    func expandedSectionIndexPaths()->[NSIndexPath]{
        let sectionIndexPaths = [NSIndexPath]();
        //have to implement
        return sectionIndexPaths;
    }
//    - (NSArray*)expandedSectionIndexPaths {
//    NSMutableArray* sectionIndexPaths = [NSMutableArray array];
//    if (!self.allowsMultipleExpandedSections) {
//    for (NSInteger i = 0; i < self.numberOfSections; i++) {
//    if ([self isExpandedSection:i]) {
//    [sectionIndexPaths addObject:[NSIndexPath indexPathForItem:0 inSection:i]];
//    }
//    }
//    }
//    return [sectionIndexPaths copy];
//    }
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