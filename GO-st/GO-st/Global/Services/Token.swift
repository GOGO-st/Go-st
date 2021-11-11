//
//  Token.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/10.
//

import Foundation

struct Token: Codable {
    let accessToken: String
}

struct RefreshToken: Codable {
    let accessToken: String
    let refreshToken: String
}
