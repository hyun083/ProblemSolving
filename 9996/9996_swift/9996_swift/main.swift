//
//  main.swift
//  9996_swift
//
//  Created by Hyun on 2022/07/28.
//

import Foundation

let n = Int(readLine()!)!
let pattern = readLine()!.split(separator: "*").map{String($0)}
var files = [String]()

for _ in 0..<n{
    files.append(readLine()!)
}
for file in files {
    let startIndex = pattern[0].count
    let endIndex = pattern[1].count
    if file.count >= startIndex+endIndex{
        if file[file.startIndex..<file.index(file.startIndex, offsetBy: startIndex)] == pattern[0] && file[file.index(file.endIndex, offsetBy: -endIndex)..<file.endIndex] == pattern[1]{
            print("DA")
        }else{
            print("NE")
        }
    }else{
        print("NE")
    }
}
