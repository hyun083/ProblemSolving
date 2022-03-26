//
//  main.swift
//  11656_swift
//
//  Created by Hyun on 2022/03/26.
//

//import Foundation

let S = readLine()!
var arr = [String]()
for i in S.indices{
    arr.append(String(S[i..<S.endIndex]))
}
print(arr.sorted().joined(separator: "\n"))
