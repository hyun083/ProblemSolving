//
//  main.swift
//  B
//
//  Created by Hyun on 2022/09/18.
//

import Foundation

var sum = [0]
for i in 1...500{
    sum.append((i*(i+1)/2))
}
let target = Int(readLine()!)!
for i in 0..<500{
    if sum[i]>target{
        if i%2 == 0{
            print(0)
        }else{
            print(sum[i]-target)
        }
        break
    }else if sum[i]==target{
        if i%2==1{
            print(0)
        }else{
            print(sum[i+1]-target)
        }
        break
    }
}
