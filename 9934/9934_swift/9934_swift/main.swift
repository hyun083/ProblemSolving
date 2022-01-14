//
//  main.swift
//  9934_swift
//
//  Created by Hyun on 2022/01/14.
//

import Foundation

let N = Int(readLine()!)! - 1
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Array(repeating: [Int](), count: N+1)

func level(num:Int){
    var temp = [Int]()
    if num == 0{
        ans[num] = arr
        return
    }
    for i in 0..<arr.count{
        if i%2==1{
            temp.append(arr[i])
        }else{
            ans[num].append(arr[i])
        }
    }
    arr = temp
    level(num: num-1)
}
level(num: N)
for a in ans{
    for res in a {
        print(res,terminator: " ")
    }
    print()
}
