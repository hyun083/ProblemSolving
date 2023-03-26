import Foundation

let mn = readLine()!.split(separator: " ").map{Int($0)!}
let m = mn[0]
let n = mn[1]
var ans = [(String,Int)]()

func itost(n:Int) -> (String,Int){
    let numbers = String(n).map{String($0)}
    var result = ""
    
    for number in numbers {
        switch number{
        case "0":
            result.append("zero")
        case "1":
            result.append("one")
        case "2":
            result.append("two")
        case "3":
            result.append("three")
        case "4":
            result.append("four")
        case "5":
            result.append("five")
        case "6":
            result.append("six")
        case "7":
            result.append("seven")
        case "8":
            result.append("eight")
        case "9":
            result.append("nine")
        default:
            continue
        }
    }
    
    return (result,n)
}

for num in m...n{
    ans.append(itost(n: num))
}

ans.sort(by: { $0.0 < $1.0})
for i in 1...ans.count{
    print(ans[i-1].1, terminator: " ")
    if i % 10 == 0{
        print()
    }
}