//
//  ViewController.swift
//  2.28_2_TraficLight
//
//  Created by Dimondr on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var trafficLightButton: UIButton!
    @IBOutlet var redRound: UIView!
    @IBOutlet var yellowRound: UIView!
    @IBOutlet var greenRound: UIView!
    
//    enum TrafficLights: Int {
//        case redRoundLight = 1
//        case yellowRoundLight
//        case greenRoundLight
//    }
    
    private var maskLight: [Double] = [0.3, 0.3, 0.3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redRound.backgroundColor = UIColor.systemRed
        redRound.alpha = maskLight[0]
        redRound.layer.cornerRadius = redRound.layer.frame.height / 2
        
        yellowRound.backgroundColor = UIColor.systemYellow
        yellowRound.alpha = maskLight[1]
        yellowRound.layer.cornerRadius = yellowRound.layer.frame.height / 2
        
        greenRound.backgroundColor = UIColor.systemGreen
        greenRound.alpha = maskLight[2]
        greenRound.layer.cornerRadius = greenRound.layer.frame.height / 2
        
        maskLight[0] = 1.0
        
        trafficLightButton.configuration = setupButton(with: "START")
    }

    @IBAction func trafficLightButtonTapped() {
        
        trafficLightButton.configuration = setupButton(with: "NEXT")
        
        redRound.alpha = maskLight[0]
        yellowRound.alpha = maskLight[1]
        greenRound.alpha = maskLight[2]
        
        maskLight.insert(maskLight.removeLast(), at: 0)
        
    }
    
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        buttonConfiguration.title = title
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
        return buttonConfiguration
    }
    
//    private func setupLight() -> UIView {
//        let lightConfig = UIView()
//        lightConfig.alpha = 1.0
//        lightConfig.layer.cornerRadius = lightConfig.layer.frame.height / 2
//        return lightConfig
//    }


}

