//
//  main.swift
//  5052_swift
//
//  Created by Hyun on 2022/01/20.
//

import Foundation

let T = Int(readLine()!)!

for _ in 1...T{
    var flag = false
    let N = Int(readLine()!)!
    var arr = [String]()
    for _ in 1...N{
        arr.append(readLine()!)
    }
    arr.sort(by: <)
    
    for i in 0..<arr.count{
        if flag{
            break
        }else{
            for k in i+1..<arr.count{
                if arr[k].starts(with: arr[i]){
                    flag = true
                    break
                }
            }
        }
    }
    if flag{
        print("NO")
    }else{
        print("YES")
    }
}


