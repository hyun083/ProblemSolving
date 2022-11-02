//
//  main.swift
//  1195_swift
//
//  Created by Hyun on 2022/10/30.
//

import Foundation

var a = readLine()!.map{Int(String($0))!}
var b = readLine()!.map{Int(String($0))!}
var ans = a.count + b.count

if a.count < b.count{
    swap(&a, &b)
}

var temp = [Int]()
while !b.isEmpty{
    var flag = true
    temp = [b.removeLast()]+temp
    for i in 0..<temp.count{
        if temp[i]==2 && a[i]==2{
            flag = false
            break
        }
    }
    if flag{
        ans = min(ans, b.count+a.count)
    }
}

var idx = 1
while idx < a.count{
    temp = [1]+temp
    var flag = true
    for i in idx..<min(a.count,temp.count){
        if temp[i]==2 && a[i]==2{
            flag = false
            break
        }
    }
    if flag{
        ans = min(ans, max(a.count, temp.count))
    }
    idx += 1
}

print(ans)
