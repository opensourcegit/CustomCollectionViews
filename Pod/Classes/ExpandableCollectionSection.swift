//
//  ExpandableCollectionSection.swift
//  Pods
//
//  Created by vikas on 19/09/15.
//
//

import Foundation
import UIKit

protocol ExpandableCollectionSectionCallBack{
    func onClick(sectionView:ExpandableCollectionSection);
}
public class ExpandableCollectionSection: UICollectionReusableView,ReactiveView {
    var sectionDelegate:ExpandableCollectionSectionCallBack?;
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        setup();
    }
    func bindViewModel(viewModel: AnyObject) {
        //implement in child
    }
    
    func setup(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "onClickSelf");
        self.addGestureRecognizer(gestureRecognizer);
    }
    func onClickSelf(){
        if let delegate = self.sectionDelegate{
            delegate.onClick(self);
        }
    }
    
}