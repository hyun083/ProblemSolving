//
//  main.swift
//  12033_swift
//
//  Created by Hyun on 2022/07/23.
//

import Foundation

for T in 1...Int(readLine()!)!{
    let n = Int(readLine()!)!
    var ans = [String]()
    let price = readLine()!.split(separator: " ").map{Int(String($0))!}
    var visited = Array(repeating: false, count: n*2)
    
    func btk(cnt: Int){
        if cnt == n*2{
            return
        }
        if visited[cnt]{
            btk(cnt: cnt+1)
        }else{
            for i in cnt..<n*2{
                if !visited[i]{
                    if Int(Double(price[i])*0.75) == price[cnt]{
                        visited[i] = true
                        visited[cnt] = true
                        ans.append(String(price[cnt]))
                        break
                    }
                }
            }
            btk(cnt: cnt+1)
        }
    }
    btk(cnt: 0)
    print("Case #\(T): \(ans.joined(separator: " "))")
}

