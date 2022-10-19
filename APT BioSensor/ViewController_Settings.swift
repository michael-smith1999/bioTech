//
//  ViewController_Settings.swift
//  APT BioSensor
//
//  Created by Michael Smith on 10/4/22.
//

import UIKit
import SwiftUI

class TimeStamp {
    var hour: String
    var minutes: [String]
    
    init(hour: String, minutes: [String]) {
        self.hour = hour
        self.minutes = minutes
    }
}

class ViewController_Settings: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @State var showNotificationSettingsUI = false
    
    

    @IBOutlet weak var morningNotificationPicker: UIPickerView!
    @IBOutlet weak var currentMorningTimeLbl: UILabel!
    var morningTimeStamps = [TimeStamp]()
    
    @IBOutlet weak var afternoonNotificationPicker: UIPickerView!
    @IBOutlet weak var currentAfternoonTimeLbl: UILabel!
    var afternoonTimeStamps = [TimeStamp]()
    
    @IBOutlet weak var eveningNotificationPicker: UIPickerView!
    @IBOutlet weak var currentEveningTimeLbl: UILabel!
    var eveningTimeStamps = [TimeStamp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // MORNING NOTIFICATIONS
        // Connect Data
        morningNotificationPicker.delegate = self
        morningNotificationPicker.dataSource = self
        
        // Input the data into the array
        morningTimeStamps.append(TimeStamp(hour: "6", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        morningTimeStamps.append(TimeStamp(hour: "7", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        morningTimeStamps.append(TimeStamp(hour: "8", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        morningTimeStamps.append(TimeStamp(hour: "9", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        morningTimeStamps.append(TimeStamp(hour: "10", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        morningTimeStamps.append(TimeStamp(hour: "11", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        
        // AFTERNOON NOTIFICATIONS
        // Connect Data
        afternoonNotificationPicker.delegate = self
        afternoonNotificationPicker.dataSource = self
        
        // Input the data into the array
        afternoonTimeStamps.append(TimeStamp(hour: "12", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        afternoonTimeStamps.append(TimeStamp(hour: "1", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        afternoonTimeStamps.append(TimeStamp(hour: "2", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        afternoonTimeStamps.append(TimeStamp(hour: "3", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        afternoonTimeStamps.append(TimeStamp(hour: "4", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        afternoonTimeStamps.append(TimeStamp(hour: "5", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        
        // EVENING NOTIFICATIONS
        // Connect Data
        eveningNotificationPicker.delegate = self
        eveningNotificationPicker.dataSource = self
        
        // Input the data into the array
        eveningTimeStamps.append(TimeStamp(hour: "6", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        eveningTimeStamps.append(TimeStamp(hour: "7", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        eveningTimeStamps.append(TimeStamp(hour: "8", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        eveningTimeStamps.append(TimeStamp(hour: "9", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        eveningTimeStamps.append(TimeStamp(hour: "10", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
        eveningTimeStamps.append(TimeStamp(hour: "11", minutes: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]))
    }
    
    // MORNING
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 6
        }
        else {
            return 12
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            if component == 0 {
                return morningTimeStamps[row].hour
            }
            else {
                let selectedHour = morningNotificationPicker.selectedRow(inComponent: 0)
                return morningTimeStamps[selectedHour].minutes[row]
            }
        }
        else if pickerView.tag == 1 {
            if component == 0 {
                return afternoonTimeStamps[row].hour
            }
            else {
                let selectedHour = afternoonNotificationPicker.selectedRow(inComponent: 0)
                return afternoonTimeStamps[selectedHour].minutes[row]
            }
        }
        else {
            if component == 0 {
                return eveningTimeStamps[row].hour
            }
            else {
                let selectedHour = eveningNotificationPicker.selectedRow(inComponent: 0)
                return eveningTimeStamps[selectedHour].minutes[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            morningNotificationPicker.reloadComponent(1)
        
            let selectedHour = morningNotificationPicker.selectedRow(inComponent: 0)
            let selectedMinute = morningNotificationPicker.selectedRow(inComponent: 1)
            let hour = morningTimeStamps[selectedHour].hour
            let minute = morningTimeStamps[selectedHour].minutes[selectedMinute]
        
            currentMorningTimeLbl.text = "Current Morning Notification Time: \(hour):\(minute)am"
        }
        else if pickerView.tag == 1 {
            pickerView.reloadComponent(1)
        
            let selectedHour = afternoonNotificationPicker.selectedRow(inComponent: 0)
            let selectedMinute = afternoonNotificationPicker.selectedRow(inComponent: 1)
            let hour = afternoonTimeStamps[selectedHour].hour
            let minute = afternoonTimeStamps[selectedHour].minutes[selectedMinute]
        
            currentAfternoonTimeLbl.text = "Current Afternoon Notification Time: \(hour):\(minute)pm"
        }
        else {
            eveningNotificationPicker.reloadComponent(1)
        
            let selectedHour = eveningNotificationPicker.selectedRow(inComponent: 0)
            let selectedMinute = eveningNotificationPicker.selectedRow(inComponent: 1)
            let hour = eveningTimeStamps[selectedHour].hour
            let minute = eveningTimeStamps[selectedHour].minutes[selectedMinute]
        
            currentEveningTimeLbl.text = "Current Evening Notification Time: \(hour):\(minute)pm"
        }
    }
    
    @IBAction func generalSettingsButton(_ sender: Any) {
        print("'General Settings' button was pressed")
    }
    
//    @IBAction func notificationSettingsButton(_ sender: Any) {
//        print("'Notification Settings' button was pressed")
//        NotificationManager.shared.fetchNotificationSettings()
//        showNotificationSettingsUI = true
//    }
    
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
