//
//  TrafficLight.swift
//  Traffic light
//
//  Created by Ramcharan Reddy Gaddam on 10/08/20.
//  Copyright © 2020 Ramcharan. All rights reserved.
//

import UIKit

extension UIControl.State {
    public static var turnOn: UIControl.State = UIControl.State(rawValue: 1<<24)
    public static var turnOff: UIControl.State = UIControl.State(rawValue: 1<<25)
}

enum TrafficLightType {
    case red
    case amber
    case green
}

@IBDesignable
class TrafficLight: UIControl {

    override var intrinsicContentSize: CGSize {
        CGSize(width: 70, height: 70)
    }
    
    var type: TrafficLightType = .red
    
    private var _state: UIControl.State = .turnOff
    
    override var state: UIControl.State {
        set {
            _state = newValue
            if newValue == .turnOn {
                turnOn()
            } else if newValue == .turnOff {
                turnOff()
            }
        }
        get {
            return _state
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2.0
    }
    
    func turnOn() {
        switch type {
        case .red:
            self.backgroundColor = UIColor.red.withAlphaComponent(1.0)
        case .amber:
            self.backgroundColor = UIColor.orange.withAlphaComponent(1.0)
        case .green:
            self.backgroundColor = UIColor.green.withAlphaComponent(1.0)
        }
    }
    
    func turnOff() {
        switch type {
        case .red:
            self.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        case .amber:
            self.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        case .green:
            self.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
    }
    
}
