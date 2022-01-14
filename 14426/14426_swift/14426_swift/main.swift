//
//  main.swift
//  14426_swift
//
//  Created by Hyun on 2022/01/13.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
var S = [String]()

for _ in 1...NM[0]{
    S.append(readLine()!)
}

var ans = 0
for _ in 1...NM[1]{
    let M = readLine()!
    for s in S{
        if s.starts(with: M){
            ans += 1
            break
        }
    }
}
print(ans)
