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
            arr[ra] = -1
        }else{
            if ra<0 || rb<0{
                arr[ra] = -1
                arr[rb] = -1
                continue
            }
            union(a: ra, b: rb)
        }
    }

    var list = Set<Int>()
    for i in 0..<n{
        if root(Of: i) < 0{
            continue
        }
        list.insert(root(Of: i))
    }
    let T = list.count
    
    if T == 0{
        print("Case \(C): No trees.")
    }else if T==1{
        print("Case \(C): There is one tree.")
    }else{
        print("Case \(C): A forest of \(T) trees.")
    }
    C += 1
    print(arr)
}
