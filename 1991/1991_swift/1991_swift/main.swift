//
//  main.swift
//  1991_swift
//
//  Created by Hyun on 2022/01/06.
//

import Foundation

let N = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: N)
var ans = ""

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Character(String($0)).asciiValue!}
    let parent = input[0] - 65
    for i in 1..<3{
        tree[Int(parent)].append(Int(input[i])-65)
    }
}
var visited = Array(repeating: false, count: N)

func preorder(from node:Int){
    ans += String(Character(UnicodeScalar(node+65)!))
    for i in 0..<2{
        let next = tree[node][i]
        if next >= 0 {
            preorder(from: next)
        }
    }
}
func inorder(from node:Int){
    for i in 0..<2{
        let next = tree[node][i]
        if next >= 0{
            inorder(from: next)
        }
        if i == 0{
            ans += String(Character(UnicodeScalar(node+65)!))
        }
    }
}
func postorder(from node:Int){
    for i in 0..<2{
        let next = tree[node][i]
        if next >= 0{
            postorder(from: next)
        }
    }
    ans += String(Character(UnicodeScalar(node+65)!))
}

preorder(from: 0)
ans += "\n"
inorder(from: 0)
ans += "\n"
postorder(from: 0)
ans += "\n"
print(ans)
