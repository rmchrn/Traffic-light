//
//  TrafficLight.swift
//  Traffic light
//
//  Created by Ramcharan Reddy Gaddam on 10/08/20.
//  Copyright © 2020 Ramcharan. All rights reserved.
//

import UIKit

private enum Constants {
    static let turnOnAlpha: CGFloat = 1.0
    static let turnOffAlpha: CGFloat = 0.5
    static let cornerRadiusDenominator: CGFloat = 2.0
}

/**
 Two custom states i.e. turnOn and turnOff for Traffic light control
 */
extension UIControl.State {
    public static var turnOn: UIControl.State = UIControl.State(rawValue: 1<<24)
    public static var turnOff: UIControl.State = UIControl.State(rawValue: 1<<25)
}
/**
 Traffic light types such as amber, red and green
 */
enum TrafficLightType {
    case red
    case amber
    case green
}

@IBDesignable
class TrafficLight: UIControl {
    //MARK: - properties
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
    //MARK:- life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / Constants.cornerRadiusDenominator
    }
    //MARK:- private methods
    /**
     This will turn on the traffic light
     */
    private func turnOn() {
        switch type {
        case .red:
            self.backgroundColor = UIColor.red.withAlphaComponent(Constants.turnOnAlpha)
        case .amber:
            self.backgroundColor = UIColor.orange.withAlphaComponent(Constants.turnOnAlpha)
        case .green:
            self.backgroundColor = UIColor.green.withAlphaComponent(Constants.turnOnAlpha)
        }
    }
    /**
    This will turn off the traffic light
    */
    private func turnOff() {
        switch type {
        case .red:
            self.backgroundColor = UIColor.red.withAlphaComponent(Constants.turnOffAlpha)
        case .amber:
            self.backgroundColor = UIColor.orange.withAlphaComponent(Constants.turnOffAlpha)
        case .green:
            self.backgroundColor = UIColor.green.withAlphaComponent(Constants.turnOffAlpha)
        }
    }
    
}
