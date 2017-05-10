# MVVMDemo
mvvm的应用
#### 1.最近比较忙，一直在忙着新项目的开发。以前的项目都是用mvc模式，有些复杂的页面的controller代码里会比较多，虽然也做过一些拆分，但是还不能满足老大的要求。所以在新项目中使用了MVVM模式，MVVM模式的介绍网上的文章一搜一大堆，我这就不介绍了。

#### 2.看过MVVM的一些文章，肯定会知道RAC,虽然说MVVM模式和RAC并没有什么关联，但是RAC对于MVVM模式中ViewModel和View的绑定，ViewModel和Controller的绑定来说相当方便。

#### 3.值得一提的是，我们加入了一些自己的创新，我们给Controller都新增了一个RootView，加在Controller的View上，所有的视图层展示和操作都在这个RootView上进行，这样Controller里面的代码就非常少了。刚开始我们项目中的哥们提出这个方案时，我们一度很不能理解为什么要这样做，这样不是多此一举吗，毕竟每个Controller都有自己的View视图，而且视图中的一些操作我们就不能直接告诉Controller了，还有就是ViewModel处理的一些数据我们要怎么样既能告诉Controller又能告诉RootView。后来经过大家的讨论，觉得这个方法还是可行的，并对上面的疑问都提供了方案。

##### 3.1 对于RootView中的一些操作不能直接告诉Controller的疑问，解决的办法有很多，通过Block回调，代理，RAC都能解决，虽然多做了一步，但还是很方便的嘛。

##### 3.2 对于ViewModel处理的一些数据我们要怎么样既能告诉Controller又能告诉RootView，我们的解决办法是Controller和RootView公用一个ViewModel，这样你想和谁绑定都行了。

##### 3.3 现在我们都认为单独抽出一个RootView是个很不错的决定，无论用哪种设计模式，最后无非都是为了给Controller减负，减少Controller里面的代码量，使结构更清晰。其实想想每个工程里都有一个Window，Window就相当于幕布，所有的Controller的表演都在幕布上进行。那现在把Controller的view想象成幕布，你所有其他View层的表演都自己进行，最后在我的view里面统一放映进行了，管理者少了不少工作，立马就轻松了.

#### 4.最后上代码吧，很简单的一个demo，希望能对大家有所帮助。[github地址](https://github.com/ZCLemo/MVVMDemo)
