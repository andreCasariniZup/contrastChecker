//
//  ConstrastChecker.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 30/01/23.
//

import Foundation

struct ContrastChecker: Codable {

    public var ratio, aa, aaLarge, aaa, aaaLarge: String

    enum CodingKeys: String, CodingKey {
        case ratio
        case aa = "AA"
        case aaLarge = "AALarge"
        case aaa = "AAA"
        case aaaLarge = "AAALarge"
    }
}
