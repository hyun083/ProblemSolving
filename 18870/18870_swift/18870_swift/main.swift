//
//  main.swift
//  18870_swift
//
//  Created by Hyun on 2021/12/25.
//

import Foundation

let N = Int(readLine()!)!

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let numbers = Set<Int>(inputs).sorted(by: <)
var dict:[Int:Int] = [:]

for idx in 0..<numbers.count{
    dict[numbers[idx]] = idx
}
var ans = ""
for i in inputs{
    ans += String(dict[i]!) + " "
}
print(ans)
