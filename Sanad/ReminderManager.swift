import UserNotifications

class ReminderManager {
    
    static func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }
    
    static func scheduleMorningReminder() {
        let content = UNMutableNotificationContent()
        content.title = "صباح الخير"
        content.body = "هل أخذت أدويتك؟"
        
        var date = DateComponents()
        date.hour = 9
        date.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: date,
            repeats: true
        )
        
        let request = UNNotificationRequest(
            identifier: "morningReminder",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
}
