import Foundation
let N = Int(readLine()!)!
var ans = [String]()
var arr = Dictionary<String, Int>()
for _ in 0..<N{
    let name = readLine()!.map{String($0)}[0]
    if arr[name]==nil{
        arr[name] = 1
    }else{
        arr[name]! += 1
    }
}
for name in arr.sorted(by: {$0.key < $1.key}){
    if name.value >= 5{
        ans.append(name.key)
    }
}
print(ans.isEmpty ? "PREDAJA":ans.joined())