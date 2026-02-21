import Foundation

let K = Int(readLine()!)!
for k in 1...K {
    let NM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NM[0]
    let M = NM[1]
    var map = Array(repeating: Set<Int>(), count: N)
    
    for _ in 0..<M {
        let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
        let U = UV[0]
        let V = UV[1]
        map[U].insert(V)
        map[V].insert(U)
    }
    
    let S = Int(readLine()!)!-1
    
    print("Data Set \(k):")
    if map[S].isEmpty {
        print("")
    } else {
        let ans = map[S].map({$0+1}).sorted(by: <)
        for num in ans {
            print(num, terminator: num==ans.last! ? "\n":" ")
        }
    }
    print()
}