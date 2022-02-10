# Assignment Parser

![Image](https://github.com/JammUtkarsh/assignment-parse/blob/main/meme.png?raw=true)

___

I needed the MySQL commands that were uses in the class. Asked a friend(let's call him Lemon). Lemon shared the whole output of lemon's terminal. Now I had to find only those commands which were actually working.

And here you are in the repo. XD

<details>
  <summary>NOTE: </summary>
This program only fetches all the commands used. I still need to figure out in code how to get only usefull commands.
This is the logic I tried, but didn't have time to implement. (Also didn't work in my code)

```
var lines []string
var working []string
loop {
        if lines[i][:6]=="mysql" && lines[i+1][:6]!="ERROR"  {
                working = append(working, line[i])
        }
}
```
Attached a sample file.
convert it into txt using `cat assignment.sql >> sample.txt`
</details>
