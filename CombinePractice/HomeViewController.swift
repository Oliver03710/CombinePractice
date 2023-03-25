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
            .flatMap { value -> AnyPublisher<Int, Never> in
                Future { promise in
                    promise(.success(value + 10))
                }
                .eraseToAnyPublisher()
            }
            .sink(receiveValue: { print($0) } )
    }
}

