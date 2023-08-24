//
//  ViewController.swift
//  Example Github
//
//  Created by Kim Yewon on 2023/08/24.
//

import UIKit
import Combine
import CombineCocoa

class ViewController: UIViewController {
    
    @Published var textFieldValue = "Placeholder"
    
    private var cancellabels = Set<AnyCancellable>()
    
    let text: UILabel = {
        let view = UILabel()
        let title = NSMutableAttributedString(
            string: "Hello, GitHub"
        )
        view.attributedText = title
        return view
    }()
    
    lazy var textField: UITextField = {
        let textFieldView = TextFieldWithPadding()
        textFieldView.text = textFieldValue
        textFieldView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        textFieldView.layer.cornerRadius = 5
        textFieldView.layer.masksToBounds = true
        textFieldView.textPublisher.sink { value in
            guard let value = value else { return }
            self.textFieldValue = value
        }.store(in: &self.cancellabels)
        
        return textFieldView
    }()
    
    lazy var button: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.baseBackgroundColor = .systemBlue
        let button = UIButton(configuration: configuration)
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .systemBlue
        
        button.tapPublisher.sink { _ in
            self.text.attributedText = NSMutableAttributedString(string: self.textFieldValue)
        }.store(in: &self.cancellabels)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        [text, button, textField].forEach(view.addSubview(_:))
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

