//
//  main.swift
//  17256_swift
//
//  Created by Hyun on 2022/05/02.
//

//import Foundation

let A = readLine()!.split(separator: " ").map{Int(String($0))!}
let B = readLine()!.split(separator: " ").map{Int(String($0))!}
print(abs(B[0]-A[2]) , B[1]/A[1], abs(B[2]-A[0]))

