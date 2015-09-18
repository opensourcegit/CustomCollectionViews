//
//  ReactiveView.swift
//  Pods
//
//  Created by opensourcegit on 18/09/15.
//
//
//
import Foundation

@objc protocol ReactiveView {
    func bindViewModel(viewModel: AnyObject)
}