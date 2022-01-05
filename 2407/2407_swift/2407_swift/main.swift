//
//  main.swift
//  2407_swift
//
//  Created by Hyun on 2021/12/18.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
var N = NM[0]
var R = NM[1]
var dp = Array(repeating: Array(repeating: "", count: 101), count: 101)

func stringAdd(numb1:String, numb2:String)->String{
    var total = [String]()
    var carry = 0

    var num1 = numb1
    var num2 = numb2

    while(!num1.isEmpty || !num2.isEmpty){
        if num1.isEmpty{
            let num = Int(String(num2.removeLast()))! + carry
            total.append(String(num%10))
            carry = num < 10 ? 0:1
            continue
        }
        if num2.isEmpty{
            let num = Int(String(num1.removeLast()))! + carry
            total.append(String(num%10))
            carry = num < 10 ? 0:1
            continue
        }
        let num = Int(String(num1.removeLast()))! + Int(String(num2.removeLast()))! + carry
        total.append(String(num%10))
        carry = num < 10 ? 0:1
    }
    
    if carry > 0{
        total.append(String(carry))
    }
    return total.reversed().joined()
}

func combination(n:Int, m:Int) -> String{
    if n==m || m==0{
        dp[n][m] = "1"
        return dp[n][m]
    }else if dp[n][m] != ""{
        return dp[n][m]
    }else{
        dp[n][m] = stringAdd(numb1: combination(n: n-1, m: m-1), numb2: combination(n: n-1, m: m))
        return dp[n][m]
    }
}
print(combination(n: N, m: R))
