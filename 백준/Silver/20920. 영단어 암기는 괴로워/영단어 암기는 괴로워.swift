import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var cnt = Dictionary<String,Int>()

for _ in 0..<N{
    let word = readLine()!
    if word.count >= M{
        if cnt[word] == nil{
            cnt[word] = 1
        }else{
            cnt[word]! += 1
        }
    }
}

var ans = cnt.sorted(by: {
    if $0.value == $1.value{
        if $0.key.count == $1.key.count{
            return $0.key < $1.key
        }else{
            return $0.key.count > $1.key.count
        }
    }else{
        return $0.value > $1.value
    }
})

for ans in ans{
    print(ans.key)
}