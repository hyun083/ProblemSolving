//
//  main.swift
//  1931_swift
//
//  Created by Hyun on 2021/11/05.
//

import Foundation

let N = Int(readLine()!)!
var starts = [Int]()
var ends = [Int]()
var outputs = [[Int]]()

for _ in 1...N{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    starts.append(inputs.first!)
    ends.append(inputs.last!)
}

var minInedx = ends.firstIndex(of: ends.min()!)!
outputs.append([starts.remove(at: minInedx),ends.remove(at: minInedx)])

while starts.count != 0{
    let lastEnd = outputs.last!
    for start in starts {
        if start < lastEnd[1]{
            let index = starts.firstIndex(of: start)!
            starts.remove(at: index)
            ends.remove(at: index)
        }
    }

    let minInedx = ends.firstIndex(of: ends.min()!)!
    outputs.append([starts.remove(at: minInedx),ends.remove(at: minInedx)])
}

print(outputs.count)
