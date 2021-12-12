//
//  main.swift
//  6603_swift
//
//  Created by Hyun on 2021/12/12.
//

import Foundation

while true {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    if inputs[0] == 0{
        break
    }
    let K = inputs[0]
    var S = inputs
    S.removeFirst()
    S.sort(by: <)
    var arr = [String]()
    var ans = [String]()
    
    func btk(cnt:Int){
        if cnt == 6{
            if arr.count == 6{
                ans.append(arr.joined(separator: " "))
            }
            return
        }
        
        for i in 0..<K{
            arr.append(String(S[i]))
            btk(cnt: cnt+1)
            arr.removeLast()
        }
    }
    btk(cnt: 0)
    print(arr)
    
}
