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
        
        let anyCancellable = data.$number
            .sink { print($0) }
        
        data.number = 1
        data.number = -20
        
        anyCancellable.cancel()
        data.number = 100
        data.number = 1000000
    }
}

