//
//  main.swift
//  sswift
//
//  Created by Hyun on 2021/11/01.
//

import Foundation

let N = Int(readLine()!)!

for _ in 1...N{
    let actions = readLine()!
    let _ = readLine()

    var str = readLine()!
    str.removeFirst()
    str.removeLast()
    var arr = str.split(separator: ",").map{Int(String($0))!}

    var flag = true

    for action in actions {
        if action == "R"{
            arr.reverse()
        }else if action == "D" && arr.isEmpty{
            flag = false
            print("error")
            break
        } else if action == "D" && !arr.isEmpty{
            arr.removeFirst()
        }
    }

    if flag{
        print(arr)
    }
}
