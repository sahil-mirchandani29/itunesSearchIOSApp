    func URLgenerator(keyword: String) -> String{
        var url: String = "htpps://itunes.apple.com/search?term="
        let keywordArray = keyword.split(separator: " ")
        for keys in keywordArray{
            url.append(contentsOf: keys+"+")
        }
        url = String(url.dropLast())
        return url
    }
    print(URLgenerator(keyword: "sahil Mirchandano"))
