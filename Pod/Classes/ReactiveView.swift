//
//  ReactiveView.swift
//  Pods
//
//  Created by Vikas Goyal on 18/09/15.
//
//

import Foundation

@objc protocol ReactiveView {
    func bindViewModel(viewModel: AnyObject)
}