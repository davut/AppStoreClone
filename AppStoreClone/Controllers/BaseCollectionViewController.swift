//
//  BaseCollectionViewController.swift
//  AppStoreClone
//
//  Created by djepbarov on 19.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class BaseCollectionViewConroller: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
