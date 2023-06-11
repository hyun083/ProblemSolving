import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
var K = NMK[2]

var q = [(x:Int,y:Int,m:Int,s:Int,d:Int)]()
for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x = info[0]-1
    let y = info[1]-1
    let m = info[2]
    let s = info[3]
    let d = info[4]
    q.append((x,y,m,s,d))
}

let dx = [-1,-1,0,1,1,1,0,-1]
let dy = [0,1,1,1,0,-1,-1,-1]

func bfs(){
    while K > 0{
        var tmpArr = Array(repeating: Array(repeating: [(m:Int,s:Int,d:Int)](), count: N), count: N)
        var dq = Array(q.reversed())
        q.removeAll()

        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr.x
            let y = curr.y
            let s = curr.s

            var nx = (x+(dx[curr.d]*s))%N
            var ny = (y+(dy[curr.d]*s))%N
            nx += nx<0 ? ((abs(nx)/(N+1)+1)*(N)):0
            ny += ny<0 ? ((abs(ny)/(N+1)+1)*(N)):0

            tmpArr[nx][ny].append((curr.m,curr.s,curr.d))
        }

        for i in 0..<N{
            for k in 0..<N{

                if tmpArr[i][k].isEmpty{
                    continue
                }else if tmpArr[i][k].count == 1{
                    let fire = tmpArr[i][k][0]
                    let m = fire.m
                    let s = fire.s
                    let d = fire.d
                    
                    q.append((i,k,m,s,d))
                    continue
                }
                
                var newM = 0
                var newS = 0
                var even = 0
                var odd = 0

                for info in tmpArr[i][k]{
                    newM += info.m
                    newS += info.s
                    
                    even += info.d%2==0 ? 1:0
                    odd += info.d%2==0 ? 0:1
                }

                newM/=5
                newS/=tmpArr[i][k].count
                if newM==0 { continue }

                if even==tmpArr[i][k].count || odd==tmpArr[i][k].count{
                    for idx in [0,2,4,6]{
                        q.append((i,k,newM,newS,idx))
                    }
                }else{
                    for idx in [1,3,5,7]{
                        q.append((i,k,newM,newS,idx))
                    }
                }
            }
        }

        K -= 1
    }
}
bfs()
var ans = 0
for info in q{
    ans += info.m
}
print(ans)