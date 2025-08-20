import Foundation

let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]
var count = 1

while count <= min(A,B){
    if A % count == 0 && B % count == 0{
        print(count,A/count,B/count)
    }
    count += 1
}