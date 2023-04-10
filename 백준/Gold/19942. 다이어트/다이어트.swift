import Foundation
let n = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map{Int(String($0))!}
var foods = [[Int]]()
var sum = [0,0,0,0,0]
var total = [String:Int]()


for _ in 0..<n{
    foods.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func btk(idx:Int,str:String){
    if idx == n{ return }
    if sum[0]+foods[idx][0]>=target[0] && sum[1]+foods[idx][1]>=target[1] && sum[2]+foods[idx][2]>=target[2] && sum[3]+foods[idx][3]>=target[3]{
        total[str+"\(idx+1) "] = sum[4]+foods[idx][4]
    }
    btk(idx: idx+1,str:str)
    
    for i in 0..<5{
        sum[i] += foods[idx][i]
    }
    btk(idx: idx+1,str: str+"\(idx+1) ")
    
    for i in 0..<5{
        sum[i] -= foods[idx][i]
    }
}
btk(idx: 0, str:"")
if total.isEmpty{
    print(-1)
}else{
let result = total.sorted(by: {
    if $0.value == $1.value{
        return $0.key < $1.key
    }else{
        return $0.value < $1.value
    }
}).first
print(result!.value)
print(result!.key)
}