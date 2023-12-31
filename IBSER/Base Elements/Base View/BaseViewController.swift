//
//  BaseViewModel.swift
//  Rickapp
//
//  Created by Wojciech Mokwiński on 23/08/2023.
//


import UIKit
import SnapKit
import Combine

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T!
    
    var hideBarWhenScrolling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        setupViews()
        setupConstraints()
        bindToViewModel()
        viewModel.bindToData()
        setupData()
    }
    
    func setupData() {}
    
    func setupViews() {}
    
    func bindToViewModel() {}
    
    func setupConstraints() {}
}

