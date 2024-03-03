//
//  NaviationBar.swift
//  NotesCD
//
//  Created by petar on 02.03.2024.
//

import Foundation
import UIKit

extension UINavigationController{
    func changeColorTitle(color: UIColor){
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
