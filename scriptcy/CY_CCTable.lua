function SetGlobalConst()


    
    VK_ESCAPE=27
    VK_Y=121
	VK_N=110
	VK_SPACE=32
	VK_RETURN=13

	SDLK_UP=273
	SDLK_DOWN=274
	SDLK_LEFT=276
	SDLK_RIGHT=275

	if CONFIG.Rotate==0 then
	    VK_UP=SDLK_UP;
	    VK_DOWN=SDLK_DOWN;
	    VK_LEFT=SDLK_LEFT;
	    VK_RIGHT=SDLK_RIGHT;
	else           --右转90度
	    VK_UP=SDLK_RIGHT;
	    VK_DOWN=SDLK_LEFT;
	    VK_LEFT=SDLK_UP;
	    VK_RIGHT=SDLK_DOWN;
	end


   -- 游戏中颜色定义
    C_STARTMENU=RGB(132, 0, 4)            -- 开始菜单颜色
    C_RED=RGB(216, 20, 24)                -- 开始菜单选中项颜色

    C_WHITE=RGB(236, 236, 236);           --游戏内常用的几个颜色值
    C_ORANGE=RGB(252, 148, 16);
    C_GOLD=RGB(236, 200, 40);
    C_BLACK=RGB(0,0,0);
   
    M_Black=RGB(0,0,0);
	M_Sienna=RGB(160,82,45);
	M_DarkOliveGreen=RGB(85,107,47);
	M_DarkGreen=RGB(0,100,0);
	M_DarkSlateBlue=RGB(72,61,139);
	M_Navy=RGB(0,0,128);
	M_Indigo=RGB(75,0,130);
	M_DarkSlateGray=RGB(47,79,79);
	M_DarkRed=RGB(139,0,0);
	M_DarkOrange=RGB(255,140,0);
	M_Olive=RGB(128,128,0);
	M_Green=RGB(0,128,0);
	M_Teal=RGB(0,128,128);
	M_Blue=RGB(0,0,255);
	M_SlateGray=RGB(112,128,144);
	M_DimGray=RGB(105,105,105);
	M_Red=RGB(255,0,0);
	M_SandyBrown=RGB(244,164,96);
	M_YellowGreen=RGB(154,205,50);
	M_SeaGreen=RGB(46,139,87);
	M_MediumTurquoise=RGB(72,209,204);
	M_RoyalBlue=RGB(65,105,225);
	M_Purple=RGB(128,0,128);
	M_Gray=RGB(128,128,128);
	M_Magenta=RGB(255,0,255);
	M_Orange=RGB(255,165,0);
	M_Yellow=RGB(255,255,0);
	M_Lime=RGB(0,255,0);
	M_Cyan=RGB(0,255,255);
	M_DeepSkyBlue=RGB(0,191,255);
	M_DarkOrchid=RGB(153,50,204);
	M_Silver=RGB(192,192,192);
	M_Pink=RGB(255,192,203);
	M_Wheat=RGB(245,222,179);
	M_LemonChiffon=RGB(255,250,205);
	M_PaleGreen=RGB(152,251,152);
	M_PaleTurquoise=RGB(175,238,238);
	M_LightBlue=RGB(173,216,230);
	M_Plum=RGB(221,160,221);
	M_White=RGB(255,255,255);

   -- 游戏状态定义
    GAME_START =0 	--开始画面
	GAME_START2 ="1"
    GAME_FIRSTMMAP = 1  --第一次显示主地图
    GAME_MMAP =2;       --主地图
    GAME_FIRSTSMAP = 3  --第一次显示主地图
    GAME_SMAP =4;       --场景地图
    GAME_WMAP =5;       --战斗地图
	GAME_DEAD =6;       --死亡画面
    GAME_END  =7;       --结束

   --游戏数据全局变量
   CC={};      --定义游戏中使用的常量，这些可以在修改游戏时修改之
   
   CC.NGAME= "１Ｒ需要重新开始游戏"
   CC.QSQJ="七伤拳经"
   CC.DJDP="大剪刀谱"
   CC.TXDH="特效动画"
   CC.TXWZ1="特效文字1"
   CC.TXWZ2="特效文字2"
   CC.TXWZ3="特效文字3"
   CC.DHJC="代号"  
   CC.say1="１老叫化也来凑个热闹！"
   CC.say2="１控制这蝌蚪一样的气流在体内游走越发随心所欲了！真有趣！"
   CC.say3="石破天轻功上升50点"
   CC.s4="请选择游戏模式"
   CC.s5="１此模式目前还未开放！"
   CC.s6="外号"
   CC.s7="武功1"
   CC.s8="武功"
   CC.s9="武功等级"
   CC.s10="SYP"
   CC.s11="１我的世界我作主"
   CC.s12="１想玩你心中的江湖Ｈ那就说出它的模样Ｈ百花谷恭候大驾"
   CC.s13="１你还是重选吧，偶的能力现在被封印了，无法成长，呜呜......"
   CC.s14="请选择主角的天赋能力"
   CC.s15="拳掌功夫"
   CC.s16="御剑能力"
   CC.s17="耍刀技巧"
   CC.s18="特殊兵器"
   CC.s19="内力最大值"
   CC.s20="内力性质"
   CC.s21="品德"
   CC.s22="１盈盈，你先退下！为父来会会你东方阿姨，哈哈哈----"
   CC.s23="姓名"
   CC.s24="天赋："
   CC.s25="称号："
   CC.s26="攻击力"
   CC.s27="防御力"
   CC.s28="轻功"
   CC.s29="周目奖励"
   CC.s30="新·苍龙半即时天赋称号版"
   CC.s31="辛卯0415版"
   CC.s32="周目"
   CC.s33="整理完毕"
   CC.s34="要换哪位队员的位置"
   CC.s35="主角不能换位"
   CC.s36="要和哪位队员替换"
   CC.s37="队伍"
   CC.s38="无法选择此角色进行游戏"
   CC.s39="时序"
   CC.s40="【炎之运手】制作组出品"
   CC.s41="我去大厅看看"
   CC.s42="Ｇ１妙风使！"
   CC.s43="Ｇ１流云使！"
   CC.s44="Ｇ１辉月使！Ｈ圣火三绝阵！"  
   CC.s45="风云再起"
   CC.s46="成员：水镜四奇  qiu001  tsmdsyp"
   CC.s47="１（这小子来这里做什么？想找俺们陪他练功？他家里不是有两位巨侠做陪练吗！不跟他玩了）Ｐ少侠武功高强，小人不是对手！"
   CC.s48="１（嗯，没功夫跟这小子纠缠了）Ｐ哈哈哈，小子，算你走运！老夫还有要事待办，这次就放你一马！"
   CC.s49="不好！有埋伏----"
   CC.s50="无名刀谱"
   CC.s51="无名刀法"
   CC.s52="１嗯，Ｒ无名刀谱Ｗ９－－－－－－ＨＷ看来这是一本记载着一套绝世无双之刀法的古书！我得好好研究一下这套武功！"
   CC.s53="刀"
   CC.s54="道德:%d 银两:%d"
   CC.s55="游戏时间:%2d时%2d分"
   CC.s56="感谢下载Ｒ炎之运手制作组Ｗ出品的ＨＧ新苍龙逐日半即时天赋称号版Ｗ！Ｈ选择重新开始可进行下一周目的游戏！"
   CC.s57="炎之英雄"
   CC.s58="小小猪"
   CC.s59="马车传送"
   CC.s60="少侠想去什么地方？"
   CC.s61="列表选择"
   CC.s62="手动输入"
   CC.s63="１Ｒ抱歉，现在无法去那里！"
   CC.s64="车夫"
   CC.s65="快速行走"
   CC.s66="慢速行走"
   CC.s67="须弥山神掌"
   CC.s68="姓名"
   CC.s69="阿朱"
   CC.s70="阿朱 "
   CC.s71="是否观看序幕事件"
   CC.s72="在开始游戏前，有件事先说明一下：Ｈ８Ｇ这个游戏是针对骨灰级玩家来制作的，难度甚高！不适合一般玩家！所以，如果对玩游戏没有足够的耐心和钻研精神，请选择退出游戏！"
   CC.s73="８Ｇ如果选择了继续，那么就请不要抱怨难度高！制作者是个暴脾气，不耐烦听这些废话！谢谢合作！接下来，请选择--"
   CC.s74="是否退出游戏"
   
   
   CC.EVB={};
   CC.EVB[1]="人X1"
   CC.EVB[2]="人Y1"
   CC.EVB[3]="人方向"  
   CC.EVB[4]="武具商"
   CC.EVB[5]="物品"
   CC.EVB[6]="物品数量"
   CC.EVB[7]="名称"
   CC.EVB[8]="确定卖出"
   CC.EVB[9]="加攻击力"
   CC.EVB[10]="加防御力"
   CC.EVB[11]="１想卖出哪件武具？"
   CC.EVB[12]="加轻功"
   CC.EVB[13]="１想卖出哪本秘籍？"
   CC.EVB[14]="秘籍商"
   CC.EVB[15]="使用人"
   CC.EVB[16]="需经验"
   CC.EVB[17]="１纹银一千两买药材50个！"
   CC.EVB[18]="药材商"
   CC.EVB[19]="要买药材吗？"
   CC.EVB[20]="１下次再说吧"
   CC.EVB[21]="１你的钱不够！"
   CC.EVB[22]="１纹银一千两买食材30个！"
   CC.EVB[23]="食材商"
   CC.EVB[24]="要买食材吗？"
        CC.EVB1="人X1"
		CC.EVB2="人Y1"
		CC.EVB3="人方向"
		CC.EVB4="１咦，有张纸条......Ｈ（小子，这是留给你的五千两银子，好好准备一下吧）Ｈ哈，那老家伙还很够意思嘛！"
		CC.EVB5="武功等级1"
		CC.EVB6="１苗大侠，我已经找到雪山飞狐这本书了"
		CC.EVB7="１嗯，很好！看来你的胡家刀法也已练得炉火纯青了，以后的江湖就看你们这些年轻人的了！这本苗家剑法你拿去吧！"
		CC.EVB8="１多谢苗大侠！"
		CC.EVB9="武功"
		CC.EVB10="武功等级"
		CC.EVB11="胡斐学会苗家剑法"
		CC.EVB12="物品"
		CC.EVB13="１雕兄－－，真想见识一下独孤前辈的风采啊！最近总感觉到对九剑有了新的领悟，但又很模糊，不能具体总结出来！"
		CC.EVB14="１哈哈－－－－，是时候了！"
		CC.EVB15="１风太师叔！！！"
		CC.EVB16="４冲儿，跟我一起唱：沧海一声笑　滔滔两岸潮　浮沉随浪只记今朝　苍天笑　纷纷世上潮　谁负谁胜出天知晓　江山笑　烟雨遥　涛浪淘尽红尘俗事知多少　清风笑竟惹寂寥　豪情还剩一襟晚照　苍生笑　不再寂寥　豪情仍在痴痴笑笑"
		CC.EVB17="１冲儿，九剑的极意就隐藏在这首歌中，自已好好去体会吧！老夫心愿已了，从此再无牵挂，就此去也，哈哈－－－－"
		CC.EVB18="１多谢太师叔传剑，你老人家多保重！嗯，就在这里参悟九剑的奥义吧－－－－"
		CC.EVB19="三日后"
		CC.EVB20="１成了！这才是真正的独孤九剑啊！此生有幸能学到独孤前辈之神技，夫复何憾！"
		CC.EVB21="令狐冲领悟九剑之秘传"
		CC.EVB22="令狐冲称号变改"
		CC.EVB23="１给你人头！"
		CC.EVB24="１给你书！"
		CC.EVB25="１你好，偶是来自未来的软体娃娃！偶的任务是让在你身体里沉睡的力量觉醒！"
		CC.EVB26="软体娃娃"
		CC.EVB27="１很好，你已经具备觉醒的条件了！Ｈ偶给你看点好东西吧－－－－"
		CC.EVB28="是否要观看战斗影像？"
		CC.EVB29="携带物品1"
		CC.EVB30="携带物品2"
		CC.EVB31="携带物品3"
		CC.EVB32="携带物品4"
		CC.EVB33="１最强人物模拟战斗影像－－－－Ｈ第一场：张三丰对决东方不败"
		CC.EVB34="１最强人物模拟战斗影像－－－－Ｈ第二场：张三丰对决扫地神僧"
		CC.EVB35="１最强人物模拟战斗影像－－－－Ｈ第三场：张三丰对决萧峰"
		CC.EVB36="１最强人物模拟战斗影像－－－－Ｈ第四场：东方不败对决萧峰"
		CC.EVB37="１最强人物模拟战斗影像－－－－Ｈ第五场：东方不败对决扫地神僧"
		CC.EVB38="１最强人物模拟战斗影像－－－－Ｈ第六场：萧峰对决扫地神僧"
		CC.EVB39="１太强了！我好像领悟到什么了.........."
		CC.EVB40="武功2"
		CC.EVB41="武功等级2"
		CC.EVB42="名称"
		CC.EVB43="风林火山功"
		CC.EVB44="攻击力10"
		CC.EVB45="武功动画&音效"
		CC.EVB46="主角学会绝技--风林火山功"
		CC.EVB47="主角获得称号--觉醒之苍龙"
		CC.EVB48="１其实你的力量还可以进一步觉醒！要想得到最后的能力，就去见那个人吧！偶已经把封印之卷轴交给他了！他会指引你完成最后的试炼！"
		CC.EVB49="主角攻防轻能力各提升30点"
		CC.EVB50="１很好，偶的任务完成了，再见！"
		CC.EVB51="１嗯，好像还不是时候，再去江湖上闯荡一番再来吧！"
		CC.EVB52="１你终于来了！很简单，战胜老夫，即可得到最后的力量！准备好了吗？"
	   CC.EVB53="１Ｒ（......也不知道那个阮娲为什么要老夫跟这小子过两招！只听她说在她和这小子的那个空间中有很多人觉得老夫很弱！也罢，那就来玩玩吧！）"
	   CC.EVB54="要挑战吗？"
	   CC.EVB55="１好功夫！这是阮娲留给你的卷轴，拿去吧！"
	   CC.EVB56="１呼，终于到手了！真不容易啊！这老道功夫的确了得！看看这卷轴的内容----"
	   CC.EVB57="９............８..........７..........６..........５..........４..........３..........２..........１我懂了！！！"
	   CC.EVB58="%s领悟六如苍龙诀"
	   CC.EVB59="姓名"
	   CC.EVB60="名称"
	   CC.EVB61="六如苍龙诀"
	   CC.EVB62="攻击力10"
	   CC.EVB63="１行了，你已经领悟了！继续去完成你的使命吧！"
	   CC.EVB64="１还缺点火候，下次再来吧！"
	   CC.EVB65="１随时可以再来！老夫恭候！"
	   CC.EVB66="１是否想直接挑战十五大高手？"
	   CC.EVB67="要直接挑战吗？"
	   CC.EVB68="品德"
	   CC.EVB69="１恭喜你战胜了十五大，那么－－－－"
	   CC.EVB70="１没关系，再去好好准备一下吧！"
	   CC.EVB71="１那就请上擂台吧！"
	   CC.EVB72="SYP"
	   CC.EVB73="１一路来到这里，真是辛苦了！Ｈ偶是 syp！大虾请休息一下，让偶来帮你放书吧！"
	   CC.EVB74="１好了，其它的书都放好了！这本天龙八部你自已去放吧，这是偶最喜欢的天书！再见了！"
	   CC.EVB75="性别"
	   CC.EVB76="１辽国皇帝耶律洪基即将进军中原，萧大哥在尽力想法劝阻，所以无法赶来相助，这是他让我交给你的东西"
	   CC.EVB77="１我要回去帮助萧大哥了，再见！"
	   CC.EVB78="使用人"
	   CC.EVB79="武器"
	   CC.EVB80="加轻功"
	   CC.EVB81="加攻击力"
	   CC.EVB82="战斗胜利"
	   CC.EVB83="战斗失败"
	   CC.EVB84="特殊奖励：千年灵芝两枚"
	   CC.EVB85="特殊奖励：主角四系兵器值提升十点"
	   CC.EVB86="特殊奖励：获得天王保命丹两颗"
	   CC.EVB87="特殊奖励：获得蛤蟆功秘籍一册"
	   CC.EVB88="特殊奖励：获得天山雪莲两枚"
	   CC.EVB89="特殊奖励：主角拳掌功夫提升十点"
	   CC.EVB90="特殊奖励：主角防御力和轻功各提升十点"
	   CC.EVB91="无忌，太师父再传你一套Ｒ太极拳剑Ｗ！看好了！"
	   CC.EVB92="１华山，真是一番好景致啊！献歌一首：ＨＧ山上的山花儿开呀嘛我才到山上来　小小的一片云呀　请你停下来！ＨＷ四处转转----"
	   CC.EVB93="１嗯－－－－，头好晕！！！"
	   CC.EVB94="１哈哈哈，这西夏的Ｒ悲酥清风Ｗ果然了得！此番终于捉到这小子了！"
	   CC.EVB95="１速速将他交予那人，获取我们各自想要的东西！"
	   CC.EVB96="１动手！"
	   CC.EVB97="１Ｇ自打盘古开天辟地  侠行天下是礼是义Ｈ不战而胜最是理想  闯荡江湖身不由已Ｐ除暴安良一身正气　闯荡江湖无人能敌　哪怕不知去向何方　努力下去就是希望"
	   CC.EVB98="１什么人？"
	   CC.EVB99="１呵呵，问俺吗？俺的名字是９ S　 Y　 P"
	   CC.EVB100="八部神威登场"
	   CC.EVB101="敬请期待后续情节"
	   CC.EVB102="论剑结束"
	   CC.EVB103="武功天下第一者："
	   CC.EVB104="是否选用特殊人物进行游戏"
		CC.EVB105="要选择哪位特殊人物"
		CC.EVB106="【零】颖悟绝伦&苍半无双  *【水】万般皆通&百花谷主  *【萧】慈严掌兵&血翼军神  "
		CC.EVB107="苍炎源码版"
		CC.EVB108="阿弥陀佛"
		CC.EVB109="伪"
		CC.EVB110="化朽为奇"
		CC.EVB111="保存进度"
		CC.EVB112="要将当前进度保存到哪个档案中？"
		CC.EVB113="存档完毕"
		CC.EVB114="读取进度"
		CC.EVB115="要从哪个档案中读取进度？"
		CC.EVB116="读档完毕"
		CC.EVB117="A：攻击 D：防御 P：蓄力 I：物品 R：休息"
		CC.EVB118="S：存档  L：读档  Q：退出  I：物品  Z：状态"
		CC.EVB119="F1：传送 F2：走速 F3：队列 F4：物品 F5：全屏 F6：音乐"
		CC.EVB120="片尾曲：英雄梦"
		CC.EVB121="按任意键退出"
		CC.EVB122="请选择"
		CC.EVB123="想要哪种属性的内力"
		CC.EVB124="请输入角色的资质 范围0-100"
		CC.EVB125="输入错误 范围0-100 请重新输入"
		CC.EVB126={"阴性","阳性","调和"}
		CC.EVB127="想卖出什么物品？"
		 CC.EVB128="大商家"
		 CC.EVB129="确定要卖出"
		 CC.EVB130="吗？"
		 CC.EVB131="请输入卖出数量"
		 CC.EVB132="卖出数量输入有误"
		 CC.EVB133="还想继续卖出物品吗"
		 CC.EVB134="本店供应食材和药材！Ｈ食材一千两三十个　药材一千两五十个Ｈ要买点吗？"
		 CC.EVB135="请选择"
		 CC.EVB136="本店商品价廉物美，客官想买点什么吗？"
		 CC.EVB137={"食材","药材","不买"}
		 CC.EVB138="先看看，下次再来！"
		 CC.EVB139="没钱了，以后再来买吧"
		 CC.EVB140="此物品已经有人修炼，是否换人修炼?"
		 CC.EVB141="谁要修炼%s?"
		 CC.EVB142="一个人只能修炼10种武功"
		 CC.EVB143="５Ｒ欲练神功　挥刀自宫"
		 CC.EVB144="２这太惨了吧！先看看再说....Ｈ（翻到下一页）"
		 CC.EVB145="５Ｒ若不自宫　也可练功"
		 CC.EVB146="１哈，原来不自宫也能练啊！Ｈ太棒了！！！"
		 CC.EVB147="修炼此书必须先挥刀自宫，是否仍要修炼?"
		 CC.EVB148="此人不适合修炼此物品"
		 CC.EVB149="此物品有人正在使用 无法卖出"
		 CC.EVB150="这把金蛇剑是有产权认证的，要想卖出的话请带着它的产权认证人一起来！"
		 CC.EVB151="老板，这把剑现在已经属于这位公子了！"
		 CC.EVB152="哦，既然袁少侠这么说了，那么小店立即收货！"
		 CC.EVB153="常回家看看"
		 CC.EVB154="公子，你回来啦！*在外面奔波这么久，一定很辛苦吧*现在想做什么？"
		 CC.EVB155={"练功","休息","起程"}
		 CC.EVB156="请输入主角的名字"
		 CC.EVB157="年轻人，又见面了，看来你的能力已经完全觉醒了！以你现在的实力，可以算得上是一位绝顶高手了！"
		 CC.EVB158="当初在这里观看四大高手比武时，是否觉得不能参予其中有点遗憾呢？"		 
		 CC.EVB159="哦，是这样吗？那好吧，祝你旅程愉快，再见！"
		 CC.EVB160="嗯，很好，年轻人就该有这样的斗志！那么，现在就来弥补这个缺憾吧！"
		 CC.EVB161="昔日在这华山之上，曾有过数次论剑，都由当时Ｇ五位绝顶高手Ｗ参予，胜者将获得Ｒ武功天下第一Ｗ之称号！"
		 CC.EVB162="以当今世上高手来算，五绝当由Ｒ少林的扫地僧，武当的张三丰，日月神教的东方不败，丐帮帮主乔峰和后起一辈人物之魁首－－也就是你Ｗ来组成"
		 CC.EVB163="好，３Ｇ新华山论剑Ｗ９－－－－－－－１开战！！！！！！！"
		 CC.EVB164="软体娃娃"
		 CC.EVB165="是否觉得很遗憾呢？"
		 CC.EVB166="人物头像更换完毕"
		 CC.EVB167="习得『"
         CC.EVB168="１嗯，这里还有一本秘籍！待我看看９......"
         CC.EVB169="３好像是门很厉害的武功，而且很合我修炼的路数嘛，哈哈！"
	     CC.EVB170="１此书果然在这里！Ｈ９......１可叹华山众人暴尸荒野，还是把他们埋了吧！"
         CC.EVB171="休息一下"
		 CC.EVB172="特色指令："
		 CC.EVB173={"确定","取消"}
		 CC.EVB174="休迅飞凫 飘忽若神"
		 CC.EVB175="凌波微步 罗袜生尘"
		 CC.EVB176="未满足发动条件"
		 CC.EVB177="催符："
		 CC.EVB178="符掌生死 德折群雄"
		 CC.EVB179="封穴"
		 CC.EVB180="气补："
		 CC.EVB181="化气补元"
		 CC.EVB182="恢复体力50点"
		 CC.EVB183="挪移："
		 CC.EVB184="请选择要将"
		 CC.EVB185="挪移到什么位置？"
		 CC.EVB186="此处有人！请重新选择"
		 CC.EVB187="水面，不可进入！请重新选择"
		 CC.EVB188="九阳明尊 挪移乾坤"
		 CC.EVB189="传功："
		 CC.EVB190="酒神戏红尘"
		 CC.EVB191="集气上升500"
		 CC.EVB192="零二七的武学常识提升至100"
		 CC.EVB193="水镜四奇的左右互搏机率提升"
		 CC.EVB194="获得称号：真苍半无双"
		 CC.EVB195="醉卧云端笑"
		 CC.EVB196="１恭喜你终于获得Ｒ武功天下第一Ｗ的称号！Ｈ凭你现在的修为，要完成你所背负的使命相信也不是什么难事了！偶会在龙之国度等待你的归来，再见......"
		 CC.EVB197="攻轻防各提升30点 武学常识提升至100"
		 CC.EVB198="１精彩的战斗，相信你也从中获益不少吧！再见......"
		 CC.EVB199="武学常识提升50点"
		 CC.EVB200="华山论剑"
		 CC.EVB201="易经筋加力"
         CC.EVB202="般若掌"
         CC.EVB203="达摩掌"
		 CC.EVB204="忍法胧地斩"
		 CC.EVB205="小子，你终于来了，在这里等你半天了！"
	     CC.EVB206="不要我加入吗？那我走了！"
		
		 CC.EVB210="姑娘，你先回小村，有需要时，我再去找你帮忙"
         CC.EVB211="有需要我帮忙的地方吗？"
		 
		 CC.EVB220="好像是门很厉害的武功！我要修炼吗......"
         CC.EVB221="是否要修炼？"
         CC.EVB222="嗯，算了，还是觉得现在练的武功更好"
	   
 CC.WARS1="官兵"
 CC.WARS2="为国为民"
 CC.WARS3="侠之大者"
 CC.WARS4="血刀攻击吸取生命"
 CC.WARS5="１Ｒ负けいくざ　だが　オレうちなるとうしが　それをこばむ　これはぶもんのいちか　真田幸村　いざ　まいる"
 CC.WARS6="６Ｒもはや　これまでか.........."
 CC.WARS7="２（真田幸村－－－－，Ｈ真是让人钦佩的勇士啊！！！）"
 CC.WARS8="２（真田兄，一六一五年大阪城再会吧！Ｈ那时我的名字是......）"
 CC.WARS9="罗汉伏魔功恢复生命"
 CC.WARS10="紫霞神功恢复内力"
 CC.WARS11="混元功恢复体力"
 CC.WARS12="盲目状态恢复"
 CC.WARS13="铁掌"
 CC.WARS14="１哈哈哈－－－，苗人凤，你终于死于我手了！今日方解多年之恨！"
 CC.WARS15="田归农攻防轻能力各提升20点 学会苗家剑法"
 CC.WARS16="１Ｒ龙儿－－－－－－！Ｈ５啊－－－－４－－－－３－－－－２－－－－１－－－－－－－－！！！"
 CC.WARS17="水镜四奇云体风身蓄力完毕"
 CC.WARS18="%s发动离合参商反击"
 CC.WARS19="%s发动斗转星移反击"
 CC.WARS20="%s发动北斗移辰反击"
 CC.WARS21="１（唉，这些年轻人闯荡江湖也不容易，也罢，此战就以Ｒ太祖长拳Ｗ来陪你们玩玩吧！）"
 CC.WARS22="太祖长拳"
 CC.WARS23="降龙三叠浪"
 CC.WARS24="教单于折箭 六军辟易 奋英雄怒"
 CC.WARS25="虽万千人吾往矣"
 CC.WARS26="胡汉恩仇  须倾英雄泪"
 CC.WARS27="日出东方  唯我不败"
 CC.WARS28="暴击加力"
 CC.WARS29="暴击"
 CC.WARS30="连击"
 CC.WARS31='·战吼'
 CC.WARS32='葵花神功加力'
 CC.WARS33="北冥神功"
 CC.WARS34="吸星大法"
 CC.WARS35="化功大法"
 CC.WARS36="擒龙功加力"
 CC.WARS37="小无相功加力"
 CC.WARS38="先天功加力"
 CC.WARS39="天罡真气·"
 CC.WARS40="乾坤大挪移加力"
 CC.WARS41="九阳神功加力"
 CC.WARS42="魔帝·吸星"
 CC.WARS43="神照经·无影神拳"
 CC.WARS44="胡刀苗剑 归真合一"
 CC.WARS45="魔音·碧海潮生曲"
 CC.WARS46="铁尸之怨念"
 CC.WARS47="中平神枪"
 CC.WARS48="西狂之怒啸"
 CC.WARS49="西狂之震怒·雷霆狂啸"
 CC.WARS50="七弦无琴剑气"
 CC.WARS51="剑胆琴心 笑傲江湖"
 CC.WARS52="万法自然"
 CC.WARS53="福泽加护"
 CC.WARS54="葵花点穴手"
 CC.WARS55="七心海棠"
 CC.WARS56="大轮密宗·火焰刀"
 CC.WARS57="混元霹雳功加力"
 CC.WARS58="魔相·幻阴"
 CC.WARS59='太极拳借力打力'
 CC.WARS60="灵鹫宫绝学·生死符"
 CC.WARS61="打狗棒法绝学--天下无狗"
 CC.WARS62="重剑真传·浪如山涌剑如虹"
 CC.WARS63="暗箭·扇中钉"
 CC.WARS64="火凤燎原"
 CC.WARS65="炎枪素浅鸣·无双乱舞皆传"
 CC.WARS66="炎枪素浅鸣·真无双乱舞"
 CC.WARS67="炎枪素浅鸣·无双乱舞"
 CC.WARS68="二天一流秘奥义·万物一空"
 CC.WARS69="毗沙门天之加护"
 CC.WARS70="真辟邪剑法·葵花刺目"
 CC.WARS71="盲目状态·攻击无效"
 CC.WARS72="+会心之一击"
 CC.WARS73="会心之一击"
 CC.WARS74="+蓄力攻击"
 CC.WARS75="蓄力攻击"
 CC.WARS76="%s修炼%s到登峰造极"
 CC.WARS77="%s 升为 %d 级"
 CC.WARS78="云体风身反攻"  
 CC.WARS79="+防御状态"
 CC.WARS80="防御状态"
 CC.WARS81="九阳神功护体"
 CC.WARS82="擒龙功护体"
 CC.WARS83="小无相功护体"
 CC.WARS84="混元霹雳功护体"
 CC.WARS85="先天功护体"
 CC.WARS86="日月·同辉"
 CC.WARS87="北冥真气"
 CC.WARS88="离合参商"
 CC.WARS89="斗转星移"
 CC.WARS90="北斗移辰"
 CC.WARS91="+森罗万象"
 CC.WARS92="森罗万象"
 CC.WARS93="无根无形"
 CC.WARS94="葵花移形"
 CC.WARS95="酒神秘踪步"
 CC.WARS96="凌波微步"
 CC.WARS97="葵花移形"
 CC.WARS98="天机身法"
 CC.WARS99="秘传·破掌式"
 CC.WARS100="秘传·破剑式"
 CC.WARS101="秘传·破刀式"
 CC.WARS102="秘传·破棍式"
 CC.WARS103="秘传·破气式"
 CC.WARS104="天罡护体"
 CC.WARS105="+天罡护体"
 CC.WARS106='反弹'
 CC.WARS107="·双"
 CC.WARS108='真--逆运筋脉走火入魔'
 CC.WARS109='走火入魔'
 CC.WARS110="九阳神功反震"
 CC.WARS111='起死回生'	
 CC.WARS112="先天一阳 起死回生"
 CC.WARS113="阎王敌 重生"
 CC.WARS114="天地独尊"
 CC.WARS115="+太极奥义"
 CC.WARS116="太极奥义--四两拨千斤"
 CC.WARS117="+怒气爆发"
 CC.WARS118="怒气爆发"
 CC.WARS119="+云体风身"
 CC.WARS120="云体风身"
 CC.WARS121="防御开始"
 CC.WARS122="蓄力失败"
 CC.WARS123="蓄力成功"
 CC.WARS124="%s 获得经验点数 %d"
 CC.WARS125="%s 升级了"
 CC.WARS126="%s 修炼 %s 成功"
 CC.WARS127="%s 升为第%s级"  
 CC.WARS128="修习会减少生命值"
 CC.WARS129="八门回天"
 CC.WARS130="·狮王之咆哮"
   
   
   CC.SrcCharSet=0;         --源代码的字符集 0 gb  1 big5，用于转换R×。 如果源码被转换为big5，则应设为1
   CC.OSCharSet=CONFIG.OSCharSet;         --OS 字符集，0 GB, 1 Big5
   CC.FontName=CONFIG.FontName;    --显示字体

   CC.ScreenW=CONFIG.Width;          --显示窗口宽高
   CC.ScreenH=CONFIG.Height;
   
   
   --定义记录文件名。S和D由于是固定大小，因此不再定义idx了。
   CC.R_IDXFilename={[0]=CONFIG.DataPath .. "ranger.idx",
                     CONFIG.DataPath .. "r1.idx",
					 CONFIG.DataPath .. "r2.idx",
					 CONFIG.DataPath .. "r3.idx",};
   CC.R_GRPFilename={[0]=CONFIG.DataPath .. "ranger.grp",
                     CONFIG.DataPath .. "\\SAVE\\r1.grp",
					 CONFIG.DataPath .. "\\SAVE\\r2.grp",
					 CONFIG.DataPath .. "\\SAVE\\r3.grp",};
   CC.S_Filename={[0]=CONFIG.DataPath .. "allsin.grp",
                  CONFIG.DataPath .. "\\SAVE\\s1.grp",
				  CONFIG.DataPath .. "\\SAVE\\s2.grp",
				  CONFIG.DataPath .. "\\SAVE\\s3.grp",};

   CC.TempS_Filename=CONFIG.DataPath .. "allsinbk.grp";

   CC.D_Filename={[0]=CONFIG.DataPath .. "alldef.grp",
                   CONFIG.DataPath .. "\\SAVE\\d1.grp",
				   CONFIG.DataPath .. "\\SAVE\\d2.grp",
				   CONFIG.DataPath .. "\\SAVE\\d3.grp",};

   CC.PaletteFile=CONFIG.DataPath .. "mmap.col";
   
  

   CC.FirstFile=CONFIG.PicturePath .. "title.png";
   CC.DeadFile=CONFIG.PicturePath .. "dead.png";
   CC.TF=CONFIG.PicturePath .. "DA.png";

   CC.MMapFile={CONFIG.DataPath .. "earth.002",
                CONFIG.DataPath .. "surface.002",
				CONFIG.DataPath .. "building.002",
		        CONFIG.DataPath .. "buildx.002",
				CONFIG.DataPath .. "buildy.002"};

   --各种贴图文件名。
   CC.MMAPPicFile={CONFIG.DataPath .. "mmap.idx",CONFIG.DataPath .. "mmap.grp"};
   CC.SMAPPicFile={CONFIG.DataPath .. "smap.idx",CONFIG.DataPath .. "smap.grp"};
   CC.WMAPPicFile={CONFIG.DataPath .. "wmap.idx",CONFIG.DataPath .. "wmap.grp"};
   CC.EffectFile={CONFIG.DataPath .. "eft.idx",CONFIG.DataPath .. "eft.grp"};
   CC.FightPicFile={CONFIG.DataPath .. "fight%03d.idx",CONFIG.DataPath .. "fight%03d.grp"};  --此处为字符串格式，类似于C中printf的格式。

   CC.HeadPicFile={CONFIG.DataPath .. "atmb.idx",CONFIG.DataPath .. "atmb.grp"};
   CC.ThingPicFile={CONFIG.DataPath .. "thing.idx",CONFIG.DataPath .. "thing.grp"};
   CC.SXTFDJ={CONFIG.DataPath .. "tfdj.idx",CONFIG.DataPath .. "tfdj.grp"};
   
   if CONFIG.MP3==1 then
      CC.MIDIFile=CONFIG.SoundPath .. "game%02d.MP3";
   else
      CC.MIDIFile=CONFIG.SoundPath .. "game%02d.MID";
   end
   CC.ATKFile=CONFIG.SoundPath .. "atk%02d.wav";
   CC.ATKFileM=CONFIG.SoundPath .. "atk%02d.MP3";
   CC.EFile=CONFIG.SoundPath .. "e%02d.wav";

   CC.WarFile=CONFIG.DataPath .. "war.sta";
   CC.WarMapFile={CONFIG.DataPath .. "warfld.idx",
                  CONFIG.DataPath .. "warfld.grp"};

   CC.TalkIdxFile=CONFIG.ScriptPath .. "oldtalk.idx";
   CC.TalkGrpFile=CONFIG.ScriptPath .. "oldtalk.grp";
   
   CC.KDEFFILE=CONFIG.DataPath .. "Kdef.grp";
   CC.T1={"零","镜","奇","二","四","七","水","雨","客","萧"};
   
   
  
   --定义记录文件R×结构。  lua不支持结构，无法直接从二进制文件中读取，因此需要这些定义，用table中不同的名字来仿真结构。
   CC.TeamNum=6;          --队伍人数
   CC.MyThingNum=200      --主角物品数量
   CC.Kungfunum=10   --角色武功数量
   
   BASEDATA={ 
   "人X",  
   "人Y",  
   "人X1", 
   "人Y1",   
   "队伍1",
   "队伍2",
   "队伍3",
   "队伍4",
   "队伍5",
   "队伍6"}
   
   WZ="未知"
   WZ1="未知1"
   WZ2="未知2"
   WZ3="未知3"
   WZ4="未知4"  
   WZ5="未知5"
   WZ6="未知6"
   WZ7="未知7"

   CC.Base_S={};         --保存基本数据的结构，以便以后存取
   CC.Base_S["乘船"]={0,0,2}   -- 起始位置(从0开始)，数据类型(0有符号 1无符号，2字符串)，长度
   CC.Base_S["无用"]={2,0,2};
   CC.Base_S["人X"]={4,0,2};
   CC.Base_S["人Y"]={6,0,2};
   CC.Base_S["人X1"]={8,0,2};
   CC.Base_S["人Y1"]={10,0,2};
   CC.Base_S["人方向"]={12,0,2};
   CC.Base_S["船X"]={14,0,2};
   CC.Base_S["船Y"]={16,0,2};
   CC.Base_S["船X1"]={18,0,2};
   CC.Base_S["船Y1"]={20,0,2};
   CC.Base_S["船方向"]={22,0,2};

   for i=1,CC.TeamNum do
        CC.Base_S["队伍" .. i]={24+2*(i-1),0,2};
   end

   for i=1,CC.MyThingNum do
        CC.Base_S["物品" .. i]={36+4*(i-1),0,2};
        CC.Base_S["物品数量" .. i]={36+4*(i-1)+2,0,2};
   end

    CC.PersonSize=182;   --每个人物数据占用字节
    CC.Person_S={};      --保存人物数据的结构，以便以后存取
    CC.Person_S["代号"]={0,0,2}
    CC.Person_S["头像代号"]={2,0,2}
    CC.Person_S["生命增长"]={4,0,2}
    CC.Person_S["无用"]={6,0,2}
    CC.Person_S["姓名"]={8,2,10}
    CC.Person_S["外号"]={18,2,10}
    CC.Person_S["性别"]={28,0,2}
    CC.Person_S["等级"]={30,0,2}
    CC.Person_S["经验"]={32,1,2}
    CC.Person_S["生命"]={34,0,2}
    CC.Person_S["生命最大值"]={36,0,2}
    CC.Person_S["受伤程度"]={38,0,2}
    CC.Person_S["中毒程度"]={40,0,2}
    CC.Person_S["体力"]={42,0,2}
    CC.Person_S["物品修炼点数"]={44,0,2}
    CC.Person_S["武器"]={46,0,2}
    CC.Person_S["防具"]={48,0,2}

     for i=1,5 do
        CC.Person_S["出招动画帧数" .. i]={50+2*(i-1),0,2};
        CC.Person_S["出招动画延迟" .. i]={60+2*(i-1),0,2};
        CC.Person_S["武功音效延迟" .. i]={70+2*(i-1),0,2};
     end

    CC.Person_S["内力性质"]={80,0,2}
    CC.Person_S["内力"]={82,0,2}
    CC.Person_S["内力最大值"]={84,0,2}
    CC.Person_S["攻击力"]={86,0,2}
    CC.Person_S["轻功"]={88,0,2}
    CC.Person_S["防御力"]={90,0,2}
    CC.Person_S["医疗能力"]={92,0,2}
    CC.Person_S["用毒能力"]={94,0,2}
    CC.Person_S["解毒能力"]={96,0,2}
    CC.Person_S["抗毒能力"]={98,0,2}

    CC.Person_S["拳掌功夫"]={100,0,2}
    CC.Person_S["御剑能力"]={102,0,2}
    CC.Person_S["耍刀技巧"]={104,0,2}
    CC.Person_S["特殊兵器"]={106,0,2}
    CC.Person_S["暗器技巧"]={108,0,2}


    CC.Person_S["武学常识"]={110,0,2}
    CC.Person_S["品德"]={112,0,2}
    CC.Person_S["攻击带毒"]={114,0,2}
    CC.Person_S["左右互搏"]={116,0,2}
    CC.Person_S["声望"]={118,0,2}

    CC.Person_S["资质"]={120,0,2}
    CC.Person_S["修炼物品"]={122,0,2}
    CC.Person_S["修炼点数"]={124,0,2}

     for i=1,10 do
        CC.Person_S["武功" .. i]={126+2*(i-1),0,2};
        CC.Person_S["武功等级" .. i]={146+2*(i-1),0,2};
     end

     for i=1,4 do
        CC.Person_S["携带物品" .. i]={166+2*(i-1),0,2};
        CC.Person_S["携带物品数量" .. i]={174+2*(i-1),0,2};
     end
    
	CC.TFJL="生命增长"
	 
    CC.ThingSize=190;   --每个人物数据占用字节
    CC.Thing_S={};
    CC.Thing_S["代号"]={0,0,2}
    CC.Thing_S["名称"]={2,2,20}
    CC.Thing_S["名称2"]={22,2,20}
    CC.Thing_S["物品说明"]={42,2,30}
    CC.Thing_S["练出武功"]={72,0,2}
    CC.Thing_S["暗器动画编号"]={74,0,2}
    CC.Thing_S["使用人"]={76,0,2}
    CC.Thing_S["装备类型"]={78,0,2}
    CC.Thing_S["显示物品说明"]={80,0,2}
    CC.Thing_S["类型"]={82,0,2}
    CC.Thing_S["未知5"]={84,0,2}
    CC.Thing_S["未知6"]={86,0,2}
    CC.Thing_S["未知7"]={88,0,2}	
	
    CC.Thing_S["加生命"]={90,0,2}
    CC.Thing_S["加生命最大值"]={92,0,2}
    CC.Thing_S["加中毒解毒"]={94,0,2}
    CC.Thing_S["加体力"]={96,0,2}
    CC.Thing_S["改变内力性质"]={98,0,2}
    CC.Thing_S["加内力"]={100,0,2}

    CC.Thing_S["加内力最大值"]={102,0,2}
    CC.Thing_S["加攻击力"]={104,0,2}
    CC.Thing_S["加轻功"]={106,0,2}
    CC.Thing_S["加防御力"]={108,0,2}
    CC.Thing_S["加医疗能力"]={110,0,2}

    CC.Thing_S["加用毒能力"]={112,0,2}
    CC.Thing_S["加解毒能力"]={114,0,2}
    CC.Thing_S["加抗毒能力"]={116,0,2}
    CC.Thing_S["加拳掌功夫"]={118,0,2}
    CC.Thing_S["加御剑能力"]={120,0,2}

    CC.Thing_S["加耍刀技巧"]={122,0,2}
    CC.Thing_S["加特殊兵器"]={124,0,2}
    CC.Thing_S["加暗器技巧"]={126,0,2}
    CC.Thing_S["加武学常识"]={128,0,2}
    CC.Thing_S["加品德"]={130,0,2}

    CC.Thing_S["加攻击次数"]={132,0,2}
    CC.Thing_S["加攻击带毒"]={134,0,2}
    CC.Thing_S["仅修炼人物"]={136,0,2}
    CC.Thing_S["需内力性质"]={138,0,2}
    CC.Thing_S["需内力"]={140,0,2}

    CC.Thing_S["需攻击力"]={142,0,2}
    CC.Thing_S["需轻功"]={144,0,2}
    CC.Thing_S["需用毒能力"]={146,0,2}
    CC.Thing_S["需医疗能力"]={148,0,2}
    CC.Thing_S["需解毒能力"]={150,0,2}

    CC.Thing_S["需拳掌功夫"]={152,0,2}
    CC.Thing_S["需御剑能力"]={154,0,2}
    CC.Thing_S["需耍刀技巧"]={156,0,2}
    CC.Thing_S["需特殊兵器"]={158,0,2}
    CC.Thing_S["需暗器技巧"]={160,0,2}

    CC.Thing_S["需资质"]={162,0,2}
    CC.Thing_S["需经验"]={164,0,2}
    CC.Thing_S["练出物品需经验"]={166,0,2}
    CC.Thing_S["需材料"]={168,0,2}

      for i=1,5 do
        CC.Thing_S["练出物品" .. i]={170+2*(i-1),0,2};
        CC.Thing_S["需要物品数量" .. i]={180+2*(i-1),0,2};
     end

    CC.SceneSize=52;   --每个场景数据占用字节
    CC.Scene_S={};
    CC.Scene_S["代号"]={0,0,2}
    CC.Scene_S["名称"]={2,2,10}
    CC.Scene_S["出门音乐"]={12,0,2}
    CC.Scene_S["进门音乐"]={14,0,2}
    CC.Scene_S["跳转场景"]={16,0,2}
    CC.Scene_S["进入条件"]={18,0,2}
    CC.Scene_S["外景入口X1"]={20,0,2}
    CC.Scene_S["外景入口Y1"]={22,0,2}
    CC.Scene_S["外景入口X2"]={24,0,2}
    CC.Scene_S["外景入口Y2"]={26,0,2}
    CC.Scene_S["入口X"]={28,0,2}
    CC.Scene_S["入口Y"]={30,0,2}
    CC.Scene_S["出口X1"]={32,0,2}
    CC.Scene_S["出口X2"]={34,0,2}
    CC.Scene_S["出口X3"]={36,0,2}
    CC.Scene_S["出口Y1"]={38,0,2}
    CC.Scene_S["出口Y2"]={40,0,2}
    CC.Scene_S["出口Y3"]={42,0,2}
    CC.Scene_S["跳转口X1"]={44,0,2}
    CC.Scene_S["跳转口Y1"]={46,0,2}
    CC.Scene_S["跳转口X2"]={48,0,2}
    CC.Scene_S["跳转口Y2"]={50,0,2}

    CC.WugongSize=136;   --每个武功数据占用字节
    CC.Wugong_S={};
    CC.Wugong_S["代号"]={0,0,2}
    CC.Wugong_S["名称"]={2,2,10}
    CC.Wugong_S["未知1"]={12,0,2}
    CC.Wugong_S["未知2"]={14,0,2}
    CC.Wugong_S["未知3"]={16,0,2}
    CC.Wugong_S["未知4"]={18,0,2}
    CC.Wugong_S["未知5"]={20,0,2}
    CC.Wugong_S["出招音效"]={22,0,2}
    CC.Wugong_S["武功类型"]={24,0,2}
    CC.Wugong_S["武功动画&音效"]={26,0,2}
    CC.Wugong_S["伤害类型"]={28,0,2}
    CC.Wugong_S["攻击范围"]={30,0,2}
    CC.Wugong_S["消耗内力点数"]={32,0,2}
    CC.Wugong_S["敌人中毒点数"]={34,0,2}

     for i=1,10 do
        CC.Wugong_S["攻击力" .. i]={36+2*(i-1),0,2};
        CC.Wugong_S["移动范围" .. i]={56+2*(i-1),0,2};
        CC.Wugong_S["杀伤范围" .. i]={76+2*(i-1),0,2};
        CC.Wugong_S["加内力" .. i]={96+2*(i-1),0,2};
        CC.Wugong_S["杀内力" .. i]={116+2*(i-1),0,2};
     end

   CC.ShopSize=30;   --每个小宝商店数据占用字节
   CC.Shop_S={};
   for i=1,5 do
      CC.Shop_S["物品" .. i]={0+2*(i-1),0,2};
      CC.Shop_S["物品数量" .. i]={10+2*(i-1),0,2};
      CC.Shop_S["物品价格" .. i]={20+2*(i-1),0,2};
   end

   CC.ShopScene={};       --小宝商店场景数据，sceneid 场景id，d_shop 小宝位置D*, d_leave 小宝离开D*，一般在场景出口，路过触发
   CC.ShopScene[0]={sceneid=1,d_shop=16,d_leave={17,18}, };
   CC.ShopScene[1]={sceneid=3,d_shop=14,d_leave={15,16}, };
   CC.ShopScene[2]={sceneid=40,d_shop=20,d_leave={21,22}, };
   CC.ShopScene[3]={sceneid=60,d_shop=16,d_leave={17,18}, };
   CC.ShopScene[4]={sceneid=61,d_shop=9,d_leave={10,11,12}, };

  --其他常量
  
  
   CC.MWidth=480;       --主地图宽
   CC.MHeight=480;      --主地图高

   CC.SWidth=64;     --子场景地图大小
   CC.SHeight=64;

   CC.DNum=200;       --D*每个场景的事件数

   CC.XScale=CONFIG.XScale;    --贴图一半的宽高
   CC.YScale=CONFIG.YScale;

   CC.Frame=50;     --每帧毫秒数
   CC.SceneMoveFrame=CC.Frame*2;           --场景移动帧速，用于场景移动事件
   CC.PersonMoveFrame=CC.Frame*2;          --主角移动速度，用于主角移动事件
   CC.AnimationFrame=CC.Frame*3;           --动画显示帧速，用于显示动画事件

   CC.WarAutoDelay=300;                   --自动战斗时显示头像的延时

   CC.DirectX={0,1,-1,0};  --不同方向x，y的加减值，用于走路改变坐标值
   CC.DirectY={-1,0,0,1};

   CC.MyStartPic=2501;      --主角走路起始贴图
   CC.BoatStartPic=3715;    --船起始贴图

   CC.Level=30;                  ---人物等级和每等级经验
   CC.Exp={ [0]=0,   50,    150,     300 ,500   , 750 ,
               1050,  1400,   1800 ,2250  , 2750 ,
               3850,  5050,   6350 ,7750  , 9250 ,
               10850, 12550, 14350 ,16750 , 18250 ,
               21400, 24700, 28150 ,31750 , 35500 ,
	           39400, 43450, 47650 ,52000 , 60000  };

    CC.MMapBoat={};    --主地图船可以进入的贴图
	local tmpBoat={ {0x166,0x16a},{0x176,0x17c},{0x1ca,0x1d0},{0x1fa,0x262},{0x3f8,0x3fe},};
    for i,v in ipairs(tmpBoat) do      --把这些数据变换成数组，其中有值就是可以进入
        for j=v[1],v[2],2 do
            CC.MMapBoat[j]=1;
        end
    end

    CC.SceneWater={};    --场景人不能进入的贴图
    local tmpWater={ {0x166,0x16a},{0x176,0x17c},{0x1ca,0x1d0},{0x1fa,0x262},{0x332,0x338},
                     {0x346,0x346},{0x3a6,0x3a8},{0x3f8,0x3fe},{0x52c,0x544},};
    for i,v in ipairs(tmpWater) do      --把这些数据变换成数组，其中空项就是可以进入的贴图
        for j=v[1],v[2],2 do
            CC.SceneWater[j]=1;
        end
    end

    CC.WarWater={};    --战斗地图人不能进入的贴图
    local tmpWater={ {0x166,0x16a},{0x176,0x17c},{0x1ca,0x1d0},{0x1fa,0x262},{0x332,0x338},
                     {0x346,0x346},{0x3a6,0x3a8},{0x3f8,0x3fe},{0x52c,0x544},};
    for i,v in ipairs(tmpWater) do      --把这些数据变换成数组，其中空项就是可以进入的贴图
        for j=v[1],v[2],2 do
            CC.WarWater[j]=1;
        end
    end


    --离队人员列表: {人员id，离队调用函数}      ----如果有新的离队人员加入，直接在这里增加
    CC.PersonExit={{1,950},{2,952},{9,954},{16,956},{17,958},
                   {25,960},{28,962},{29,964},{35,966},{36,968},
                   {37,970},{38,972},{44,974},{45,976},{47,978},
                   {48,980},{49,982},{51,984},{53,986},{54,988},
                   {58,990},{59,992},{61,994},{63,996},{76,998},  }

    --所有可加入人员离队需要清除的D*事件，清除后这些人就找不到了。得到武林帖指令使用
    CC.AllPersonExit={ {0,0},{49,2},{4,1},{44,0},{44,1},{37,5},{30,0},{59,0},{40,3},{56,1},{1,7},{1,8},{1,10},
                       {40,7},{40,8},{77,0},{54,0},{62,3},{62,4},{60,2},{60,15},{52,1},{61,0},{61,8},{78,0},
                       {18,0},{18,1},{69,0},{69,1},{45,0},{52,2},{42,6},{42,7},{8,8},{7,6},{80,1}, };

    CC.BookNum=14;               --天书个数
    CC.BookStart=144;            --14天书起始物品id

    CC.MoneyID=174;              --金钱物品id

    CC.Shemale={ [78]=1,[93]=1}   --需要自宫的书的id
