//
//  main.swift
//  1931_swift
//
//  Created by Hyun on 2021/11/05.
//

import Foundation

let N = Int(readLine()!)!

var inputs = [[UInt32]]()

var count = 0;

for _ in 1...N{
    let input = readLine()!.split(separator: " ").map{UInt32(String($0))!}
    inputs.append([input[0],input[1]])
}

var min = inputs.map{$0[1]}.min()!
var minIndex = inputs.firstIndex(of: inputs.filter(){$0[1]==min}.first!)!
inputs.remove(at: minIndex)
count += 1

while inputs.count != 0{
    for input in inputs {
        if input[0] < min{
            inputs.remove(at: inputs.firstIndex(of: input)!)
        }
    }
    min = inputs.map{$0[1]}.min()!
    minIndex = inputs.firstIndex(of: inputs.filter(){$0[1]==min}.first!)!
    inputs.remove(at: minIndex)
    count += 1
}
print(count)
