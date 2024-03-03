//
//  NaviationBar.swift
//  NotesCD
//
//  Created by petar on 02.03.2024.
//

import UIKit

extension UINavigationController {
    func configureTitleTextAttributes(color: UIColor? = nil,
                                      font: UIFont? = nil) {
        var attributes = [NSAttributedString.Key: Any]()
        
        if let color {
            attributes[.foregroundColor] = color
        }
        
        if let font {
            attributes[.font] = font
        }
        
        navigationBar.titleTextAttributes = attributes
    }
}
