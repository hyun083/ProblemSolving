//
//  main.swift
//  11382_swift
//
//  Created by Hyun on 2022/04/23.
//

//import Foundation

print(readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, +))
