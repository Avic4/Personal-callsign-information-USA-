//
//  Info.swift
//  Callook Usa
//
//  Created by Сергей Митрофанов on 22/09/2017.
//  Copyright © 2017 Wipline. All rights reserved.
//

import Foundation

struct Information: Decodable {
    var status: String
    var type: String
    var current: Current?
    var previous: Previous?
    var trustee: Trustee?
    var name: String
    var address: Address?
    var location: Location?
    var otherInfo: OtherInfo?
}
