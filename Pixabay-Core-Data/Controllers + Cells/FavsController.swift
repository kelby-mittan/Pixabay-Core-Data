//
//  FavsController.swift
//  Pixabay-Core-Data
//
//  Created by Kelby Mittan on 4/12/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class FavsController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var pixPics = [PixImage]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadPix()
    }
    
    private func loadPix() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? UICollectionViewCell, let pixVC = segue.destination as? PixDetailController, let indexPath = collectionView.indexPath(for: cell) else {
            fatalError("could not load")
        }
        
        pixVC.pixImage = pixPics[indexPath.row]
        pixVC.isFavorite = true
    }
    
}

extension FavsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pixPics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as? PixCollectionCell else {
            fatalError("could not downcast country")
        }
        let pixPic = pixPics[indexPath.row]
        cell.configureCell(for: pixPic)
        
        return cell
    }
}

extension FavsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 20
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 2
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = itemWidth //+ (itemWidth * 0.25)
        
        //        return CGSize(width: itemWidth, height: (itemWidth * 2))
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
