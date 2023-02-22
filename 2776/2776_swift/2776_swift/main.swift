//
//  main.swift
//  2776_swift
//
//  Created by Hyun on 2023/02/23.
//

import Foundation

let T = Int(readLine()!)!
var output = [String]()
for _ in 0..<T{
    var note = Set<Int>()
    
    let _ = readLine()
    for num in readLine()!.split(separator: " ").map({Int($0)!}){
        note.insert(num)
    }
    
    let _ = readLine()
    for ans in readLine()!.split(separator: " ").map({Int($0)!}){
        output.append("\(note.contains(ans) ? 1:0)")
    }
}
print(output.joined(separator: "\n"))
