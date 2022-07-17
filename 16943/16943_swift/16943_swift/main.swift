//
//  main.swift
//  16943_swift
//
//  Created by Hyun on 2022/07/17.
//

import Foundation

let AB = readLine()!.split(separator: " ")
let A = AB[0]
let B = Int(AB[1])!

var numbers = A.map{String($0)}.sorted(by: <)
var visited = Array(repeating: false, count: numbers.count)
var temp = [String]()
var ans = [String]()

func btk(cnt:Int){
    if cnt == numbers.count{
        if Int(temp.joined())! < B && temp.first != "0"{
            ans.append(temp.joined())
        }
        return
    }
    for i in 0..<numbers.count{
        if !visited[i]{
            visited[i] = true
            temp.append(numbers[i])
            btk(cnt: cnt+1)
            temp.removeLast()
            visited[i] = false
        }
    }
}
btk(cnt: 0)
print(ans.max() ?? "-1")
