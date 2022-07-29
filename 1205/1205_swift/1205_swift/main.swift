//
//  main.swift
//  1205_swift
//
//  Created by Hyun on 2022/07/29.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}

let n = line[0]
let target = line[1]
let p = line[2]
var scores = [Int]()
var rank = 1

if n != 0{
    scores = readLine()!.split(separator: " ").map{Int(String($0))!}
}

for score in scores{
    if target <= score{
        rank += 1
    }
}

if rank > p{
    print(-1)
}else{
    var ans = 1
    for score in scores{
        if score > target{
            ans += 1
        }else{
            break
        }
    }
    print(ans)
}
