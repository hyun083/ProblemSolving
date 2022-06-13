//
//  main.swift
//  4195_swift
//
//  Created by Hyun on 2022/06/13.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t{
    let f = Int(readLine()!)!
    var arr = Array(repeating: -1, count: f*2)
    var numberOf =  [String:Int]()
    var idx = 0
    func root(of n:Int)->Int{
        if arr[n] < 0 { return n}
        arr[n] = root(of: arr[n])
        return arr[n]
    }
    func union(a:Int, b:Int){
        let rootOfA = root(of: a)
        let rootOfB = root(of: b)
        if rootOfA == rootOfB{ return }
        if arr[rootOfA] < arr[rootOfB]{
            arr[rootOfA] += arr[rootOfB]
            arr[rootOfB] = rootOfA
        }else{
            arr[rootOfB] += arr[rootOfA]
            arr[rootOfA] = rootOfB
        }
    }
    for _ in 0..<f{
        let ab = readLine()!.split(separator: " ").map{String($0)}
        let a = ab[0]
        let b = ab[1]
        if numberOf[a] == nil{
            numberOf[a] = idx
            idx += 1
        }
        if numberOf[b] == nil{
            numberOf[b] = idx
            idx+=1
        }
        union(a: numberOf[a]!, b: numberOf[b]!)
        print(abs(arr[root(of: numberOf[a]!)]))
    }
}

