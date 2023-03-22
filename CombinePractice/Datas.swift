//
//  Datas.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/03/22.
//

import Combine

final class Datas: ObservableObject {
    // MARK: - Properties
    var number: Int {
        willSet { self.objectWillChange.send() }
    }
    
    // MARK: - Init
    init(number: Int) {
        self.number = number
    }
}
