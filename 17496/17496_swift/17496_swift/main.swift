//
//  main.swift
//  17496_swift
//
//  Created by Hyun on 2022/05/08.
//

//import Foundation

let star = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = star[0] - 1
let t = star[1]
let c = star[2]
let p = star[3]
print((n/t)*c*p)

