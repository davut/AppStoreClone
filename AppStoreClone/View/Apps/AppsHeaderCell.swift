//
//  AppsHeaderCell.swift
//  AppStoreClone
//
//  Created by djepbarov on 13.05.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(title: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(title: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        imageView.backgroundColor = .red
        
        companyLabel.textColor = .blue
        
        titleLabel.numberOfLines = 2
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel,
            titleLabel,
            imageView
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
}
