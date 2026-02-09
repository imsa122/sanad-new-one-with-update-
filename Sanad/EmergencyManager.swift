import Foundation
import AVFoundation
import UIKit

class EmergencyManager {
    
    static let shared = EmergencyManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    
    func startEmergencyCheck() {
        vibrate()
        speak("هل أنت بخير؟")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            self.sendEmergencyAlert()
        }
    }
    
    private func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    private func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
        synthesizer.speak(utterance)
    }
    
    private func sendEmergencyAlert() {
        print("تم إرسال تنبيه الطوارئ")
        // هنا لاحقاً نربط SMS أو إشعار للعائلة
    }
}
