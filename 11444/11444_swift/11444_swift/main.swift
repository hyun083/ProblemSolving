//
//  main.swift
//  11444_swift
//
//  Created by Hyun on 2021/12/29.
//

import Foundation

let n = readLine()!
let number = NSDecimalNumber(string: n)
var arr = Dictionary<NSDecimalNumber,Int>()
arr[0] = 0
arr[1] = 1

func fibonacci(n:NSDecimalNumber) -> Int{
    let check = n.stringValue.map{Int(String($0))!}.last!%2==0 ? true : false
    if arr[n] == nil{
        if check{
            let fnM1 = fibonacci(n: n.dividing(by: 2).subtracting(1))
            let fn = fibonacci(n: n.dividing(by: 2))
            arr[n] = (fn*(2*fnM1+fn))%1000000007
        }else{
            let fnP1 = fibonacci(n: n.adding(1).dividing(by: 2))
            let fn = fibonacci(n: n.adding(1).dividing(by: 2).subtracting(1))
            arr[n] = ((fn*fn)+(fnP1*fnP1))%1000000007
        }
    }
    return arr[n]!
}
print(fibonacci(n: number))

