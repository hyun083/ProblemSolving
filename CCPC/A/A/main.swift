//
//  main.swift
//  A
//
//  Created by Hyun on 2022/05/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let ad = readLine()!.split(separator: " ").map{Int(String($0))!}
let monster = readLine()!.split(separator: " ").map{Int(String($0))!}

let n = nm[0]
let m = nm[1]
let a = ad[0]
let d = ad[1]==1
let row = n%2==0

if row{
    if d{
        if (monster[0]==0 && monster[1]<a) || (monster[0]==n && monster[1]<m){
            print("YES!")
        }else{
            print("NO...")
        }
    }else{
        if monster[0]==0 && monster[1]>a{
            print("YES!")
        }else{
            print("NO...")
        }
    }
}else{
    if d{
        if monster[0]==0 && monster[1]<a{
            print("YES!")
        }else{
            print("NO...")
        }
    }else{
        if (monster[0]==0 && monster[1]>a) || (monster[0]==n && monster[1]<m){
            print("YES!")
        }else{
            print("NO...")
        }
    }
}
