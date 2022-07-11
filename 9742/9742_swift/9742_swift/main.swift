//
//  main.swift
//  9742_swift
//
//  Created by Hyun on 2022/03/27.
//

import Foundation

while let line = readLine(){
    let input = line.split(separator: " ").map{String($0)}
    let arr = input[0].map{String($0)}.sorted(by: <)
    let idx = Int(input[1])!-1
    var visited = Array(repeating: false, count: arr.count)
    var result = [String]()
    var ans = [String]()
    
    func btk(cnt:Int){
        if result.count==arr.count{
            ans.append(result.joined())
            return
        }
        for i in 0..<arr.count{
            if !visited[i]{
                visited[i] = true
                result.append(arr[i])
                btk(cnt: cnt+1)
                visited[i] = false
                result.removeLast()
            }
        }
    }
    for i in 0..<arr.count{
        visited[i] = true
        result.append(arr[i])
        btk(cnt: 0)
        visited[i] = false
        result.removeLast()
    }
    if ans.count < idx{
        print(input[0],input[1],"=","No permutation")
    }else{
        print(input[0],input[1],"=",ans[idx])
    }
}

