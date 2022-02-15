//
//  main.swift
//  2562_swift
//
//  Created by Hyun on 2022/02/16.
//

var arr = [Int]()
for _ in 1...9{
    arr.append(Int(readLine()!)!)
}
print("\(arr.max()!)\n\(arr.firstIndex(of: arr.max()!)! + 1)")
