import Foundation

let N = Int(readLine()!)!
var rankOfYonsei = 0
var rankOfKorea = 0

for i in 0..<N{
    let name = readLine()!
    if name == "yonsei"{
        rankOfYonsei = i
    }else if name == "korea"{
        rankOfKorea = i
    }
}
print(rankOfYonsei > rankOfKorea ? "Yonsei Lost..." : "Yonsei Won!")