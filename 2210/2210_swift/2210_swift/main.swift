//
//  main.swift
//  2210_swift
//
//  Created by Hyun on 2022/09/11.
//

import Foundation

var map = Array(repeating: [String](), count: 5)
for i in 0..<5{
    map[i] = readLine()!.split(separator: " ").map{String($0)}
}
var ans = Set<String>()
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func dfs(x:Int,y:Int,cnt:Int,str:String){
    if cnt==6{
        ans.insert(str)
        return
    }
    for i in 0..<4{
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx<0 || nx>=5 || ny<0 || ny>=5 {continue}
        dfs(x: nx, y: ny, cnt: cnt+1, str: str+map[nx][ny])
    }
}
for i in 0..<5{
    for k in 0..<5{
        dfs(x: i, y: k, cnt: 0, str: "")
    }
}
print(ans.count)
