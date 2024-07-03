import Foundation

let N = Int(readLine()!)!
var arr = Dictionary<String,Int>()

for _ in 0..<N{
    let ext = readLine()!.split(separator: ".").map{String($0)}.last!
    if arr[ext] == nil{
        arr[ext] = 1
    }else{
        arr[ext]! += 1
    }
}
for ans in arr.sorted(by: {$0.key < $1.key}){
    print(ans.key, ans.value)
}