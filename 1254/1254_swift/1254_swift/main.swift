//
//  main.swift
//  1254_swift
//
//  Created by Hyun on 2022/07/28.
//

import Foundation

let s = readLine()!.map{String($0)}

var rev = s
rev.removeLast()
rev = rev.reversed()
var str = s+rev
var ans = str.count
while str.count > s.count{
    str.removeLast()
    if str == str.reversed(){
        ans = str.count
    }
}
print(ans)

