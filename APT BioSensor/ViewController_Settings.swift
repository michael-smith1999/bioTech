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
        NotificationManager.shared.requestAuthorization { granted in
            if granted {
                self.showNotificationSettingsUI = true
            }
        }
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
