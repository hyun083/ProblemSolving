//
//  main.swift
//  10216_swift
//
//  Created by Hyun on 2022/06/23.
//

import Foundation

func dist(x1:Double, x2:Double, y1:Double, y2:Double) -> Double{
    return sqrt(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
}

var output = ""

for _ in 0..<Int(readLine()!)!{
    let n = Int(readLine()!)!
    var arr = Array(repeating: -1, count: n)
    var map = [(x:Double,y:Double,r:Double)]()
    
    func root(of n:Int) -> Int{
        if arr[n]<0 {return n}
        arr[n] = root(of: arr[n])
        return arr[n]
    }
    
    func union(a:Int, b:Int){
        let rootOfA = root(of: a)
        let rootOfB = root(of: b)
        if rootOfA == rootOfB{ return }
        arr[rootOfB] = rootOfA
    }
    
    for i in 0..<n{
        let info = readLine()!.split(separator: " ").map{Double($0)!}
        let x = info[0]
        let y = info[1]
        let r = info[2]
        map.append((x,y,r))
        
        for k in 0..<i{
            let target = map[k]
            if target.r + r >= dist(x1: target.x, x2: x, y1: target.y, y2: y){
                union(a: i, b: k)
            }
        }
    }
    
    var ans = 0
    for i in 0..<n{
        if arr[i]<0{
            ans += 1
        }
    }
    output += "\(ans)\n"
}
print(output)
