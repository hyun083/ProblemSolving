import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = readLine()!.split(separator: ",").map{Int($0)!}

func makeArray(from arr:[Int]) -> [Int]{
    var res = [Int]()
    
    for i in 0..<arr.count-1{
        res.append(arr[i+1]-arr[i])
    }
    return res
}

for _ in 0..<K{
    arr = makeArray(from: arr)
}

for i in 0..<arr.count{
    print(arr[i], terminator: i==arr.count-1 ? "":",")
}