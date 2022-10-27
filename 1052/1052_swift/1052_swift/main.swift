//
//  main.swift
//  1052_swift
//
//  Created by Hyun on 2022/10/27.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = nk[0]
let k = nk[1]
if n<=k{
    print(0)
}else{
    var ans = 0
    while true{
        var cnt = 0
        var temp = n
        while temp > 0{
            if temp%2==0{
                temp /= 2
            }else{
                temp /= 2
                cnt += 1
            }
        }
        if cnt <= k { break }
        ans += 1
        n += 1
    }
    print(ans)
}
