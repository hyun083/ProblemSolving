import Foundation

while let line = readLine() {
    let input = line.split(separator: " ").map{Int($0)!}
    let N = input[0]
    let M = input[1]
    var ans = 0
    
    func check(num:Int) -> Bool{
        let n = String(num).map{String($0)}
        return Set(n).count == n.count
    }

    for num in N...M{
        ans += check(num: num) ? 1:0
    }
    print(ans)
}