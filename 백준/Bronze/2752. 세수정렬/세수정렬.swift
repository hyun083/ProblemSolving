for number in readLine()!.split(separator: " ").map({Int(String($0))!}).sorted(by: <){
    print(number,terminator: " ")
}