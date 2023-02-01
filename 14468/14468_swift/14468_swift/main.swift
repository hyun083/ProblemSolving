//
//  main.swift
//  14468_swift
//
//  Created by Hyun on 2023/02/01.
//

import Foundation

let line = readLine()!.map{Int(Character(String($0)).asciiValue!)-65}
var cow = Array(repeating: (-1,-1), count: 26)
var cnt = 0

for i in 0..<52{
    let idx = line[i]
    if cow[idx].0 == -1{
        cow[idx].0 = i
    }else{
        cow[idx].1 = i
    }
}

for i in 0..<26{
    for k in 0..<26{
        if cow[i].0 < cow[k].0 && cow[k].0 < cow[i].1 && cow[i].1 < cow[k].1{
            cnt += 1
        }
    }
}

print(cnt)
