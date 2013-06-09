KanXuePasswordTest
==================

看雪论坛API密码生成方法iOS版

#关于方法
本方法是按照官方提供的Java代码和方法解释，通过Objective-C语言实现的
实现此方法是为了方便看雪论坛iOS客户端制作
项目内附Main.java是按照官方说明实现的Java版方法，主要内容复制自官方介绍贴


#看雪论坛官方API介绍
介绍地址
http://bbs.pediy.com/showthread.php?t=163280

vb_login_md5password值生成方式：

(1). 取出密码中的前后空格 trim()

(2). 对上步结果做一下java方法处理

```java
private String strToEnt(String input) {
  String output = "";
  
  for (int i = 0; i < input.length(); i++) {
    int ucode = input.codePointAt(i);
    String tmp = "";
    
    if (ucode > 255) {
      while (ucode >= 1) {
        tmp = "0123456789".charAt(ucode%10) + tmp;
        ucode /= 10;
      }
      
      if (tmp == "") {
        tmp = "0";
      }
      
      tmp = "#" + tmp;
      tmp = "&" + tmp;
      tmp = tmp + ";";
      output += tmp;
    }else {
      output += input.charAt(i);
    }
  }
  return output;
}
```
(3). 对上步所得值进行md5

#测试结果
###Java

KanXueLunTanKaolaSo

22f877f1ab38daf680f799b5df1d293e

###Objective-C

2013-06-09 10:00:57.544 KanXuePasswordTest[56683:c07] KanXueLunTanKaolaSo

2013-06-09 10:00:57.545 KanXuePasswordTest[56683:c07] 22f877f1ab38daf680f799b5df1d293e

#开源代码授权
The MIT License (MIT)

Copyright (c) 2013 R³ Studio

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
