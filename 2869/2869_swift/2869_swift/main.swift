//
//  main.swift
//  2869_swift
//
//  Created by Hyun on 2021/11/10.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let A = inputs[0]
let B = inputs[1]
let V = inputs[2]
var sum = 0
var cnt = 0
while(true){
    cnt += 1
    sum += A
    if(sum >= V){
        break
    }else{
        sum -= B
    }
}
print(cnt)
