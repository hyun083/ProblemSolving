import Foundation

let LR = readLine()!.split(separator: " ").map{Int($0)!}
let L = LR[0]
let R = LR[1]

if L+R == 0{
    print("Not a moose")
}else{
    print(L==R ? "Even \(L+R)":"Odd \(max(L,R)*2)")
}