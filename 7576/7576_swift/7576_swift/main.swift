//
//  main.swift
//  7576_swift
//
//  Created by Hyun on 2021/11/27.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inputs[1]
let M = inputs[0]

var map = Array(repeating: Array(repeating: -1, count: M), count: N)

var eq =  [[Int]]()
var dq = [[Int]]()
var cnt0 = 0
var cnt1 = 0
var cntm = 0
for n in 0..<N{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    for m in 0..<M{
        if(inputs[m] == 1){eq.append([n,m]); cnt1+=1}
        else if(inputs[m] == 0){cnt0+=1}
        else{ cntm+=1; continue}
        map[n][m] = inputs[m]
    }
}

let nx = [1,-1,0,0]
let ny = [0,0,-1,1]
func bfs() -> Int{
    var cnt = 0
    while(!eq.isEmpty){
        cnt += 1
        dq = eq.reversed()
        eq.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for i in 0...3{
                let X = curr[0] + nx[i]
                let Y = curr[1] + ny[i]
                
                if(X<0 || Y<0 || X>=N || Y>=M){ continue }
                if(map[X][Y]==0){
                    map[X][Y] = 1
                    cnt0 -= 1
                    eq.append([X,Y])
                }
                
            }
        }
    }
    if(cnt0 == 0){
        return cnt-1
    }else{
        return -1
    }
}

if(cnt1 == N*M-cntm){
    print("0")
}else{
    print(bfs())
}


