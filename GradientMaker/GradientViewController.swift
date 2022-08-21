//
//  GradientViewController.swift
//  GradientMaker
//
//  Created by Вадим Лавор on 18.08.22.
//

import UIKit

class GradientViewController: UIViewController {
    
    var colorTop = UIColor.clear
    var colorBottom = UIColor.clear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(view: self.view, colorTop: colorTop, colorBottom: colorBottom)
    }
    
    func setGradientBackground(view: UIView, colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
