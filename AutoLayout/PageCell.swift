//
//  PageCell.swift
//  AutoLayout
//
//  Created by Anthony Lee on 12/28/18.
//  Copyright © 2018 anthonyLee. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell{
    
    var page : Page? {
        didSet{
            guard let page = page else {return}
            
            imageView.image = UIImage(named: page.imageName)
            
            let attributedText = NSMutableAttributedString(string: page.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
            attributedText.append(NSAttributedString(string: "\n\n\n \(page.bodyText)", attributes : [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
        }
    }
    
    private let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private let descriptionTextView : UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isEditable = false
        textview.isScrollEnabled = false
        return textview
    }()
    
    private let topContainerView : UIView = {
        let topContainerView = UIView()
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        return topContainerView
    }()
    
    private let previousButton : UIButton = {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Back", for: .normal)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        previousButton.setTitleColor(.black, for: .normal)
        return previousButton
    }()
    
    private let nextButton : UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return nextButton
    }()
    
    private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .cyan
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupBottomControls()
    }
    
    func setupLayout() {
        //add as subViews
        addSubview(descriptionTextView)
        addSubview(topContainerView)
        
        //TopcontainerView Constraint
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topContainerView.addSubview(imageView)
        //      Better to use leading and trailing anchors that right left
        
        //      topContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //      topContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        //ImageView Constraint
        imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        //TextView Contraints
        descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant : 30).isActive = true
    }
    
    fileprivate func setupBottomControls(){
        
        
        //StackView
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomStackView.backgroundColor = .red
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
