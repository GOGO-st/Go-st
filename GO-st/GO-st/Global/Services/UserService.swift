//
//  UserService.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/09.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

struct UserService {
    
    private init() {}
    
    static let shared = UserService()
    
    // MARK: - 이메일 인증
    func authenticateEmail(_ email: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.emailAuth
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let body: Parameters = [
            "email": email
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: headers)
        
        dataRequest.responseData { response in
            
            switch response.result {
                case .success(_):
                if let value = response.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseSimpleResult<String>.self, from: value)
                                
                                print("이메일 인증 \(result)")
                                completion(.success(result.data))
                            } catch {
                                completion(.pathErr)
                            }
                            // 다른번호는 나중에
                            
                        case 400:
                            print("헤이 여기 400")
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseTempResult.self, from: value)
                                completion(.requestErr(result.message))
                            } catch {
                                completion(.pathErr)
                            }
                            
                        default:
                            break
                        }
                    }
                }
                case .failure(_):
                    completion(.networkFail)
            }
            
        }
    }
}
