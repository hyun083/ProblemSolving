//
//  main.swift
//  5597_swift
//
//  Created by Hyun on 2022/07/18.
//

import Foundation

var arr = Array(repeating: false, count: 30)

for _ in 0..<28{
    arr[Int(readLine()!)!-1] = true
}

for i in 0..<30{
    if !arr[i]{
        print(i+1)
    }
}
