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

func btk(cnt:Int, flag:Bool, score:Int){
    if cnt == 10{
        if score > 4{
            ans += 1
        }
        return
    }
    for i in 0..<5{
        if !(flag && arr[i] == pick.last!){
            if arr[i] == pick.last!{
                if targets[i] == arr[i]{
                    pick.append(arr[i])
                    btk(cnt: cnt+1, flag: true, score: score+1)
                    pick.removeLast()
                }else{
                    pick.append(arr[i])
                    btk(cnt: cnt+1, flag: true, score: score)
                    pick.removeLast()
                }
            }else{
                if targets[i] == arr[i]{
                    pick.append(arr[i])
                    btk(cnt: cnt+1, flag: false, score: score+1)
                    pick.removeLast()
                }else{
                    pick.append(arr[i])
                    btk(cnt: cnt+1, flag: false, score: score)
                    pick.removeLast()
                }
            }
        }
    }
}
for i in 0..<5{
    if targets[i] == arr[i]{
        pick.append(arr[i])
        btk(cnt: 1, flag: false, score: 1)
        pick.removeLast()
    }else{
        pick.append(arr[i])
        btk(cnt: 1, flag: false, score: 0)
        pick.removeLast()
    }
}
print(ans)
