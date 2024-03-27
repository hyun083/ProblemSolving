let N = Int(readLine()!)!
var arr = Set<[Int]>()
let (nx,ny) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var target = [(x:Int,y:Int)]()
var ans = 0

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.insert([x,y])
    target.append((x,y))
}

for i in 0..<N{
    let curr = target[i]
    if arr.contains([curr.x+nx,curr.y]) && arr.contains([curr.x,curr.y+ny]) && arr.contains([curr.x+nx, curr.y+ny]){
        ans += 1
    }
}
print(ans)