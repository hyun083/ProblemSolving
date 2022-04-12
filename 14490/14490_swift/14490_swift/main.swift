//
//  main.swift
//  14490_swift
//
//  Created by Hyun on 2022/04/12.
//

import Foundation

func gcd(_ num1:Int,_ num2:Int) -> Int{
    if num1%num2 == 0{
        return num2
    }else{
        return gcd(num2,num1%num2)
    }
}

let nm = readLine()!.split(separator: ":").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

if n==m{
    print("1:1")
}else{
    let temp = n>m ? gcd(n, m):gcd(m, n)
    print("\(n/temp):\(m/temp)")
}
