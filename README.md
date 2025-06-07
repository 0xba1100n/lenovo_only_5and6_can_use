联想小新系列的电脑有一个问题很奇怪，在使用一年以后，每次开机时都会只有5和6键能够使用，

这个问题已被反复讨论，但最远追溯到十年前了，每次开机都期望电脑不要出问题,有被烦到

https://answers.microsoft.com/en-us/windows/forum/all/lenovo-laptop-number-keys-12347890-dont-work-only/05e1ada5-d375-453c-a365-3595263061ba

https://forums.lenovo.com/t5/Lenovo-P-Y-and-Z-series/Number-keys-symbols-not-working-only-5-and-6-can-be-typed/td-p/2233779

https://www.reddit.com/r/24hoursupport/comments/1e71hl4/only_5_and_6_working_in_the_number_keys_of_my/

该一键工具方法参考自https://www.zhihu.com/question/473053185/answer/2911846179知乎用户回答

用法：

将Restart-I2CHIDAndSendKey.ps1和run_me.bat置于同一文件夹下，然后每次右键管理员执行run_me.bat，

嫌每次右键麻烦的话，在文件资源管理器器路径输入shell:startup并将run_me.bat快捷方式丢入即可
