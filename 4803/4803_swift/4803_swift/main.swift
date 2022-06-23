//
//  main.swift
//  4803_swift
//
//  Created by Hyun on 2022/01/07.
//

import Foundation
var C = 1
while let nm = readLine(){
    if nm == "0 0"{
        break
    }
    let nm = nm.split(separator: " ").map{Int(String($0))!}
    let n = nm[0]
    let m = nm[1]
    var arr = [Int](0..<n)
    var chk = Array(repeating: 0, count: n)

    func root(Of n:Int)->Int{
        if arr[n] == n{return n}
        arr[n] = root(Of: arr[n])
        return arr[n]
    }
    func union(a:Int, b:Int){
        let rootOfA = root(Of: a)
        let rootOfB = root(Of: b)
        if rootOfA <= rootOfB{
            arr[rootOfB] = rootOfA
        }else{
            arr[rootOfA] = rootOfB
        }
    }
    for _ in 0..<m{
        let ab = readLine()!.split(separator: " ").map{Int(String($0))!-1}
        let ra = root(Of: ab[0])
        let rb = root(Of: ab[1])
        if ra == rb{
            chk[ra] = -500
        }else{
            if chk[ra] == -500 || chk[rb] == -500{
                chk[ra] = -500
                chk[rb] = -500
            }
            union(a: ra, b: rb)
        }
    }
    var T = 0
    for i in 0..<n{
        chk[root(Of: i)] += 1
    }
    for i in 0..<n{
        if chk[i] > 0{
            T += 1
        }
    }

    if T == 0{
        print("Case \(C): No trees.")
    }else if T==1{
        print("Case \(C): There is one tree.")
    }else{
        print("Case \(C): A forest of \(T) trees.")
    }
    C += 1
}
