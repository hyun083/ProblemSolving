//
//  main.swift
//  1026_swift
//
//  Created by Hyun on 2022/02/17.
//

//import Foundation

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var B = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
var S = [Int]()
for i in 0..<N{
    S.append(A[i]*B[i])
}
print(S.reduce(0, +))

