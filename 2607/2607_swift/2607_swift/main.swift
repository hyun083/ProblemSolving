//
//  main.swift
//  2607_swift
//
//  Created by Hyun on 2023/01/26.
//

import Foundation

let n = Int(readLine()!)!
let target = readLine()!.map{String($0)}
var targetArr = Array(repeating: 0, count: 26)
for target in target{
    let idx = Int(Character(target).asciiValue!) - 65
    targetArr[idx] += 1
}
var ans = 0

func similar(with tmp:[String]) -> Bool{
    var result = false
    var arr = targetArr
    
    if target.count == tmp.count{
        var cnt = target.count
        for tmp in tmp{
            let idx = Int(Character(tmp).asciiValue!) - 65
            if arr[idx] > 0{
                cnt -= 1
                arr[idx] -= 1
            }
        }
        if cnt < 2{ result = true }
    }else if target.count == tmp.count + 1{
        var cnt = target.count
        for tmp in tmp{
            let idx = Int(Character(tmp).asciiValue!) - 65
            if arr[idx] > 0{
                cnt -= 1
                arr[idx] -= 1
            }
        }
        if cnt == 1{ result = true }
    }else if target.count + 1 == tmp.count{
        var cnt = tmp.count
        for tmp in tmp{
            let idx = Int(Character(tmp).asciiValue!) - 65
            if arr[idx] > 0{
                cnt -= 1
                arr[idx] -= 1
            }
        }
        if cnt == 1{ result = true }
    }else{
        result = false
    }

    return result
}

for _ in 1..<n{
    let tmp = readLine()!.map{String($0)}
    if similar(with: tmp){
        ans += 1
    }
}
print(ans)
