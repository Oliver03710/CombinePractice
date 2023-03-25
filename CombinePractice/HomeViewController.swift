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
        
        let publisher = [1, nil, 100].publisher
        
        let cancellable = publisher
            .setFailureType(to: CustomError.self)
            .sink(
                receiveCompletion: { print($0) },
                receiveValue: { print($0) }
            )
    }
}

