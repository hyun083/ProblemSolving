import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

let numbers = Array(1...N)
var arr = [Int]()
var ans = [[Int]]()

func dfs(curr:Int){
    if curr == N {
        if arr.count == M{
            ans.append(arr)
        }
        return
    }
    
    dfs(curr: curr + 1)
    
    arr.append(numbers[curr])
    dfs(curr: curr + 1)
    
    arr.remove(at: arr.firstIndex(of: numbers[curr])!)
}

dfs(curr: 0)

for arr in ans.reversed(){
    for a in arr{
        print(a,terminator: " ")
    }
    print()
}