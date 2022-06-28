//
//  main.swift
//  3613_swift
//
//  Created by Hyun on 2022/06/28.
//

import Foundation

let S = readLine()!
var cFlag = false
var javaFlag = false
var flag = false
var ans = ""
for i in 0..<S.count{
    let idx = S.index(S.startIndex, offsetBy: i)
    if i==0 && Int(String(S[idx].asciiValue!))! >= 65 && Int(String(S[idx].asciiValue!))! <= 90{
        flag = true
        break
    }
    if Int(String(S[idx].asciiValue!))! >= 65 && Int(String(S[idx].asciiValue!))! <= 90{
        javaFlag = true
        ans.append("_\(S[idx].lowercased())")
        continue
    }
    if Int(String(S[idx].asciiValue!))! == 95{
        cFlag = true
        if (javaFlag&&cFlag) || cFlag{
            flag = true
            break
        }
        continue
    }
    if cFlag{
        cFlag = false
        ans.append(S[idx].uppercased())
        continue
    }
    ans.append(S[idx])
}
if flag||cFlag{
    print("Error!")
}else{
    print(ans)
}
