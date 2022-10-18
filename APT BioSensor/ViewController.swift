//
//  ViewController.swift
//  APT BioSensor
//
//  Created by Benjamin R. on 9/16/22.
//

import UIKit
import CoreMotion

var tempString = ""
var rollValues = ["Roll"]
var pitchValues = ["Pitch"]
var yawValues = ["Yaw"]

class ViewController: UIViewController {
    
    @IBOutlet weak var roll: UILabel!
    @IBOutlet weak var pitch: UILabel!
    @IBOutlet weak var rollTextView: UITextView!
    @IBOutlet weak var pitchTextView: UITextView!
    @IBOutlet weak var yawTextView: UITextView!
    @IBOutlet weak var yaw: UILabel!
    var saveCount = 1
    
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOrientation()
        requestNotificationPermission()
        
        // Do any additional setup after loading the view.
        // need to figure way to reset count and arrays when date switches
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let curDate = Date()
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
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notifications authorized")
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let tempDate = Date()
        let str = df.string(from: Date())
        print(str)
        UserDefaults.standard.setValue(str, forKey: str)
        
        rollValues.append(self.roll.text ?? "yoyo")
        pitchValues.append(self.pitch.text ?? "yoyo")
        yawValues.append(self.yaw.text ?? "yoyo")
        print(rollValues.count)
        
        UserDefaults.standard.set(rollValues, forKey: str + "rollValue")
        UserDefaults.standard.set(pitchValues, forKey: str + "pitchValue")
        UserDefaults.standard.set(yawValues, forKey: str + "yawValue")
        tempString = str
        saveCount += 1
        print(saveCount)
        print(str)

        

    }
    
    @IBAction func loadSaveData(_ sender: Any) {
        rollTextView.text = UserDefaults.standard.object(forKey: tempString + "rollValue") as? String
        pitchTextView.text = UserDefaults.standard.object(forKey: tempString + "pitchValue") as? String
        yawTextView.text = UserDefaults.standard.object(forKey: tempString + "yawValue") as? String
                
    }
}

