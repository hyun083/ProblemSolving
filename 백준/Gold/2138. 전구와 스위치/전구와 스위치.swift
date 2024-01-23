import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{Int(String($0))!}
var target = readLine()!.map{Int(String($0))!}

var curr = arr
var ans = N+1
var cnt = 0

func toggle(_ num:Int){
    let dx = [-1,0,1]
    
    for i in 0..<3{
        let nx = num+dx[i]
        if nx<0 || nx>=N { continue }
        curr[nx] += 1
        curr[nx] %= 2
    }
    cnt += 1
}

for i in 1..<N{
    if curr[i-1]==target[i-1]{ continue }
    toggle(i)
}
ans = curr==target ? cnt:ans

curr = arr
cnt = 0
toggle(0)
for i in 1..<N{
    if curr[i-1]==target[i-1]{ continue }
    toggle(i)
}
ans = curr==target ? min(ans,cnt):ans
print(ans==N+1 ? -1:ans)