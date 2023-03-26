let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var pkg = 10001
var ea = 10001
for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    if pkg > line[0]{
        pkg = line[0]
    }
    if ea > line[1]{
        ea = line[1]
    }
}
print(min((N/6+1)*pkg, min((N/6*pkg + N%6*ea), N*ea)))