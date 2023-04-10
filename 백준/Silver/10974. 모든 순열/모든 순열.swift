import Foundation

let n = Int(readLine()!)!
var visited = Array(repeating: false, count: n)
var arr = [Int]()

func btk(cnt:Int){
    if cnt == n{
        for a in arr{
            print(a,terminator: " ")
        }
        print()
    }
    for i in 0..<n{
        if !visited[i]{
            visited[i] = true
            arr.append(i+1)
            btk(cnt: cnt+1)
            
            arr.removeLast()
            visited[i] = false
        }
    }
}
btk(cnt: 0)