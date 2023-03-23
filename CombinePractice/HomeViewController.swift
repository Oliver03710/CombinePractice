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
        
        let subscriber = AnySubscriber<Int, Never>(
            receiveSubscription: { sub in
                print("receiveSubscription: \(sub)")
            },
            receiveValue: { v1 in
                print("receiveValue: \(v1)")
                return .max(1)
            },
            receiveCompletion: { _ in
                print("receiveCompletion")
            }
        )
        
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            .publisher
            .subscribe(subscriber)
        
        
    }
}

