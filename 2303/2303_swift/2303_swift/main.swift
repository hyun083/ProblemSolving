//
//  main.swift
//  2303_swift
//
//  Created by Hyun on 2022/02/10.
//

import Foundation

let N = Int(readLine()!)!
var results = [Int]()

for _ in 1...N{
    let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = Set<Int>()
    for i in 0..<5{
        for k in 0..<5{
            if k == i{
                continue
            }
            for p in 0..<5{
                if p == i || p == k{
                    continue
                }
                result.insert((numbers[i] + numbers[k] + numbers[p]) % 10)
            }
        }
    }
    results.append(result.max()!)
}

var idx = -1
var temp = -1
for index in results.indices{
    if temp < results[index]{
        temp = results[index]
        idx = index
    }else if temp > results[index]{
        continue
    }else{
        idx = idx > index ? idx : index
    }
}
print(idx + 1)
