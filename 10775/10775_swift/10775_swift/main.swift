//
//  main.swift
//  10775_swift
//
//  Created by Hyun on 2022/06/20.
//

import Foundation

let g = Int(readLine()!)!
let p = Int(readLine()!)!
var arr = [Int](0...g)
func root(Of n:Int) -> Int{
    if arr[n] == n{
        return n
    }
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let rootOfA = root(Of: a)
    let rootOfB = root(Of: b)
    if rootOfA == rootOfB{return}
    arr[root(Of: b)] = root(Of: a)
}
var ans = 0
for _ in 0..<p{
    let plane = Int(readLine()!)!
    if root(Of: plane) != 0{
        ans += 1
        union(a: root(Of: plane)-1, b: root(Of: plane))
    }else{
        break
    }
}

print(ans)
