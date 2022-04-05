//
//  main.swift
//  1316_swift
//
//  Created by Hyun on 2022/04/03.
//

//import Foundation
var cnt = 0
for _ in 0..<Int(readLine()!)!{
    var arr = Array(repeating: -1, count: 26)
    let word = readLine()!
    var flag = true
    for (idx,value) in word.utf8.enumerated(){
        print(idx,value)
        if arr[Int(value-97)] == -1{
            arr[Int(value-97)] = idx
        }else{
            if idx - arr[Int(value-97)] > 1{
                flag = false
                break
            }
        }
    }
    if flag{
        cnt += 1
    }
}
print(cnt)
