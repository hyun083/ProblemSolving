//
//  main.swift
//  1992_swift
//
//  Created by Hyun on 2021/12/24.
//

import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()

for _ in 0..<N{
    arr.append(Array(readLine()!).map{Int(String($0))!})
}
var ans = ""

func comp(x:Int, y:Int, size:Int){
    var zero = true
    var one = true

    for i in x..<x+size{
        for k in y..<y+size{
            if arr[i][k] == 0{
                one = false
            }else{
                zero = false
            }
        }
    }
    if one == true{
        ans += "1"
    }
    if zero == true{
        ans += "0"
    }
    if one==false && zero==false{
        ans += "("
        comp(x: x, y: y, size: size/2)
        comp(x: x, y: y+size/2, size: size/2)
        comp(x: x+size/2, y: y, size: size/2)
        comp(x: x+size/2, y: y+size/2, size: size/2)
        ans += ")"
    }
}
comp(x: 0, y: 0, size: N)
print(ans)

