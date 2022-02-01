//
//  main.swift
//  1002_swift
//
//  Created by Hyun on 2022/02/01.
//

import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Float(String($0))!}
    let x1 = input[0]
    let y1 = input[1]
    let r1 = input[2]

    let x2 = input[3]
    let y2 = input[4]
    let r2 = input[5]

    let distance = pow((x2-x1), 2) + pow((y2-y1), 2)
    
    if distance == 0{
        if pow(r1-r2,2) == 0{
            print("-1")
        }else{
            print("0")
        }
    }else if distance == pow(r1-r2, 2) || distance == pow(r1+r2, 2){
        print("1")
    }else if pow(r1-r2, 2) < distance && distance < pow(r1+r2, 2){
        print("2")
    }else{
        print("0")
    }
}

