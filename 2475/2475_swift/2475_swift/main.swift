//
//  main.swift
//  2475_swift
//
//  Created by Hyun on 2022/01/17.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0
for number in numbers{
    ans += Int(pow(Double(number), 2.0))
}
print(ans%10)

