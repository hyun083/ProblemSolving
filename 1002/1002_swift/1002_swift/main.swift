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

    //좌표가 같은경우
    if x1 == x2 && y1 == y2{
        if r1 == r2{
            print(-1)
        }else{
            print(0)
        }
    }else{
        let distance = sqrt(Double(pow((x2-x1), 2) + pow((y2-y1), 2)))
        if distance < Double(r1+r2){
            print(2)
        }else if distance == Double(r1+r2){
            print(1)
        }else if distance == Double(r1) || distance == Double(r2){
            print(1)
        }else{
            print(0)
        }
    }
}

