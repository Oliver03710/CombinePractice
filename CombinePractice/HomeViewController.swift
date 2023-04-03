//
//  HomeViewController.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/03/22.
//

import UIKit
import Combine

final class HomeViewController: UIViewController {
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Text Field"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Inactive"
        config.baseBackgroundColor = .darkGray
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isEnabled = false
        return btn
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setConstraints()
        bindTo()
    }
    
    // MARK: - Functions
    private func setConstraints() {
        view.addSubview(textField)
        view.addSubview(button)
        
        textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        NSLayoutConstraint(item: textField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.7, constant: 0).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func bindTo() {
        textField.controlPublisher(for: .editingChanged)
            .map { $0 as UITextField }
            .compactMap { $0.text }
            .eraseToAnyPublisher()
            .sink { str in
                print(str)
            }
            .store(in: &cancellables)
        
        button.controlPublisher(for: .touchUpInside)
            .map { $0 as UIButton }
            .eraseToAnyPublisher()
            .sink { _ in
                print("Button Is Tapped")
            }
            .store(in: &cancellables)
        
        textField.controlPublisher(for: .editingChanged)
            .map { $0 as UITextField }
            .compactMap { $0.text?.isEmpty }
            .eraseToAnyPublisher()
            .sink { [weak self] isEmpty in
                guard let self else { return }
                self.button.configuration?.title = isEmpty ? "Inactive" : "Active"
                self.button.configuration?.baseBackgroundColor = isEmpty ? .darkGray : .systemBlue
                self.button.isEnabled = isEmpty ? false : true
            }
            .store(in: &cancellables)
    }
}


