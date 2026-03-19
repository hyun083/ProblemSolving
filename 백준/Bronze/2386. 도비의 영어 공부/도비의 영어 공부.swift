import Foundation

while let line = readLine() {
    let input = line.split(separator: " ").map{String($0)}
    let target = input[0]
    var ans = 0
    
    if target == "#" { break }
    
    for i in 1..<input.count {
        for alpha in input[i].map({String($0.lowercased())}) {
            ans += target==alpha ? 1:0
        }
    }
    print(target,ans)
}