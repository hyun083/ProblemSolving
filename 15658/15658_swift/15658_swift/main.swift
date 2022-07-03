//
//  main.swift
//  15658_swift
//
//  Created by Hyun on 2022/07/02.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var op = readLine()!.split(separator:  " ").map{Int(String($0))!}

var visited = Array(repeating: false, count: n)
var myMin = 1000000001
var myMax = -1000000001

func btk(cnt:Int, sum:Int){
    if cnt == n-1{
        myMax = max(myMax, sum)
        myMin = min(myMin, sum)
        return
    }
    for i in 0..<4{
        if i==0 && op[i]>0{
            op[i] -= 1
            btk(cnt: cnt+1, sum: sum+arr[cnt+1])
            op[i] += 1
        }
        if i==1 && op[i]>0{
            op[i] -= 1
            btk(cnt: cnt+1, sum: sum-arr[cnt+1])
            op[i] += 1
        }
        if i==2 && op[i]>0{
            op[i] -= 1
            btk(cnt: cnt+1, sum: sum*arr[cnt+1])
            op[i] += 1
        }
        if i==3 && op[i]>0{
            op[i] -= 1
            btk(cnt: cnt+1, sum: sum/arr[cnt+1])
            op[i] += 1
        }
    }
}
btk(cnt: 0, sum: arr[0])
print(myMax)
print(myMin)
