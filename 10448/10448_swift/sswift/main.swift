//
//  main.swift
//  sswift
//
//  Created by Hyun on 2021/11/03.
//

import Foundation

func main() -> Int{
    let T = Int(readLine()!)!

    var arr = [Int]()
    arr.append(1)

    var add = 2

    while(arr.last! < 1000){
        arr.append(arr.last! + add)
        add += 1
    }
    arr.removeLast()
    
    for _ in 1...T{
        var flag = true
        let K = Int(readLine()!)!
        
        for i in arr.indices{
            if flag{
                for k in arr.indices{
                    if flag{
                        for p in arr.indices{
                            if(arr[i] + arr[k] + arr[p] == K){
                                flag = !flag
                                break
                            }
                        }
                    }else{
                        break
                    }
                }
            }else{
                break
            }
        }
        if flag{
            print(0)
        }else{
            print(1)
        }
    }
    return 0
}
main()
