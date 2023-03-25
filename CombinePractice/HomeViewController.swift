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
        
        [1, 2, -3, 4]
            .publisher
            .tryFilter {
                if $0 == -3 {
                    throw CustomError.other
                } else {
                    return true
                }
            }
            .sink(
                receiveCompletion: { val in
                    switch val {
                    case let .failure(error):
                        // 에러 발생시 Complition에서 처리하므로 그 뒤의 데이터는 구독해제 되어 출력되지 않음.
                        print("error=", error)
                    case .finished:
                        print("finish")
                    }
                },
                receiveValue: { print($0) }
            )
            .store(in: &subscription)
    }
}

