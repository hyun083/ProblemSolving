//
//  main.swift
//  14629_swift
//
//  Created by Hyun on 2022/07/19.
//

import Foundation

let n = readLine()!.map{String($0)}
let N = Int(n.joined())!
var ans = Int.min
var diff = Int.max

var visited = Array(repeating: false, count: 10)
var temp = 0

func btk(cnt:Int){
    if cnt == n.count{
        if abs(temp-N) < diff{
            diff = abs(temp-N)
            ans = temp
        }
        return
    }
    for i in 0..<10{
        if !visited[i]{
            visited[i] = true
            temp *= 10
            temp += i
            btk(cnt: cnt+1)
            temp -= i
            temp /= 10
            visited[i] = false
        }
    }
}
if N >= 9876543210{
    print(9876543210)
}else{
    btk(cnt: 0)
    print(ans)
}
