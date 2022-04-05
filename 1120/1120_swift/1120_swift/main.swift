//
//  main.swift
//  1120_swift
//
//  Created by Hyun on 2022/04/05.
//

import Foundation

let AB = readLine()!.split(separator: " ").map{String($0)}
let A = AB[0].map{String($0)}
let B = AB[1].map{String($0)}
var cnt = 51

for i in 0...B.count - A.count{
    var temp = 0
    for k in 0..<A.count{
        if A[k] != B[k+i]{
            temp += 1
        }
    }
    cnt = temp<cnt ? temp:cnt
}
print(cnt)

