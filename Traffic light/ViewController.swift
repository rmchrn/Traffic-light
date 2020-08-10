//
//  ViewController.swift
//  Traffic light
//
//  Created by Ramcharan Reddy Gaddam on 10/08/20.
//  Copyright © 2020 Ramcharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redControl: TrafficLight!
    
    @IBOutlet weak var amberControl: TrafficLight!
    
    @IBOutlet weak var greenControl: TrafficLight!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        redControl.type = .red
        amberControl.type = .amber
        greenControl.type = .green
        
        var indicator = 1
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if 1 <= indicator && indicator <= 4 {
                self.turnOn(type: .red)
            } else if 5 == indicator {
                self.turnOn(type: .amber)
            } else if 6 <= indicator && indicator <= 9 {
                self.turnOn(type: .green)
            }
            indicator += 1
            if indicator > 9 {
                indicator = 1
            }
        }
    }
    
    func turnOn(type aType: TrafficLightType) {
        self.redControl.state = .turnOff
        self.amberControl.state = .turnOff
        self.greenControl.state = .turnOff
        switch aType {
        case .red:
            self.redControl.state = .turnOn
        case .amber:
            self.amberControl.state = .turnOn
        case .green:
            self.greenControl.state = .turnOn
        }
    }


}

