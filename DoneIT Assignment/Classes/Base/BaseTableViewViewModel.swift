//
//  BaseTableViewViewModel.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation

protocol BaseTableViewViewModel: AnyObject {
    var onUpdateTable: (() -> Void)? { get set }
    
    func numberOfRows() -> Int
    func selectElement(at index: Int)
}
