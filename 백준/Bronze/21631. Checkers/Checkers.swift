import Foundation

let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]

if B == 0{
    print(0)
}else{
    if A == 0{
        print(1)
    }else if A>=B-1{
        print(B)
    }else{
        print(A+1)
    }
}