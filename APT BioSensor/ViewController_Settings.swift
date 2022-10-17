//
//  ViewController_Settings.swift
//  APT BioSensor
//
//  Created by Michael Smith on 10/4/22.
//

import UIKit
import SwiftUI

class ViewController_Settings: UIViewController {
    @State var showNotificationSettingsUI = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func notificationSettingsButton(_ sender: Any) {
        print("'Notification Settings' button was pressed")
        NotificationManager.shared.fetchNotificationSettings()
        showNotificationSettingsUI = true
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
