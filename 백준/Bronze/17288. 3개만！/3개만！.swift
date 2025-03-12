import Foundation

let S = readLine()!.map{String($0)}.map{Int($0)!}
var ans = 0
var tmp = 1
for i in 1..<S.count {
    if S[i-1] + 1 == S[i]{
        tmp += 1
    }else if tmp == 3{
        ans += 1
        tmp = 1
    }else{
        tmp = 1
    }
}
if tmp == 3{
    ans += 1
}
print(ans)