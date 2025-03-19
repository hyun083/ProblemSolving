import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let friends = Set(readLine()!.split(separator: " ").map{Int($0)!})
var ans = 0
for i in 0..<M{
    let num = arr[i]
    if !friends.contains(num){
        ans += 1
    }
}
print(ans)