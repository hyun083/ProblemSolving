import Foundation

let str = readLine()!.map{String($0)}
let n = str.count
var ans = Set<String>()

var temp = ""
for i in 0..<n{
    for k in i..<n{
        temp += str[k]
        ans.insert(temp)
    }
    temp = ""
}
print(ans.count)