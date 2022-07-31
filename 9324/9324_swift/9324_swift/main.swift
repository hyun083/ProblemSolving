//
//  main.swift
//  9324_swift
//
//  Created by Hyun on 2022/07/31.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    var dic = [String:Int]()
    let message = readLine()!.map{String($0)}
    var ans = "OK"
    for i in 0..<message.count{
        let str = message[i]
        if i == message.count-1{
            if dic[str] == 2{
                ans = "FAKE"
            }
        }else{
            if dic[str] == nil{
                dic[str] = 1
            }else if dic[str] == 3{
                if message[i-1] == message[i]{
                    dic[str] = 0
                }else{
                    ans = "FAKE"
                    break
                }
            }else{
                dic[str]! += 1
            }
        }
    }
    print(ans)
}

