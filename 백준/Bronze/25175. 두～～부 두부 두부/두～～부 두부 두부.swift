import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0]
var iter = line[1] - 1
let move = line[2] - 3
let arr = [Int](1...n)

if move > 0 {
    for _ in 0..<move{
        iter += 1
        if iter >= n{
            iter = 0
        }
    }
}else{
    for _ in move..<0{
        iter -= 1
        if iter < 0{
            iter = n-1
        }
    }
}
print(arr[iter])