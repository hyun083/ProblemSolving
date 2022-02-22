//
//  main.swift
//  5585_swift
//
//  Created by Hyun on 2022/02/22.
//

import Foundation

var changes = 1000-Int(readLine()!)!
let coins = [500,100,50,10,5,1]
var cnt = 0
for coin in coins{
    cnt += changes/coin
    changes %= coin
}
print(cnt)
