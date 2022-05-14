//
//  main.swift
//  B
//
//  Created by Hyun on 2022/05/14.
//

import Foundation

let n = Int(readLine()!)!
var dic = [String:Bool]()
var cnt = 0

for _ in 0..<n{
    let line = readLine()!
    if line == "ENTER"{
        dic = [String:Bool]()
    }else{
        if dic[line] == nil{
            dic[line] = true
            cnt += 1
        }
    }
}
print(cnt)
