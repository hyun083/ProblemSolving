//
//  main.swift
//  11021_swift
//
//  Created by Hyun on 2022/08/04.
//

//import Foundation

for t in 1...Int(readLine()!)!{
    print("Case #\(t):",readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, +))
}

