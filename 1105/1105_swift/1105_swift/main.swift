//
//  main.swift
//  1105_swift
//
//  Created by Hyun on 2022/11/24.
//

import Foundation

let LR = readLine()!.split(separator: " ").map{String($0)}
let L = LR[0].map{String($0)}
let R = LR[1].map{String($0)}
var ans = 0

if L.count != R.count{
    print(0)
}else{
    for i in 0..<L.count{
        if L[i]==R[i]{
            if L[i]=="8"{ ans += 1 }
        }else{
            break
        }
    }
    print(ans)
}
