//
//  ViewController.swift
//  Traffic light
//
//  Created by Ramcharan Reddy Gaddam on 10/08/20.
//  Copyright © 2020 Ramcharan. All rights reserved.
//

import UIKit

private enum Constants {
    static let redDuration = 4
    static let amberDuration = 1
    static let greenDuration = 4
}

class ViewController: UIViewController {
    //MARK: - outlets
    @IBOutlet weak var redControl: TrafficLight!
    
    @IBOutlet weak var amberControl: TrafficLight!
    
    @IBOutlet weak var greenControl: TrafficLight!
    
    //MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redControl.type = .red
        amberControl.type = .amber
        greenControl.type = .green
        
        startSignalling()
    }
    
    /**
     It start signalling with the given durations for each traffic light
     */
    private func startSignalling() {
        var indicator = 1
        let totalDuration = Constants.redDuration + Constants.amberDuration + Constants.greenDuration
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            switch indicator {
            case 1...Constants.redDuration:
                self.turnOn(type: .red)
            case Constants.redDuration + 1:
                self.turnOn(type: .amber)
            case (Constants.redDuration + Constants.amberDuration + 1)...totalDuration:
                self.turnOn(type: .green)
            default:
                break
            }
            indicator += 1
            if indicator > totalDuration {
                indicator = 1
            }
        }
    }
    /**
     It will turn on one light and turn off the rest
     - parameter aType: Type of light which you want to turn on
     */
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

