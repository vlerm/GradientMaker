//
//  ViewController.swift
//  GradientMaker
//
//  Created by Вадим Лавор on 17.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstColorView: UIView!
    @IBOutlet var firstRedCounter: UILabel!
    @IBOutlet var firstGreenCounter: UILabel!
    @IBOutlet var firstBlueCounter: UILabel!
    
    @IBOutlet var firstRedSlider: UISlider! {
        didSet {
            setSliderParameters(slider: firstRedSlider, color: .red)
        }
    }
    
    @IBOutlet var firstGreenSlider: UISlider! {
        didSet {
            setSliderParameters(slider: firstGreenSlider, color: .green)
        }
    }
    
    @IBOutlet var firstBlueSlider: UISlider! {
        didSet {
            setSliderParameters(slider: firstBlueSlider, color: .blue)
        }
    }
    
    @IBOutlet weak var secondColorView: UIView!
    @IBOutlet weak var secondRedCounter: UILabel!
    @IBOutlet weak var secondGreenCounter: UILabel!
    @IBOutlet weak var secondBlueCounter: UILabel!
    
    @IBOutlet weak var secondRedSlider: UISlider! {
        didSet {
            setSliderParameters(slider: secondRedSlider, color: .red)
        }
    }
    
    @IBOutlet weak var secondGreenSlider: UISlider! {
        didSet {
            setSliderParameters(slider: secondGreenSlider, color: .green)
        }
    }
    
    @IBOutlet weak var secondBlueSlider: UISlider! {
        didSet {
            setSliderParameters(slider: secondBlueSlider, color: .blue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultParameters()
    }
    
    @IBAction func firstRedSliderValueChanged(_ sender: UISlider) {
        counterValueChanged(counterLabel: firstRedCounter, sender: sender)
    }
    
    @IBAction func firstGreenSliderValueChanged(_ sender: UISlider) {
        counterValueChanged(counterLabel: firstGreenCounter, sender: sender)
    }
    
    @IBAction func firstBlueSliderValueChanged(_ sender: UISlider) {
        counterValueChanged(counterLabel: firstBlueCounter, sender: sender)
    }
    
    @IBAction func secondRedSliderValueChanged(_ sender: UISlider) {
        counterValueChanged(counterLabel: secondRedCounter, sender: sender)
    }
    
    @IBAction func secondGreenSliderValueChanged(_ sender: UISlider) {
        counterValueChanged(counterLabel: secondGreenCounter, sender: sender)
    }
    
    @IBAction func secondBlueSliderValueChanged(_ sender: UISlider) {
        counterValueChanged(counterLabel: secondBlueCounter, sender: sender)
    }
    
    @IBAction func showGetGradient(_ sender: UIButton) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "GradientViewController") as? GradientViewController {
            detailViewController.colorTop = firstColorView.backgroundColor ?? UIColor.systemBlue
            detailViewController.colorBottom = secondColorView.backgroundColor ?? UIColor.systemPink
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    @IBAction func colorValueChanged(_ sender: UISlider) {
        firstColorView.backgroundColor = UIColor(red: CGFloat(firstRedSlider.value) / 255, green: CGFloat(firstGreenSlider.value) / 255, blue: CGFloat(firstBlueSlider.value) / 255, alpha: 1.0)
        secondColorView.backgroundColor = UIColor(red: CGFloat(secondRedSlider.value) / 255, green: CGFloat(secondGreenSlider.value) / 255, blue: CGFloat(secondBlueSlider.value) / 255, alpha: 1.0)
    }
    
    func counterValueChanged(counterLabel: UILabel, sender: UISlider){
        let counter = Int(sender.value)
        counterLabel.text = "\(counter)"
    }
    
    func setSliderParameters(slider: UISlider, color: UIColor){
        slider.value = 0
        slider.thumbTintColor = color
        slider.minimumTrackTintColor = color
    }

    func setupDefaultParameters(){
        firstColorView.layer.cornerRadius = 15
        firstColorView.backgroundColor = .black
        secondColorView.layer.cornerRadius = 15
        secondColorView.backgroundColor = .black
        self.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor)
    }
    
    func setGradientBackground(view: UIView, colorTop: CGColor = UIColor(red: 29.0/255.0, green: 34.0/255.0, blue:234.0/255.0, alpha: 1.0).cgColor, colorBottom: CGColor = UIColor(red: 38.0/255.0, green: 0.0/255.0, blue: 6.0/255.0, alpha: 1.0).cgColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
