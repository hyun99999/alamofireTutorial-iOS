//
//  Contact.swift
//  alamofireTutorial-iOS
//
//  Created by kimhyungyu on 2021/02/07.
//

import Foundation

struct APIResponse: Codable {
    let contacts: [Contact]
}
struct Contact: Codable {
    let name: String
    let email: String
    let gender: String
}
