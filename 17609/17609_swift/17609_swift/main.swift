//
//  main.swift
//  17609_swift
//
//  Created by Hyun on 2022/04/24.
//

//import Foundation
func palindrome(left:Int, right:Int, cnt:Int, line:[String]) -> Int{
    var left = left
    var right = right
    while left < right{
        if line[left] == line[right]{
            left += 1
            right -= 1
            continue
        }else{
            if cnt == 0{
                if palindrome(left: left+1, right: right, cnt: 1, line: line)==0 || palindrome(left: left, right: right-1, cnt: 1, line: line)==0{
                    return 1
                }else{
                    return 2
                }
            }else{
                return 2
            }
        }
    }
    return 0
}
for _ in 0..<Int(readLine()!)!{
    let line = readLine()!.map{String($0)}
    print(palindrome(left: 0, right: line.count-1, cnt: 0, line: line))
}
