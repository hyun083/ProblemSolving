//
//  main.swift
//  2294_swift
//
//  Created by Hyun on 2022/09/17.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
var k = nk[1]
var cnt = 0
var ans = Int.max
var numbers = Array(repeating: false, count: 100001)

for _ in 0..<n{
    let number = Int(readLine()!)!
    numbers[number] = true
    if k%number==0{
        ans = min(ans, k/number)
    }
}

for coin in stride(from: 100000, through: 0, by: -1){
    if numbers[coin] && coin<=k{
        cnt += k/coin
        k %= coin
    }
}
if k==0{
    ans = min(ans, cnt)
}
if ans==Int.max{
    print(-1)
}else{
    print(ans)
}
