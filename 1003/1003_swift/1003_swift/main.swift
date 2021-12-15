//
//  main.swift
//  1003_swift
//
//  Created by Hyun on 2021/12/15.
//

import Foundation

var ans = [[1,0],[0,1]]
for i in 2...40{
    ans.append([ans[i-1][0] + ans[i-2][0], ans[i-1][1]+ans[i-2][1]])
}

let T = Int(readLine()!)!

for _ in 1...T{
    let n = Int(readLine()!)!
    for a in ans[n]{
        print(a,terminator: " ")
    }
    print()
}

