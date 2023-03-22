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
        
        let data = Datas(number: 20)
        
        data.objectWillChange
            .sink { print("value = \($0)") }
            .store(in: &subscription)
        
        data.number = 10
        data.number = -1
    }
}

