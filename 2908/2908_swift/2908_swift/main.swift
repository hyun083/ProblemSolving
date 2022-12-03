//
//  main.swift
//  2908_swift
//
//  Created by Hyun on 2022/12/03.
//

import Foundation

let nk = readLine()!.split(separator: " ")
var n = String(nk[0].reversed())
var k = String(nk[1].reversed())

if n>k{
    print(n)
}else{
    print(k)
}

