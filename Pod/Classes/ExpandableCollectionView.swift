//
//  ExpandableCollectionView.swift
//  Pods
//
//  Created by Vikas Goyal on 18/09/15.
//
//

import Foundation
import UIKit

public class ExpandableCollectionView: BaseCollectionView,UIGestureRecognizerDelegate {
    private var tabGestureRecognizer:UIGestureRecognizer?;
    override public func setCollectionViewData(data: [BaseCollectionSectionModel]) {
        super.setCollectionViewData(data);
    }
    override func setup() {
        super.setup();
        let gestureRecognizer = getGestureRecognizer();
        addGestureRecognizer(gestureRecognizer);
        self.tabGestureRecognizer = gestureRecognizer;
    }
    func getGestureRecognizer()->UIGestureRecognizer{
        if let tabGesture = self.tabGestureRecognizer{
            return tabGesture;
        }
        let gestureRecognizer = UIGestureRecognizer(target: self, action: "handleTapGestuer");
        self.tabGestureRecognizer = gestureRecognizer;
        self.tabGestureRecognizer?.delegate = self;
        return gestureRecognizer;
    }
    func handleTapGestuer(sender:AnyObject){
        if(sender.state != UIGestureRecognizerState.Ended){
            return;
        }
        let point = sender.locationInView(self);
        let tappedCellPathOptional = self.indexPathForItemAtPoint(point);
        let tappedCellPath:NSIndexPath = tappedCellPathOptional!;
        if(tappedCellPath.item == 0){
            return;
        }
        let tappedSection = tappedCellPath.section;
        let sectionModel = data[tappedSection] as! ExpandableCollectionSectionModel;
        let willOpen = !sectionModel.isExpanded;
        let indexpaths = self.indexPathsForSection(tappedSection);
        let expandedSectionIndexpaths = willOpen ? self.expandedSectionIndexPaths():[NSIndexPath]();
        self.performBatchUpdates({ () -> Void in
            if(willOpen){
//                self.deleteItemsAtIndexPaths(self.)
                self.insertItemsAtIndexPaths(indexpaths);
            }else{
                self.deleteItemsAtIndexPaths(indexpaths);
            }
            sectionModel.setExpand(willOpen);
        }, completion: nil);
        
        if(willOpen){
            let lastItemIndexPath = NSIndexPath(forItem: self.numberOfItemsInSection(tappedCellPath.section)-1, inSection: tappedCellPath.section)
            let firstItem = self.cellForItemAtIndexPath(tappedCellPath);
            let lastItemOptional = self.cellForItemAtIndexPath(lastItemIndexPath);
            let lastItem = lastItemOptional!;
            
            let firstItemTop = firstItem?.frame.origin.y;
            let lastItemBottom = lastItem.frame.origin.y + lastItem.frame.size.height;
            let height = self.bounds.size.height;
            
            if(lastItemBottom - self.contentOffset.y > height){
                if(lastItemBottom - firstItemTop! > height ){
                self.setContentOffset(CGPoint(x: 0, y: firstItemTop!), animated: true);
            }else{
                self.setContentOffset(CGPoint(x: 0, y: lastItemBottom - height), animated: true);
                }
            }
        }
    }
    func indexPathsForSection(section:Int)->[NSIndexPath]{
        var indexpaths = [NSIndexPath]();
        var count = self.dataSource?.collectionView(self, numberOfItemsInSection: section);
        count = count!-1;
        for i in 0...count!{
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
  
//MARK: gestureRecognizer delegates
   public func  gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if(gestureRecognizer === self.tabGestureRecognizer){
            if(gestureRecognizer.state == UIGestureRecognizerState.Possible){
                let point = touch.locationInView(self);
                let tappedCellPath = self.indexPathForItemAtPoint(point);
                return (tappedCellPath != nil) && (tappedCellPath?.item==0);
            }
            return false;
        }
        return true;
    }
   
}