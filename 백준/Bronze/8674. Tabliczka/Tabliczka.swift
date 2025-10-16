import Foundation

let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]

if A%2==1 && B%2==1{
    print(min(A,B))
}else{
    print(0)
}