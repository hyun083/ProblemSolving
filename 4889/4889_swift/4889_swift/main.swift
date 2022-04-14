//
//  main.swift
//  4889_swift
//
//  Created by Hyun on 2022/04/14.
//

import Foundation
var cnt = 0
while let line = readLine(){
    cnt += 1
    if line.contains("-"){
        break
    }
    var stack = ""
    for input in line{
        if !stack.isEmpty && stack.last! == "{" && input == "}"{
            stack.removeLast()
            continue
        }
        stack.append(input)
    }
    var temp = ""
    var result = 0
    for s in stack{
        temp.append(s)
        if temp == "{{" || temp == "}}"{
            result += 1
            temp = ""
        }else if temp == "}{"{
            result += 2
            temp = ""
        }
    }
    print("\(cnt). \(result)")
}

