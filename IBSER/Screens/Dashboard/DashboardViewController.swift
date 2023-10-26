//
//  DashboardViewController.swift
//  ibser-ios
//
//  Created by Wojciech Mokwiński on 25/10/2023.
//

import SnapKit
import UIKit

class DashboardViewController:BaseViewController<DashboardViewModel> {
    private let welcomeLabel = UILabel()
    private let fundsStackView = UIStackView()
    private let availableFundsLabel = UILabel()
    private let fundsLabel = UILabel()
    private let recentExpensesLabel = UILabel()
    private let actionsStackView = UIStackView()
    private let newTransferButton = UIButton()
    private let blikButton = UIButton()
    private let assetsButton = UIButton()
    private let lastOperationsLabel = UILabel()
    private let dateLabel = UILabel()
    
    
    override func setupViews() {
        super.setupViews()
        welcomeLabel.text = "Hello, Wojtek"
        welcomeLabel.textColor = .black
        welcomeLabel.font = .boldSystemFont(ofSize: 25)
        
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        welcomeLabel.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
