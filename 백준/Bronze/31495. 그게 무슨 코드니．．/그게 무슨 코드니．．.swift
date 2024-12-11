import Foundation

let S = readLine()!.map{String($0)}
if S.first! == "\"" && S.last! == "\"" {
    if S.count > 2 {
        print(String(S[1..<S.count-1].joined()))
    }else{
        print("CE")
    }
}else{
    print("CE")
}