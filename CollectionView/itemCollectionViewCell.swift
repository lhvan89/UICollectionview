//
//  itemCollectionViewCell.swift
//  CollectionView
//
//  Created by mac on 6/19/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class itemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var badgeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        badgeButton.layer.cornerRadius = badgeButton.frame.width / 2
    }
    
    func loadData(item: Item){
        
        // hide item if data is empty
        if item.title == "" {
            self.isHidden = true
            return
        } else {
            self.isHidden = false
        }
        iconImage.image = UIImage(named: item.image)
        titleLabel.text = item.title
        badgeButton.setTitle(String(item.badge), for: .normal)
    }
    
}
