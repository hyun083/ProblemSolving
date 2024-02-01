import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr:[Int] = readLine()!.map{Int(String($0))!}.reversed()
var stk = [Int]()
var cnt = 0

while !arr.isEmpty{
    if stk.isEmpty{
        stk.append(arr.removeLast())
    }else if stk.last! < arr.last! && cnt<K{
        while !stk.isEmpty && stk.last! < arr.last! && cnt<K{
            stk.removeLast()
            cnt += 1
        }
        stk.append(arr.removeLast())
    }else{
        stk.append(arr.removeLast())
    }
}
while cnt<K{
    stk.removeLast()
    cnt += 1
}
for ans in stk{ print(ans,terminator:"") }