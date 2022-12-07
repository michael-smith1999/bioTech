//
//  ViewController.swift
//  APT BioSensor
//
//  Created by Benjamin R. on 9/16/22.
//

import UIKit
import CoreMotion

var tempString = ""
var rollValues = ["Angle"]
var pitchValues = ["Angle"]
var yawValues = ["Angle"]
var updatedToday = false

class ViewController: UIViewController {
    
    let conVal = 180/Double.pi
    var rollDeg:Float = 0
    var yawDeg:Float = 0
    var pitchDeg:Float = 0
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
        
        motion.deviceMotionUpdateInterval = 0.0000001
        motion.startDeviceMotionUpdates(
            using: .xMagneticNorthZVertical,
            to: OperationQueue.current!){ (data, error) in
            if let trueData = data{
                self.rollDeg=Float(Int(10*(90-abs(trueData.attitude.roll*self.conVal))))/10
                
                self.yawDeg=Float(Int(10*(90-abs(trueData.attitude.yaw*self.conVal))))/10
                
                self.pitchDeg=Float(Int(10*(90-abs(trueData.attitude.pitch*self.conVal))))/10
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
        let str = df.string(from: Date())
        print(str)
        UserDefaults.standard.setValue(str, forKey: str)
    
        if(str != UserDefaults.standard.object(forKey: "currentDate") as? String)
        {
            pitchValues.removeAll()
            UserDefaults.standard.set(str, forKey: "currentDate")
        }
        else{
            pitchValues = UserDefaults.standard.object(forKey: str + "pitchValue") as? [String] ?? [""]
        }
        pitchValues.append(String(pitchDeg))
        print(pitchValues.count)
        UserDefaults.standard.set(pitchValues, forKey: str + "pitchValue")
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
