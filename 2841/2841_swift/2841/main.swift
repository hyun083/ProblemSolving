//
//  main.swift
//  2841
//
//  Created by Hyun on 2021/10/30.
//

import Foundation
let inputs = readLine()!.split(separator: " ").map({Int(String($0))!})
let N = inputs[0]
let P = inputs[1]

var count = 0

var lines = [[Int]]()

for _ in 1...6{
    lines.append([Int]())
}

for _ in 1...N{
    let inputs = readLine()!.split(separator: " ").map({Int(String($0))!})
    let lineNumber = inputs[0]
    let frat = inputs[1]
    
    if(lines[lineNumber-1].isEmpty || lines[lineNumber-1].last! < frat){
        lines[lineNumber-1].append(frat)
        count += 1
    }else if(lines[lineNumber-1].last! > frat){
        while(lines[lineNumber-1].last! > frat){
            lines[lineNumber-1].removeLast()
            count += 1
            if(lines[lineNumber-1].isEmpty || lines[lineNumber-1].last! < frat){
                lines[lineNumber-1].append(frat)
                count += 1
                break
            }
        }
    }
}

print(count)
