import Foundation

let N = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map{Int($0)!}
let INF = 1000001
var one = num.min()!
var two = INF*2
var three = INF*3

for i in 0..<6{
    for k in 0..<6{
        if i+k==5 || i==k{ continue }
        two = min(two, num[i]+num[k])
    }
}

for i in 0..<6{
    for k in 0..<6{
        for p in 0..<6{
            if i+k==5 || i+p==5 || k+p==5 || i==k || k==p || i==p{
                continue
            }
            three = min(three,num[i]+num[k]+num[p])
        }
    }
}

let top = (three*4) + (two*(N-2)*4) + (one*(N-2)*(N-2))
let body = (two*(N-1)*4) + (one*(N-1)*(N-2)*4)

if N==1{
    print(num.reduce(0, +)-num.max()!)
}else{
    print(top+body)
}