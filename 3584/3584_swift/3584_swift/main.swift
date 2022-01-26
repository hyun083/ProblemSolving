//
//  main.swift
//  3584_swift
//
//  Created by Hyun on 2022/01/26.
//

import Foundation

let size = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = Set(readLine()!.split(separator: " ").map{Int(String($0))!})
let B = Set(readLine()!.split(separator: " ").map{Int(String($0))!})
var cnt = 0
for b in B{
    if A.contains(b){
        cnt += 1
    }
}
print(size.reduce(0, +)-cnt*2)
