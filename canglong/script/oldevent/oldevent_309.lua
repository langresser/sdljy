--function oldevent_309()
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,21,0,0,0,0,0,5394,5394,5394,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]
    instruct_3(-2,20,0,0,0,0,0,7040,7040,7040,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [20]
    instruct_3(-2,23,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [23]
    instruct_3(-2,24,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [24]
    instruct_3(-2,25,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [25]
    instruct_3(-2,26,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [26]
    instruct_3(-2,27,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [27]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_30(26,45,17,45);   --  30(1E):主角走动26-45--17-45
    instruct_1(1084,172,0);   --  1(1):[???]说: 青书，我武当派是名门正派*，你怎能在此偷窥峨嵋派的*卧房？快跟我回去，向太师*父和你父亲请罪。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1085,82,0);   --  1(1):[???]说: 七叔，你饶了我吧。我再也*不敢了。如果回去见了我爹*，他非打死我不可。我不能*回去，我不能回去……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1096,0,1);   --  1(1):[AAA]说: ＜宋青书这小子倒是可以利*用，我是不是应该帮他一下*？＞
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_11(44,0) ==false then    --  11(B):是否住宿是则跳转到:Label0
        instruct_1(1097,82,0);   --  1(1):[???]说: 我不能回武当，不能回武当*……
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1098,172,0);   --  1(1):[???]说: 别跑……臭小子，给我站住*！
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_14();   --  14(E):场景变黑
        instruct_3(-2,20,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [20]
        instruct_3(-2,21,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_37(1);   --  37(25):增加道德1
        do return; end
    end    --:Label0

    instruct_37(-2);   --  37(25):增加道德-2
    instruct_1(1086,0,1);   --  1(1):[AAA]说: 这位公子恐怕是爱上了峨嵋*派的某位佳人，这也是人之*常情嘛，莫七侠何必苦苦相*逼？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1087,172,0);   --  1(1):[???]说: 这是我武当派自己的事，不*需旁人插手。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1088,82,0);   --  1(1):[???]说: 我不回去，我不回去，少侠*救我啊……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1089,0,1);   --  1(1):[AAA]说: 听到了吧，是他让我救他，*我也不得不管了。
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(225,4,0,0) ==false then    --  6(6):战斗[225]是则跳转到:Label1
        instruct_15(0);   --  15(F):战斗失败，死亡
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label1

    instruct_3(-2,21,1,0,0,0,0,5440,5440,5440,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(1090,172,0);   --  1(1):[???]说: ……啊……青书，你……居*然偷袭我……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1091,82,0);   --  1(1):[???]说: 七叔，我……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1092,0,1);   --  1(1):[AAA]说: 宋少侠，你亲手杀了你七叔*，这可是欺师灭祖的大罪啊*。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1093,82,0);   --  1(1):[???]说: 我不能再回武当了，不能再*回了，我该去哪？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1094,0,1);   --  1(1):[AAA]说: 跟着我吧，只要你好好帮我*，我就不会把这件事情说出*去的。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1095,82,0);   --  1(1):[???]说: ……好吧。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_37(-3);   --  37(25):增加道德-3
    instruct_3(104,70,1,0,983,0,0,7040,7040,7040,-2,-2,-2);   --  3(3):修改事件定义:场景[钓鱼岛]:场景事件编号 [70]

    if instruct_20(35,0) ==false then    --  20(14):队伍是否满？是则跳转到:Label2
        instruct_14();   --  14(E):场景变黑
        instruct_3(-2,20,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [20]
        instruct_3(-2,21,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_10(82);   --  10(A):加入人物[宋青书]
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_1(12,82,0);   --  1(1):[???]说: 你的队伍已满，我就直接去*小村吧。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,20,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [20]
    instruct_3(-2,21,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(70,54,1,0,179,0,0,7040,7040,7040,-2,-2,-2);   --  3(3):修改事件定义:场景[小村]:场景事件编号 [54]
    instruct_13();   --  13(D):重新显示场景
--end

