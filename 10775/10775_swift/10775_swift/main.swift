//
//  main.swift
//  10775_swift
//
//  Created by Hyun on 2022/06/20.
//

import Foundation

let g = Int(readLine()!)!
let p = Int(readLine()!)!
var arr = [Int](0..<g)
func root(Of n:Int) -> Int{
    if arr[n] == n{
        return n
    }
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    arr[root(Of: a)] = root(Of: b)
}

for i in 1...p{
    let plane = Int(readLine()!)!-1
    if root(Of: 0) <= plane{
        union(a: 0, b: root(Of: 0)+1)
    }else{
        print(i)
        break
    }
}
