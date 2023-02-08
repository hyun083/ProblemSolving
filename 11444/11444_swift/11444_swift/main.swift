//
//  main.swift
//  11444_swift
//
//  Created by Hyun on 2021/12/29.
//

import Foundation

let n = Int(readLine()!)!
var arr = Dictionary<Int,Int>()
arr[0] = 0
arr[1] = 1

func fibonacci(n:Int) -> Int{
    let check = n%2==0 ? true : false
    if arr[n] == nil{
        if check{
            let fnM1 = fibonacci(n: n/2-1)
            let fn = fibonacci(n: n/2)
            arr[n] = (fn*(2*fnM1+fn))%1000000007
        }else{
            let fnP1 = fibonacci(n: n/2+1)
            let fn = fibonacci(n: n/2)
            arr[n] = ((fn*fn)+(fnP1*fnP1))%1000000007
        }
    }
    return arr[n]!
}
print(fibonacci(n: n))
