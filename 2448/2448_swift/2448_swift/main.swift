//
//  main.swift
//  2448_swift
//
//  Created by Hyun on 2022/01/12.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: " ", count: n*2-1), count: n)

func printStar(num:Int, x:Int, y:Int){
    if num==3{
        arr[x][y] = "*"
        arr[x+1][y-1] = "*"
        arr[x+1][y+1] = "*"
        for i in 0..<5{
            arr[x+2][y-2+i] = "*"
        }
        
    }else{
        let next = num/2
        printStar(num: next, x: x, y: y)
        printStar(num: next, x: x+next, y: y-next)
        printStar(num: next, x: x+next, y: y+next)
    }
}

printStar(num: n, x: 0, y: n-1)
var ans = ""
for a in arr{
    ans += a.joined(separator: "") + "\n"
}
print(ans)
