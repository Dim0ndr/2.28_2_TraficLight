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
                
        countText.text = String("\(count)")
        trafficLightButton.layer.cornerRadius = 10
        
        for (index,light) in lightRounds.enumerated() {
            light.backgroundColor = index % 3 == 0 ? UIColor.systemRed :
            index % 3 == 1 ? UIColor.systemYellow : UIColor.systemGreen
            light.alpha = 0.3
//            light.layer.cornerRadius = light.frame.height / 2
        }
        print("Высота стороны для viewDidLoad =", lightRounds[0].frame.height)
        
    }
    override func viewDidLayoutSubviews() {

        lightRounds.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
        }

        print("Высота стороны для viewDidLayoutSubviews =", lightRounds[0].frame.height)

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        lightRounds.forEach {
//            $0.layer.cornerRadius = $0.frame.height / 2
//        }
//    }


//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        if UIDevice.current.orientation.isLandscape {
//            print("Landscape")
//            lightRounds.forEach {
//                $0.layer.cornerRadius = $0.frame.height / 2
//            }
//        } else {
//            print("Portrait")
//            lightRounds.forEach {
//                $0.layer.cornerRadius = $0.frame.height / 2
//            }
//        }
//    }
    
    @IBAction func pushRed() {
        
        lightRounds[0].alpha = lightRounds[0].alpha < 1 ? 1 : 0.3
        print(lightRounds[0].alpha)
        
    }
    
    @IBAction func pushGreen() {
        lightRounds[2].alpha = lightRounds[2].alpha < 1 ? 1 : 0.3
        
    }
    @IBAction func pushYellow() {
        lightRounds[1].alpha = lightRounds[1].alpha < 1 ? 1 : 0.3
//        print(lightRounds[0].alpha)
        
    }
    @IBAction func trafficLightButtonTapped() {
        
        if trafficLightButton.currentTitle == "START" {
            trafficLightButton.setTitle("NEXT", for: .normal)
        }
        
        for (index,light) in lightRounds.enumerated() {
            
//            light.alpha = count % lightRounds.count == index ? 1 : 0.3
//
//            countText.text = String("\(count) - \(count % 3) == \(index)")
            
            if count % lightRounds.count == index {
                light.alpha = 1.0
                countText.text = String("\(count) - \(count % 3) == \(index)")
            } else {
                light.alpha = 0.3
            }
            
            
            print("\(count): \(count % lightRounds.count) == \(index)")
        }
        count += 1

    }
    
//    private func setupButton(with title: String) -> UIButton.Configuration {
//        var buttonConfiguration = UIButton.Configuration.filled()
//        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
//        buttonConfiguration.title = title
//        buttonConfiguration.buttonSize = .large
//        buttonConfiguration.cornerStyle = .large
//        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
//        return buttonConfiguration
//    }
    


}

