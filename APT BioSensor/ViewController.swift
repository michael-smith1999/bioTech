//
//  ViewController.swift
//  APT BioSensor
//
//  Created by Benjamin R. on 9/16/22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var roll: UILabel!
    @IBOutlet weak var pitch: UILabel!
    @IBOutlet weak var yaw: UILabel!
    
    var motion = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrientation();
        // Do any additional setup after loading the view.
    }
    func getOrientation() {
        
        motion.deviceMotionUpdateInterval = 1
        motion.startDeviceMotionUpdates(to: OperationQueue.current!){ (data, error) in
            if let trueData = data{
                self.roll.text = "\(trueData.attitude.roll)"
                self.yaw.text = "\(trueData.attitude.yaw)"
                self.pitch.text = "\(trueData.attitude.pitch)"
            }
            
        }
    }
}

