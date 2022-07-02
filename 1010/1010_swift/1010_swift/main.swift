//
//  main.swift
//  1010_swift
//
//  Created by Hyun on 2022/04/02.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = MN[0]
    let n = MN[1]
    var temp = 1
    var f = 1
    for i in stride(from: n, to: n-m, by: -1){
        temp *= i
        temp /= f
        f += 1
    }
    print(temp)
}


