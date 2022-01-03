//
//  main.swift
//  2407_swift
//
//  Created by Hyun on 2021/12/18.
//

import Foundation
//
//let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
//var N = NM[0]
//var R = NM[1]
//var dp = Array(repeating: Array(repeating: "", count: 101), count: 101)
//
//func stringAdd(numb1:String, numb2:String)->String{
//    var total = [String]()
//    var carry = "0"
//
//    var num1 = numb1
//    var num2 = numb2
//
//    while(!num1.isEmpty && !num2.isEmpty && carry == "0"){
//        if num1.isEmpty{
//            let num = Int(String(num2.removeLast()))! + Int(carry)!
//            total.append(String(num%10))
//            carry = String(num/10)
//            continue
//        }
//        if num2.isEmpty{
//            let num = Int(String(num1.removeLast()))! + Int(carry)!
//            total.append(String(num%10))
//            carry = String(num/10)
//            continue
//        }
//        let num = Int(String(num1.removeLast()))! + Int(String(num2.removeLast()))! + Int(carry)!
//        total.append(String(num%10))
//        carry = String(num/10)
//    }
//
//    return total.reversed().joined()
//}
//
//func combination(n:Int, m:Int) -> String{
//    if n==m || m==0{
//        dp[n][m] = "1"
//        return dp[n][m]
//    }else if dp[n][m] != ""{
//        return dp[n][m]
//    }else{
//        dp[n][m] = stringAdd(numb1: combination(n: n-1, m: m-1), numb2: combination(n: n-1, m: m))
//        return dp[n][m]
//    }
//}
//print(combination(n: N, m: R))
//print(dp)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
let limit: UInt64 = 1000000000000000000
var left = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)
var right = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)

right[1][0] = 1
right[1][1] = 1

for i in 2...n {
    right[i][0] = 1
    right[i][i] = 1

    for j in 1..<i {
        right[i][j] = right[i - 1][j - 1] + right[i - 1][j]
        left[i][j] = left[i - 1][j - 1] + left[i - 1][j]

        if right[i][j] >= limit {
            right[i][j] -= limit
            left[i][j] += 1
        }
    }
}

if left[n][m] > 0 {
    print("\(left[n][m])" + "\(right[n][m])")
} else {
    print(right[n][m])
}
