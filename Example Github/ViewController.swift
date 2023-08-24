//
//  ViewController.swift
//  Example Github
//
//  Created by Kim Yewon on 2023/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let text: UILabel = {
        let view = UILabel()
        let title = NSMutableAttributedString(
            string: "Hello, GitHub"
        )
        view.attributedText = title
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

