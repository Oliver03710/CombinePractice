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
        
        [1, 2, Optional(3), 4]
            .publisher
            .compactMap { $0 }
            .sink(receiveValue: { print($0) })
            .store(in: &subscription)
    }
}

