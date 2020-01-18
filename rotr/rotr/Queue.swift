//
//  Queue.swift
//  rotr
//
//  Created by Andrew Finke on 1/18/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

struct Queue: Codable, Equatable {
    let queueId: String
    let name: String
    let currentArrivingGroupStart: Int
    let currentArrivingGroupEnd: Int
    let state: String
    let type: String
    
    let postedWaitTime: Int?
    let postedWaitTimeTts: Int?
    let postedInQueueWaitTime: Int?
    let postedInQueueWaitTimeTts: Int?
    
    let postedQueueStatus: String
    let showQueueProgress: Bool
    let showPostedWaitTimeOnConfirmation: Bool
    let showPostedWaitTimeOnHub: Bool
    
    let legalDisclaimer: LegalDisclaimer
    let postedSummonReturnWindowMinutes: Int
    
    func diff(q: Queue) -> String? {
        var diff = ""
        if queueId != q.queueId {
            diff += "queueId: now \(queueId), was \(q.queueId)\n"
        }
        if name != q.name {
            diff += "name: now \(name), was \(q.name)\n"
        }
        if currentArrivingGroupStart != q.currentArrivingGroupStart {
            diff += "currentArrivingGroupStart: now \(currentArrivingGroupStart), was \(q.currentArrivingGroupStart)\n"
        }
        if currentArrivingGroupEnd != q.currentArrivingGroupEnd {
            diff += "currentArrivingGroupEnd: now \(currentArrivingGroupEnd), was \(q.currentArrivingGroupEnd)\n"
        }
        if state != q.state {
            diff += "state: now \(state), was \(q.state)\n"
        }
        if type != q.type {
            diff += "type: now \(type), was \(q.type)\n"
        }
        
        if postedWaitTime != q.postedWaitTime {
            diff += "postedWaitTime: now \(String(describing: postedWaitTime)), was \(String(describing: q.postedWaitTime))\n"
        }
        if postedWaitTimeTts != q.postedWaitTimeTts {
            diff += "postedWaitTimeTts: now \(String(describing: postedWaitTimeTts)), was \(String(describing: q.postedWaitTimeTts))\n"
        }
        if postedInQueueWaitTime != q.postedInQueueWaitTime {
            diff += "postedInQueueWaitTime: now \(String(describing: postedInQueueWaitTime)), was \(String(describing: q.postedInQueueWaitTime))\n"
        }
        if postedInQueueWaitTimeTts != q.postedInQueueWaitTimeTts {
            diff += "postedInQueueWaitTimeTts: now \(String(describing: postedInQueueWaitTimeTts)), was \(String(describing: q.postedInQueueWaitTimeTts))\n"
        }
        
        if postedQueueStatus != q.postedQueueStatus {
            diff += "postedQueueStatus: now \(postedQueueStatus), was \(q.postedQueueStatus)\n"
        }
        if showQueueProgress != q.showQueueProgress {
            diff += "showQueueProgress: now \(showQueueProgress), was \(q.showQueueProgress)\n"
        }
        if showPostedWaitTimeOnConfirmation != q.showPostedWaitTimeOnConfirmation {
            diff += "showPostedWaitTimeOnConfirmation: now \(showPostedWaitTimeOnConfirmation), was \(q.showPostedWaitTimeOnConfirmation)\n"
        }
        if showPostedWaitTimeOnHub != q.showPostedWaitTimeOnHub {
            diff += "showQueueProgress: now \(showPostedWaitTimeOnHub), was \(q.showPostedWaitTimeOnHub)\n"
        }
        
        if legalDisclaimer != q.legalDisclaimer {
            diff += "legalDisclaimer: now \(legalDisclaimer), was \(q.legalDisclaimer)\n"
        }
        if postedSummonReturnWindowMinutes != q.postedSummonReturnWindowMinutes {
            diff += "postedSummonReturnWindowMinutes: now \(postedSummonReturnWindowMinutes), was \(q.postedSummonReturnWindowMinutes)\n"
        }
      
        
        if diff.count > 0 {
            return diff
        } else {
            return nil
        }
    }
}
