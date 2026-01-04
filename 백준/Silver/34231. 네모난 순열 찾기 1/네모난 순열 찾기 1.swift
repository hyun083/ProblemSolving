import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var ans = 0
var cnt = 0

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(line)
}

for r1 in 0..<N{
    for r2 in r1..<N{
        for c1 in 0..<N{
            for c2 in c1..<N{
                //if !(r1==0 || r2==N-1 || c1==0 || c2==N-1){ continue }
                
                var tmp = Set<Int>()
                var valid = true
                for r in r1...r2{
                    for c in c1...c2{
                        if tmp.contains(map[r][c]){
                            valid = false
                            break
                        }else{
                            tmp.insert(map[r][c])
                        }
                    }
                    if valid == false{ break }
                }
                if valid{
                    let count = tmp.count
                    if tmp.min()==1 && tmp.max()==tmp.count{
                        ans += 1
                    }
                }
            }
        }
    }
}
print(ans)