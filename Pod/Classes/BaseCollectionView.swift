
//
//  BaseCollectionView.swift
//  Pods
//
//  Created by opensourcegit on 18/09/15.
//
//

import Foundation
import UIKit

public class BaseCollectionView: UICollectionView {
    
    var data = [BaseCollectionSectionModel]();
    
   public func setCollectionViewData(data:[BaseCollectionSectionModel]){
        self.data = data;
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            print("data reload count \(self.data.count)\n")
            self.reloadData();
        });
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setup()
    }

    required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setup();
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib();
        self.setup()
    }
    
    
    func setup(){
        self.dataSource = self;
        self.delegate = self;
    }
}

 extension BaseCollectionView:UICollectionViewDataSource{
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        let sectionModel = data[section];
        let count = sectionModel.items.count;
        println("count \(count)");
        return count;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let sectionModel = data[indexPath.section];
        let cellModel = sectionModel.items[indexPath.item];
        let cellIdentifier = cellModel.dynamicType.cellIdentifier();
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! UICollectionViewCell;
        
        if let cell = cell as? ReactiveView{
            cell.bindViewModel(cellModel);
        }
        return cell
    }
    
    //MARK: optional
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return data.count;
    }
    
    // The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
    public func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        var reusableView : UICollectionReusableView? = nil
        if kind == UICollectionElementKindSectionHeader {
            let sectionModel = data[indexPath.section];
            let reuseIdentifier = sectionModel.identifer!;
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseIdentifier, forIndexPath: indexPath) as? UICollectionReusableView
            if let reusableView = reusableView as? ReactiveView {
                reusableView.bindViewModel(sectionModel);
            }
        }
        return reusableView!
    }
}

 extension BaseCollectionView:UICollectionViewDelegateFlowLayout{
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let sectionModel:BaseCollectionSectionModel = data[indexPath.section];
        let cellModel = sectionModel.items[indexPath.item];
        return CellSizer.shared.sizeThatFits(collectionView.bounds.size, viewModel: cellModel, cellClass: cellModel.cellClass())
        }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        
//    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
//        
//    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
//        
//    }
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: 100, height: 100);
    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
//        
//    }
}