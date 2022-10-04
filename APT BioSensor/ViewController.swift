//
//  ViewController.swift
//  APT BioSensor
//
//  Created by Benjamin R. on 9/16/22.
//

import UIKit
import CoreMotion
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var roll: UILabel!
    @IBOutlet weak var pitch: UILabel!
    @IBOutlet weak var yaw: UILabel!
    
    var motion = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrientation();
        // Do any additional setup after loading the view.
        
        // Notifications:
        // Step 1: Ask for permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Time for your daily measurements!"
        content.body = "Please open the APT BioSensor app for your daily pelvic tilt and pain measurements"
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(5) // adds a time interval of 10 seconds to date
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
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

