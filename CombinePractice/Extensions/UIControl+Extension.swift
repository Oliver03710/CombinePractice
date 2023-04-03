//
//  UIControl+Extension.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/04/03.
//

import UIKit
import Combine

protocol Combinable { }
extension UIControl: Combinable { }

// MARK: - Custom Subscriber
extension UIControl {
    fileprivate class EventControlSubscription<EventSubscriber: Subscriber, Control: UIControl>: Subscription where EventSubscriber.Input == Control, EventSubscriber.Failure == Never {
        // MARK: - Properties
        let event: UIControl.Event
        let control: Control
        var subscriber: EventSubscriber?
        
        var currentDemand: Subscribers.Demand = .none
        
        // MARK: - Initializers
        init(control: Control, event: UIControl.Event, subscriber: EventSubscriber) {
            self.control = control
            self.subscriber = subscriber
            self.event = event
            
            control.addTarget(self, action: #selector(eventRaised), for: event)
        }
        
        // MARK: - Functions
        func request(_ demand: Subscribers.Demand) {
            currentDemand += demand
        }
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(eventRaised), for: event)
        }
        
        // MARK: - Selectors
        
        @objc func eventRaised() {
            if currentDemand > 0 {
                _ = subscriber?.receive(control)
                currentDemand -= 1
            }
        }
    }
}

// MARK: - Custom Publisher
extension UIControl {
    struct EventControlPublisher<Control: UIControl>: Publisher {
        typealias Output = Control
        typealias Failure = Never
        
        let control: Control
        let controlEvent: Control.Event
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            let subscription = EventControlSubscription(control: control, event: controlEvent, subscriber: subscriber)
            subscriber.receive(subscription: subscription)
        }
    }
}

// MARK: - Control Publisher
extension Combinable where Self: UIControl {
    func controlPublisher(for event: UIControl.Event) -> UIControl.EventControlPublisher<Self> {
        return UIControl.EventControlPublisher(control: self, controlEvent: event)
    }
}
