let numbers = readLine()!.split(separator: " ").map{Int($0)!}
let na = numbers[0]
let nb = numbers[1]

var ans = [Int]()
let a = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let b = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

func bin(num:Int) -> Bool{
    var start = 0
    var end = nb-1
    while start <= end{
        let mid = (start+end)/2
        if b[mid] < num{
            start = mid+1
            continue
        }else if b[mid] == num{
            return true
        }else{
            end = mid-1
            continue
        }
    }
    return false
}

for member in a{
    if !bin(num: member){
        ans.append(member)
    }
}
print(ans.count)
if ans.count > 0{
    for ans in ans{
        print(ans,terminator: " ")
    }
}