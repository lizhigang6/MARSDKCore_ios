

Pod::Spec.new do |s|

  s.name             = 'MARSDKCore_ios'
  s.version          = '5.1.2'
  s.summary          = '火星人打包工具'
   s.description      = <<-DESC
火星人打包工具  BUGLY
                       DESC
s.homepage     = "https://github.com/lizhigang6/MARSDKCore_ios.git"# 你git库的地址首页,可以在开元中国创建你的库,不需要使用什么初始化方法,不要勾选 readme
s.license          = { :type => 'MIT', :file => 'LICENSE' } #这里不需要改变,使用默认,文件指向的文件名与工程中文件名要一致。
s.author           = { '名字' => 'lizhigang6@163.com' } #作者信息：账户名，账户邮箱地址
s.source           = { :git => 'https://github.com/lizhigang6/MARSDKCore_ios.git', :tag => s.version.to_s } # 这里输入邮箱如果你在开元中国申请的 git 账号,那么把你在开元中国创建的项目的 https 网址输入到这里,
s.platform     = :ios
s.platform     = :ios, "9.0" #iOS 支持的最低级别,这里最低9.0
s.resource_bundles = {
     'mrasdk' => ['MARSDKCore_ios/Assets/*']
 }
s.vendored_frameworks = 'MARSDKCore_ios/Classes/MARSDKCore.framework' #静态库文件的依赖，意思是执行到Classes文件夹下检索.framework类型的文件，我们放入的是动态库文件需要写入进行标注
s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }  # 如果项目已经设置 pod_target_xcconfig，添加到已有值的后面。此处解决了模拟器和真机包合并问题
end
