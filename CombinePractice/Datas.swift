//
//  Datas.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/03/22.
//

import Combine

final class Datas {
    // MARK: - Properties
    @Published var number: Int
    
    // MARK: - Init
    init(number: Int) {
        self.number = number
    }
}
