//
//  main.swift
//  15686_swift
//
//  Created by Hyun on 2022/08/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var house = [[Int]]()
var chicken = [[Int]]()
var ans = Int.max

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for k in 0..<n{
        if line[k] == 1{
            house.append([i,k])
        }
        if line[k] == 2{
            chicken.append([i,k])
        }
    }
}

var temp = [[Int]]()
var visited = Array(repeating: false, count: chicken.count)

func btk(cnt:Int, idx:Int){
    if cnt == m{
        var result = 0
        for house in house {
            var distance = Int.max
            for temp in temp{
                distance = min(distance, abs(house[0]-temp[0])+abs(house[1]-temp[1]))
            }
            result += distance
        }
        ans = min(ans, result)
    }
    for i in idx..<chicken.count{
        if !visited[i]{
            visited[i] = true
            temp.append(chicken[i])
            btk(cnt: cnt+1, idx: i)
            temp.removeLast()
            visited[i] = false
        }
    }
}
btk(cnt: 0, idx: 0)
print(ans)
