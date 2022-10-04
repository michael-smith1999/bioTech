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
    let conVal = 180/Double.pi
    var rollDeg:Double = 0
    var yawDeg:Double = 0
    var pitchDeg:Double = 0
    
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
                //convert roll, pitch, yaw to degrees and display
                self.rollDeg=trueData.attitude.roll*self.conVal
                self.roll.text = "\(self.rollDeg)"
                
                self.yawDeg=trueData.attitude.yaw*self.conVal
                self.yaw.text = "\(self.yawDeg)"
                
                self.pitchDeg=trueData.attitude.pitch*self.conVal
                self.pitch.text = "\(self.pitchDeg)"
            }
            
        }
    }
}

