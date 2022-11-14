//
//  UIViewController+Extension.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit
import Swinject

extension UIViewController {
    
    var container: Container {
        ContainerManager.shared.container
    }
}
