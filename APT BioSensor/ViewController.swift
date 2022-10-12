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
    @IBOutlet weak var rollTextView: UITextView!
    @IBOutlet weak var pitchTextView: UITextView!
    @IBOutlet weak var yawTextView: UITextView!
    @IBOutlet weak var yaw: UILabel!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOrientation()
        requestAuthorization()
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
    
    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(self.roll.text, forKey: "rollValue")
        UserDefaults.standard.set(self.pitch.text, forKey: "pitchValue")
        UserDefaults.standard.set(self.yaw.text, forKey: "yawValue")
    }
    
    @IBAction func loadSaveData(_ sender: Any) {
        rollTextView.text = UserDefaults.standard.object(forKey: "rollValue") as? String
        pitchTextView.text = UserDefaults.standard.object(forKey: "pitchValue") as? String
        yawTextView.text = UserDefaults.standard.object(forKey: "yawValue") as? String
    }
    
    @IBAction func notificationPreferences(_ sender: Any) {
        // this would go in the settings tab where notification preferences can be set
        // notification preferences would include setting the time for daily measurement notifications to be sent out
    }
}

