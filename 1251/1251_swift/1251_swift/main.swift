//
//  main.swift
//  1251_swift
//
//  Created by Hyun on 2022/08/08.
//

import Foundation

let str = readLine()!.map{String($0)}
var start = 0
var mid = 1
var end = 2
var ans = [String]()

while end <= str.count-1{
    for i in mid+1..<str.count{
        var temp = str[start..<mid].reversed().joined()
        temp += str[mid..<i].reversed().joined()
        temp += str[i..<str.count].reversed().joined()
        ans.append(temp)
    }
    mid += 1
    end += 1
}
print(ans.sorted(by: <)[0])
