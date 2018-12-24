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
        return imageView
    }()
    
    let descriptionTextView : UITextView = {
        let textview = UITextView()
        textview.text = "How are you doing today?"
        textview.textAlignment = .center
        textview.font = UIFont.boldSystemFont(ofSize: 20)
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isEditable = false
        textview.isScrollEnabled = false
        return textview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(imageView)
        view.addSubview(descriptionTextView)
        setupLayout()
    }

    func setupLayout() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //TextView Contraints
        descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant : 30).isActive = true
    }
    
}

