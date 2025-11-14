import Foundation

var dict = Dictionary<String,String>()

dict["CU"] = "see you"
dict[":-)"] = "I’m happy"
dict[":-("] = "I’m unhappy"
dict[";-)"] = "wink"
dict[":-P"] = "stick out my tongue"
dict["(~.~)"] = "sleepy"
dict["TA"] = "totally awesome"
dict["CCC"] = "Canadian Computing Competition"
dict["CUZ"] = "because"
dict["TY"] = "thank-you"
dict["YW"] = "you’re welcome"
dict["TTYL"] = "talk to you later"

while let input = readLine(){
    print(dict[input, default: input])
}