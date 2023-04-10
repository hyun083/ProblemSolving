for char in readLine()!{
    if char.isLowercase{
        print(char.uppercased(),terminator: "")
    }else{
        print(char.lowercased(),terminator: "")
    }
}