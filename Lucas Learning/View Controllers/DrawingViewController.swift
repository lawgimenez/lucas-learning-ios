//
//  DrawingViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/4/22.
//

import UIKit
import CoreGraphics

class DrawingViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    private var lastPoint = CGPoint.zero
    private var color = UIColor.black
    private var brushWidth: CGFloat = 10.0
    private var opacity: CGFloat = 1.0
    private var isSwiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .dark {
            // Dark
            color = .white
        } else {
            color = .black
        }
        title = "Drawing"
        let selectColorBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paintpalette"), style: .plain, target: self, action: #selector(selectColor))
        navigationItem.rightBarButtonItem = selectColorBarButtonItem
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                if traitCollection.userInterfaceStyle == .dark {
                    // Dark
                    color = .white
                }
                else {
                    // Light
                    color = .black
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        isSwiped = false
        lastPoint = touch.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        isSwiped = true
        let currentPoint = touch.location(in: view)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isSwiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
        UIGraphicsBeginImageContext(view.frame.size)
        mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        tempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tempImageView.image = nil
    }
    
    private func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        tempImageView.image?.draw(in: view.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    @objc func selectColor() {
        let colorsViewController = storyboard?.instantiateViewController(withIdentifier: "colors") as! ColorsViewController
        colorsViewController.modalPresentationStyle = .pageSheet
        if let sheet = colorsViewController.sheetPresentationController {
            // 3
            sheet.detents = [.medium(), .large()]
            
        }
        colorsViewController.colorSelectDelegate = self
        present(colorsViewController, animated: true)
    }
}

extension DrawingViewController: ColorSelectDelegate {
    
    func colorSelected(color: UIColor) {
        self.color = color
    }
}
