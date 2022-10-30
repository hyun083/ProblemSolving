//
//  main.swift
//  1195_swift
//
//  Created by Hyun on 2022/10/30.
//

import Foundation

var a = readLine()!.map{Int(String($0))!}
var b = readLine()!.map{Int(String($0))!}

if a.count < b.count{
    swap(&a, &b)
}
