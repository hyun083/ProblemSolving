//
//  main.swift
//  1010_swift
//
//  Created by Hyun on 2022/04/02.
//

//import Foundation

//for _ in 0..<Int(readLine()!)!{
//    let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let m = MN[0]
//    let n = MN[1]
//    var temp = 1
//    var f = 1
//    for i in stride(from: n, to: n-m, by: -1){
//        temp *= i
//        temp /= f
//        f += 1
//    }
//    print(temp)
//}
func solution(_ stones:[Int], _ k:Int) -> Int {
    var ans = 0
    var stones = stones
    func check() -> Bool{
        let check = Array(repeating:0, count:k)
        for i in 0...stones.count-k{
            if Array(stones[i..<i+k]) == check{return false}
        }
        return true
    }
    while check(){
        for i in 0..<stones.count{
            if stones[i] <= 0 {
                stones[i] = 0
            }else{
                stones[i] -= 1
            }
        }
        print(stones)
        ans += 1
    }
    return ans
}
print(solution([0, 0, 1, 3, 2, 1, 4, 2, 5, 1], 3))
