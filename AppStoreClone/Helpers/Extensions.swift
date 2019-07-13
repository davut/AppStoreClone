//
//  Extensions.swift
//  AppStoreClone
//
//  Created by djepbarov on 19.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String, font: UIFont) {
        self.init(frame: CGRect.zero)
        self.text = title
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init()
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

