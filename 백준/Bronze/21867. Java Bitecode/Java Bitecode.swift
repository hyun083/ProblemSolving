let N = Int(readLine()!)!
let S = readLine()!.map{String($0)}
let JAVA:Set<String> = ["J","A","V"]
var res = [String]()

for code in S{
    if !JAVA.contains(String(code)){
        res.append(code)
    }
}
print(res.isEmpty ? "nojava":res.joined())