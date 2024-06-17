import Foundation

let TC = Int(readLine()!)!

for _ in 0..<TC{
    let (N,K,T,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2]-1, $0[3])}[0]
    var team = Array(repeating: Array(repeating: 0, count: K), count: N)
    var cnt = Array(repeating: 0, count: N)
    var last = Array(repeating: 0, count: N)
    
    for time in 0..<M{
        let (id,n,score) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
        team[id][n] = max(team[id][n], score)
        cnt[id] += 1
        last[id] = time
    }
    
    var total = team.map{$0.reduce(0, +)}
    var ans = 1
    
    for i in 0..<N{
        if i == T { continue }
        if total[i] > total[T]{
            ans += 1
        }else if total[i] == total[T]{
            if cnt[i] < cnt[T] {
                ans += 1
            }else if cnt[i] == cnt[T]{
                ans += last[i]<last[T] ? 1:0
            }
        }
    }
    print(ans)
}