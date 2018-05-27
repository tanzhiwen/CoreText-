# CoreText [我的简书](https://www.jianshu.com/u/2db9a9d9181c "悬停显示")
![](https://raw.githubusercontent.com/AchillesWang/CoreText/master/Magazine/image/img01.png)
学会使用CoreText会帮助提升一些性能上的问题
* 作者：檀志文
* 年龄：28
* 职业：iOS开发
----------
## CoreText 一些扫盲的知识点
`CTFont`<br>
`CTFontCollection`<br>
`CTFontDescriptor`<br>
`CTFrame`<br>
`CTFramesetter`<br>
`CTGlyphInfo`<br>
`CTLine`<br>
`CTParagraphStyle`<br>
`CTRun`<br>
`CTTextTab`<br>
`CTTypesetter`<br>`
                          

CTFrame 作为一个整体的画布(Canvas)，其中由行(CTLine)组成，而每行可以分为一个或多个小方块（CTRun）。 注意：你不需要自己创建CTRun，Core Text将根据NSAttributedString的属性来自动创建CTRun。每个CTRun对象对应不同的属性，正因此，你可以自由的控制字体、颜色、字间距等等信息。<br>
## 通常处理步聚：
1 使用`coretext`就是先有一个要显示的string，然后定义这个string每个部分的样式<br>
2 －>`attributedString` －> 生成 `CTFramesetter` -> 得到`CTFrame` -> 绘制（`CTFrameDraw`） 其中可以更详细的设置换行方式，对齐方式，绘制区域的大小等。<br>
3 绘制只是显示，点击事件就需要一个判断了。 CTFrame 包含了多个CTLine,并且可以得到各个line的其实位置与大小。判断点击处在不在某个line上。<br>
4 CTLine 又可以判断这个点(相对于ctline的坐标)处的文字范围。然后遍历这个string的所有`NSTextCheckingResult`，根据`result`的`rang`判断点击处在不在这个rang上，从而得到点击的链接与位置。<br>


           
                                                                               
