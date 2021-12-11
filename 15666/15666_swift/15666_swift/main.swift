//
//  main.swift
//  15666_swift
//
//  Created by Hyun on 2021/12/11.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = Array(Set(readLine()!.split(separator: " ").map{Int(String($0))!})).sorted(by: <)

var arr = [String]()

func btk(numb:Int, cnt:Int){
    if cnt == M{
        if arr.count == M{
            print(arr.joined(separator: " "))
        }
        return
    }
    
    for i in numb..<num.count{
        arr.append(String(num[i]))
        btk(numb: i, cnt: cnt+1)
        arr.removeLast()
    }
}

btk(numb: 0, cnt: 0)
