//
//  main.swift
//  2252_swift
//
//  Created by Hyun on 2022/04/27.
//

//import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var arr = Array(repeating: 0, count: N)
var map = Array(repeating: [Int](), count:N)
var queue = [Int]()
var result = [Int]()

for _ in 0..<M{
    let numbers = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    arr[numbers[1]] += 1
    map[numbers[0]].append(numbers[1])
}

for i in 0..<N{
    if arr[i] == 0{
        queue.append(i)
        arr[i] = -1
    }
}

while !queue.isEmpty{
    let idx = queue.removeLast()
    for number in map[idx]{
        arr[number] -= 1
    }
    result.append(idx)
    for i in 0..<N{
        if arr[i] == 0{
            queue.append(i)
            arr[i] = -1
        }
    }
}

for result in result {
    print(result+1, terminator: " ")
}
