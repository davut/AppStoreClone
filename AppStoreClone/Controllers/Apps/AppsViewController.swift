//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by djepbarov on 9.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class AppsViewController: BaseCollectionViewConroller, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "Cell"
    private let headerId = "headerId"
    var appGroups = [AppGroup]()
    
    let activityIndicatorView: UIActivityIndicatorView = {
       let aiv = UIActivityIndicatorView(style: .whiteLarge)
       aiv.color = .black
       aiv.hidesWhenStopped = true
       aiv.startAnimating()
       return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        fetch()
    }
    
    func fetch() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (result: Result<AppGroup, Error>) in
            switch result {
            case .success(let appGroup):
                dispatchGroup.leave()
                group1 = appGroup
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopFreeApps { (result: Result<AppGroup, Error>) in
            switch result {
            case .success(let appGroup):
                dispatchGroup.leave()
                group2 = appGroup
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (result: Result<AppGroup, Error>) in
            switch result {
            case .success(let appGroup):
                dispatchGroup.leave()
                group3 = appGroup
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            
            self.activityIndicatorView.stopAnimating()
            
            if let appGroup = group1 {
                self.appGroups.append(appGroup)
            }
            if let appGroup = group2 {
                self.appGroups.append(appGroup)
            }
            if let appGroup = group3 {
                self.appGroups.append(appGroup)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroups.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsGroupCell
        let appGroup = appGroups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.appsHorizontalController.appGroup = appGroup
        cell.appsHorizontalController.collectionView.reloadData()
        cell.appsHorizontalController.didSelectHandler = { [weak self] appFeed in
            let appDetailVC = AppDetailController()
            appDetailVC.appId = appFeed.id
            self?.navigationController?.pushViewController(appDetailVC, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 16, bottom: 0, right: 0)
    }
}
