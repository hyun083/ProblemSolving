//
//  main.swift
//  5800_swift
//
//  Created by Hyun on 2022/07/29.
//

import Foundation

let K = Int(readLine()!)!
for tc in 1...K{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let scores = input[1..<input.count].sorted(by: >)
    let myMax = scores.first!
    let myMin = scores.last!
    var gap = 0
    for i in 0..<scores.count-1{
        gap = max(gap, scores[i]-scores[i+1])
    }
    print("Class \(tc)")
    print("Max \(myMax), Min \(myMin), Largest gap \(gap)")
}

