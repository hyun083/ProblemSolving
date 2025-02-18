import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let M = Int(readLine()!)!
    var ans = 0
    var missions = [(k:Int, d:Int, a:Int)]()
    
    for _ in 0..<M{
        let mission = readLine()!.split(separator: " ").map{Int($0)!}
        missions.append((mission[0], mission[1], mission[2]))
    }
    
    let kda = readLine()!.split(separator: " ").map{Int($0)!}
    
    let K = kda[0]
    let D = kda[1]
    let A = kda[2]
    for mission in missions{
        var res = 0
        res += mission.k * K
        res -= mission.d * D
        res += mission.a * A
        ans += res<0 ? 0:res
    }
    print(ans)
}