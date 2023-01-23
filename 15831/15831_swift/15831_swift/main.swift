//
//  main.swift
//  15831_swift
//
//  Created by Hyun on 2023/01/23.
//

import Foundation

let nbw = readLine()!.split(separator: " ").map{Int($0)!}
let n = nbw[0]
let b = nbw[1]
let w = nbw[2]

let arr = readLine()!.map{String($0)}
var head = 0
var tail = 0
var bCnt = 0
var wCnt = 0
var ans = 0

while tail < n{
    if arr[tail]=="B"{
        if bCnt >= b{
            if arr[head] == "B"{
                bCnt -= 1
            }else{
                wCnt -= 1
            }
            head += 1
        }else{
            bCnt += 1
            tail += 1
        }
    }else{
        wCnt+=1
        tail+=1
    }
    if bCnt<=b && wCnt>=w{
        ans = max(ans, bCnt+wCnt)
    }
}
print(ans)
