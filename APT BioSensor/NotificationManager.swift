//
//  NotificationManager.swift
//  APT BioSensor
//
//  Created by Pinto,Daniel E on 10/11/22.
//

import Foundation
import UserNotifications

func requestAuthorization() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("Access Granted!")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
}

func sendNotification(scheduledTime: DateComponents) {
    // Cutomize the content
    let content = UNMutableNotificationContent()
    content.title = "Time for your daily measurements!"
    content.body = "Open the APTBioSensor app to record current pelvic tilt and recent pain levels."
    content.sound = UNNotificationSound.default
    
    // Specifying conditions for delivery
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    
    dateComponents.hour = 20 // 20:00 hours (8pm)
    
    // Create the trigger as a repeating event
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    
    // Create the request
    let uuidString = UUID().uuidString
    let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
    
    // Schedule the request with the system
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.add(request) { (error) in
        if error != nil {
            // handle errors here
        }
    }
}