--[[
   CC.Effect={[0]=9,14,17,9,13,                    --eft.idx/grp贴图各个武功效果贴图个数
                 17,17,17,18,19,
                 19,15,13,10,10,
                 15,21,16,9,11,
                 8,9,8,8,7,
                 8,8,9,12,19,
                 11,14,12,17,8,
                 11,9,13,10,19,
                 14,17,19,14,21,
                 16,13,18,14,17,
                 17,16,7,   };]]--
				 
   CC.Effect={[0]=9,14,17,9,13,                    --eft.idx/grp贴图各个武功效果贴图个数
                 17,17,17,18,19,						--NND,不止第一帧有问题，中间还有个也有问题。另外从金水复制过来的，也有两帧有问题
                 19,15,13,10,10,
                 15,21,16,9,11,
                 8,9,8,8,7,
                 8,8,9,12,19,
                 11,14,12,17,8,
                 11,10,13,10,19,
                 14,17,19,14,21,
                 16,13,18,14,17,
                 17,16,7,12,40,
				 16,9,15,15,31,
				 38,24,26,24,20,
				 12,17,14,14,10,
				 10,18,31,12,7,
				 6,7,28,16,7,
				 16,20,15,13,15,
				 11,11,11,20,20,
				 20,17,17,17,9,
				 8,8,17,10,11,
				 8,29,6,13,31,
				 14,4,13,13,15,};
				 
    CC.ExtraOffense={{106,57,100},             --武功武器配合增加攻击力， 依次为：武器物品id，武功id，攻击力增加
                   {107,49,50},
                   {108,49,50},
                   {110,54,80},
                   {115,63,50},
                   {116,67,70},
                   {119,68,100},}

    CC.NewPersonName="徐小侠";                --新游戏的数据
    CC.NewGameSceneID=70;                      --场景ID
    CC.NewGameSceneX=19;                       --场景坐标
    CC.NewGameSceneY=20;
    CC.NewGameEvent=691;                       --新游戏场景执行事件。如果没有，则看新游戏坐标后面有没有事件。691
    CC.NewPersonPic=3445;                      --开始主角pic

   CC.PersonAttribMax={};             --人物属性最大值
   CC.PersonAttribMax["经验"]=60000;
   CC.PersonAttribMax["物品修炼点数"]=60000;
   CC.PersonAttribMax["修炼点数"]=60000;
   CC.PersonAttribMax["生命最大值"]=999;
   CC.PersonAttribMax["受伤程度"]=100;
   CC.PersonAttribMax["中毒程度"]=100;
   CC.PersonAttribMax["内力最大值"]=999;
   CC.PersonAttribMax["体力"]=100;
   CC.PersonAttribMax["攻击力"]=100;
   CC.PersonAttribMax["防御力"]=100;
   CC.PersonAttribMax["轻功"]=100;
   CC.PersonAttribMax["医疗能力"]=100;
   CC.PersonAttribMax["用毒能力"]=100;
   CC.PersonAttribMax["解毒能力"]=100;
   CC.PersonAttribMax["抗毒能力"]=100;
   CC.PersonAttribMax["拳掌功夫"]=100;
   CC.PersonAttribMax["御剑能力"]=100;
   CC.PersonAttribMax["耍刀技巧"]=100;
   CC.PersonAttribMax["特殊兵器"]=100;
   CC.PersonAttribMax["暗器技巧"]=100;
   CC.PersonAttribMax["武学常识"]=100;
   CC.PersonAttribMax["品德"]=100;
   CC.PersonAttribMax["资质"]=100;
   CC.PersonAttribMax["攻击带毒"]=100;

    CC.WarDataSize=186;         --战斗数据大小  war.sta数据结构
    CC.WarData_S={};        --战斗数据结构
    CC.WarData_S["代号"]={0,0,2};
    CC.WarData_S["名称"]={2,2,10};
    CC.WarData_S["地图"]={12,0,2};
    CC.WarData_S["经验"]={14,0,2};
    CC.WarData_S["音乐"]={16,0,2};
    for i=1,6 do
        CC.WarData_S["手动选择参战人"  .. i]={18+(i-1)*2,0,2};
        CC.WarData_S["自动选择参战人"  .. i]={30+(i-1)*2,0,2};
        CC.WarData_S["我方X"  .. i]={42+(i-1)*2,0,2};
        CC.WarData_S["我方Y"  .. i]={54+(i-1)*2,0,2};
    end
    for i=1,20 do
        CC.WarData_S["敌人"  .. i]={66+(i-1)*2,0,2};
        CC.WarData_S["敌方X"  .. i]={106+(i-1)*2,0,2};
        CC.WarData_S["敌方Y"  .. i]={146+(i-1)*2,0,2};
    end
	
	
    CC.WarWidth=64;        --战斗地图大小
    CC.WarHeight=64;

	--显示主地图和场景地图坐标
	--如果显示坐标，则会增加cpu占用。机器速度慢的话可能会卡。这个在调试时有用。
	--注意: 如果设置了CONFIG.FastShowScreen=1，则场景视角范围超出后显示的坐标不正确。
	CC.ShowXY=0      --0 不显示 1 显示

	--以下为控制显示方式的参数

	CC.RowPixel=4         -- 每行字的间距像素数

	CC.MenuBorderPixel=5  -- 菜单四周边框留的像素数，也用于绘制字符串的box四周留得像素
	

	if CONFIG.Type==0 then      --320*240显示方式
		CC.DefaultFont=16

		CC.StartMenuFontSize=16  --开始菜单字号

		CC.NewGameFontSize =16   --新游戏属性选择字号

		CC.MainMenuX=10;         --主菜单开始坐标
		CC.MainMenuY=10;

		CC.GameOverX=90;
		CC.GameOverY=65;

        CC.PersonStateRowPixel= 1;    --显示人物状态行间距像素

	elseif CONFIG.Type==1 then  --640*480显示方式
		CC.DefaultFont=math.modf(math.min(CC.ScreenW,CC.ScreenH)/20);

		CC.StartMenuFontSize=math.modf(math.min(CC.ScreenW,CC.ScreenH)/15);

		CC.NewGameFontSize =math.modf(math.min(CC.ScreenW,CC.ScreenH)/20);

		CC.MainMenuX=10;
		CC.MainMenuY=10;

		CC.GameOverX=255;
		CC.GameOverY=165;

        CC.PersonStateRowPixel= 4;  --显示人物状态行间距像素

	end

    CC.StartMenuY=CC.ScreenH-3*(CC.StartMenuFontSize+CC.RowPixel)-20;
	CC.NewGameY=CC.ScreenH-4*(CC.NewGameFontSize+CC.RowPixel)-10;

	--子菜单的开始坐标
	CC.MainSubMenuX=CC.MainMenuX+2*CC.MenuBorderPixel+2*CC.DefaultFont+5;       --主菜单为两个汉字
	CC.MainSubMenuY=CC.MainMenuY;

	--二级子菜单开始坐标
	CC.MainSubMenuX2=CC.MainSubMenuX+2*CC.MenuBorderPixel+4*CC.DefaultFont+5;   --子菜单为四个字符

	CC.SingleLineHeight=CC.DefaultFont+2*CC.MenuBorderPixel+5;  --带框的单行字符高

	------------------------以下为物品菜单参数
	if CONFIG.Type==0 then
		CC.ThingFontSize = 16;

		CC.ThingPicWidth=40;    --物品图片宽高
		CC.ThingPicHeight=40;

		CC.MenuThingXnum=5      --一行显示几个物品
		CC.MenuThingYnum=3      --物品显示几列

		CC.ThingGapOut=10;      --物品图像显示四周留白
		CC.ThingGapIn=5;        --物品图像显示中间间隔

	elseif CONFIG.Type==1 then

		CC.ThingFontSize = 24;  --

		CC.ThingPicWidth=40;    --物品图片宽高
		CC.ThingPicHeight=40;

		CC.MenuThingXnum=10      --一行显示几个物品
		CC.MenuThingYnum=5      --物品显示几列

		CC.ThingGapOut=10;      --物品图像显示四周留白
		CC.ThingGapIn=10;        --物品图像显示中间间隔
	end

	if CONFIG.Zoom == 1 then--or CONFIG.Zoom == 0 then
		CC.ThingPicWidth=80;    --物品图片宽高
		CC.ThingPicHeight=80;
		local n
		n=math.modf(CC.ScreenW*0.75/80)
		if CC.MenuThingXnum>n then
			CC.MenuThingXnum=n
		end
		n=math.modf(CC.ScreenH*0.65/80)
		if CC.MenuThingYnum>n then
			CC.MenuThingYnum=n
		end
	end

    --场景视角范围。超出此范围则只移动主角，场景不移动了。也就是主角不在屏幕中央了
	if CONFIG.Type==0 then      --320*240显示方式
        CC.SceneXMin=12
        CC.SceneYMin=12
        CC.SceneXMax=45;
        CC.SceneYMax=45;
	elseif CONFIG.Type==1 then
        CC.SceneXMin=11
        CC.SceneYMin=11
        CC.SceneXMax=47;
        CC.SceneYMax=47;
	end

	CC.SceneFlagPic={2749,2846}    --场景贴图中旗帜的贴图编号。

	if CONFIG.FastShowScreen==0 then
        CC.ShowFlag=1;                 --0 不显示旗帜动画 1 显示。不显示旗帜动画可以增加场景中主角不动时的显示速度
		if CONFIG.Type==1 then
            CC.AutoWarShowHead=1;          --1 战斗时一直显示头像 0 不显示。如果设为1，则战斗时将重绘整个屏幕，会降低显示速度。
		else
		    CC.AutoWarShowHead=0;
		end
	else
        CC.ShowFlag=0;
		CC.AutoWarShowHead=0;
	end

    CC.LoadThingPic=1           --读取物品贴图方式 0 从mmap/smap/wmap中读取  1 读取独立的thing.idx/grp
	CC.StartThingPic=0          --物品贴图在mmap/smap/wmap中的起始编号。CC.LoadThingPic=0有效


