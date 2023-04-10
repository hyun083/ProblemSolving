import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: N)
num.sort(by: <)

var arr = [Int]()
var ans = Set<[Int]>()
func dfs(numb:Int, cnt:Int){
    if cnt == M{
        ans.insert(arr)
        return
    }
    
    for i in numb..<N{
        if visited[i] == false{
            visited[i] = true
            arr.append(num[i])
            dfs(numb: i, cnt: cnt+1)
            arr.removeLast()
            visited[i] = false
        }
    }
}

dfs(numb: 0, cnt: 0)

var a = ans.sorted(by: {
    for i in 0..<M{
        if $0[i] == $1[i]{
            continue
        }else{
            return $0[i] < $1[i]
        }
    }
    return $0[0] < $1[0]
})

for res in a {
    for r in res{
        print(r,terminator: " ")
    }
    print()
}