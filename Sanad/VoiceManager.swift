import Foundation
import Speech
import AVFoundation
import Combine   // أضف هذا السطر

class VoiceManager: ObservableObject {
    
    func requestPermission() {
        SFSpeechRecognizer.requestAuthorization { status in
            print("Speech permission: \(status)")
        }
    }
}
