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
        
        Future<Int, Never> { promise in
            promise(.success(1))
        }
        .sink { print($0) }
        
        var number = 0
        let futureTester = FutureTester()
        futureTester.execute(100)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { number = $0 })
        
        print(number)
    }
}

