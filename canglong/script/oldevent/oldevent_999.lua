--function oldevent_999()

    if instruct_5(2,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0


    if instruct_6(130,4,0,0) ==false then    --  6(6):战斗[130]是则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_15(0);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(3829,266,0);   --  1(1):[???]说: 八个牙鹿！！*我们的精兵的，还有！*再战的干活！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,3,1,0,0);   --  26(1A):增加场景事件编号的三个触发事件编号
    instruct_21(50);   --  21(15):[乔峰]离队
    instruct_21(92);   --  21(15):[李沅芷]离队
    instruct_21(91);   --  21(15):[温青青]离队
    instruct_21(90);   --  21(15):[钟灵]离队
    instruct_21(89);   --  21(15):[人厨子]离队
    instruct_21(88);   --  21(15):[祖千秋]离队
    instruct_21(87);   --  21(15):[苏荃]离队
    instruct_21(86);   --  21(15):[阿珂]离队
    instruct_21(85);   --  21(15):[贝海石]离队
    instruct_21(84);   --  21(15):[霍都]离队
    instruct_21(83);   --  21(15):[何铁手]离队
    instruct_21(82);   --  21(15):[宋青书]离队
    instruct_21(81);   --  21(15):[朱九真]离队
    instruct_21(80);   --  21(15):[张召重]离队
    instruct_21(79);   --  21(15):[岳灵珊]离队
    instruct_21(78);   --  21(15):[梅超风]离队
    instruct_21(77);   --  21(15):[萧中慧]离队
    instruct_21(76);   --  21(15):[王语嫣]离队
    instruct_21(75);   --  21(15):[陈家洛]离队
    instruct_21(74);   --  21(15):[霍青桐]离队
    instruct_21(73);   --  21(15):[任盈盈]离队
    instruct_21(72);   --  21(15):[田归农]离队
    instruct_21(66);   --  21(15):[小昭]离队
    instruct_21(63);   --  21(15):[程英]离队
    instruct_21(59);   --  21(15):[小龙女]离队
    instruct_21(58);   --  21(15):[杨过]离队
    instruct_21(56);   --  21(15):[黄蓉]离队
    instruct_21(55);   --  21(15):[郭靖]离队
    instruct_21(54);   --  21(15):[袁承志]离队
    instruct_21(53);   --  21(15):[段誉]离队
    instruct_21(52);   --  21(15):[花铁干]离队
    instruct_21(51);   --  21(15):[慕容复]离队
    instruct_21(49);   --  21(15):[虚竹]离队
    instruct_21(48);   --  21(15):[游坦之]离队
    instruct_21(47);   --  21(15):[阿紫]离队
    instruct_21(45);   --  21(15):[薛慕华]离队
    instruct_21(44);   --  21(15):[岳老三]离队
    instruct_21(38);   --  21(15):[石破天]离队
    instruct_21(37);   --  21(15):[狄云]离队
    instruct_21(36);   --  21(15):[林平之]离队
    instruct_21(35);   --  21(15):[令狐冲]离队
    instruct_21(29);   --  21(15):[田伯光]离队
    instruct_21(28);   --  21(15):[平一指]离队
    instruct_21(25);   --  21(15):[蓝凤凰]离队
    instruct_21(17);   --  21(15):[王难姑]离队
    instruct_21(16);   --  21(15):[胡青牛]离队
    instruct_21(9);   --  21(15):[张无忌]离队
    instruct_21(4);   --  21(15):[阎基]离队
    instruct_21(2);   --  21(15):[程灵素]离队
    instruct_21(1);   --  21(15):[胡斐]离队
--end

