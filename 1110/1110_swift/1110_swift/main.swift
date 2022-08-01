//
//  main.swift
//  1110_swift
//
//  Created by Hyun on 2022/08/01.
//

import Foundation

var n = readLine()!.map{Int(String($0))!}
var temp = [Int]()
var ans = 1

if n.count == 1{
    n = [0,n[0]]
    temp = [n[1],n[1]]
}else{
    temp = [n[1],(n[0]+n[1])%10]
}
 
while n != temp{
    ans += 1
    let a = temp[0] + temp[1]
    temp = [temp[1],a%10]
}
print(ans)
