//
//  main.swift
//  4659_swift
//
//  Created by Hyun on 2022/08/29.
//

import Foundation

while let line = readLine(){
    if line == "end"{
        break
    }
    let input = line.map{String($0)}
    var flag = true
    let n = input.count
    let mo = ["a","e","i","o","u"]
    
    if input.contains("a") || input.contains("e") || input.contains("i") || input.contains("o") || input.contains("u"){
        if n >= 2{
            for i in 0..<n-1{
                if input[i] == "e" || input[i] == "o"{
                    continue
                }
                if input[i] == input[i+1]{
                    flag = false
                    break
                }
            }
        }
        if n >= 3{
            for i in 0..<n-2{
                if (mo.contains(input[i]) && mo.contains(input[i+1]) && mo.contains(input[i+2])) || (!mo.contains(input[i]) && !mo.contains(input[i+1]) && !mo.contains(input[i+2])){
                    flag = false
                    break
                }
            }
        }
    }else{
        flag = false
    }
    
    if flag{
        print("<\(line)> is acceptable.")
    }else{
        print("<\(line)> is not acceptable.")
    }
}

