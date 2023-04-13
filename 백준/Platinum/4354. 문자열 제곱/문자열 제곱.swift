import Foundation

while let line = readLine(){
    if line == "."{ break }
    let S = line.map{String($0)}
    let N = S.count

    var fail = Array(repeating: 0, count: N)
    var k = 0
    for i in 1..<N{
        while k>0 && S[i] != S[k] { k = fail[k-1] }
        if S[i] == S[k] {
            k += 1
            fail[i] = k
        }
    }
    let p = N - fail[N-1]
    print(N%p==0 ? N/p:1)
}