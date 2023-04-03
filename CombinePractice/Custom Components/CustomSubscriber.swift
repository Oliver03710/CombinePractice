//
//  CustomSubscriber.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/03/22.
//

import Combine

final class CustomSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Incoming Data: \(input)")
        return .none
    }
    
    func receive(subscription: Subscription) {
        print("Subscribing Data")
        subscription.request(.unlimited)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Finished Subscribing")
    }
}
