//
//  main.swift
//  2504_swift
//
//  Created by Hyun on 2022/07/28.
//

import Foundation

let arr = readLine()!.map{String($0)}
var stack = [String]()
var ans = 0

for str in arr{
    if str == "(" || str == "["{
        stack.append(str)
    }
    if str == ")"{
        if let top = stack.last{
            if top == "("{
                stack.removeLast()
                if stack.isEmpty{
                    ans += 2
                }else if stack.last! == ""{
                    
                }
            }
        }else{
            stack.append(str)
        }
    }
    if str == "]"{
        
    }
}

