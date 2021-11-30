//
//  main.swift
//  2839_swift
//
//  Created by Hyun on 2021/11/30.
//

import Foundation

var N = Int(readLine()!)!
var cnt = 0

while N >= 0 {
    if N%5 == 0{
        cnt += N/5
        break
    }else{
        N -= 3
        cnt += 1
    }
}

if N<0{ print(-1) }
else{ print(cnt) }
