//
//  main.swift
//  1713_swift
//
//  Created by Hyun on 2022/07/29.
//

import Foundation

let n = Int(readLine()!)!
let s = Int(readLine()!)!
let line = readLine()!.split(separator: " ").map{Int(String($0))!}

var likes = Array(repeating: 1001, count: 101)
var queue = [Int]()

for number in line{
    if queue.contains(number){
        likes[number] += 1
    }else{
        if queue.count < n{
            queue.append(number)
            likes[number] = 1
        }else{
            let target = likes.min()!
            for i in 0..<n{
                if likes[queue[i]] == target{
                    likes[queue[i]] = 1001
                    queue.remove(at: i)
                    break
                }
            }
            queue.append(number)
            likes[number] = 1
        }
    }
}
for q in queue.sorted(by: <){
    print(q,terminator: " ")
}
