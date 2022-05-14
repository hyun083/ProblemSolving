//
//  main.swift
//  A
//
//  Created by Hyun on 2022/05/14.
//

//import Foundation

let n = Int(readLine()!)!
let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
print(min(ab[0]/2 + ab[1], n))
