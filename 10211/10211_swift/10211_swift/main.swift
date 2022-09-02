//
//  main.swift
//  10211_swift
//
//  Created by Hyun on 2022/05/11.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let n = Int(readLine()!)!
    var temp = 0
    var ans = Int.min
    let psum = [0] + readLine()!.split(separator: " ").map{num in
        temp += Int(num)!
        ans = max(ans, Int(num)!)
        return temp
    }
    
    for i in 1..<n{
        for k in i+1...n{
            ans = max(ans, psum[k]-psum[i-1])
        }
    }
    print(ans)
}


