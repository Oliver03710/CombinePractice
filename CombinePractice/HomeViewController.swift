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
            .tryScan(0) { try self.handleSomeValue(lhs: $0, rhs: $1) }
            .sink(
                receiveCompletion: { print("receiveCompletion: \($0)") },
                receiveValue: { print("receiveValue: \($0)") }
            )
    }
    
    func handleSomeValue(lhs: Int?, rhs: Int?) throws -> Int {
        guard let lhs, let rhs else { throw NilError.isNil }
        return lhs + rhs
    }
}

