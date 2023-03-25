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
        
        [1, 10, 100]
            .publisher
            .reduce(10, { $0 + $1 })
            .sink { print($0) }
            .store(in: &subscription)
    }
}

