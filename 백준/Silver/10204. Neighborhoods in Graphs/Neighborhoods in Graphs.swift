import Foundation

let T = Int(readLine()!.filter{$0 != " "})!

for _ in 0..<T{
    var info = readLine()!.split(separator: " ").map{String($0)}
    let N = Int(info.removeFirst())!
    let E = Int(info.removeFirst())!
    let target = Int(info.removeLast().filter{$0 != "v"})!-1
    
    var map = Array(repeating: Array(repeating: false, count: N), count: N)
    for i in stride(from: 0, to: E*2, by: +2){
        let U = Int(info[i].filter{$0 != "v"})!-1
        let V = Int(info[i+1].filter{$0 != "v"})!-1
        map[U][V] = true
        map[V][U] = true
    }
    
    func fw(from root:Int) -> Int{
        var res = Set<Int>()
        for i in 0..<N{
            if i == root { continue }
            if map[root][i] { res.insert(i) }
            for k in 0..<N{
                if k == root { continue }
                if map[root][i] && map[i][k]{
                    res.insert(k)
                }
            }
        }
        return res.count
    }
    let res = fw(from: target)
    print("The number of supervillains in 2-hop neighborhood of v\(target+1) is \(res)")
}