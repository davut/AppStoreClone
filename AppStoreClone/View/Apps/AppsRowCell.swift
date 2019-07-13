//
//  AppsRowCell.swift
//  AppStoreClone
//
//  Created by djepbarov on 19.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class AppsRowCell: UICollectionViewCell {
    
    let iconImageView = UIImageView(cornerRadius: 8)
    
    let appNameLabel = UILabel(title: "App Name", font: UIFont.boldSystemFont(ofSize: 16))
    let appCompanyLabel = UILabel(title: "App Company", font: UIFont.systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        let stackView = UIStackView(arrangedSubviews: [
            iconImageView, VerticalStackView(arrangedSubviews: [appNameLabel, appCompanyLabel], spacing: 8), getButton
            ])
        addSubview(stackView)
        stackView.fillSuperview()
        stackView.alignment = .center
        stackView.spacing = 16
        
        iconImageView.constrainHeight(constant: 64)
        iconImageView.constrainWidth(constant: 64)
        iconImageView.backgroundColor = .purple
        
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        
    }
    
}
