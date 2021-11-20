//
//  ResponseResult.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/09.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var status: Int?
    var success: String?
    var message: String?
    var data: [T]?
}

struct ResponseSimpleResult<T: Codable>: Codable {
    var status: Int?
    var success: String?
    var message: String?
    var data: T?
}

// 지금 서버에 메세지밖에 없는데 status 달라고 하기
struct ResponseTempResult: Codable {
//    var status: Int?
    var message: String?
}
