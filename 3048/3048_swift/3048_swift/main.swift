//
//  main.swift
//  3048_swift
//
//  Created by Hyun on 2023/02/04.
//

import Foundation

let N = readLine()!.split(separator: " ").map{Int($0)!}
let N1 = N[0]
let N2 = N[1]

var res = [(String,String)]()
var ans = ""

let ant1 = readLine()!.reversed().map{String($0)}
let ant2 = readLine()!.map{String($0)}
let T = Int(readLine()!)!

for ant in ant1{
    res.append((ant,"R"))
}

for ant in ant2{
    res.append((ant,"L"))
}

for _ in 0..<T{
    var curr = 0
    while curr < res.count-1{
        if res[curr].1 == "R" && res[curr+1].1 == "L"{
            res.swapAt(curr, curr+1)
            curr += 2
        }else{
            curr += 1
        }
    }
}

for res in res{ ans += res.0 }
print(ans)
