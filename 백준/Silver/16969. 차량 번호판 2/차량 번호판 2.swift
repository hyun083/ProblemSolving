import Foundation

let line = readLine()!.map{String($0)}
var ans = 1

for i in 0..<line.count{
    let curr = line[i]
    let pre = i>0 ? line[i-1]:" "
    
    if curr == "d"{
        ans *= pre==curr ? 9:10
    }else{
        ans *= pre==curr ? 25:26
    }
    ans %= 1000000009
}
print(ans)