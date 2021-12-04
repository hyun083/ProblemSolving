//
//  main.swift
//  1759_swift
//
//  Created by Hyun on 2021/12/04.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let L = inputs[0]
let C = inputs[1]
var arr = readLine()!.split(separator: " ").map{String($0)}
arr.sort(by: <)
var pwd = [String](repeating: "", count: 16)


func backTracking(pos:Int, prev:Int, consonant:Int, vowel:Int){
    if pos == L{
        if consonant >= 2 && vowel >= 1 {
            for p in pwd{
                print(p,terminator: "")
            }
            print()
        }
        return
    }
    
    for i in prev+1..<C{
        pwd[pos] = arr[i]
        if arr[i] == "a" || arr[i] == "e" || arr[i] == "i" || arr[i] == "o" || arr[i] == "u"{
            backTracking(pos: pos+1, prev: i, consonant: consonant, vowel: vowel + 1)
        }else{
            backTracking(pos: pos+1, prev: i, consonant: consonant + 1, vowel: vowel)
        }
    }
}

backTracking(pos: 0, prev: -1, consonant: 0, vowel: 0)
