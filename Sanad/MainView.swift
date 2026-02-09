import SwiftUI

struct MainView: View {
    
    @StateObject var voice = VoiceManager()
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Sanad")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            BigButton(title: "اتصل بالعائلة") {
                callFamily()
            }
            
            BigButton(title: "أرسل موقعي") {
                sendLocation()
            }
            
            BigButton(title: "المساعدة الطارئة") {
                EmergencyManager.shared.startEmergencyCheck()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            voice.requestPermission()
            ReminderManager.requestPermission()
            ReminderManager.scheduleMorningReminder()
        }
    }
}

#Preview {
    MainView()
}
