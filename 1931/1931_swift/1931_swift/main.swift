//
//  main.swift
//  1931_swift
//
//  Created by Hyun on 2021/11/05.
//

import Foundation

let N = Int(readLine()!)!

var inputs = [[Int]]()
var outputs = [[Int]]()

for _ in 1...N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    inputs.append([input[0],input[1]])
}

var min = inputs.map{$0[1]}.min()!
var minIndex = inputs.firstIndex(of: inputs.filter(){$0[1]==min}.first!)!
outputs.append(inputs.remove(at: minIndex))

while inputs.count != 0{
    let lastEnd = outputs[outputs.count-1][1]
    for input in inputs {
        if input[0] < lastEnd{
            inputs.remove(at: inputs.firstIndex(of: input)!)
        }
    }
    min = inputs.map{$0[1]}.min()!
    minIndex = inputs.firstIndex(of: inputs.filter(){$0[1]==min}.first!)!
    outputs.append(inputs.remove(at: minIndex))
}
print(outputs.count)
