//
//  main.swift
//  9663_swift
//
//  Created by Hyun on 2021/12/06.
//

import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: false, count: N), count: N)
var ans = 0

let nx = [1,-1,0,0,1,1,-1,-1]
let ny = [0,0,-1,1,-1,1,-1,1]

func backtrack(queen:Int){
    if queen == N {
        return
    }
    for x in 0..<N{
        for y in 0..<N{
            if map[x][y]==false{
                for i in 0...7{
                    let X = x + nx[i]
                    let Y = y + ny[i]
                    
                }
                
            }
        }
    }
}
