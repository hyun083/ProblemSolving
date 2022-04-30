//
//  main.swift
//  15964_swift
//
//  Created by Hyun on 2022/04/30.
//

//import Foundation

let AB = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = AB[0]
let B = AB[1]
print((A+B)*(A-B))
