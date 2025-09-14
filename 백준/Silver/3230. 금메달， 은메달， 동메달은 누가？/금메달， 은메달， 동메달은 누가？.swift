import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var arr = [Int]()
var ans = [Int]()

for num in 1...N{
    let rank = Int(readLine()!)!-1
    if rank >= arr.count{
        arr.append(num)
    }else{
        arr.insert(num, at: rank)
    }
}

arr = Array(arr[0..<M]).reversed()

for i in 0..<M{
    let rank = Int(readLine()!)!-1
    if rank >= ans.count{
        ans.append(arr[i])
    }else{
        ans.insert(arr[i], at: rank)
    }
}

for i in 0..<3{
    print(ans[i])
}