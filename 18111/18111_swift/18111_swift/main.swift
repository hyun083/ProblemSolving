//
//  main.swift
//  18111_swift
//
//  Created by Hyun on 2021/11/29.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]
let B = inputs[2]

var base = Array(repeating:[Int](), count: N)
var numbers = Set<Int>()

for n in 0..<N{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    for input in inputs{
        base[n].append(input)
        numbers.insert(input)
    }
}

var arr = [Int:Int]()

for num in numbers{
    var cnt = 0
    var map = base
    var inven = B
    for x in 0..<N{
        for y in 0..<M{
            if map[x][y] == num{ continue }
            while map[x][y] != num{
                if map[x][y] < num{
                    inven -= 1
                    map[x][y] += 1
                    cnt += 1
                }else if map[x][y] > num{
                    map[x][y] -= 1
                    inven += 1
                    cnt += 2
                }
            }
            
        }
    }
    if inven >= 0{
        arr[cnt]=num
    }
}

let ans = arr.min(by: {$0.key < $1.key})!
print(ans.key,arr[ans.key]!)
