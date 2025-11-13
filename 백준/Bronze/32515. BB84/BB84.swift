import Foundation

let N = Int(readLine()!)!
var arr1 = readLine()!.map{String($0)}
let key1 = readLine()!.map{String($0)}

var arr2 = readLine()!.map{String($0)}
let key2 = readLine()!.map{String($0)}
var ans = ""
for i in 0..<N{
    if arr1[i] == arr2[i]{
        if key1[i] == key2[i]{
            ans.append(key1[i])
        }else{
            ans = "htg!"
            break
        }
    }else{
        continue
    }
}
print(ans)