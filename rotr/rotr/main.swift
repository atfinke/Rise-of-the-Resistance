//
//  main.swift
//  rotr
//
//  Created by Andrew Finke on 1/18/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

let dlrURLString = "https://vqguest-svc.wdprapps.disney.com/application/v1/guest/getQueues"
let wdwURLString = "https://vqguest-svc-wdw.wdprapps.disney.com/application/v1/guest/getQueues"
guard let dlrURL = URL(string: dlrURLString), let wdwURL = URL(string: wdwURLString) else {
    fatalError()
}

let path = FileManager.default.currentDirectoryPath + "/"
print(path)

var lastDLRResponse: ResponseObject?
var lastWDWResponse: ResponseObject?

while true {
    print("Checking @ \(Date())")
    guard let dlrData = try? Data(contentsOf: dlrURL),
        let dlrResponse = try? JSONDecoder().decode(ResponseObject.self, from: dlrData),
        let wdwData = try? Data(contentsOf: wdwURL), let wdwResponse = try? JSONDecoder().decode(ResponseObject.self, from: wdwData) else {
            
            sleep(5)
            print("no data")
            continue
    }
    
    if lastDLRResponse != dlrResponse {
        let diskPath = "\(path)DLR-\(Date().timeIntervalSince1970)"
        if let r = lastDLRResponse, let diff = dlrResponse.diff(r: r) {
            let url = URL(fileURLWithPath: diskPath + "-diff.txt")
            try! diff.write(to: url, atomically: true, encoding: .utf8)
        } else {
            let url = URL(fileURLWithPath: diskPath + ".txt")
            try! dlrData.write(to: url, options: .atomic)
        }
        lastDLRResponse = dlrResponse
    }
    
    if lastWDWResponse != wdwResponse {
        let diskPath = "\(path)WDW-\(Date().timeIntervalSince1970)"
        if let r = lastWDWResponse, let diff = wdwResponse.diff(r: r) {
            let url = URL(fileURLWithPath: diskPath + "-diff.txt")
            try! diff.write(to: url, atomically: true, encoding: .utf8)
        } else {
            let url = URL(fileURLWithPath: diskPath + ".txt")
            try! wdwData.write(to: url, options: .atomic)
        }
        lastWDWResponse = wdwResponse
    }
    
    sleep(5)
}
