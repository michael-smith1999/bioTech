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
    let conVal = 180/Double.pi
    var rollDeg:Double = 0
    var yawDeg:Double = 0
    var pitchDeg:Double = 0
    var isAPT:Bool = false
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOrientation()
        requestNotificationPermission()
        
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
    
    //determine if user has apt and by how much
    /*func compareAngles() -> (Bool, Double){
        if(){
            isAPT = true
        }else{
            isAPT = false
        }
        return (isAPT, )
    }*/
    
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
        UserDefaults.standard.set(self.roll.text, forKey: "rollValue")
        UserDefaults.standard.set(self.pitch.text, forKey: "pitchValue")
        UserDefaults.standard.set(self.yaw.text, forKey: "yawValue")
    }
    
    @IBAction func loadSaveData(_ sender: Any) {
        rollTextView.text = UserDefaults.standard.object(forKey: "rollValue") as? String
        pitchTextView.text = UserDefaults.standard.object(forKey: "pitchValue") as? String
        yawTextView.text = UserDefaults.standard.object(forKey: "yawValue") as? String
    }
}

