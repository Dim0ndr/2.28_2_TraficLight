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
                
//        for light in lightRounds {
//            light.alpha = 0.3
//            light.layer.cornerRadius = light.frame.height / 2
//        }
        
        lightRounds.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
            $0.alpha = 0.3
        }
        
        
        countText.text = String("\(count)")
        trafficLightButton.layer.cornerRadius = 10
    }
    
    @IBAction func trafficLightButtonTapped() {
        
        trafficLightButton.setTitle("NEXT", for: .normal)
        
        for (index,light) in lightRounds.enumerated() {
            light.alpha = count % 3 == index ? 1 : 0.3
            light.layer.cornerRadius = light.frame.height / 2
        }
        count += 1
        countText.text = String("\(count)")
    }
    
}

