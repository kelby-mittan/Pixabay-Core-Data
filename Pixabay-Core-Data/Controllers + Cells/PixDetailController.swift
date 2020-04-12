//
//  PixDetailController.swift
//  Pixabay-Core-Data
//
//  Created by Kelby Mittan on 4/12/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class PixDetailController: UIViewController {
    
    @IBOutlet var largePixImage: UIImageView!
    @IBOutlet var tagsLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var viewsLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
    @IBOutlet var postedByLabel: UILabel!
    @IBOutlet var favButton: UIButton!
    
    public var pixImage: PixImage?
    public var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        tagsLabel.text = "Tags: \(pixImage?.tags ?? "")"
        likesLabel.text = "Likes: \(pixImage?.likes.description ?? "")"
        viewsLabel.text = "Views: \(pixImage?.views.description ?? "")"
        commentsLabel.text = "Comments: \(pixImage?.comments.description ?? "")"
        postedByLabel.text = "Posted by: \(pixImage?.user ?? "")"
        
        guard let largeImage = pixImage?.largeImageURL else {
            return
        }
        
        largePixImage.getImage(with: largeImage) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.largePixImage.image = UIImage(systemName: "photo.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.largePixImage.image = image
                }
            }
        }
        if isFavorite {
            favButton.setBackgroundImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favButton.setBackgroundImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @IBAction func favButtonPressed(_ sender: UIButton) {
        
        guard let pixImage = pixImage else {
            return
        }
        if isFavorite {
            favButton.setBackgroundImage(UIImage(systemName: "star"), for: .normal)
            
            showAlert(title: "Okay", message: "This photo has been deleted from favorites")
            isFavorite = false
        } else {
            favButton.setBackgroundImage(UIImage(systemName: "star.fill"), for: .normal)
            
            showAlert(title: "Cool", message: "This photo has been favorited")
            
            isFavorite = true
        }
        
    }
    
}
