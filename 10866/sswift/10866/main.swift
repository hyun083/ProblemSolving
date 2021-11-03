//
//  main.swift
//  10866
//
//  Created by Hyun on 2021/11/01.
//

import Foundation

let N = Int(readLine()!)!
var dequeue = [Int]()
var outputs = [Int]()

for _ in 1...N{
    let input = readLine()!.split(separator: " ").map{String($0)}
    switch input[0]{
    case "push_front":
        dequeue.insert(Int(input[1])!, at: 0)
        break
    case "push_back":
        dequeue.append(Int(input[1])!)
        break
    case "pop_front":
        dequeue.isEmpty ? outputs.append(-1) : outputs.append(dequeue.removeFirst())
        break
    case "pop_back":
        outputs.append(dequeue.popLast() ?? -1)
        break
    case "size":
        outputs.append(dequeue.count)
        break
    case "empty":
        dequeue.isEmpty ? outputs.append(1) : outputs.append(0)
        break
    case "front":
        outputs.append(dequeue.first ?? -1)
        break
    case "back":
        outputs.append(dequeue.last ?? -1)
        break
    default:
        break
    }
}
for output in outputs {
    print(output)
}
