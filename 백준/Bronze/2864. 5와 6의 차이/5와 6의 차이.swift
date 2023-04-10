let numbers = readLine()!.split(separator: " ").map{String($0)}
var num1 = ""
var num2 = ""

for number in numbers {
    for n in number{
        if n == "5" || n == "6"{
            num1 += "5"
            num2 += "6"
            continue
        }
        num1 += String(n)
        num2 += String(n)
    }
    num1 += " "
    num2 += " "
}
print(num1.split(separator: " ").map{Int(String($0))!}.reduce(0, +),terminator: " ")
print(num2.split(separator: " ").map{Int(String($0))!}.reduce(0, +))