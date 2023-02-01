//
//  main.swift
//  9536_swift
//
//  Created by Hyun on 2023/01/31.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    var sound = readLine()!.split(separator: " ").map{String($0)}
    while let line = readLine(){
        if line == "what does the fox say?"{
            break
        }
        let otherSound = line.split(separator: " ").map{String($0)}[2]
        for i in 0..<sound.count{
            if sound[i] == otherSound{
                sound[i] = ""
            }
        }
    }
    let res = sound.filter({$0 != ""})
    print(res.joined(separator: " "))
}

