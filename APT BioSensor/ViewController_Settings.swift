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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct NotificationSettingsView: View {
  @ObservedObject var notificationManager = NotificationManager.shared

  var body: some View {
    VStack {
      Form {
        Section {
          HStack {
            Spacer()
            Text("Notification Settings")
              .font(.title2)
            Spacer()
          }
        }
        Section {
          SettingRowView(
            setting: "Authorization Status",
            enabled: notificationManager.settings?.authorizationStatus == UNAuthorizationStatus.authorized)
          SettingRowView(
            setting: "Show in Notification Center",
            enabled: notificationManager.settings?.notificationCenterSetting == .enabled)
          SettingRowView(
            setting: "Sound Enabled?",
            enabled: notificationManager.settings?.soundSetting == .enabled)
          SettingRowView(
            setting: "Badges Enabled?",
            enabled: notificationManager.settings?.badgeSetting == .enabled)
          SettingRowView(
            setting: "Alerts Enabled?",
            enabled: notificationManager.settings?.alertSetting == .enabled)
          SettingRowView(
            setting: "Show on lock screen?",
            enabled: notificationManager.settings?.lockScreenSetting == .enabled)
          SettingRowView(
            setting: "Alert banners?",
            enabled: notificationManager.settings?.alertStyle == .banner)
          SettingRowView(
            setting: "Critical Alerts?",
            enabled: notificationManager.settings?.criticalAlertSetting == .enabled)
          SettingRowView(
            setting: "Siri Announcement?",
            enabled: notificationManager.settings?.announcementSetting == .enabled)
        }
      }
    }
  }
}

struct NotificationSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationSettingsView()
  }
}

struct SettingRowView: View {
  var setting: String
  var enabled: Bool
  var body: some View {
    HStack {
      Text(setting)
      Spacer()
      if enabled {
        Image(systemName: "checkmark")
          .foregroundColor(.green)
      } else {
        Image(systemName: "xmark")
          .foregroundColor(.red)
      }
    }
    .padding()
  }
}

