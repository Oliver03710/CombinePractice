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
        
        [1,2,3,-3,4]
            .publisher
            .tryMap {
                if $0 == -3 {
                    throw CustomError.other
                } else {
                    return $0
                }
            }
            .replaceError(with: 100)
            .sink(receiveValue: { print($0) })
            .store(in: &subscription)
    }
}

