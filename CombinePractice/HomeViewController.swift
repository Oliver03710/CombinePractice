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
        
        let subject = PassthroughSubject<String, Never>()
        
        subject
            .sink(receiveValue: { print($0) })
            .store(in: &subscription)
        
        subject.send("dddd")
        subject.send("\(123123123)")
        
        let subject2 = CurrentValueSubject<String, Never>("Current")
        
        subject2
            .sink(receiveValue: { print($0) })
            .store(in: &subscription)
        
        subject2.send("Next")
        subject2.send("Next 2")
    }
}

