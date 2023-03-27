import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = Array(repeating: -1, count: n+1)
var output = ""
func find(n:Int) -> Int{
    if arr[n] < 0{ return n }
    arr[n] = find(n: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let a = find(n: a)
    let b = find(n: b)
    if a==b{return}
    if a<b{
        arr[a] += arr[b]
        arr[b] = a
    }else{
        arr[b] += arr[a]
        arr[a] = b
    }
}
for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let cmd = line[0]
    let a = line[1]
    let b = line[2]
    if cmd == 0{
        union(a: a, b: b)
    }else{
        if find(n: a) == find(n: b){
            print("YES")
        }else{
            print("NO")
        }
    }
}