//
//  main.swift
//  3980_swift
//
//  Created by Hyun on 2022/07/22.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    var players = Array(repeating: [Int](), count: 11)
    var visited = Array(repeating: false, count: 11)
    var ans = 0
    
    for i in 0..<11{
        players[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    
    func btk(cnt:Int, sum:Int){
        if cnt == 11{
            ans = max(ans, sum)
            return
        }
        for i in 0..<11{
            if !visited[i] && players[cnt][i] != 0{
                visited[i] = true
                btk(cnt: cnt+1, sum: sum+players[cnt][i])
                visited[i] = false
            }
        }
    }
    btk(cnt: 0, sum: 0)
    print(ans)
}

