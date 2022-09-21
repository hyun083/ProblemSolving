//
//  main.swift
//  1788_swift
//
//  Created by Hyun on 2022/09/21.
//

import Foundation

let mod = 1000000000
var fibonacci = [0,1]
for i in 2...1000000{
    fibonacci.append((fibonacci[i-1]+fibonacci[i-2])%mod)
}
let n = Int(readLine()!)!

if n>0{
    print(1)
    print(fibonacci[n])
}else if n==0{
    print(0)
    print(0)
}else{
    if (-1*n)%2==0{
        print(-1)
    }else{
        print(1)
    }
    print(fibonacci[-1*n])
}
