//
//  main.swift
//  1343_swift
//
//  Created by Hyun on 2022/10/17.
//

import Foundation

let input = readLine()!.map{String($0)}
var arr = [""]+Array(repeating: "", count: 50)
let poliomino = ["BB","AAAA"]
var ans = ""

var cnt = 0
for str in input{
    if str == "X"{
        cnt+=1
    }else if str == "."{
        if cnt%2==0{
            for _ in 0..<cnt/4{
                ans += "AAAA"
            }
            if cnt%4==2{
                ans += "BB"
            }
        }else{
            cnt = 0
            ans = "-1"
            break
        }
        cnt = 0
        ans += "."
    }
}
if cnt > 0{
    if cnt%2==0{
        for _ in 0..<cnt/4{
            ans += "AAAA"
        }
        if cnt%4==2{
            ans += "BB"
        }
    }else{
        ans = "-1"
    }
}
print(ans)
