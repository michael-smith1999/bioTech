//
//  ViewController_Settings.swift
//  APT BioSensor
//
//  Created by Michael Smith on 10/4/22.
//

import UIKit
import SwiftUI
import UserNotifications

class ViewController_Settings: UIViewController {
    
    //@IBOutlet weak var notifOneSwitch: UISwitch!
    
    @IBOutlet weak var notifOneTimePicker: UIDatePicker!
    
//    @IBAction func notifOneSwitch(_ sender: Any) {
//        print("switch one moment")
//
//        if notifOneSwitch.isOn {
//            // notification one is on: create and register notification
//
//            // Cutomize the content
//            let content = UNMutableNotificationContent()
//            content.title = "Time for your daily APTBioSensor measurement!"
//            content.body = "Open the APTBioSensor app to record current pelvic tilt"
//            content.sound = UNNotificationSound.default
//
//            // Specifying conditions for delivery
//            var date = DateComponents()
//            let pickerDateComponents = Calendar.current.dateComponents([.hour, .minute], from: notifOneTimePicker.date)
//            date.hour = pickerDateComponents.hour
//            date.minute = pickerDateComponents.minute
//
//            // Create the trigger as a repeating event
//            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
//
//            // Create the request
//            let uuidString = UUID().uuidString
//            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
//
//            // Schedule the request with the system
//            let notificationCenter = UNUserNotificationCenter.current()
//            notificationCenter.add(request) { (error) in
//                if let error = error {
//                    print(error)
//                }
//            }
//        }
//        else {
//            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNotification()
    }
    
    func setNotification() {
        // CREATING AND REGISTERING NOTIFICATION BASED ON TIMEPICKER
        // Cutomize the content
        let content = UNMutableNotificationContent()
        content.title = "Time for your daily APTBioSensor measurement!"
        content.body = "Open the APTBioSensor app to record current pelvic tilt"
        content.sound = UNNotificationSound.default

        // Specifying conditions for delivery
        var date = DateComponents()
        let pickerDateComponents = Calendar.current.dateComponents([.hour, .minute], from: notifOneTimePicker.date)
        date.hour = pickerDateComponents.hour
        date.minute = pickerDateComponents.minute
        
        // Create the trigger as a repeating event
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        // Create the request
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        // Schedule the request with the system
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                print(error)
            }
        }
    }
    
    @IBAction func generalSettingsButton(_ sender: Any) {
        print("'General Settings' button was pressed")
    }
    
    @IBAction func aboutButton(_ sender: Any) {
        // info about the app and dev team are displayed after clicking this button
        print("'About' button was pressed")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
