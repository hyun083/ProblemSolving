//
//  main.swift
//  2675_swift
//
//  Created by Hyun on 2022/04/03.
//

//import Foundation

for _ in 0..<Int(readLine()!)!{
    let NS = readLine()!.split(separator: " ").map{String($0)}
    let N = Int(NS[0])!
    let S = NS[1].map{String($0)}
    var temp = ""
    for s in S{
        for _ in 0..<N{
            temp += s
        }
    }
    print(temp)
}

