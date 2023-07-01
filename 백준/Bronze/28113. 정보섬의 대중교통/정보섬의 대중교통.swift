import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}

let N = info[0]
let A = info[1]
let B = info[2]

if N <= B{
    if A < B{
        print("Bus")
    }else if A==B{
        print("Anything")
    }else{
        print("Subway")
    }
}else{
    print("Bus")
}