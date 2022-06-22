//
//  main.swift
//  24391_swift
//
//  Created by Hyun on 2022/06/22.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = [Int](0..<n)
func root(Of n:Int)->Int{
    if arr[n] == n {return n}
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let ra = root(Of: a)
    let rb = root(Of: b)
    if ra == rb{
        return
    }
    arr[ra] = rb
}
for _ in 0..<m{
    let ij = readLine()!.split(separator: " ").map{Int(String($0))!-1}
    let i = ij[0]
    let j = ij[1]
    union(a: i, b: j)
}
let timetable = readLine()!.split(separator: " ").map{Int(String($0))!-1}
var ans = 0
for i in 0..<n-1{
    if root(Of: timetable[i]) != root(Of: timetable[i+1]){
        ans += 1
    }
}
print(ans)
