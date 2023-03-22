//
//  FutureTester.swift
//  CombinePractice
//
//  Created by Junhee Yoon on 2023/03/22.
//

import UIKit
import Combine

struct FutureTester {
    func execute(_ number: Int, completion: (Result<Int, Error>) -> Void) -> Void {
        completion(.success(number))
        print("FutureTester Executed")
    }
    
    func execute(_ number: Int) -> Future<Int, Error> {
        Future { promise in
            self.execute(number, completion: promise)
        }
    }
}
