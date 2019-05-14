//
//  ViewController.swift
//  ScrollViews
//
//  Created by Michael Kozub on 5/14/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let redView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let greenView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add the scroll view to self.view
        self.view.addSubview(scrollView)
        
        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0).isActive = true
        
        // add three views to the scroll view
        scrollView.addSubview(redView)
        scrollView.addSubview(greenView)
        scrollView.addSubview(blueView)
        
        // give each view a height of 300
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalToConstant: 300),
            greenView.heightAnchor.constraint(equalToConstant: 300),
            blueView.heightAnchor.constraint(equalToConstant: 300),
            ])
        
        // give each view a width constraint equal to scrollView's width
        NSLayoutConstraint.activate([
            redView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            greenView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            blueView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            ])
        
        // constrain each view's leading and trailing to the scrollView
        // this also defines the width of the scrollView's .contentSize
        NSLayoutConstraint.activate([
            redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            greenView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            blueView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            redView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            greenView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            blueView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            ])
        
        // constrain redView's Top to scrollView's Top + 8-pts padding
        // this also defines the Top of the scrollView's .contentSize
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8.0),
            ])
        
        // constrain greenView's Top to redView's Bottom + 20-pts spacing
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20.0),
            ])
        
        // constrain blueView's Top to greenView's Bottom + 20-pts spacing
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20.0),
            ])
        
        // constrain blueView's Bottom to scrollView's Bottom + 8-pts padding
        // this also defines the Bottom / Height of the scrollView's .contentSize
        // Note: it must be negative
        NSLayoutConstraint.activate([
            blueView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8.0),
            ])
        
        // result:
        // scrollView's .contentSize.width is now
        // scrollView's width (defined by subviews' leading and trailing anchors
        //
        // and scrollView's .contentSize.height is now
        // redView-Height + 20-pts-spacing +
        // greenView-Height + 20-pts-spacing +
        // blueView-Height +
        // 8-pts top-padding + 8-pts bottom-padding
        // or 956
    }


}

