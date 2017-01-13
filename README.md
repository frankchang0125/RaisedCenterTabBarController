# RaisedCenterTabBarController
Raised center tabbar button example

加入一 button 至 tabbar 並置中，製造凸顯按鈕的效果。

此外，為了避免當 status bar 高度改變時 (ex: 連結 personal hotspot、
導航... etc) 會導致 tabbar controller 其 view 的高度改變，因此我們將 button 加至 tabbar controller 中的 tab bar，並加上 auto layout contraints 來讓 button 能保持置中位置，不會隨著 status bar 高度的改變而移動其位置。
