//
//  main.swift
//  20254_swift
//
//  Created by Hyun on 2022/05/17.
//

//import Foundation

var scores = readLine()!.split(separator: " ").map{Int(String($0))!}
var ratio = [56,24,14,6]
for i in 0..<4{ scores[i] *= ratio[i] }
print(scores.reduce(0, +))
