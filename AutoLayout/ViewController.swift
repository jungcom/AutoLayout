//
//  ViewController.swift
//  AutoLayout
//
//  Created by Anthony Lee on 12/24/18.
//  Copyright © 2018 anthonyLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hat2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView : UITextView = {
        let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "How are you doing today?", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: "\n\n\nToday is Christmas! Are you ready for some presents???????????????", attributes : [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        textview.attributedText = attributedText
        textview.textAlignment = .center
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isEditable = false
        textview.isScrollEnabled = false
        return textview
    }()
    
    let topContainerView : UIView = {
        let topContainerView = UIView()
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        return topContainerView
    }()
    
    let previousButton : UIButton = {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Back", for: .normal)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        previousButton.setTitleColor(.black, for: .normal)
        return previousButton
    }()
    
    let nextButton : UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return nextButton
    }()
    
    let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .cyan
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(descriptionTextView)
        view.addSubview(topContainerView)
        setupBottomControls()
        setupLayout()
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

    func setupLayout() {
        //TopcontainerView Constraint
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
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
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant : 30).isActive = true
    }
    
}

