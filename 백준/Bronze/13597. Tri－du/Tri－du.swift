import Foundation

let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]

if A==B{
    print(A)
}else{
    print(max(A, B))
}