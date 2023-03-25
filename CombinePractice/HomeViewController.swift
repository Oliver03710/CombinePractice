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
        
        (0...10)
            .publisher
            .tryFilter({ num in
                guard num != 0 else { throw CustomError.other }
                return num < 20
            })
            .ignoreOutput()
            .sink(
                receiveCompletion: { print("completion: \($0)") },
                receiveValue: { print("value \($0)") }
            )
            .store(in: &subscription)
    }
}

