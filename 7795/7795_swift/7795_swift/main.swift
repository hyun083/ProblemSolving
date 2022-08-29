//
//  main.swift
//  7795_swift
//
//  Created by Hyun on 2022/08/29.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let n = nm[0]
    let m = nm[1]
    let a = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
    let b = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
    
    var cnt = 0
    var ans = 0
    var idx1 = 0
    var idx2 = 0
    while idx1<n || idx2<m{
        if a[idx1] > b[idx2]{
            cnt += 1
            idx2 += 1
            if idx2 >= m{
                ans += cnt*(n-idx1)
                break
            }
        }else{
            ans += cnt
            idx1 += 1
            if idx1 >= n{
                break
            }
        }
    }
    print(ans)
}
