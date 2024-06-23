import Foundation

let (H,W) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let N = Int(readLine()!)!
var arr = [(r:Int, c:Int)]()

for _ in 0..<N{
    let (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((R,C))
}
arr.sort(by: {$0.r*$0.c > $1.r*$1.c})

func place(a:(r:Int, c:Int), b:(r:Int, c:Int)) -> Int{
    var res = 0
    
    if H-a.r>=0 && W-a.c>=0{    //정방향
        let nr = H-a.r
        let nc = W-a.c
        if (nr>=b.r && W>=b.c) || (nr>=b.c && W>=b.r) || (H>=b.r && nc>=b.c) || (H>=b.c && nc>=b.r){
            res = max(res, (a.r*a.c) + (b.r*b.c))
        }
    }
    
    if H-a.c>=0 && W-a.r>=0{  //90도
        let nr = H-a.c
        let nc = W-a.r
        if (nr>=b.r && W>=b.c) || (nr>=b.c && W>=b.r) || (H>=b.r && nc>=b.c) || (H>=b.c && nc>=b.r){
            res = max(res, (a.r*a.c) + (b.r*b.c))
        }
    }
    
    return res
}

var ans = 0
for i in 0..<N-1{
    for k in i+1..<N{
        ans = max(ans,place(a: arr[i], b: arr[k]))
    }
}
print(ans)