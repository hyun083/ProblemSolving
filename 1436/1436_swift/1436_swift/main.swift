//
//  main.swift
//  1436_swift
//
//  Created by Hyun on 2021/11/28.
//

import Foundation

var num = [Int]()

num.append(666)
var number = num.last! + 1
while(num.count <= 10000){
    let txt = String(number)
    
    for index in txt.indices{
        if txt.distance(from: index, to: txt.index(txt.endIndex, offsetBy: -1)) >= 2 {
            if txt[index]=="6" && txt[txt.index(index, offsetBy: 1)] == "6" && txt[txt.index(index, offsetBy: 2)] == "6"{
                num.append(number)
                break
            }
        }else{
            break
        }
    }
    number += 1
}

let N = Int(readLine()!)!

print(num[N-1])
//let tt = "12345"
//print(tt[tt.index(tt.endIndex, offsetBy: -1)])


