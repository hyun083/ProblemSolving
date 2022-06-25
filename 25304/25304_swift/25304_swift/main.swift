//
//  main.swift
//  25304_swift
//
//  Created by Hyun on 2022/06/25.
//

import Foundation

var s = Int(readLine()!)!
for _ in 0..<Int(readLine()!)!{
    let price = readLine()!.split(separator: " ").map{Int(String($0))!}
    s -= price[0]*price[1]
}
if s == 0{
    print("Yes")
}else{
    print("No")
}
