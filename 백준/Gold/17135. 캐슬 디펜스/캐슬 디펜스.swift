import Foundation

let (N,M,D) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var map = [[Int]]()
var ans = 0

for _ in 0..<N{
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

var S = [[(x:Int, y:Int)]]()
for i in 0..<M-2{
    for k in i+1..<M-1{
        for p in k+1..<M{
            S.append([(N,i),(N,k),(N,p)])
        }
    }
}

func target(x:Int, y:Int, mp:[[Int]]) -> (x:Int, y:Int){
    var res = [(x:Int,y:Int,d:Int)]()
    
    for nx in (x-D..<x).reversed(){
        for ny in y-D..<y+D{
            let distance = abs(x-nx) + abs(y-ny)
            if nx<0 || ny<0 || ny>=M{ continue }
            if  distance > D { continue }
            
            if mp[nx][ny]==1{
                res.append((nx,ny,distance))
            }
        }
    }
    
    if res.isEmpty{
        return (-1,-1)
    }else{
        res.sort(by: {$0.d==$1.d ? $0.y<$1.y:$0.d<$1.d})
        return (res[0].x,res[0].y)
    }
}

while !S.isEmpty{
    var s = S.removeLast()
    var m = map
    var cnt = 0
    
    for _ in 0..<N{
        var res = Set<[Int]>()
        
        for i in 0..<3{
            let T = target(x: s[i].x, y: s[i].y, mp: m)
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