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
        
        let publisher1 = [1, 2, 3].publisher
        let cancellable1 = publisher1
            .map { $0 + 2 }
            .sink(receiveValue: { print($0) })
    }
}

