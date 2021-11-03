//
//  main.swift
//  2164
//
//  Created by Hyun on 2021/10/31.
//

import Foundation

let N = Int(readLine()!)!
var queue = Array<Int>(1...N)

while(queue.count != 1){
    queue.removeFirst()
    queue.append(queue.removeFirst())
}

print(queue.first!)


