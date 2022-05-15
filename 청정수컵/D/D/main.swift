//
//  main.swift
//  D
//
//  Created by Hyun on 2022/05/15.
//

import Foundation

let n = Int(readLine()!)!
let word1 = readLine()!.map{String($0)}
var check1 = [String:Int]()
let word2 = readLine()!.map{String($0)}
var check2 = [String:Int]()

for w in word1{
    if check1[w] == nil{
        check1[w] = 1
    }else{
        check1[w]! += 1
    }
}
for w in word2{
    if check2[w] == nil{
        check2[w] = 1
    }else{
        check2[w]! += 1
    }
}

var flag = true
if check1 != check2{
    flag = false
    
}
if word1.first! != word2.first || word1.last! != word2.last!{
    flag = false
    
}

var temp1 = [String]()
var temp2 = [String]()
for i in 0..<n{
    if word1[i] == "a" || word1[i] == "e" || word1[i] == "i" || word1[i] == "o" || word1[i] == "u" {
        
    }else{
        temp1.append(word1[i])
    }
    
    if word2[i] == "a" || word2[i] == "e" || word2[i] == "i" || word2[i] == "o" || word2[i] == "u" {
        
    }else{
        temp2.append(word2[i])
    }
}
if temp1.joined() != temp2.joined(){
    flag = false
}
if flag{
    print("YES")
}else{
    print("NO")
}
