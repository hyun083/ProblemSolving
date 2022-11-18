//
//  main.swift
//  5525_swift
//
//  Created by Hyun on 2022/01/21.
//
import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map{$0}

var ans = 0
var compare = 0
var idx = 0

while idx < m-2 {
    if String(s[idx...idx+2]) == "IOI" {
        compare += 1
        if compare == n {
            compare -= 1
            ans += 1
        }
        idx += 1
    } else {
        compare = 0
    }
    idx += 1
}
print(ans)
