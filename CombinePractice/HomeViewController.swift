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
        
        let subject = PassthroughSubject<Void, Never>()

        subject
            .sink(receiveValue: { _ in print(Thread.isMainThread) })
            .store(in: &subscription)

        subject.send(())

        DispatchQueue.global().async {
            subject.send(())
        }

        let cancellable = subject

        cancellable
          .handleEvents(receiveOutput: { print("upstream: \(Thread.isMainThread)") })
          .receive(on: DispatchQueue.main)
          .handleEvents(receiveOutput: { print("downstream: \(Thread.isMainThread)") })
          .sink(receiveValue: { _ in print()  })
          .store(in: &subscription)

        DispatchQueue.global().async {
          subject.send(())
        }
        
        Just(1)
          .map { _ in print("subscribe Upstream: \(Thread.isMainThread)") }
          .map { _ in print("middle Stream: \(Thread.isMainThread)") }
          .subscribe(on: DispatchQueue.global())
          .sink { print("subscribe Downstream: \(Thread.isMainThread)") }
          .store(in: &subscription)
        
        let delayCancellable = Just(1)
        
        delayCancellable
          .receive(on: DispatchQueue.main)
          .map { _ in print(Thread.isMainThread) }
          .delay(for: 2, scheduler: DispatchQueue.global())
          .sink { print(Thread.isMainThread) }
          .store(in: &subscription)
    }
}

