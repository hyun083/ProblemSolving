//
//  main.swift
//  2914_swift
//
//  Created by Hyun on 2022/03/18.
//

//import Foundation

let AI = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = AI[0]
let I = AI[1] - 1
print(A*I+1)
