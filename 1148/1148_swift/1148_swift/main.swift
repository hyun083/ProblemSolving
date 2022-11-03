//
//  main.swift
//  1148_swift
//
//  Created by Hyun on 2022/11/03.
//
import Foundation

var dictionary = [[Int]]()

while let line = readLine(){
    if line == "-"{ break }
    
    var word = Array(repeating: -1, count: 26)
    for ch in line{
        word[Int(ch.asciiValue!)-65] += 1
    }
    
    dictionary.append(word)
}

while let line = readLine(){
    if line == "#"{ break }
    
    var puzzle = Array(repeating: -1, count: 26)
    var cnt = Array(repeating: -1, count: 26)
    for ch in line {
        puzzle[Int(ch.asciiValue!)-65] += 1
        cnt[Int(ch.asciiValue!)-65] = 0
    }
    
    for word in dictionary{
        var flag = true
        var temp = cnt
        for i in 0..<26{
            if word[i] == -1{ continue }
            if puzzle[i] >= word[i]{
                temp[i] += 1
            }else{
                flag = false
                break
            }
        }
        if flag{
            cnt = temp
        }
    }
    
    var minValue = Int.max
    var maxValue = Int.min
    var minKey = ""
    var maxKey = ""
    for i in 0..<26{
        if cnt[i] == -1{
            continue
        }
        minValue = min(minValue, cnt[i])
        maxValue = max(maxValue, cnt[i])
    }
    
    for i in 0..<26{
        if cnt[i] == minValue{
            minKey.append(String(UnicodeScalar(UInt8(i+65))))
        }else if cnt[i] == maxValue{
            maxKey.append(String(UnicodeScalar(UInt8(i+65))))
        }
    }
    
    if maxValue == minValue{
        print(minKey,minValue,minKey,minValue)
    }else{
        print(minKey,minValue,maxKey,maxValue)
    }
}
