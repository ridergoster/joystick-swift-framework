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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let joystick = FWJoystick()
        joystick.actionHandler = { section in
            switch section {
            case 0:
                print("LEFT")
            case 1:
                print("UP")
            case 2:
                print("RIGHT")
            case 3:
                print("DOWN")
            default:
                break;
                
            }
        }
        joystick.center = CGPoint(x: view.frame.size.width  / 2,y: view.frame.size.height / 2);
        view.addSubview(joystick)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
