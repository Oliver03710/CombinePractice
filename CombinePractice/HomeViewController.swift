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
        
        let publisher = [2, 1, 0].publisher
        
        let cancellable = publisher
            .tryMap {
                guard $0 != 0 else { throw CustomError.zero }
                return 10 / $0
            }
            .sink(
                receiveCompletion: { result in
                    switch result {
                    case let .failure(error):
                        print("failure: \(error)")
                    case .finished:
                        print("finished")
                    }
                },
                receiveValue: { value in
                    print(value)
                }
            )
    }
}

