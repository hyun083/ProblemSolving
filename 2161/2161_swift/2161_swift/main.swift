//
//  main.swift
//  2161_swift
//
//  Created by Hyun on 2022/08/02.
//

import Foundation

let n = Int(readLine()!)!
var arr = [Int](1...n)
var ans = [String]()

for _ in 0..<n-1{
    ans.append(String(arr.removeFirst()))
    arr.append(arr.removeFirst())
}
ans.append(String(arr.removeLast()))
print(ans.joined(separator: " "))

