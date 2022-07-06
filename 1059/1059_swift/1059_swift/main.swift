//
//  main.swift
//  1059_swift
//
//  Created by Hyun on 2022/07/06.
//

import Foundation

let L = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let n = Int(readLine()!)!
var start = 0
var end = n+1
var ans = 0

if S.contains(n){
    print(0)
}else{
    for i in 0..<L{
        if S[i] < n{
            start = S[i]+1
        }
        if n < S[i]{
            end = S[i]
            break
        }
    }
    
    let numbers = [Int](start..<end)
    for i in 0..<numbers.count{
        for k in i+1..<numbers.count{
            let temp = [Int](numbers[i]...numbers[k])
            if temp.contains(n){
                ans += 1
            }
        }
    }
    print(ans)
}

