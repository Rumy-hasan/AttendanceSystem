//
//  LocalNotification.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 24/7/22.
//

import Foundation
import UserNotifications

class LocalNotification{
    private let content = UNMutableNotificationContent()
    
    init() {
        //test
        self.askPermission()
    }
    
    private func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, error in
            if success {
                print("success")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func contents(with title:String, subTitle: String) {
        content.title = title
        content.subtitle = subTitle
        content.sound = UNNotificationSound.default
    }
    
    func showNotification() {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
}

