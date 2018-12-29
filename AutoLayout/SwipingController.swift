//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Anthony Lee on 12/28/18.
//  Copyright © 2018 anthonyLee. All rights reserved.
//

import UIKit

class SwipingController : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
//    let images = ["1","2","3","4"]
//    let headerStrings = ["Hello, This is Anthony's Project that uses page swiping",
//                         "Here I added all the UI elements and constraints programmatically",
//                         "There was absolutely no use of the storyboard",
//                         "This allows for more flexibility in building an application"]
    let pages = [
        Page(imageName: "1", headerText:"Hello, This is Anthony's Project that uses page swiping with the MVC pattern", bodyText: "Press next to move to the next page"),
        Page(imageName: "2", headerText:"Here I added all the UI elements and constraints programmatically", bodyText: "You can swipe left or right to scroll back and forth"),
        Page(imageName: "3", headerText:"There was absolutely no use of the storyboard", bodyText: "The page control keeps track of the page number"),
        Page(imageName: "4", headerText:"This allows for more flexibility in building an application", bodyText: "Press back or swipe right to move to the previous page"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        cell.page = page
        return cell
    }
    
    //delegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
