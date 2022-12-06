//
//  main.swift
//  15683_swift
//
//  Created by Hyun on 2022/11/08.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating: "0", count: m), count: n)
var ans = 0
var total = 0

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{String($0)}
    for k in 0..<m{
        map[i][k] = line[k]
        if map[i][k] == "0" {
            total += 1
        }
    }
}

func btk(x:Int, y:Int, cnt:Int){
    if x==n-1 && y==m-1{
        ans = max(ans, total-cnt)
        return
    }
    var cnt = cnt
    if map[x][y]=="0" || map[x][y]=="6" || map[x][y]=="#"{
        if y+1<m{
            btk(x: x, y: y+1, cnt: cnt)
        }else{
            btk(x: x+1, y: 0, cnt: cnt)
        }
    }
    if map[x][y]=="1"{
        let origin = map
        var temp = map
        var tempCnt = 0
        for k in y+1..<m{
            if temp[x][k] == "6"{ break }
            if temp[x][k] == "0"{
                temp[x][k] = "#"
                tempCnt += 1
            }
        }
        map = temp
        if y+1<m{
            btk(x: x, y: y+1, cnt: cnt+tempCnt)
        }else{
            btk(x: x+1, y: 0, cnt: cnt+tempCnt)
        }
        map = origin
        temp = origin
        for i in x+1..<n{
            if temp[i][y] == "6"{ break }
            if temp[i][y] == "0"{
                temp[i][y] = "#"
                tempCnt += 1
            }
        }
        map = temp
        if y+1<m{
            btk(x: x, y: y+1, cnt: cnt+tempCnt)
        }else{
            btk(x: x+1, y: 0, cnt: cnt+tempCnt)
        }
    }
}

btk(x: 0, y: 0, cnt: 0)
