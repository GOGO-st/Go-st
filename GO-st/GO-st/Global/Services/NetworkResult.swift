//
//  NetworkResult.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/09.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
