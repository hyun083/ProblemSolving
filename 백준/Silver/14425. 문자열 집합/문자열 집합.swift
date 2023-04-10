import Foundation

let cnt = readLine()!.split(separator: " ").map{Int(String($0))!}

var S = [String:Bool]()

for _ in 1...cnt[0]{
    S[readLine()!] = true
}

var ans = 0
for _ in 1...cnt[1]{
    if S[readLine()!] == true{
        ans += 1
    }
}
print(ans)