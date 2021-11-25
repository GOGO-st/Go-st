//
//  SignUpViewModel.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/10.
//

import Foundation

final class SignUpViewModel {
    
    // 이메일 정규성 체크
    func validateEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        // ac.kr로 끝나는 경우
//        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.ac\\.kr"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailPredicate.evaluate(with: email)
    }
}
