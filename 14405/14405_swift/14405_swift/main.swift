//
//  main.swift
//  14405_swift
//
//  Created by Hyun on 2021/12/19.
//

import Foundation

let input = readLine()!

func pikachu(str:String){
    if str == ""{
        print("NO")
        return
    }
    var ans = ""
    for char in str{
        ans += String(char)
        if char == "i"{
            if ans == "pi"{
                ans = ""
            }else{
                print("NO")
                return
            }
        }
        if char == "a"{
            if ans == "ka"{
                ans = ""
            }else{
                print("NO")
                return
            }
        }
        if char == "u"{
            if ans == "chu"{
                ans = ""
            }else{
                print("NO")
                return
            }
        }
    }
    if ans.count == 0{
        print("YES")
    }else{
        print("NO")
    }
    return
}
pikachu(str: input)
