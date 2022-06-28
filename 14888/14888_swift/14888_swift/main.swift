//
//  main.swift
//  14888_swift
//
//  Created by Hyun on 2022/06/28.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var op = readLine()!.split(separator: " ").map{Int(String($0))!}
var operands = [[Int]]()
var temp = [Int]()
var maximum = Int.min
var minimum = Int.max
func btk(result:Int, idx:Int){
    if idx == n-1{
        maximum = max(maximum, result)
        minimum = min(minimum,result)
        return
    }
    for i in 0..<4{
        if op[i] > 0 {
            op[i] -= 1
            if i == 0{
                btk(result: result+arr[idx+1], idx: idx+1)
            }else if i == 1{
                btk(result: result-arr[idx+1], idx: idx+1)
            }else if i == 2{
                btk(result: result*arr[idx+1], idx: idx+1)
            }else{
                btk(result: result/arr[idx+1], idx: idx+1)
            }
            op[i] += 1
        }
    }
}
btk(result: arr[0], idx: 0)
print(maximum)
print(minimum)
