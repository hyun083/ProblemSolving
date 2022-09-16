//
//  main.swift
//  6588_swift
//
//  Created by Hyun on 2022/09/16.
//

import Foundation

var primes = Array(repeating: true, count: 1000001)

for i in 0..<1000001{
    if i <= 1{
        primes[i] = false
        continue
    }
    if primes[i]{
        for k in stride(from: i+i, to: 1000001, by: +i){
            primes[k] = false
        }
    }
}

while let input = readLine(){
    let n = Int(input)!
    if n == 0{ break }
    
    var flag = false
    for i in 3..<1000001{
        if primes[i]{
            let chk = n-i
            if primes[chk]{
                flag = true
                print(n,"=",i,"+",chk)
                break
            }
        }
    }
    if !flag{
        print("Goldbach's conjecture is wrong.")
    }
}
