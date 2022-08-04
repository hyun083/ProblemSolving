//
//  main.swift
//  2033_swift
//
//  Created by Hyun on 2022/08/04.
//

import Foundation

var number = Array(readLine()!.map{Int(String($0))!}.reversed())
if number.count >= 2{
    for i in 0..<number.count{
        if i == number.count-1{
            if number[i] >= 10{
                number.append(number[i]/10)
                number[i]%=10
                break
            }
        }else{
            if number[i] >= 5{
                number[i] = 0
                number[i+1] += 1
            }
        }
    }
}
for number in Array(number.reversed()){
    print(number,terminator: "")
}
