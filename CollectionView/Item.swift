//
//  Item.swift
//  CollectionView
//
//  Created by mac on 6/19/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation

class Item {
    var title = ""
    var image = ""
    var badge = 0
    init(title: String, image: String, badge: Int) {
        self.title = title
        self.image = image
        self.badge = badge
    }
}
