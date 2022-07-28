//
//  main.swift
//  10973_swift
//
//  Created by Hyun on 2022/07/28.
//

import Foundation

let n = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = target

for i in stride(from: n-1, through: 1, by: -1){
    if ans[i] < ans[i-1]{
        let idx = i-1
        for k in stride(from: n-1, through: 0, by: -1){
            if ans[idx] > ans[k]{
                ans.swapAt(idx, k)
                break
            }
        }
        ans[idx+1..<n].sort(by: >)
        break
    }
}
if ans == target{
    print(-1)
}else{
    for a in ans{
        print(a,terminator: " ")
    }
}
