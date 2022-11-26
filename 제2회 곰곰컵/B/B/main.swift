//
//  main.swift
//  B
//
//  Created by Hyun on 2022/11/26.
//

import Foundation

let n = Int(readLine()!)!
var dancePeople = Set<String>()
dancePeople.insert("ChongChong")

for _ in 0..<n{
    let people = readLine()!.split(separator: " ").map{String($0)}
    if dancePeople.contains(people[0]) || dancePeople.contains(people[1]){
        dancePeople.insert(people[0])
        dancePeople.insert(people[1])
    }
}
print(dancePeople.count)
