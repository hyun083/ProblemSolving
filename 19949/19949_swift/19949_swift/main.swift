//
//  main.swift
//  19949_swift
//
//  Created by Hyun on 2022/07/14.
//

import Foundation

let targets = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [1,2,3,4,5]
var pick = [Int]()
var ans = 0
var score = 0

func btk(cnt:Int){
    if cnt == 10{
        var score = 0
        for i in 0..<10{
            if pick[i] == targets[i] {score += 1}
        }
        if score >= 5{ans += 1}
        return
    }
    for i in 0..<5{
        if cnt > 1{
            if pick[cnt-1]==arr[i] && pick[cnt-2]==arr[i]{
                continue
            }
            pick.append(arr[i])
            btk(cnt: cnt+1)
            pick.removeLast()
        }else{
            pick.append(arr[i])
            btk(cnt: cnt+1)
            pick.removeLast()
        }
    }
}
for i in 0..<5{
    pick.append(arr[i])
    btk(cnt: 1)
    pick.removeLast()
}
print(ans)
