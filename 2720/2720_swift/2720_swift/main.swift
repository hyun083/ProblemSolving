//
//  main.swift
//  2720_swift
//
//  Created by Hyun on 2022/02/28.
//

import Foundation

let T = Int(readLine()!)!
let coin = [25,10,5,1]
for _ in 0..<T{
    var coins = ""
    var charge = Int(readLine()!)!
    for i in 0..<4{
        coins += String(charge/coin[i]) + " "
        charge = charge%coin[i]
    }
    print(coins)
}
