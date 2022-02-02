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
    
    init(name: String, desc: String, icon: UIImage) {
        self.name = name
        self.desc = desc
        self.icon = icon
    }
}
