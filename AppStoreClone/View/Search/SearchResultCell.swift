//
//  SearchCell.swift
//  AppStoreClone
//
//  Created by djepbarov on 9.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultCell: UICollectionViewCell {
    
    var appsStoreResult: AppsStoreResult! {
        didSet {
            appNameLabel.text = appsStoreResult.trackName
            appCategoryLabel.text = appsStoreResult.primaryGenreName
            appRateLabel.text = "Rating: \(appsStoreResult.averageUserRating ?? 0)"
            let iconUrl = URL(string: appsStoreResult.artworkUrl100)
            appIconImageView.kf.setImage(with: iconUrl)
            
            let screenshotUrl = URL(string: appsStoreResult.screenshotUrls[0])
            ss1.kf.setImage(with: screenshotUrl)
            
            if appsStoreResult.screenshotUrls.count > 1 {
                ss2.kf.setImage(with: URL(string: appsStoreResult.screenshotUrls[1]))
            }
            
            if appsStoreResult.screenshotUrls.count > 2 {
                ss3.kf.setImage(with: URL(string: appsStoreResult.screenshotUrls[2]))
            }
            
            
        }
    }
    
    let appIconImageView: UIImageView = {
       let iv = UIImageView()
       iv.layer.cornerRadius = 12
       iv.clipsToBounds = true
       iv.contentMode = .scaleAspectFill
       iv.constrainHeight(constant: 64)
       iv.constrainWidth(constant: 64)
       return iv
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        return label
    }()
    
    let appCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let appRateLabel: UILabel = {
        let label = UILabel()
        label.text = "9.9M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8999717072, green: 0.8999717072, blue: 0.8999717072, alpha: 1)
        button.constrainHeight(constant: 32)
        button.constrainWidth(constant: 80)
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var ss1 = createScreenshots()
    lazy var ss2 = createScreenshots()
    lazy var ss3 = createScreenshots()
    
    func createScreenshots() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        let labelsStackView = VerticalStackView(arrangedSubviews: [
            appNameLabel, appCategoryLabel, appRateLabel
            ])
        
        let infoStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelsStackView, getButton
            ])
        infoStackView.alignment = .center
        infoStackView.spacing = 12
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [
            ss1, ss2, ss3
            ])
        screenshotsStackView.distribution = .fillEqually
        screenshotsStackView.spacing = 12
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoStackView, screenshotsStackView
            ], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
