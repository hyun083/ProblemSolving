import Foundation

let (N,M,D) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var map = [[Int]]()
var ans = 0

for _ in 0..<N{
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

func makeSoldier() -> [[(x:Int,y:Int)]]{
    var res = [[(x:Int, y:Int)]]()
    
    for i in 0..<M-2{
        for k in i+1..<M-1{
            for p in k+1..<M{
                res.append([(N,i),(N,k),(N,p)])
            }
        }
    }
                            
    return res
}

func target(x:Int, y:Int, d:Int, mp:[[Int]]) -> (x:Int, y:Int){
    var res = [(x:Int,y:Int,d:Int)]()
    
    for nx in (x-d..<x).reversed(){
        for ny in (y-d..<y).reversed(){
            if nx<0 || ny<0 || ny>=M{ continue }
            if abs(x-nx) + abs(y-ny) > d { continue }
            if mp[nx][ny]==1{
                res.append((nx,ny,abs(x-nx) + abs(y-ny)))
            }
        }
        for ny in y..<y+d{
            if nx<0 || ny<0 || ny>=M{ continue }
            if abs(x-nx) + abs(y-ny) > d { continue }
            if mp[nx][ny]==1{
                res.append((nx,ny,abs(x-nx) + abs(y-ny)))
            }
        }
    }
    res.sort(by: {$0.d==$1.d ? $0.y<$1.y:$0.d<$1.d})
    if res.isEmpty{
        return (-1,-1)
    }else{
        return (res[0].x,res[0].y)
    }
}

var S = makeSoldier()

while !S.isEmpty{
    var s = S.removeLast()
    var m = map
    var cnt = 0
    
    for _ in 0..<N{
        var res = Set<[Int]>()
        
        for i in 0..<3{
            let T = target(x: s[i].x, y: s[i].y, d: D, mp: m)
            res.insert([T.x,T.y])
            s[i].x -= 1
        }
        
        for t in res{
            if t == [-1,-1] { continue }
            m[t[0]][t[1]] = 0
            cnt += 1
        }
    }
    ans = max(ans, cnt)
}
print(ans)