//
//  Color.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/3/22.
//

import Foundation
import UIKit

struct Color {
    
    let name: String?
    var color: UIColor = .blue
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
