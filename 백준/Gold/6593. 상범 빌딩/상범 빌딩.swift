import Foundation

while(true){
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    let L = inputs[0]
    let R = inputs[1]
    let C = inputs[2]
    if L + R + C == 0{ break }
    
    var map = Array(repeating: Array(repeating: Array<Character>(), count: R), count: L)
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: C), count: R), count: L)
    var start = [0,0,0]
    var end = [0,0,0]
    for level in 0..<L{
        for idx in 0..<R{
            let inputs = readLine()!
            for input in inputs{
                if(input == "S"){
                    let startIdx = inputs.startIndex
                    let endIdx = inputs.firstIndex(of: input)!
                    start = [level,idx,inputs.distance(from: startIdx, to: endIdx)]
                }
                if(input == "E"){
                    let startIdx = inputs.startIndex
                    let endIdx = inputs.firstIndex(of: input)!
                    end = [level,idx,inputs.distance(from: startIdx, to: endIdx)]
                }
                map[level][idx].append(input)
            }
        }
        readLine()
    }
    
    let nZ = [0,0,0,0,1,-1]
    let nX = [1,-1,0,0,0,0]
    let nY = [0,0,-1,1,0,0]
    
    func bfs() -> Int{
        var q = [[Int]]()
        q.append(start)
        visited[start[0]][start[1]][start[2]] = true
        var cnt = 0
        
        while(!q.isEmpty){
            cnt += 1
            for _ in 1...q.count{
                let curr = q.removeFirst()
                for i in 0...5{
                    let Z = curr[0] + nZ[i]
                    let X = curr[1] + nX[i]
                    let Y = curr[2] + nY[i]
                    
                    if(Z<0 || X<0 || Y<0 || Z>=L || X>=R || Y>=C){
                        continue
                    }
                    if([Z,X,Y] == end){return cnt}
                    if(map[Z][X][Y] == "." && visited[Z][X][Y] == false){
                        q.append([Z,X,Y])
                        visited[Z][X][Y] = true
                    }
                }
            }
            
        }
        return -1
    }
    let ans = bfs()
    if(ans == -1){
        print("Trapped!")
    }else{
        print("Escaped in \(ans) minute(s).")
    }
}