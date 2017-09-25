//
//  OtherInfo.swift
//  Callook Usa
//
//  Created by Сергей Митрофанов on 22/09/2017.
//  Copyright © 2017 Wipline. All rights reserved.
//

import Foundation

struct OtherInfo: Decodable {
    var grantDate: String
    var expiryDate: String
    var lastActionDate: String
    var frn: String
    var ulsUrl: String
}
