//
//  FormPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/25.
//

import SwiftUI

struct FormPracticeView: View {
    
    enum NotificationSetting: String {
        case newPost = "새 게시글만 알림"
        case message = "메시지만 알림"
        case anything = "모든 알림 허용"
    }
    
    @State private var notification: NotificationSetting = .anything
    @State private var playNotificationSound: Bool = false
    
    var body: some View {
        Form {
            Section("알림 설정") {
                Picker("알림 허용", selection: $notification) {
                    Text(NotificationSetting.newPost.rawValue).tag(NotificationSetting.newPost)
                    Text(NotificationSetting.message.rawValue).tag(NotificationSetting.message)
                    Text(NotificationSetting.anything.rawValue).tag(NotificationSetting.anything)
                }
                Toggle("알림 소리", isOn: $playNotificationSound)
            }
        }
    }
}

struct FormPracticeSettingView_Preview: PreviewProvider {
    static var previews: some View {
        FormPracticeView()
    }
}
