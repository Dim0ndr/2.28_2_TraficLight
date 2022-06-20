//
//  ViewController.swift
//  2.28_2_TraficLight
//
//  Created by Dimondr on 19.06.2022.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var trafficLightButton: UIButton!
    @IBOutlet var lightRounds: [UIView]!
    
    @IBOutlet var countText: UILabel!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        for (index,light) in lightRounds.enumerated() {
            light.alpha = 0.3
            light.backgroundColor = index % 3 == 0 ? UIColor.systemRed :
            index % 3 == 1 ? UIColor.systemYellow : UIColor.systemGreen
            light.layer.cornerRadius = light.frame.height / 2
        }
        countText.text = String("\(count)")
        trafficLightButton.configuration = setupButton(with: "START")
    }
    
    @IBAction func trafficLightButtonTapped() {
        
        trafficLightButton.configuration = setupButton(with: "NEXT")
        
        for (index,light) in lightRounds.enumerated() {
            light.alpha = count % 3 == index ? 1 : 0.3
            light.layer.cornerRadius = light.frame.height / 2
        }
        count += 1
        countText.text = String("\(count)")
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
    


}

