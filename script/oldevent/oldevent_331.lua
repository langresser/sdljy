--function oldevent_331()
    instruct_1(1231,201,0);   --  1(1):[???]说: 金龙帮弟子正在练功，这是*我们最新设计的343阵法。*我是金龙帮总教头，姓米，*名卢，是宋代着名书法家米*芾的后人。
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_29(0,100,999,0,2) ==true then    --  29(1D):判断AAA武力100-999否则跳转到:Label0
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(3993,201,0);   --  1(1):[???]说: 少侠想和我们一起练练吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(2,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1


    if instruct_6(224,8,0,1) ==false then    --  6(6):战斗[224]是则跳转到:Label2
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(3994,201,0);   --  1(1):[???]说: 成功了！成功了！没有给对*手任何机会！伟大的金龙帮*的左后卫！我们继承了金龙*帮的光荣传统！在这一刻，*我们不是一个人在战斗，不*是一个人！金龙帮万岁！
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(3995,201,0);   --  1(1):[???]说: 看来这个343阵法还有些问*题，也许改成10、0、0阵法*会好一些。
    instruct_0();   --  0(0)::空语句(清屏)
--end

