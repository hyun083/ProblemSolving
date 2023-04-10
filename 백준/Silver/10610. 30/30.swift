let number = readLine()!.sorted(by: >).map{String($0)}
let sum = number.map{Int(String($0))!}.reduce(0, +)
if number.last! == "0" && sum%3 == 0{
    print(number.joined())
}else{
    print("-1")
}