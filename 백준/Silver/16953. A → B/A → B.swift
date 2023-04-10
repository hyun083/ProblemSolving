import Foundation

let AB = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = AB[0]
let B = AB[1]
var ans = 10000

func dfs(num:Int, cnt:Int){
    if num > B{
        return
    }
    if num==B{
        ans = min(ans, cnt)
    }
    dfs(num: num*2, cnt: cnt+1)
    dfs(num: num*10+1, cnt: cnt+1)
}

dfs(num: A, cnt: 1)
if ans == 10000{
    print(-1)
}else{
    print(ans)
}