end

   
   GZM={'二','三','四','五','六','七','八','九','十'}
  
   SZB={'一','二','三','四','五','六','七','八','九','十',
             '十一','十二','十三','十四','十五','十六','十七','十八','十九','二十'}
   
   LMSJ={'少商剑','商阳剑','中冲剑','关冲剑','少冲剑','少泽剑'}
   XL18={'亢龙有悔','见龙在田','飞龙在天','双龙出水','神龙摆尾','潜龙勿用'}			
   XL18JY={'极意--亢龙·鸿渐於陆','极意--飞龙·或跃在渊','极意--潜龙·密雨不云','极意--神龙·震惊百里','极意--见龙·利涉大川','极意--双龙·突如其来','极意--六龙·履霜冰至','极意--龙战·损则有孚'}
   HDZC={'真传·云龙三现','秘技·上步摘星刀','秘技·鹞子翻身刀'}
   TFSSJ={"·『天道惊雷憾』"  , "·『一剑镇神洲』" ,  "·『羽葬煌炎斩』",  "·『千机龙绝闪』"  , "·『斗焰罡霸体』" ,"·『侠行天下』","·『八门聚万象』"}
   
   ZJTF={
      "灵犀真拳",--ok
	  "剑神一笑",--ok
	  "傲世狂刀",--ok
	  "棍藏天机",--ok
	  "绝世天罡",--ok
	  "仁者无敌",--ok
	  "回天圣手" };
	  
	TFE={"拳","剑","刀","特","罡","仁","医"}
	
	KJDYSAVE={"存档一","存档二","存档三","不存档"}
	KJDYLOAD={"存档一","存档二","存档三","不读档"}
	
	WARSZJY={
		 3,2,5,2,40,15,5,5,5,5,
		 5,5,5,5,3,2,2,10,5,4,
		 4,5,4,2,2,20,40,2,3,3,
		 3,3,3,3,5,3,4,4,8,8,
		 4,4,4,4,2,5,3,4,3,30,
		 4,2,3,3,4,4,15,5,5,15,
		 3,15,3,15,10,2,8,3,15,7,
		 8,3,3,3,4,2,2,2,2,4,
		 2,2,2,3,2,2,2,2,2,2,
		 2,2,2,2,2,2,7,7,4,4,
		 2,2,12,2,2,2,3,3,3,3,
		 3,7,7,50,3,3,5,6,3,3,
		 3,3,3,3,3,3,3,3,20,3,
		 3,3,3,3,3,3,2,3,2,35,
		 2,2,2,2,2,2,2,2,3,3,
		 3,3,3,3,3,3,3,3,3,3,
		 3,3,3,3,3,3,3,3,3,3,
		 4,3,4,4,4,2,2,2,2,2,
		 2,2,3,7,7,4,3,5,5,3 };
	  
   RWWH={};
    RWWH[50]="狂龙天征"
	RWWH[53]="六脉真传"
	RWWH[67]="铁掌帮主"
	RWWH[51]="姑苏慕容"
	RWWH[35]="九剑传人"
	RWWH['35']='剑魔再临'
	RWWH[69]="北丐"
	RWWH[27]="唯我不败"
	RWWH[64]="顽童武痴"
	RWWH[55]="侠之大者"
	RWWH[58]="西狂"
	RWWH[59]="联心素女"
	RWWH[9]="九阳明尊"
	RWWH[76]="琅嬛仙子"
	RWWH[75]="天池红花"
	RWWH[37]="真名神照"
	RWWH[56]="奇术无双"
	RWWH[60]="西毒"
	RWWH[1]="雪山飞狐"
	RWWH[54]="气侠风雷"
	RWWH[2]="毒手药仙"
	RWWH[16]="蝶谷医仙"
	RWWH[28]="杀人名医"
	RWWH[45]="阎王敌"
	RWWH[6]="月月轻松"	
	RWWH[114]="达摩再世" 
	RWWH[5]="太极宗师"
	RWWH[103]="大轮明王"
	RWWH[48]="冰毒怪客"
	RWWH[47]="铁丑之主"
	RWWH[129]="中神通"
	RWWH[57]="桃花岛主"
	RWWH[65]="南僧"
	RWWH[63]="青萧落瑛"
	RWWH[78]="铁尸魔煞"
	RWWH[73]="日月圣姑"
	RWWH[36]="辟邪剑客"
	RWWH[29]="万里独行"
	RWWH[72]="天龙掌门"
	RWWH[4]="雁过拨毛"	
    RWWH[25]="五毒教主"	
    RWWH[83]="铁袖拂风"	
    RWWH[17]="毒手姑婆"	
    RWWH[91]="青青子衿"	
    RWWH[74]="翠羽黄衫"	
    RWWH[80]="火手判官"	
    RWWH[62]="元蒙帝师"		
	RWWH[84]="吾乃蛮夷"	
    RWWH[85]="老谋深算"	
    RWWH[66]="波斯圣女"		
	RWWH[81]="灵獒毒娇"	
    RWWH[77]="鸳鸯刀客"	
    RWWH[88]="酒神"	
	RWWH[89]="食神"
    RWWH[90]="毓秀灵姝"	
    RWWH[44]="凶神恶煞"
	RWWH[52]="中平神枪"
	RWWH[82]="玉面孟尝"
	RWWH[92]="我本佳人"
	RWWH[97]="茹毛饮血"
	RWWH[79]="慧中灵剑"
	RWWH[26]="日月魔帝"
	RWWH[553]="真田一之兵"
	RWWH['01']="苍半无双"
	RWWH['01b']="真苍半无双"
	RWWH['02']="百花谷主"
	RWWH['03']="血翼军神"
	RWWH['04']="觉醒之苍龙"
	RWWH['49']="逍遥掌门"
	RWWH['38']="白首太玄"
	
   RWTFLB={};
	RWTFLB[50]="奋英雄怒"
	RWTFLB[49]="福缘深厚"
	RWTFLB[35]="灵奇洒脱"
	RWTFLB[55]="大器晚成"
	RWTFLB[58]="逆流勇进"
	RWTFLB[76]="博闻强记"
	RWTFLB[56]="兰心慧质"
	RWTFLB[38]="质朴刚健"
	RWTFLB[6]="那个不痛"
	RWTFLB[1]="魂系一刀"
	RWTFLB[37]="赤心连城"
	RWTFLB[53]="磊落仁心"
	RWTFLB[51]="离合参商"
	RWTFLB[48]="心无所住"
	RWTFLB[64]="童真永留"
	RWTFLB[60]="倒行逆施"
	RWTFLB[63]="外和内刚"
	RWTFLB[87]="媚眼如丝"
	RWTFLB[86]="倾国倾城"
	RWTFLB[73]="琴铮盈盈"
	RWTFLB[74]="巾帼之才"
	RWTFLB[80]="勇猛精进"
	RWTFLB[59]="冷剑冰花"
	RWTFLB[9]="谁与争峰"
	RWTFLB[82]="我为伊狂"
	RWTFLB[54]="志垂日月"
	RWTFLB[553]="赤胆忠魂"
	RWTFLB['01']="颖悟绝伦"
	RWTFLB['02']="万般皆通"
	RWTFLB['03']="慈严掌兵"

	TeamP={  
 0,1,2,4,9,16,
 17,25,28,29,30,
 35,36,37,38,44,
 45,47,48,49,51,
 52,53,54,55,56,
 58,59,63,66,72,
 73,74,75,76,77,
 78,79,80,81,82,
 83,84,85,86,87,
 88,89,90,91,92};
   
   FLHSYL={
    "其疾如风",
	"其徐如林",
	"侵略如火",
	"不动如山",
	"难知如阴",
	"动如雷震",
	"六如苍龙诀"};
	
   YYGZT={"风林火山功",
                "六如苍龙诀"};
				
	TSXMLB={"零二七","水镜四奇","萧雨客"}			
	
	MODEXZ={
	
	"初次接触本作和不擅长玩游戏者",
	"请选择『初入江湖』模式"};
	
	MODEXZ2={"初入江湖","千锤百炼","龙形舞天"}
	
	TFXZSAY1=" 朔雪飘飘开雁门 * 平沙历乱卷蓬根 * 功名耻计擒生数 * 直斩楼兰报国恩 "
	TFXZSAY2=" 【灵犀真拳】 * 【剑神一笑】 * 【傲世狂刀】 * 【棍藏天机】 * 【绝世天罡】 * 【仁者无敌】 * 【回天圣手】 "  
	
	XKXSJ={
	"赵客缦胡缨 吴钩霜雪明",
	"十步杀一人 千里不留行",
	"纵死侠骨香 不惭世上英",
	"谁能书阁下 白首太玄经"};
	
	GRTS={};
	GRTS[53]="凌波";
	GRTS[49]="催符";
	GRTS[89]="气补";
	GRTS[9]="挪移"
	GRTS[88]="传功";

	GRTSSAY={}
	GRTSSAY[53]="效果：至该角色下次行动为止*      闪避机率大幅提升*条件：消耗体力10点"
	GRTSSAY[49]="效果：催动敌人身上的生死符*      使其封穴25时序*条件：消耗体力5点 内力500点"
    GRTSSAY[89]="效果：回复指定邻接队友体力50点*条件：消耗体力25点 内力300点"
    GRTSSAY[9]="效果：将八格范围内的我方任一队友*      挪移到指定位置*条件：消耗体力10点 内力500点"
    GRTSSAY[88]="效果：将五格范围内我方任一队友*      当前集气提升500点*条件：消耗体力10点 内力700点"
    

