//
//  ViewController.swift
//  FWJoystickExemple
//
//  Created by Vincent Kocupyr on 11/02/2017.
//  Copyright © 2017 MOC2. All rights reserved.
//

import UIKit
import FWJoystick

class ViewController: UIViewController {
    
    var label: UITextField?;
    let joystick = FWJoystick();

    override func viewDidLoad() {
        super.viewDidLoad()
        label =  UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label?.textColor = UIColor.blue
        label?.textAlignment = NSTextAlignment.center
        label?.text = "Hello"
        label?.accessibilityLabel = "testLabel";
        
        joystick.actionHandler = { section in
            switch section {
            case 0:
                self.setTextLabel(text: "CENTER")
            case 1:
                self.setTextLabel(text: "LEFT")
            case 2:
                self.setTextLabel(text: "UP")
            case 3:
                self.setTextLabel(text: "RIGHT")
            case 4:
                self.setTextLabel(text: "DOWN")
            default:
                break;
            }
        }
        joystick.center = CGPoint(x: view.frame.size.width  / 2,y: view.frame.size.height / 2);
        joystick.accessibilityLabel = "joystick";
        label?.center = CGPoint(x: 100 ,y: 100);
        view.addSubview(label!);
        view.addSubview(joystick)
    }

    func setTextLabel(text: String){
        joystick.isInAction = true;
        label?.text = text;
        setTimeout(delay: 2, block: { () -> Void in
            // do this stuff after 0.35 seconds
            self.joystick.isInAction = false;
        })
    }
    func setTimeout(delay:TimeInterval, block:@escaping ()->Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
