//
//  main.swift
//  10953_swift
//
//  Created by Hyun on 2022/04/05.
//

//import Foundation

for _ in 0..<Int(readLine()!)!{
    let numbers = readLine()!.split(separator: ",").map{Int(String($0))!}
    print(numbers.reduce(0, +))
}

