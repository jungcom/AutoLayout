//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Anthony Lee on 12/28/18.
//  Copyright © 2018 anthonyLee. All rights reserved.
//

import UIKit

class SwipingController : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
    
    let pages = [
        Page(imageName: "1", headerText:"Hello, This is Anthony's Project that uses page swiping with the MVC pattern", bodyText: "Press next to move to the next page"),
        Page(imageName: "2", headerText:"Here I added all the UI elements and constraints programmatically", bodyText: "You can swipe left or right to scroll back and forth"),
        Page(imageName: "3", headerText:"There was absolutely no use of the storyboard", bodyText: "The page control keeps track of the page number"),
        Page(imageName: "4", headerText:"This allows for more flexibility in building an application", bodyText: "Press back or swipe right to move to the previous page"),
        Page(imageName: "1", headerText:"Hello, This is Anthony's Project that uses page swiping with the MVC pattern", bodyText: "Press next to move to the next page"),
        Page(imageName: "2", headerText:"Here I added all the UI elements and constraints programmatically", bodyText: "You can swipe left or right to scroll back and forth"),
        Page(imageName: "3", headerText:"There was absolutely no use of the storyboard", bodyText: "The page control keeps track of the page number"),
        Page(imageName: "4", headerText:"This allows for more flexibility in building an application", bodyText: "Press back or swipe right to move to the previous page"),
    ]
    
    private let previousButton : UIButton = {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Back", for: .normal)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        previousButton.setTitleColor(.black, for: .normal)
        previousButton.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return previousButton
    }()
    
    @objc func handlePrevious(){
        let index = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: index, section: 0)
        pageControl.currentPage = index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton : UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return nextButton
    }()
    
    @objc func handleNext(){
        let index = min(pageControl.currentPage + 1, pages.count-1)
        let indexPath = IndexPath(item: index, section: 0)
        pageControl.currentPage = index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .cyan
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    fileprivate func setupBottomControls(){
        
        
        //StackView
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomStackView.backgroundColor = .red
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
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
