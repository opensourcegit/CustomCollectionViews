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

    override public func setCollectionViewData(data: [BaseCollectionSectionModel]) {
        super.setCollectionViewData(data);
    }
    override func setup() {
        super.setup();
    }

    func indexPathsForSection(section:Int)->[NSIndexPath]{
        var indexpaths = [NSIndexPath]();
        let sectionModel = data[section] as! ExpandableCollectionSectionModel;
        var count = sectionModel.numberOfitems() ;
        count = count-1;
        for i in 0...count{
            indexpaths.append(NSIndexPath(forItem: i, inSection: section));
        }
        return indexpaths;
    }
    
public override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let view = super.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, atIndexPath: indexPath);
        view.tag = indexPath.section;
    
    if let view = view as? ExpandableCollectionSection{
        view.sectionDelegate = self;
    }
        return view;
    }

   //MARK: ExpandableCollectionSectionCallBackDelegate
    func onClick(sectionView: ExpandableCollectionSection) {
        let viewK = sectionView;
        let tappedSection = viewK.tag;//tappedCellPath.section;
        let sectionModel = data[tappedSection] as! ExpandableCollectionSectionModel;
        let willOpen = !sectionModel.isExpanded;
        let indexpaths = self.indexPathsForSection(tappedSection);
        self.performBatchUpdates({ () -> Void in
            if(willOpen){
                self.insertItemsAtIndexPaths(indexpaths);
            }else{
                self.deleteItemsAtIndexPaths(indexpaths);
            }
            sectionModel.setExpand(willOpen);
            }) { (done) -> Void in
                
        };
    }
}