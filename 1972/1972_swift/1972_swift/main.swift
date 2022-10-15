//
//  main.swift
//  1972_swift
//
//  Created by Hyun on 2022/10/15.
//

import Foundation

while let input = readLine(){
    if input == "*"{ break }
    let input = input.map{String($0)}
    let n = input.count
    var flag = true
    if n>1{
        for D in 1...n-1{
            var s = Set<String>()
            for i in 0..<n-D{
                let pair = input[i]+input[i+D]
                if !s.contains(pair){
                    s.insert(pair)
                }else{
                    flag = false
                }
            }
        }
    }
    if flag{
        print(input.joined(),"is surprising.")
    }else{
        print(input.joined(),"is NOT surprising.")
    }
}

