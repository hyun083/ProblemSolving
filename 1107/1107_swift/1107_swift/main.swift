//
//  main.swift
//  1107_swift
//
//  Created by Hyun on 2022/03/16.
//

import Foundation

var target = Int(readLine()!)!
let M = Int(readLine()!)!
var arr = [Int]()
if M > 0{
    arr = readLine()!.split(separator: " ").map{Int(String($0))!}
}
var result = abs(target - 100)

for i in 0...1000000{
    if result == 0{
        break
    }
    
    let count = check(i)
    if count > 0{
        let number = abs(target - i) + count
        result = min(result, number)
    }
}
print(result)

func check(_ num:Int) -> Int{
    if num == 0{
        if arr.contains(0){
            return 0
        }else{
            return 1
        }
    }
    var n = num
    var cnt = 0
    while n>0{
        if arr.contains(n%10){
            return 0
        }
        n = n/10
        cnt += 1
    }
    return cnt
}
