//
//  CustomError.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/03/25.
//

import Foundation

enum CustomError: Error {
    case zero
    case other
}

enum GeneralError: Error {
    case first
}

enum NilError: Error {
    case isNil
}
