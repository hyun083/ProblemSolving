import Foundation

while let input = readLine(){
    let NK = input.split(separator: " ").map{Int($0)!}
    let N = NK[0]
    let K = NK[1]
    
    var stamp = 0
    var ans = N
    stamp += N
    
    while stamp >= K{
        let chicken = stamp/K
        ans += chicken
        stamp = stamp%K
        stamp += chicken
    }
    print(ans)
}