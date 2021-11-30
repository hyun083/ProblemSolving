//
//  main.swift
//  10845
//
//  Created by Hyun on 2021/10/31.
//

import Foundation

let N = Int(readLine()!)!
var queue = [Int]()
var outputs = [Int]()

for _ in 1...N{
    let input = readLine()!.split(separator: " ").map{String($0)}
    switch input[0]{
    case "push":
        queue.append(Int(input[1])!)
        break
    case "pop":
        if queue.isEmpty{
            outputs.append(-1)
        }else{
            outputs.append(queue.removeFirst())
        }
        break
    case "size":
        outputs.append(queue.count)
        break
    case "empty":
        if queue.isEmpty{
            outputs.append(1)
        }else{
            outputs.append(0)
        }
        break
    case "front":
        if queue.isEmpty{
            outputs.append(-1)
        }else{
            outputs.append(queue.first!)
        }
        break
    case "back":
        if queue.isEmpty{
            outputs.append(-1)
        }else{
            outputs.append(queue.last!)
        }
        break
    default:
        break
    }
}

for output in outputs {
    print(output)
}
