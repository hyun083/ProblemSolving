import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
var A = info[0]
let B = info[1]
let N = info[2]
let cnt = String(B).count
var tmp = 1

var arr = [Int]()
var remain = A%B
for _ in 0..<N{
    if remain==0{
        arr.append(0)
        break
    }else{
        remain *= 10
        arr.append(remain/B)
        remain %= B
    }
}
print(arr.last!)