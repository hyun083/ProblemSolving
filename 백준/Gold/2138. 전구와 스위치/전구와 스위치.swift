import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{Int(String($0))!}
var target = readLine()!.map{Int(String($0))!}

var curr = arr
var ans = -1
var cnt = 0

for i in 1..<N{
    if curr[i-1]==target[i-1]{ continue }
    curr[i-1]+=1; curr[i-1]%=2
    curr[i]+=1; curr[i]%=2
    if i+1<N { curr[i+1]+=1; curr[i+1]%=2 }
    cnt += 1
}

if curr == target { ans = cnt }
curr = arr
cnt = 1

curr[0]+=1; curr[0]%=2
curr[1]+=1; curr[1]%=2
for i in 1..<N{
    if curr[i-1]==target[i-1]{ continue }
    curr[i-1]+=1; curr[i-1]%=2
    curr[i]+=1; curr[i]%=2
    if i+1<N { curr[i+1]+=1; curr[i+1]%=2 }
    cnt += 1
}

if curr==target{
    ans = ans<0 ? cnt:min(ans,cnt)
}
print(ans)