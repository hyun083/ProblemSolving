//
//  main.swift
//  2753_swift
//
//  Created by Hyun on 2022/12/17.
//

import Foundation

let year = Int(readLine()!)!
let flag = year%4==0 && (year%100>0 || year%400==0)
print(flag ? 1:0)
