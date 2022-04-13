//
//  main.swift
//  1769_swift
//
//  Created by Hyun on 2022/04/13.
//

import Foundation

var x = readLine()!
var cnt = 0
while x.count > 1{
    var temp = 0
    for y in x{
        temp += Int(String(y))!
    }
    x = String(temp)
    cnt += 1
}

print(cnt)
if Int(x)! % 3 == 0{
    print("YES")
}else{
    print("NO")
}
