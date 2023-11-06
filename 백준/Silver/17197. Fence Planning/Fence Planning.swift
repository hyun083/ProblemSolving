import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var cows = [(x:Int, y:Int)]()
var size = [(xMin:Int, xMax:Int, yMin:Int, yMax:Int)]()

func root(of node:Int) ->Int{
    if arr[node] < 0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    
    size[A].xMin = min(size[A].xMin, size[B].xMin)
    size[A].xMax = max(size[A].xMax, size[B].xMax)
    size[A].yMin = min(size[A].yMin, size[B].yMin)
    size[A].yMax = max(size[A].yMax, size[B].yMax)
    arr[B] = A
}

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    cows.append((x,y))
    size.append((x,x,y,y))
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    union(a: u, b: v)
}

var ans = Int.max
for i in 0..<N{
    if arr[i] < 0{
        let fence = (2*(size[i].xMax - size[i].xMin)) + (2*(size[i].yMax - size[i].yMin))
        ans = min(ans, fence)
    }
}
print(ans)