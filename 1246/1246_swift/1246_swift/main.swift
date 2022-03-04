//
//  main.swift
//  1246_swift
//
//  Created by Hyun on 2022/03/04.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var arr = [Int]()
var income = 0
var price = 0

for _ in 0..<M{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: >)
for i in stride(from: N < arr.count ? N-1 : arr.count-1, through: 0, by: -1){
    if income < arr[i]*(i+1){
        income = arr[i]*(i+1)
        price = arr[i]
    }
}
print(price, income)
