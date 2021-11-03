//
//  main.swift
//  sswift
//
//  Created by Hyun on 2021/11/02.
//

import Foundation

func main() -> Int{
    var inputs = Array<Int>()
    for _ in 1...9{
        inputs.append(Int(readLine()!)!)
    }

    for i in inputs.indices{
        for k in inputs.indices{
            if(k == i){
                continue
            }
            var result = 0
            var outputs = [Int]()
            for index in inputs.indices{
                if index != i && index != k{
                    result += inputs[index]
                    outputs.append(inputs[index])
                }
            }
            if result == 100{
                outputs.sort()
                for output in outputs {
                    print(output)
                }
                return 0
            }
        }
    }
    return 0
}

main()
