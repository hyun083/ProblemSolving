//
//  main.swift
//  14652_swift
//
//  Created by Hyun on 2022/04/26.
//

//import Foundation

let NMK = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = NMK[1]
let K = NMK[2]
print(K/M, K%M)

