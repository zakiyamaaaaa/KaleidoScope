//
//  Dog.swift
//  KaleidoScopeSample
//
//  Created by shoichiyamazaki on 2018/08/11.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import Foundation

struct Dog: Codable {
    let status: String
    let imageUrl: [String]
    
    enum CodingKeys: String, CodingKey {
        case status
        case imageUrl = "message"
    }
}
