//
//  main.swift
//  2522_swift
//
//  Created by Hyun on 2022/03/17.
//

import Foundation

let N = Int(readLine()!)!

var star = ""
for i in 1...(2*N-1){
    if i < N{
        for _ in 0..<N-i{
            star += " "
        }
        for _ in 0..<i{
            star += "*"
        }
    }else if i == N{
        for _ in 0..<N{
            star += "*"
        }
    }else{
        let temp = i-N
        for _ in 0..<temp{
            star += " "
        }
        for _ in 0..<N-temp{
            star += "*"
        }
    }
    if i != 2*N-1{
        star += "\n"
    }
}
print(star)
