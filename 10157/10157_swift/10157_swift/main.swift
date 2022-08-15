//
//  main.swift
//  10157_swift
//
//  Created by Hyun on 2022/08/14.
//

import Foundation

let cr = readLine()!.split(separator: " ").map{Int(String($0))!}
var r = cr[1] 
var c = cr[0]
let max = c*r
let target = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: c), count: r)

var number = 1
var x = 0
var y = 0
var flag = true
var ans = "0"


while number <= max{
    if flag{
        for i in 0..<r{
            if number == target {
                ans = "\(y+1) \(x+1)"
            }
            map[x][y] = number
            number += 1
            if i < r-1{
                x += 1
            }else{
                y += 1
            }
        }
        for i in 0..<c-1{
            if number == target {
                ans = "\(y+1) \(x+1)"
            }
            map[x][y] = number
            number += 1
            if i < c-2{
                y += 1
            }else{
                x -= 1
            }
        }
        flag = !flag
        r -= 1
        c -= 1
    }else{
        for i in 0..<r{
            if number == target {
                ans = "\(y+1) \(x+1)"
            }
            map[x][y] = number
            number += 1
            if i < r-1{
                x -= 1
            }else{
                y -= 1
            }
        }
        for i in 0..<c-1{
            if number == target {
                ans = "\(y+1) \(x+1)"
            }
            map[x][y] = number
            number += 1
            if i < c-2{
                y -= 1
            }else{
                x += 1
            }
        }
        flag = !flag
        r -= 1
        c -= 1
    }
}

print(ans)
