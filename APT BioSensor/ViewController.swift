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
var yawValues = ["Angle"]

class ViewController: UIViewController {
    
    let conVal = 180/Double.pi
    var rollDeg:Int = 0
    var yawDeg:Int = 0
    var pitchDeg:Int = 0
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
        let dateCheck = df.string(from: Date())
        UserDefaults.standard.set(dateCheck, forKey: "currentDate")
    }
    
    func getOrientation() {
        
        motion.deviceMotionUpdateInterval = 0.001
        motion.startDeviceMotionUpdates(to: OperationQueue.current!){ (data, error) in
            if let trueData = data{
                self.rollDeg=Int(trueData.attitude.roll*self.conVal)
                
                self.yawDeg=Int(trueData.attitude.yaw*self.conVal)
                
                self.pitchDeg=Int(trueData.attitude.pitch*self.conVal)
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
        getOrientation()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let str = df.string(from: Date())
        print(str)
        UserDefaults.standard.setValue(str, forKey: str)
        
        if(str != UserDefaults.standard.object(forKey: "currentDate") as? String)
        {
            yawValues.removeAll()
            UserDefaults.standard.set(str, forKey: "currentDate")
        }
        yawValues.append(String(yawDeg))
        print(yawValues.count)
        UserDefaults.standard.set(yawValues, forKey: str + "yawValue")
        tempString = str
        saveCount += 1
        print(saveCount)
        print(str)
    }
    /*
    @IBAction func loadSaveData(_ sender: Any) {
        rollTextView.text = UserDefaults.standard.object(forKey: tempString + "rollValue") as? String
        pitchTextView.text = UserDefaults.standard.object(forKey: tempString + "pitchValue") as? String
        yawTextView.text = UserDefaults.standard.object(forKey: tempString + "yawValue") as? String
                
    }*/
}
