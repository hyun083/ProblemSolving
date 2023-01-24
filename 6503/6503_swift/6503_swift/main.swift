//
//  main.swift
//  6503_swift
//
//  Created by Hyun on 2023/01/24.
//

import Foundation

var output = ""
while let line = readLine(){
    if line == "0"{
        break
    }
    let n = Int(line)!
    let arr = readLine()!.map{String($0)}
    
    var head = 0
    var tail = 0
    var ans = 0
    
    var dic = Dictionary<String,Int>()
    
    while tail<arr.count{
        let str = arr[tail]
        if dic.count >= n{
            if dic[str] == nil{
                if dic[arr[head]]! == 1{
                    dic.removeValue(forKey: arr[head])
                }else{
                    dic[arr[head]]! -= 1
                }
                head += 1
            }else{
                dic[str]! += 1
                tail += 1
            }
        }else{
            if dic[str] == nil{
                dic[str] = 1
            }else{
                dic[str]! += 1
            }
            tail += 1
        }
        if dic.count <= n{
            ans = max(ans, tail - head)
        }
    }
    output += "\(ans)\n"
}
print(output)
