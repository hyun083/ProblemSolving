//
//  main.swift
//  19942_swift
//
//  Created by Hyun on 2022/05/06.
//

import Foundation

//struct Food:Comparable,Sequence{
//    static func < (lhs: Food, rhs: Food) -> Bool {
//        return lhs.protein<rhs.protein && lhs.vitamin<rhs.vitamin && lhs.carbohydrate<rhs.carbohydrate && lhs.fat<rhs.fat
//    }
//    static func <= (lhs: Food, rhs: Food) -> Bool {
//        return lhs.protein<=rhs.protein && lhs.vitamin<=rhs.vitamin && lhs.carbohydrate<=rhs.carbohydrate && lhs.fat<=rhs.fat
//    }
//
//    let protein:Int
//    let fat:Int
//    let carbohydrate:Int
//    let vitamin:Int
//    init(p:Int, f:Int, c:Int, v:Int){
//        protein=p
//        fat=f
//        carbohydrate=c
//        vitamin=v
//    }
//}

let n = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map{Int(String($0))!}
var foods = [[Int]]()
var prices = [Int]()

var price = 0
var temp = [0,0,0,0]

for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let food = [line[0],line[1],line[2],line[3]]
    prices.append(line[4])
    foods.append(food)
}

func dfs(idx:Int){
    if idx == n-1{
        return
    }
    
}
for i in 0..<n{
    
}
