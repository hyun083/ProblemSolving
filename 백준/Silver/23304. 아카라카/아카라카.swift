import Foundation

var S = readLine()!.map{String($0)}
while S.count > 1{
    let RS = Array(S.reversed())
    if S==RS{
        S = Array(S[0..<S.count/2])
    }else{
        break
    }
}
print(S.count==1 ? "AKARAKA":"IPSELENTI")