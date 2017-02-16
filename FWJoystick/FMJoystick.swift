//
//  FWJoystick.swift
//  FWJoystick
//
//  Created by Vincent Kocupyr on 11/02/2017.
//  Copyright © 2017 MOC2. All rights reserved.
//

import UIKit

@IBDesignable
public class FWJoystick: UIView {
    
    @IBInspectable public var joystickSize: CGSize = CGSize(width: 30, height: 30) { didSet { setNeedsDisplay() }}
    @IBInspectable public var joystickColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) { didSet { setNeedsDisplay() }}
    
    @IBInspectable public var fieldSize: CGSize = CGSize(width: 100, height: 100) { didSet { setNeedsDisplay() }}
    @IBInspectable public var fieldColor: UIColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1) { didSet { setNeedsDisplay() }}

    @IBInspectable public var opacity: CGFloat = 1 { didSet { setNeedsDisplay() }}
    
    @IBInspectable public var sectionNb: Int = 4
    @IBInspectable public var sectionSize: CGFloat = 0.5
    @IBInspectable public var centerSize: CGFloat = 0.3

    @IBInspectable public var isInAction: Bool = false

    private var joystickView = UIView(frame: .zero)
    
    public var actionHandler: ((Int) -> Void)?
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    convenience init() {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }

    
    public override func draw(_ rect: CGRect) {
        alpha = opacity

        layer.backgroundColor = fieldColor.cgColor
        layer.cornerRadius = bounds.width / 2
        
        joystickView.frame = CGRect(origin: .zero, size: joystickSize)
        joystickView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        joystickView.layer.backgroundColor = joystickColor.cgColor
        joystickView.layer.cornerRadius = joystickSize.width / 2
        
        if let view = joystickView.superview {
            view.bringSubview(toFront: joystickView)
        } else {
            addSubview(joystickView)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.touchesMoved(touches, with: event)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let radius = frame.width / 2
            let touchPoint = touch.location(in: self)
            let position = CGPoint(x: touchPoint.x - (frame.width / 2), y: touchPoint.y - (frame.height / 2))
            let distance = sqrt(position.x * position.x + position.y * position.y)
            if (distance < radius) {
                joystickView.center = touchPoint
            } else {
                let aX = (position.x / distance * frame.height / 2) + (frame.width / 2)
                let aY = (position.y / distance * frame.height / 2) + (frame.width / 2)
                joystickView.center = CGPoint(x: aX, y: aY)
            }
            
            let angleSize = 2 * M_PI / Double(sectionNb)
            var angle = Double(atan2(position.y, position.x)) + 3.14
            if(sectionNb == 4) {
                // ajustement
                angle += (3.14 / 4)
            }
            let section = Int(Int(angle / angleSize) % sectionNb)

            if(sqrt(position.x * position.x + position.y * position.y) > (radius * sectionSize) && !isInAction) {
                actionHandler?(section + 1)
            }
            else if(sqrt(position.x * position.x + position.y * position.y) < (radius * centerSize) && !isInAction) {
                actionHandler?(0)
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        reset()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        reset()
    }
    
    private func reset() {
        UIView.animate(withDuration: 0.1) {
            self.joystickView.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        }
    }
}
