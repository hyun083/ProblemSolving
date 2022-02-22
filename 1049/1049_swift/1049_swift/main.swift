//
//  main.swift
//  1049_swift
//
//  Created by Hyun on 2022/02/22.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var result = [Int]()
for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let pkg = line[0]
    let single = line[1]
    
    if N > 6{
        if N%6 > 0{
            result.append(min(pkg*(N/6+1), single*N))
        }else{
            result.append(min(pkg*(N/6), single*N))
        }
    }else{
        result.append(min(pkg, single*N))
    }
}
print(result.min()!)
