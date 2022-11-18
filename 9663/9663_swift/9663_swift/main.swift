//
//  main.swift
//  9663_swift
//
//  Created by Hyun on 2021/12/06.
//

import Foundation

let N = Int(readLine()!)!
var cols = Array(repeating: false, count: N)
var diagonal1 = Array(repeating: false, count: 2*N-1)
var diagoanl2 =  Array(repeating: false, count: 2*N-1)
var ans = 0

func check(i:Int, k:Int) -> Bool{
    if cols[k] || diagonal1[i+k] || diagoanl2[i-k+N-1]{
        return false
    }else{
        return true
    }
}

func btk(row:Int){
    if row == N{
        ans += 1
        return
    }
    for col in 0..<N{
        if check(i: row, k: col){
            cols[col] = true; diagonal1[row+col] = true; diagoanl2[row-col+N-1] = true
            btk(row: row+1)
            cols[col] = false; diagonal1[row+col] = false; diagoanl2[row-col+N-1] = false
        }
    }
}

btk(row: 0)
print(ans)
