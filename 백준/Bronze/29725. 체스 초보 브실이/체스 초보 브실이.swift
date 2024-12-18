import Foundation

var dic = Dictionary<String, Int>()
var ans = 0

dic["K"] = 0
dic["k"] = 0
dic["P"] = 1
dic["p"] = -1
dic["N"] = 3
dic["n"] = -3
dic["B"] = 3
dic["b"] = -3
dic["R"] = 5
dic["r"] = -5
dic["Q"] = 9
dic["q"] = -9

for _ in 0..<8{
    let arr = readLine()!.map{String($0)}
    for data in arr{
        if data == "." { continue }
        ans += dic[data]!
    }
}
print(ans)