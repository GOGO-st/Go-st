//
//  ResponseResult.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/09.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var status: Int?
    var message: String?
    var data: [T]?
}

struct ResponseSimpleResult<T: Codable>: Codable {
    var status: Int?
    var message: String?
    var data: T?
}

struct ResponseTempResult: Codable {
    var status: Int?
    var message: String?
}
