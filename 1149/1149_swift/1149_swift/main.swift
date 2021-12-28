//
//  main.swift
//  1149_swift
//
//  Created by Hyun on 2021/12/29.
//

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)

for i in 0..<N{
    arr[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

var ans = [Int]()

func cost(){
    
}
