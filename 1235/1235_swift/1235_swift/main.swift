//
//  main.swift
//  1235_swift
//
//  Created by Hyun on 2022/07/24.
//

import Foundation

var numbers = [[String]]()
var N = Int(readLine()!)!
for _ in 0..<N{
    numbers.append(readLine()!.map{String($0)})
}
let n = numbers[0].count
var ans = n-1
var flag = false

while !flag{
    var check = [String:Bool]()
    var flag2 = true
    
    for i in 0..<N{
        if check[numbers[i][ans..<n].joined()] == nil{
            check[numbers[i][ans..<n].joined()] = true
        }else{
            flag2 = false
            break
        }
    }
    if !flag2{
        ans -= 1
    }
    flag = flag2
}
print(n-ans)
