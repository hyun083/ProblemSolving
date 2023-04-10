import Foundation

let input = Int(readLine()!)!

for _ in 1...input{
    let I = Int(readLine()!)!
    let dept = readLine()!.split(separator: " ").map{Int(String($0))!}
    let dest = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var map = Array(repeating: Array(repeating: 0, count: I), count: I)
    
    let nx = [-1,-2,-2,-1,1,2,2,1]
    let ny = [-2,-1,1,2,2,1,-1,-2]
    
    func bfs(from dep: [Int], to des: [Int]) -> Int{
        var iter = 0
        var cnt = 0
        var q = [[Int]]()
        q.append(dep)
        
        while(q.count > iter){
            cnt += 1
            for _ in iter..<q.count{
                let curr = q[iter]
                iter += 1
                map[curr[0]][curr[1]] = 1
                for i in 0...7{
                    let X = curr[0] + nx[i]
                    let Y = curr[1] + ny[i]
                    
                    if(X<0 || Y<0 || X>=I || Y>=I){ continue }
                    if [X,Y] == des {return cnt}
                    if(map[X][Y] == 0){
                        map[X][Y] = 1
                        q.append([X,Y])
                    }
                }
            }
        }
        return -1
    }
    
    if(dest == dept){
        print(0)
    }else{
        print(bfs(from: dept, to: dest))
    }
}