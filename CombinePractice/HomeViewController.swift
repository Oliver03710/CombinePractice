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
    private var subscription = Set<AnyCancellable>()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Empty<String, Never>()
            .sink (
                receiveCompletion: { print("receiveCompletion: \($0)") },
                receiveValue: { print("receiveValue: \($0)") }
            )
        
    }
}

