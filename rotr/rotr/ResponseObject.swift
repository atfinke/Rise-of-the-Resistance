//
//  ResponseObject.swift
//  rotr
//
//  Created by Andrew Finke on 1/18/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

struct ResponseObject: Codable, Equatable {
    let responseStatus: String
    let queues: [Queue]
    
    func diff(r: ResponseObject) -> String? {
        var diff = ""
        if responseStatus != r.responseStatus {
            diff += "responseStatus: now \(responseStatus), was \(r.responseStatus)\n"
        }
        if let queueDiff = queues[0].diff(q: r.queues[0]) {
            diff += queueDiff
        }
        if diff.count > 0 {
            return diff
        } else {
            return nil
        }
    }
}
