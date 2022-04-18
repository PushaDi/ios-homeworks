//
//  Setupable.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 26.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
