//
//  AppsDetailCell.swift
//  AppStoreClone
//
//  Created by djepbarov on 2.06.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class AppsDetailCell: UICollectionViewCell {
    
    var appResult: SearchResult? {
        didSet {
            titleLabel.text = appResult?.results.first?.trackName
//            releaseNotesLabel.text = appResult?.results.first.
            logoImageView.kf.setImage(with: URL(string: appResult?.results.first?.artworkUrl100 ?? ""))
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let whatsNewLabel: UILabel = {
        let label = UILabel()
        label.text = "Whats new"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Release Notes"
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.constrainWidth(constant: 140)
        imageView.constrainHeight(constant: 140)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let buyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.setTitle("4.59$", for: .normal)
        btn.constrainWidth(constant: 80)
        btn.constrainHeight(constant: 32)
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                logoImageView,
                VerticalStackView(arrangedSubviews: [
                    titleLabel,
                    UIStackView(arrangedSubviews: [
                        buyButton,
                        UIView()
                    ]),UIView()], spacing: 12 )
                ], customSpacing: 20),
            whatsNewLabel,
            releaseNotesLabel
            ], spacing: 16)
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
