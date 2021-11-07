//
//  main.swift
//  11866_swift
//
//  Created by Hyun on 2021/11/06.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

var numbers = Array(1...inputs[0])

let K = inputs[1]

var indexForRemove = K - 1

while(!numbers.isEmpty){
    numbers.remove(at: indexForRemove)
    indexForRemove += K
    
}


