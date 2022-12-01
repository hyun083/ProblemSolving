import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var cnt = 0
var head = (x:0,y:1)
var tail = (x:0,y:0)

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    map[i] = line
}

func bfs(){
    var q = [(head,tail)]
    var idx = 0
    while idx < q.count{
        let curr = q[idx]
        let head = curr.0
        let tail = curr.1
        if head.x == n-1 && head.y == n-1{
            cnt += 1
            idx += 1
            continue
        }
        
        if head.x == tail.x{
            if head.y+1<n{
                if map[head.x][head.y+1]==0{
                    let newHead = (x:head.x,y:head.y+1)
                    let newTail = head
                    q.append((newHead,newTail))
                }
            }
        }else if head.y == tail.y{
            if head.x+1<n{
                if map[head.x+1][head.y]==0{
                    let newHead = (x:head.x+1,y:head.y)
                    let newTail = head
                    q.append((newHead,newTail))
                }
            }
        }else{
            if head.y+1<n{
                if map[head.x][head.y+1]==0{
                    let newHead = (x:head.x,y:head.y+1)
                    let newTail = head
                    q.append((newHead,newTail))
                }
            }
            if head.x+1<n{
                if map[head.x+1][head.y]==0{
                    let newHead = (x:head.x+1,y:head.y)
                    let newTail = head
                    q.append((newHead,newTail))
                }
            }
        }
        
        if head.x+1<n && head.y+1<n{
            if map[head.x+1][head.y+1]==0 && map[head.x][head.y+1]==0 && map[head.x+1][head.y]==0{
                let newHead = (x:head.x+1,y:head.y+1)
                let newTail = head
                q.append((newHead,newTail))
            }
        }
        idx += 1
    }
}
bfs()
print(cnt)
