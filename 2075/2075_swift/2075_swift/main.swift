//
//  main.swift
//  2075_swift
//
//  Created by Hyun on 2022/01/28.
//

import Foundation

var arr = [Int]()
let N = Int(readLine()!)!

for i in 0..<N{
    arr += readLine()!.split(separator: " ").map{Int(String($0))!}
    if i > 0{
        for _ in 0..<N{
            let idx = arr.firstIndex(of: arr.min()!)!
            arr.remove(at: idx)
        }
    }
}
print(arr.min()!)
