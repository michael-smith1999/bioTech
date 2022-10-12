//
//  NotificationSettingsView.swift
//  APT BioSensor
//
//  Created by Pinto,Daniel E on 10/11/22.
//

import SwiftUI

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


