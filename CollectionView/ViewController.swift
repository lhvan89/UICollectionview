//
//  ViewController.swift
//  CollectionView
//
//  Created by mac on 6/19/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let numberOfItemPerpage = 15
    
    var listItems: [Item] = [
        Item(title: "Behance", image: "behance", badge: 0),
        Item(title: "Deviantart", image: "deviantart", badge: 1),
        Item(title: "Dribbble", image: "dribbble", badge: 2),
        Item(title: "Dropbox", image: "dropbox", badge: 3),
        Item(title: "Facebook", image: "facebook", badge: 4),
        Item(title: "Flickr", image: "flickr", badge: 5),
        Item(title: "Foursquare", image: "foursquare", badge: 6),
        Item(title: "Google-plus", image: "google-plus", badge: 7),
        Item(title: "Instagram", image: "instagram", badge: 8),
        Item(title: "Line", image: "line", badge: 9),
        Item(title: "Linkedin", image: "linkedin", badge: 10),
        Item(title: "Myspace", image: "myspace", badge: 11),
        Item(title: "Path", image: "path", badge: 12),
        Item(title: "Pinterest", image: "pinterest", badge: 13),
        Item(title: "Quora", image: "quora", badge: 14),
        Item(title: "Skype", image: "skype", badge: 15),
        Item(title: "Snapchat", image: "snapchat", badge: 16),
        Item(title: "Soundcloud", image: "soundcloud", badge: 17),
        Item(title: "Spotify", image: "spotify", badge: 18),
        Item(title: "Swarm", image: "swarm", badge: 19),
        Item(title: "Telegram", image: "telegram", badge: 20),
        Item(title: "Tumblr", image: "tumblr", badge: 21),
        Item(title: "Twitter", image: "twitter", badge: 22),
        Item(title: "Viber", image: "viber", badge: 23),
        Item(title: "Vimeo", image: "vimeo", badge: 24),
        Item(title: "Vine", image: "vine", badge: 25),
//        Item(title: "Whatsapp", image: "whatsapp", badge: 26),
//        Item(title: "Yelp", image: "yelp", badge: 27),
//        Item(title: "Youtube", image: "youtube", badge: 28),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
        
         pageControl.numberOfPages = listItems.count/numberOfItemPerpage + (listItems.count % numberOfItemPerpage == 0 ? 0 : 1)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemsCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as? itemCollectionViewCell else { return UICollectionViewCell() }
        cell.loadData(item: listItems[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        self.pageControl.currentPage = currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.size.width / 3
        let itemHeight = (collectionView.frame.size.height / 5) - 4
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
