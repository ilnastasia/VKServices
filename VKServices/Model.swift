//
//  Model.swift
//  VKServices
//
//  Created by Anastasia Ilina on 14.07.2022.
//

import Foundation

struct Root: Decodable {
    let body: Service
    let status: Int
}

struct Service: Decodable {
    let services: [Application]
}

struct Application: Decodable {
    let name: String
    let description: String
    let link: String
    let icon_url: String
}
