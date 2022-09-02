//
//  main.swift
//  21758_swift
//
//  Created by Hyun on 2022/09/02.
//

import Foundation

let n = Int(readLine()!)!
var temp = 0
let psum = [0] + readLine()!.split(separator: " ").map{ num in
    temp += Int(num)!
    return temp
}
