//
//  main.swift
//  21300_swift
//
//  Created by Hyun on 2022/05/12.
//

//import Foundation

print(readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, +)*5)

