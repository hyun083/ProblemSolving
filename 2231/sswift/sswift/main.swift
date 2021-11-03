//
//  main.swift
//  sswift
//
//  Created by Hyun on 2021/11/02.
//

import Foundation

func main() -> Int{
    let N = Int(readLine()!)!
    for number in 1...N{
        var total = number
        
        for n in String(number){
            total += Int(String(n))!
        }
        
        if total == N {
            print(number)
            return 0
        }
        if number > N {
            print(0)
            return 0
        }
    }
    print(0)
    return 0
}
main()
