//
//  main.swift
//  1764_swift
//
//  Created by Hyun on 2021/12/14.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var people:[String:Bool] = [:]
var ans = [String]()

for _ in 0..<N{
    people[readLine()!] = true
}

for _ in 0..<M{
    let person = readLine()!
    if people[person] != nil {
        ans.append(person)
    }
}

print(ans.count)
print(ans.sorted().joined(separator: "\n"))
