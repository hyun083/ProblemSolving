import Foundation

while let line = readLine(){
    let ST = line.split(separator: " ")
    let S = ST[0].map{String($0)}
    let T = ST[1].map{String($0)}
    var curr = 0
    
    for i in 0..<T.count{
        if curr >= S.count { break }
        if T[i] == S[curr] {
            curr += 1
        }
    }
    print(curr == S.count ? "Yes" : "No")
}