function SetModify()

   
   --Menu_System_old=Menu_System;         --备份原始函数，如果新的函数需要，还可以调用原始函数。
   --Menu_System=Menu_System_new;

   --ExecDoctor_old=ExecDoctor;         --新的医疗函数
   --ExecDoctor=ExecDoctor_new;

   --War_PersonLostLife_old=War_PersonLostLife;         --新的中毒减少生命函数
   --War_PersonLostLife=War_PersonLostLife_new;

   instruct_11_old=instruct_11;         --新的指令
   instruct_11=instruct_11_new;

   instruct_45_old=instruct_45;
   instruct_45=instruct_45_new;

   instruct_46_old=instruct_46;
   instruct_46=instruct_46_new;

   instruct_47_old=instruct_47;
   instruct_47=instruct_47_new;

   instruct_48_old=instruct_48;
   instruct_48=instruct_48_new;
   
   DrawBoxTitle=NewDrawBoxTitle

   --在此定义特殊物品。没有定义的均调用缺省物品函数
    JY.ThingUseFunction[182]=Show_Position;     --罗盘函数


--修改CC的常量

	CC.FontBIG=math.modf(math.min(CC.ScreenW,CC.ScreenH)/12)	--最大，未使用	640x480时size=40
	CC.FontBig=math.modf(math.min(CC.ScreenW,CC.ScreenH)/15)	--较大，游戏开始菜单使用	640x480时size=32
	CC.Fontbig=math.modf(math.min(CC.ScreenW,CC.ScreenH)/20)	--通常字号，对话菜单等使用	640x480时size=24
	CC.Fontsmall=math.modf(math.min(CC.ScreenW,CC.ScreenH)/24)	--稍小字号	640x480时size=20
	CC.FontSmall=math.modf(math.min(CC.ScreenW,CC.ScreenH)/30)	--较小字号	640x480时size=16
	CC.FontSMALL=math.modf(math.min(CC.ScreenW,CC.ScreenH)/40)	--最小字号	640x480时size=12
	CC.RowPixel=math.modf(math.min(CC.ScreenW,CC.ScreenH)/100)         -- 每行字的间距像素数
   --各种贴图文件名。
   CC.SMAPPicFile={CONFIG.DataPath .. "sdx",CONFIG.DataPath .. "smp"};
   CC.WMAPPicFile={CONFIG.DataPath .. "wdx",CONFIG.DataPath .. "wmp"};
   CC.FightPicFile={CONFIG.DataPath .. "\\fight\\fdx%03d",CONFIG.DataPath .. "\\fight\\fmp%03d"};  --此处为字符串格式，类似于C中printf的格式。

       --离队人员列表: {人员id，离队调用函数}      ----如果有新的离队人员加入，直接在这里增加
    CC.PersonExit={{1,100},{2,102},{4,104},{9,106},{16,108},
                   {17,110},{25,112},{28,114},{29,116},{30,118},
                   {35,120},{36,122},{37,124},{38,126},{44,128},
                   {45,130},{47,132},{48,134},{49,136},{51,138},
                   {52,140},{53,142},{54,144},{55,146},{56,148},
                   {58,150},{59,152},{63,154},{66,156},{72,158},
                   {73,160},{74,162},{75,164},{76,166},{77,168},
                   {78,170},{79,172},{80,174},{81,176},{82,178},
                   {83,180},{84,182},{85,184},{86,186},{87,188},
                   {88,190},{89,192},{90,194},{91,196},{92,198},

				   };


    CC.ExtraOffense={{52,75,100},             --武功武器配合增加攻击力， 依次为：武器物品id，武功id，攻击力增加
                   {45,67,100},
                   {37,41,100},
                   {49,80,200},
                   {44,63,150},
                   {40,40,150},
                   {36,45,100},}

   CC.PersonAttribMax={};             --人物属性最大值
   CC.PersonAttribMax["经验"]=60000;
   CC.PersonAttribMax["物品修炼点数"]=30000;
   CC.PersonAttribMax["修炼点数"]=30000;
   CC.PersonAttribMax["生命最大值"]=999;
   CC.PersonAttribMax["受伤程度"]=100;
   CC.PersonAttribMax["中毒程度"]=100;
   CC.PersonAttribMax["内力最大值"]=5000;
   CC.PersonAttribMax["体力"]=100;
   CC.PersonAttribMax["攻击力"]=500;
   CC.PersonAttribMax["防御力"]=500;
   CC.PersonAttribMax["轻功"]=500;
   CC.PersonAttribMax["医疗能力"]=240;
   CC.PersonAttribMax["用毒能力"]=240;
   CC.PersonAttribMax["解毒能力"]=240;
   CC.PersonAttribMax["抗毒能力"]=240;
   CC.PersonAttribMax["拳掌功夫"]=240;
   CC.PersonAttribMax["御剑能力"]=240;
   CC.PersonAttribMax["耍刀技巧"]=240;
   CC.PersonAttribMax["特殊兵器"]=240;
   CC.PersonAttribMax["暗器技巧"]=240;
   CC.PersonAttribMax["武学常识"]=100;
   CC.PersonAttribMax["品德"]=100;
   CC.PersonAttribMax["资质"]=100;
   CC.PersonAttribMax["攻击带毒"]=240;


    CC.NewPersonName="徐小侠";                --新游戏的数据
    CC.NewGameSceneID=70;                      --场景ID
    CC.NewGameSceneX=16;                       --场景坐标
    CC.NewGameSceneY=31;
    CC.NewGameEvent=691;                       --新游戏场景执行事件。如果没有，则执行新游戏坐标路过事件。691
    CC.NewPersonPic=2515;                      --开始主角pic


    CC.LoadThingPic=1              --读取物品贴图方式 0 从mmap/smap/wmap中读取  1 读取独立的thing.idx/grp
	CC.StartThingPic=4131          --物品贴图在mmap/smap/wmap中的起始编号。CC.LoadThingPic=0有效
	CC.forg=false
	CC.KRP='.\\data\\kdef.grp'
	CC.KDX='.\\data\\kdef.idx'
	CC.TRP='.\\data\\talk.grp'
	CC.TDX='.\\data\\talk.idx'
	
	CC.MapKind=1;
	CC.MapSize=16;
	
	CC.AddAtk={
						{10,15,50},
						{11,15,50},
						{12,15,50},
						{13,15,50},
						{14,15,50},
						{48,47,100},
						{47,50,100},
						{53,76,100},
						{79,36,60},
						{74,75,50},
						{59,58,100},
						{54,91,100},
						{99,70,100},
						{119,65,50},
						{120,65,50},
						{121,65,50},
						{122,65,50},
						{68,129,50},
						{123,129,50},
						{124,129,50},
						{125,129,50},
						{126,129,50},
						{127,129,50},
						{128,129,50},
						};
	CC.AddDef={
						{76,51,100},
						{55,56,50},
						{56,55,100},
						{35,73,100},
						{79,36,60},
						{73,35,50},
						{74,75,50},
						{58,59,50},
						{59,58,50},
						{66,9,50},
						{91,54,100},
						{119,65,50},
						{120,65,50},
						{121,65,50},
						{122,65,50},
						{68,129,50},
						{123,129,50},
						{124,129,50},
						{125,129,50},
						{126,129,50},
						{127,129,50},
						{128,129,50},
						};
	CC.AddSpd={
						{25,35,50},
						{90,53,50},
						{55,56,100},
						{56,55,50},
						{35,79,100},
						{73,35,50},
						{74,75,50},
						{58,59,100},
						{63,58,60},
						{83,54,50},
						};
	CC.AddDoc={
						{2,1,120},
						{16,17,50},
						};
	CC.AddPoi={
						{17,16,50},
						};
	CC.Timer={
						stime=0,
						status=0,
						str='',
						len=0,
						fun=demostr,
					};
	CC.KfName={
	                     {2,'饭来张口',600},   --逍遥游3招
						{2,'沿门托钵',600},
						{2,'见人伸手',600},
						{3,'五毒摧心',700},
						{4,'锁喉',700},
						{4,'探目',700},
						{5,'寒冰封体',700},
						{6,'天罗地网',700},
						{7,'绵绵不绝',700},					
	                    {8,'阳歌天钧',900},   --天山六阳掌3招
						{8,'阳春白雪',900},
						{8,'阳关三叠',900},	
						{9,'雪山白驼',800},
						{10,'一错',800},
						{10,'再错',800},
						{11,'旋',800},
						{11,'钻',800},						
						{12,'珞樱缤纷',900},  --落英神剑掌3招
						{12,'雨急风狂',900},
						{12,'江城飞花',900},
						{14,'踏雪折梅',1000},
						{14,'天山灵鹫',1000},
						{15,'深藏若虚',1200}, --空明拳3招
						{15,'天马行空',1200},
						{15,'空空如也',1200},
						{16,'上步野马分鬃',1000}, --太极拳3招
						{16,'提步高探马',1000},
						{16,'白鹤晾翅',1000},
						{17,'一阳定乾坤',1200},
						{18,'弹指·一瞬',1200},
						{19,'魔幻天阴',1000},
						{20,'沛然有雨',1000},
						{21,'玄冥侵体',1000},
						{21,'冰毒缭绕',1000},
						{22,'金刚大手印',1000},
						{23,'七伤',1000},
						{24,'色空四显',1200},  --须弥山神掌3招
						{24,'无色无相',1200},
						{24,'慑伏外道',1200},
						{25,'拖泥带水',1300},  --销魂掌6招
						{25,'倒行逆施',1300},
						{25,'行尸走肉',1300},
						{25,'魂不守舍',1300},
						{25,'心惊肉跳',1300},
						{25,'六神不安',1300},
						
						
						{27,'平沙落雁式',300}, --松风剑术3招
						{27,'鸿飞冥冥',300},
						{27,'碧渊腾蛟',300},
						{28,'轰雷掣电',300}, --雷震剑术3招
						{28,'雷霆万钧',300},
						{28,'驱雷掣电',300},
				        {29,'冰河倒泻',400}, --三分剑术3招
						{29,'雪中奇莲',400},
						{29,'冰河开冻',400},						
						{30,'万花齐放',500}, --恒山剑法3招
						{30,'万卉争艳',500},
						{30,'清澈梅花',500},	
						{31,'五大夫剑',500}, --泰山剑法3招
						{31,'岱宗如何',500},
						{31,'七星落长空',500},						
					    {32,'泉鸣芙蓉',600}, --衡山剑法3招
						{32,'鹤翔紫盖',600},
						{32,'天柱云气',600},												
						{33,'叠翠浮青',600}, --嵩山剑法3招
						{33,'玉进天池',600},
						{33,'天外玉龙',600},						
						{34,'苍松迎客',600}, --华山剑法3招
						{34,'金雁横空',600},
						{34,'天坤倒悬',600},						
						{35,'雪泥鸿爪',600},  --雪山剑法3招
						{35,'梅雪争春',600},
						{35,'雪山六出',600},						
						{36,'杏花春雨',700},  --柔云剑法3招
						{36,'满天花雨',700},
						{36,'玉带围腰',700},												
						{38,'山外清音',800},  --玉萧剑法5招
						{38,'金声玉振',800},
						{38,'凤曲长鸣',800},
                        {38,'响隔楼台',800},
						{38,'棹歌中流',800},												
						{40,'金蛇万道',900}, --金蛇剑法7招
						{40,'金蛇狂舞',900},
						{40,'金光蛇影',900},
						{40,'蛇影万馈',900},
						{40,'灵蛇电闪',900},
						{40,'蛇困愁城',900},
						{40,'金蛇化龙',900},																		
						{41,'灭',1000},        --灭剑绝剑2招
						{41,'绝',1000},						
						{42,'清饮小酌',1000},  --玉女素心剑6招
						{42,'浪迹天涯',1000},
						{42,'举案齐眉',1000},
						{42,'皓腕玉镯',1000},
						{42,'冷月窥人',1000},
						{42,'竹帘临池',1000},						
						{44,'冲天掌苏秦背剑',1000},  --苗家剑法6招
						{44,'黄龙转身吐须势',1000},
						{44,'迎门腿反劈华山',1000},
						{44,'洗剑怀中抱月',1000},
						{44,'上步云边摘月',1000},
						{44,'提撩剑白鹤舒翅',1000},						
						{45,'重剑无锋',1300},  --玄铁剑法3招
						{45,'大巧不工',1400},
						{45,'破尽天下',1500},
						{46,'大魁星',1300},  --太极剑法3招
						{46,'三环套月',1400},
						{46,'云麾三舞',1500},						
						{47,'总决式',1600},  --独孤九剑9招
						{47,'破剑式',1500},
						{47,'破枪式',1500},
						{47,'破刀式',1500},
						{47,'破鞭式',1500},
						{47,'破索式',1500},
						{47,'破掌式',1500},
						{47,'破箭式',1500},
						{47,'破气式',1600},
						{48,'扫荡群魔',1300},  --辟邪剑法6招
						{48,'紫气东来',1300},
						{48,'锺馗抉目',1300},		
						{48,'花开见佛',1300},
						{48,'直捣黄龙',1300},	
						{48,'指打奸邪',1300},	
						
						{50,'砍',500}, 
						{50,'劈',500},
						{52,'鬼见愁',600}, 
						{53,'铁锁横江',600},
						{53,'燕子入巢',600},
						{54,'大青',700},
						{54,'小青',700},
						{55,'狂风大作',700}, 
						{55,'飞沙走石',700},
						{56,'带醉脱靴',700},
						{56,'单刀破枪',700},						
						{57,'放下屠刀',600},
						{57,'立地成佛',600},
						{58,'恨意绵绵',600},
						{59,'白虎跳涧',600},
						{59,'剪扑自如',600},
						{60,'重节守义',700},
						{60,'万劫不复',700},
						{61,'梅雪逢夏',700},					
						{61,'赤日炎炎',700},	
                        {62,'女貌郎才珠万斛',800},					
						{62,'天教丽质为眷属',800},	
						{62,'清风引佩下瑶台',800},					
						{62,'明月照妆成金屋',800},							
						{63,'呕心沥血',800},						
						{63,'批纸削腐',800},
						{63,'流星经天',800},						
						{65,'钻木取火',800},
						{65,'无名孽火',1100},
						{66,'烈火燎原',1200},
						{66,'举火烧天',1200},
						{67,'穿手藏刀式',1100},
						{67,'八方藏刀式',1100},

						{68,'回马枪',500},
						{68,'春雷震怒',500},
						{68,'凤点头',500},
						{70,'中正锁喉',600},
						{70,'枪平九洲',600},
						{71,'大君制六合',700},
						{71,'猛将清九垓',700},
						{74,'灵蛇吐信',700},
						{74,'冲天一鹤',700},
						{75,'咔嚓',800},
						{75,'我剪',800},
						{77,"金刀黑剑",600},
						{77,"假刀非刀",600},
						{77,"假剑非剑",600},
						{78,"血染黄沙",600},
						{78,"飞沙万里",600},
						{79,"银索缠身",900},
						{79,"锁穴金铃",900},
						{80,'棒打狗头',1000},
						{80,'反截狗臀',1000},
						{80,'獒口夺杖',1000},
						{80,'棒打双犬',1000},
						{80,'獒口夺杖',1000},
						{81,'书化丹心',1000},
						{81,'玄天一阳',1000},						
						{82,'祗园精舍',1100},
						{82,'诸行无常',1100},
						{82,'娑罗双树',1100},						
						{82,'幻梦一场',1100},
						{83,'力战千钧',1200},
						{83,'拔山填海',1200},
						{83,'千钧压顶',1200},
						{84,'武林至尊',800},
						{84,'宝刀屠龙',800},
						{84,'号令天下',900},
						{84,'莫敢不从',900},
						{84,'倚天不出',1000},
						{84,'谁与争锋',1000},
						{86,'天魔降伏',1100},
						{86,'降龙伏虎',1100},
						
						{109,'石头',1200},
						{109,'剪子',1200},
						{109,'布',1200},
						{110,'神洲移山剑',1200},
						{110,'神洲镇山剑',1200},
						{110,'神洲擎山剑',1200},
						{111,'切瓜',1200},
						{111,'剁瓜',1200},
						{111,'砍瓜',1200},
						{112,'一闪',1200},
						{112,'连一闪',1200},
						{112,'真一闪',1200},
						
						
					};
	CC.RUNSTR={
							'请注意不要让所持物品数量超过200',
							'令狐冲内伤未愈之前成长很低',
							'有些武功自身带有高连击机率',
							'有些武功自身带有高暴击机率',
							'请尽可能多培养一些队友',
							'请尽可能多培养一些队友',
							'主角各系天赋的终极技都非常强大',
							'和人对话时请尽量站在对方的正面  否则很没礼貌',
							'和人对话时请尽量站在对方的正面  否则很没礼貌',
							'飞雪连天射白鹿  笑书神侠倚碧鸳  红尘有你终相伴  笑傲江湖情两牵',
							'    www.txdx.net                                      www.txdx.net                                      www.txdx.net     ',
						};
end
