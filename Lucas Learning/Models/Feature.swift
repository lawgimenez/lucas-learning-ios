//
//  Feature.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/2/22.
//

import UIKit

struct Feature {
    
    let name: String?
    let desc: String?
    let icon: UIImage?
    var colorTheme: UIColor = .blue
    
    init(name: String, desc: String, icon: UIImage, colorTheme: UIColor) {
        self.name = name
        self.desc = desc
        self.icon = icon
        self.colorTheme = colorTheme
    }
}
