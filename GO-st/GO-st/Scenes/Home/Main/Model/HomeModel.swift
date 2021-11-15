//
//  HomeModel.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import Foundation
import MapKit

struct HomeData: Codable {
    let result: [StoreData]
    let nickName: String
    let university: String
}

//struct StoreData: Codable {
//    let id: Int
//    let storeName, address, businessHours: String?
//    let longitude, latitude: Double
//    let emoji: String
//}

struct StoreData: Codable{
    let storeName: String?
    let longitude: Double
    let latitude: Double
    let emoji: String
}

