//
//  LegalDisclaimer.swift
//  rotr
//
//  Created by Andrew Finke on 1/18/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

struct LegalDisclaimer: Codable, Equatable {
    let showOnIntro: Bool
    let showOnConfirmation: Bool
    let showOnMyLines: Bool
    let disclaimerText: String
}
