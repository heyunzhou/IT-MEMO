## Flexbox布局

### 父元素

```css
display:flex
// 开启flexbox

flex-direction:row | row-reverse | column | column-reverse
// row 水平方向排列，从左到右(默认值)
// row-reverse 水平方向排列，从右到左，和row相反
// column 垂直方向排列，从上到下
// column-reverse 垂直方向排列，从下到上

flex-wrap: nowrap | wrap | wrap-reverse
// nowrap  flex的元素被摆放到到一行，这可能导致溢出 flex 容器。(默认值)
// wrap  flex元素被打断到多个行中。
// wrap-reverse		和 wrap 的行为一样，但是 cross-start 和 cross-end 互换。

flex-flow
//flex-flow 是 flex-direction 和 flex-wrap 组合的简写属性
//flex-flow: row wrap;

align-items: stretch | center | flex-start | flex-end
stretch  //  弹性元素被在侧轴方向被拉伸到与容器相同的高度或宽度
flex-start  // 元素向侧轴起点对齐。
flex-end  // 元素向侧轴终点对齐。
center  //  元素在侧轴居中。如果元素在侧轴上的高度高于其容器，那么在两个方向上溢出距离相同。

align-content: stretch | center | flex-start | flex-end
stretch  //  弹性元素被在侧轴方向被拉伸到与容器相同的高度或宽度
flex-start  // 元素向侧轴起点对齐。
flex-end  // 元素向侧轴终点对齐。
center  //  元素在侧轴居中。如果元素在侧轴上的高度高于其容器，那么在两个方向上溢出距离相同。

justify-content: stretch | flex-start | flex-end | center | space-around | space-between
start  // 从行首开始排列。每行第一个元素与行首对齐，同时所有后续的元素与前一个对齐。
flex-start  // 从行首起始位置开始排列
flex-end  // 从行尾位置开始排列
center  // 居中排列
space-around  // 均匀排列每个元素每个元素周围分配相同的空间
space-between  // 均匀排列每个元素首个元素放置于起点，末尾元素放置于终点
space-evenly  // 均匀排列每个元素每个元素之间的间隔相等
```

### 子元素

```css
flex-grow: number | 0;
// 定义项目的放大比例，默认为0，即如果存在剩余空间，也不放大。
// 0 为0则表示剩余空间不重新分配；(默认值)
// number 为正整数则按比例分配多余空间

flex-shrink: 1 | 0
// 定义了项目的缩小比例，默认为1，即如果空间不足，该项目将缩小
// 1 空间不足时将缩小
// 0 空间不足时不缩小

flex-basis: number | auto;
// 给上面两个属性分配多余空间之前，计算项目是否有多余空间，默认值为auto,即项目本身的大小
// number  一个长度单位或者一个百分比，规定灵活项目的初始长度。
// auto  长度等于灵活项目的长度。如果该项目未指定长度，则长度将根据内容决定。(默认值)

flex:1;
// flex属性是 flex-grow、flex-shrink、flex-basis的简写，默认为 0，1，auto。
// flex: 0, 1, auto(默认值)

align-self: stretch | center | flex-start | flex-end
stretch  //  单个弹性元素被在侧轴方向被拉伸到与容器相同的高度或宽度
flex-start  // 元素向侧轴起点对齐。
flex-end  // 元素向侧轴终点对齐。
center  //  元素在侧轴居中。如果元素在侧轴上的高度高于其容器，那么在两个方向上溢出距离相同。

order: 5 | -1; // 正数或负数
```

https://developer.mozilla.org/zh-CN/docs/Glossary/Flexbox
