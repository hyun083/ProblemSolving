import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{String($0)}
var ans = [String]()
for i in 0..<N{
    if arr[i]=="?" && arr[N-1-i]=="?"{
        ans.append("a")
    }else if arr[i]=="?"{
        ans.append(arr[N-1-i])
    }else{
        ans.append(arr[i])
    }
}
print(ans.joined())