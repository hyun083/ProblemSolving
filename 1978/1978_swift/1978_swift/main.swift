//
//  main.swift
//  1978_swift
//
//  Created by Hyun on 2021/11/14.
//

import Foundation

let N = readLine()

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0
for number in numbers{
    if(number == 1) {continue}
    
    for i in 2...number{
        if(i == number) {cnt += 1}
        else if(number % i == 0) {break}
    }
    
}
print(cnt)
