import Foundation

var ans = -1
var x = -1
var y = -1

for i in 0..<9{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<9{
        if num[k] > ans{
            ans = num[k]
            x = i+1
            y = k+1
        }
    }
}
print(ans)
print(x,y)