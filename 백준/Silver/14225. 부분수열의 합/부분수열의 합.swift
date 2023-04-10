let n = Int(readLine()!)!
let s = readLine()!.split(separator: " ").map{Int(String($0))!}
var number = Array(repeating: false, count: 2000000)

func solution(idx:Int, sum:Int){
    number[sum] = true
    if idx == n{
        return
    }else{
        solution(idx: idx+1, sum: sum)
        solution(idx: idx+1, sum: sum+s[idx])
    }
}

solution(idx: 0, sum: 0)
for i in 0..<2000000{
    if !number[i]{
        print(i)
        break
    }
}