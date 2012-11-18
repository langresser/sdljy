
function IncludeFile()              --导入其他模块
    dofile(CONFIG.ScriptPath .. "CY_CCTable.lua")
	dofile(CONFIG.ScriptPath .. "CY_Fight.lua")	
    dofile(CONFIG.ScriptPath .. "readkdef.hsk")			
	dofile(CONFIG.ScriptPath .. "SAI.lua")
	
end

function SetGlobal()   --设置游戏内部使用的全程变量   
   JY={};

   JY.Status=0--GAME_INIT;  --游戏当前状态
   --JY.IN=GAME_INIT
   --保存R×数据
   JY.Base={};           --基本数据
   JY.PersonNum=0;      --人物个数
   JY.Person={};        --人物数据
   JY.ThingNum=0        --物品数量
   JY.Thing={};         --物品数据
   JY.SceneNum=0        --物品数量
   JY.Scene={};         --物品数据
   JY.WugongNum=0        --物品数量
   JY.Wugong={};         --物品数据
   JY.ShopNum=0        --商店数量
   JY.Shop={};         --商店数据
         
   JY.Data_Base=nil;     --实际保存R*数据
   JY.Data_Person=nil;
   JY.Data_Thing=nil;
   JY.Data_Scene=nil;
   JY.Data_Wugong=nil;
   JY.Data_Shop=nil;
   
   CC.SBL_Base={};
   CC.SBL_Person={};
   CC.SBL_Thing={};
   CC.SBL_Scene={};
   CC.SBL_Wugong={};
   CC.SBL_Shop={};

   JY.MyCurrentPic=0;       --主角当前走路贴图在贴图文件中偏移
   JY.MyPic=0;              --主角当前贴图
   JY.MyTick=0;             --主角没有走路的持续帧数
   JY.MyTick2=0;            --显示事件动画的节拍
   JY.CDD=0;
   JY.LOADTIME=0;
   JY.SAVETIME=0;
   JY.GTIME=0;
   JY.JB=1;
   JY.GOLD=0;  
   JY.WGLVXS=0; 
   JY.MY=0  
   JY.ZJSL=0  
   
   JY.XZSPD=1 
   JY.MV=0 
   JY.MAPKJ=0 
   JY.HEADXZ=1 
   JY.SZJPJC={}; 
   JY.LEQ=CC.T1[1]..CC.T1[4]..CC.T1[6]
   JY.SQ=CC.T1[7]..CC.T1[2]..CC.T1[5]..CC.T1[3]  
   JY.XYK=CC.T1[10]..CC.T1[8]..CC.T1[9]   
  
   JY.EnterSceneXY=nil;     --保存进入场景的坐标，有值可以进入，为nil则重新计算。

   JY.oldMMapX=-1;          --上次显示主地图的坐标。用来判断是否需要全部重绘屏幕
   JY.oldMMapY=-1;
   JY.oldMMapPic=-1;        --上次显示主地图主角贴图

   JY.SubScene=-1;          --当前子场景编号
   JY.SubSceneX=0;          --子场景显示位置偏移，场景移动指令使用
   JY.SubSceneY=0;

   JY.Darkness=0;             --=0 屏幕正常显示，=1 不显示，屏幕全黑

   JY.CurrentD=-1;          --当前调用D*的编号
   JY.OldDPass=-1;          --上次触发路过事件的D*编号, 避免多次触发
   JY.CurrentEventType=-1   --当前触发事件的方式 1 空格 2 物品 3 路过

   JY.oldSMapX=-1;          --上次显示场景地图的坐标。用来判断是否需要全部重绘屏幕
   JY.oldSMapY=-1;
   JY.oldSMapXoff=-1;       --上次场景偏移
   JY.oldSMapYoff=-1;
   JY.oldSMapPic=-1;        --上次显示场景地图主角贴图

   JY.D_Valid=nil           --记录当前场景有效的D的编号，提高速度，不用每次显示都计算了。若为nil则重新计算
   JY_D_Valld_Num=0;        --当前场景有效的D个数

   JY.D_PicChange={}        --记录事件动画改变，以计算Clip
   JY.NumD_PicChange=0;     --事件动画改变的个数

   JY.CurrentThing=-1;      --当前选择物品，触发事件使用

   JY.MmapMusic=-1;         --切换大地图音乐，返回主地图时，如果设置，则播放此音乐

   JY.CurrentMIDI=-1;       --当前播放的音乐id，用来在关闭音乐时保存音乐id。
   JY.EnableMusic=1;        --是否播放音乐 1 播放，0 不播放
   JY.EnableSound=1;        --是否播放音效 1 播放，0 不播放
   JY.TF=0;

   JY.ThingUseFunction={};          --物品使用时调用函数，SetModify函数使用，增加新类型的物品
   JY.SceneNewEventFunction={};     --调用场景事件函数，SetModify函数使用，定义使用新场景事件触发的函数
   
   
   WAR={};     --战斗使用的全程变量。。这里占个位置，因为程序后面不允许定义全局变量了。具体内容在WarSetGlobal函数中
   AutoMoveTab={[0]=0}
   Bright={}
   CC.Light=200
   CC.Sight=120
   --setBright(light,sight) 
   --WAR.LT=light
   --WAR.ST=sight
   
end

function JY_Main()        --主程序入口
	os.remove("debug.txt");        --清除以前的debug输出
    xpcall(JY_Main_sub,myErrFun);     --捕获调用错误
end

function myErrFun(err)      --错误处理，打印错误信息
    lib.Debug(err);                 --输出错误信息
    lib.Debug(debug.traceback());   --输出调用堆栈信息
end

function JY_Main_sub()        --真正的游戏主程序入口   
    IncludeFile();         --导入其他模块
    SetGlobalConst();    --设置全程变量CC, 程序使用的常量
    SetGlobal();         --设置全程变量JY
    
    GenTalkIdx();        --生成对话idx

    SetModify();         --设置对函数的修改，定义新的物品，事件等等

    --禁止访问全程变量
    setmetatable(_G,{ __newindex =function (_,n)
                       error("attempt read write to undeclared variable " .. n,2);
                       end,
                       __index =function (_,n)
                       error("attempt read read to undeclared variable " .. n,2);
                       end,
                     }  );
    lib.Debug("JY_Main start.");

	math.randomseed(os.time());          --初始化随机数发生器

	lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay,CONFIG.KeyRePeatInterval);   --设置键盘重复率

    JY.Status=GAME_START;

    lib.PicInit(CC.PaletteFile);       --加载原来的256色调色板

    --lib.PlayMPEG(CONFIG.DataPath .. "start.mpg",VK_ESCAPE);
 
	
	Cls();

    PlayMIDI(30);
	lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);	
	

	local menu={  {"重新开始",nil,1},
	              {"载入进度",nil,1},
	              {"离开游戏",nil,1}  };
	local menux=(CC.ScreenW-4*CC.StartMenuFontSize-2*CC.MenuBorderPixel)/2
    
	DrawString(650,580,CC.EVB107,C_WHITE,20)
    --ShowScreen();
    	
	local menuReturn=ShowMenu(menu,3,0,menux,CC.StartMenuY+30,0,0,0,0,35,C_STARTMENU, C_GOLD)

    if menuReturn == 1 then        --重新开始游戏
		ClsN();	
		PlayMIDI(31);
		
		ShowScreen();
		STARTDH()
		JY.Status=GAME_START2
        --lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK)
		SBLNewGame(); 		--设置新游戏数据		

        JY.SubScene=CC.NewGameSceneID;         --新游戏直接进入场景
        --JY.Scene[JY.SubScene]["名称"]=JY.Person[0]["姓名"] .. "居";
        JY.Base["人X1"]=CC.NewGameSceneX;
        JY.Base["人Y1"]=CC.NewGameSceneY;
        JY.MyPic=CC.NewPersonPic;

        lib.ShowSlow(50,1)
		JY.Status=GAME_SMAP;
        JY.MmapMusic=-1;

 	    CleanMemory();

		Init_SMap(0);

        --if CC.NewGameEvent>0 then
		   --oldCallEvent(CC.NewGameEvent);
		   --OEVENTLUA[691]();
	    --end
		
		if DrawStrBoxYesNo(-1,-1,CC.s71,C_WHITE,30)==true then
		   oldCallEvent(CC.NewGameEvent);
		else
		   OEVENTLUA[691]();
	    end
		for i=5,7 do
			 SetD(70,2,i,4369*2)
			 SetD(104,88,i,4369*2)
	    end
		

	elseif menuReturn == 2 then         --载入旧的进度
		Cls();
    	local loadMenu={ {"进度一",nil,1},
	                     {"进度二",nil,1},
	                     {"进度三",nil,1} };

	    local menux=(CC.ScreenW-3*CC.StartMenuFontSize-2*CC.MenuBorderPixel)/2

    	local r=ShowMenu(loadMenu,3,0,menux,CC.StartMenuY+30,0,0,0,0,35,C_STARTMENU, C_GOLD)
		Cls();
		DrawString(menux,CC.StartMenuY+60,"请稍候...",C_GOLD,35)--CC.StartMenuFontSize);
		ShowScreen();
        SBLDATAL(r);
		Cls();
		if JY.Base["无用"]~=-1 then
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["无用"]
			
			JY.MmapMusic=-1;
			JY.MyPic=GetMyPic();
			Init_SMap(1);
		else
			JY.SubScene=-1;
			JY.Status=GAME_FIRSTMMAP;
		end
		ShowScreen();

	elseif menuReturn == 3 then
        return ;
	end
	lib.LoadPicture("",0,0);
    lib.GetKey();
    Game_Cycle();
end

function CleanMemory()            --清理lua内存
    if CONFIG.CleanMemory==1 then
		 collectgarbage("collect");
		 --lib.Debug(string.format("Lua memory=%d",collectgarbage("count")));
    end
end

function SBLNewGame()     --选择新游戏，设置主角初始属性
    SBLDATAL(0); --  载入新游戏数据
   
	CXDYWPSX()
	
    ClsN();
	
	lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK);
	DrawStrBox(-1,-1,"炎之运手制作组",C_GOLD,50)
					ShowScreen();
					lib.Delay(1000);
	
	ClsN();
	local x=1;
	while x==1 do		
		local mode=2;
		if GetS(100,10,10,4)==2 and GetS(100,10,10,5)==3185 then
		   mode=2
		elseif GetS(100,10,10,4)==3 and GetS(100,10,10,5)==7293 then
		   mode=2
		end
		local MS=JYMsgBox(CC.s4,MODEXZ[1].."*"..MODEXZ[2],MODEXZ2,2,35);
          
		if MS==1 then
		   JY.Thing[202][WZ7]=1
		   x=2
		elseif  MS==2 then
		   JY.Thing[202][WZ7]=2
		   x=2
		else
		   JY.Thing[202][WZ7]=2
		   x=2
		end
	end		
	
	local Tp=0;
	if DrawStrBoxYesNo(-1,-1,CC.EVB104,C_WHITE,30)==true then
	    local pnum=JY.Thing[202][WZ7];
			
		Tp=1
		ClsN();
	    local m=JYMsgBox(CC.EVB105,CC.EVB106,TSXMLB,2,280);
        if m==2 then
	      JY.Person[0][CC.s23]=TSXMLB[2]
		elseif m==3 then
		  JY.Person[0][CC.s23]=TSXMLB[3]
		elseif m==1 then
		  JY.Person[0][CC.s23]=TSXMLB[1]
		end
	end
	ClsN();
	while Tp==0 do
	    DrawStrBoxWaitKey(CC.EVB156,C_WHITE,30)
        JY.Person[0][CC.s23]=Shurufa(32,CC.ScreenH-6*CC.Fontbig);
	    JY.Person[0]["生命最大值"]=50
		JY.Person[0]["内力最大值"]=100;
        JY.Person[0]["攻击力"]=30
        JY.Person[0]["防御力"]=30
        JY.Person[0]["轻功"]=30
        JY.Person[0]["医疗能力"]=30
        JY.Person[0]["用毒能力"]=30
        JY.Person[0]["解毒能力"]=30
        JY.Person[0]["抗毒能力"]=30
        JY.Person[0]["拳掌功夫"]=30
        JY.Person[0]["御剑能力"]=30
        JY.Person[0]["耍刀技巧"]=30
        JY.Person[0]["特殊兵器"]=30
        JY.Person[0]["暗器技巧"]=30
		ClsN();
		local nl=JYMsgBox(CC.EVB122,CC.EVB123,CC.EVB126,3,280);
        if nl==1 then
		   JY.Person[0]["内力性质"]=0
		elseif nl==2 then
		   JY.Person[0]["内力性质"]=1
		else
		   JY.Person[0]["内力性质"]=2
		end
		local T={};
				for a=1,1000 do
					 local b=""..a
					 T[b]=a
				end
	    DrawStrBoxWaitKey(CC.EVB124,C_WHITE,30)
		JY.Person[0]["资质"]=-1;
		while JY.Person[0]["资质"]==-1 do
			local r=GetPinyin1(32,CC.ScreenH-CC.Fontbig*6)
			if T[r]~=nil and T[r]>-1 and T[r]<101 then
				JY.Person[0]["资质"]=T[r]
		    else
			    DrawStrBoxWaitKey(CC.EVB125,C_WHITE,30)		
			end	
        end			      
		break;
	end
   
    if JY.Person[0][CC.s23]==JY.LEQ and Tp==1 then 
        JY.Person[0]["生命增长"]=8;
	    JY.Person[0]["内力性质"]=2
        JY.Person[0]["内力最大值"]=300;
        JY.Person[0]["攻击力"]=40;
        JY.Person[0]["防御力"]=40;
        JY.Person[0]["轻功"]=40;
        JY.Person[0]["医疗能力"]=40;
        JY.Person[0]["用毒能力"]=40;
        JY.Person[0]["解毒能力"]=40;
        JY.Person[0]["抗毒能力"]=40;
        JY.Person[0]["拳掌功夫"]=40;
        JY.Person[0]["御剑能力"]=40;
        JY.Person[0]["耍刀技巧"]=40;
        JY.Person[0]["特殊兵器"]=40;
        JY.Person[0]["暗器技巧"]=40;        
        JY.Person[0]["生命最大值"]=100;
	    JY.Person[0]["资质"]=100;
    end

    if JY.Person[0][CC.s23]==JY.SQ and Tp==1 then 
        JY.Person[0]["生命增长"]=4;
	    JY.Person[0]["内力性质"]=2
        JY.Person[0]["内力最大值"]=100;
        JY.Person[0]["攻击力"]=40;
        JY.Person[0]["防御力"]=40;
        JY.Person[0]["轻功"]=40;
        JY.Person[0]["医疗能力"]=40;
        JY.Person[0]["用毒能力"]=40;
        JY.Person[0]["解毒能力"]=40;
        JY.Person[0]["抗毒能力"]=40;
        JY.Person[0]["拳掌功夫"]=40;
        JY.Person[0]["御剑能力"]=40;
        JY.Person[0]["耍刀技巧"]=40;
        JY.Person[0]["特殊兵器"]=40;
        JY.Person[0]["暗器技巧"]=40;
        JY.Person[0]["左右互搏"]=1;
        JY.Person[0]["生命最大值"]=50;
	    JY.Person[0]["资质"]=50;
    end
	  
	if JY.Person[0][CC.s23]==JY.XYK and Tp==1 then 
        JY.Person[0]["生命增长"]=6;
	    JY.Person[0]["内力性质"]=2
        JY.Person[0]["内力最大值"]=200;
        JY.Person[0]["攻击力"]=40;
        JY.Person[0]["防御力"]=40;
        JY.Person[0]["轻功"]=40;
        JY.Person[0]["医疗能力"]=40;
        JY.Person[0]["用毒能力"]=40;
        JY.Person[0]["解毒能力"]=40;
        JY.Person[0]["抗毒能力"]=40;
        JY.Person[0]["拳掌功夫"]=40;
        JY.Person[0]["御剑能力"]=40;
        JY.Person[0]["耍刀技巧"]=40;
        JY.Person[0]["特殊兵器"]=40;
        JY.Person[0]["暗器技巧"]=40;        
        JY.Person[0]["生命最大值"]=75;
	    JY.Person[0]["资质"]=80;
		JY.Person[0]["左右互搏"]=1;
    end

        JY.Person[0]["生命"]=JY.Person[0]["生命最大值"];
        JY.Person[0]["内力"]=JY.Person[0]["内力最大值"];
        ClsN();
        ShowScreen();
        ClsN();
	
	
	SetS(0,0,0,0,1)	
	SetS(0,0,0,1,0);
	SetS(10,1,0,0,1);
	SetS(57,52,29,1,2589*2)
    SetS(57,52,30,1,2589*2)
	
	SetD(70,59,0,0);
	SetD(70,59,2,0);
	SetD(71,3,2,0);
	SetD(71,2,2,0);
	
	for i=1,2 do
	      SetS(70,36+i,23,3,110+i)
		  instruct_3(70,110+i,1,0,0,0,0,5106,5106,5106,0,36+i,23)
	end
	SetD(70,111,2,2003);
	SetD(70,112,2,2004);
	
	SetS(13,18,28,3,101) --成昆事件
    SetS(13,18,29,3,102)
    instruct_3(13,101,0,0,0,0,2001,0,0,0,0,-2,-2)
    instruct_3(13,102,0,0,0,0,2001,0,0,0,0,-2,-2)
	
	SetS(102,20,25,2,0) --老祖图
    SetD(102,13,2,0)
    SetS(102,17,22,3,101)
    instruct_3(102,101,1,0,1014,0,0,3631*2,3631*2,3631*2,0,-2,-2)
	
	for i=5,7 do
	     --SetD(70,2,i,4369*2)
		 SetD(104,88,i,4369*2)
	end

    for p=0,588 do
	   local r=0;
	   JY.Person[p][CC.s6]=" "
	     if JY.Person[p][CC.s7]>0 then
		    for i,v in pairs(CC.PersonExit) do
			     if v[1]==p then
				    r=1
			     end
			end
			if p==0 then r=1 end
			if r==0 then 
			    for i=1,10 do
			        if JY.Person[p][CC.s8..i]>0 then
					    if p<191 then
			               JY.Person[p][CC.s9..i]=999 
						else
						   JY.Person[p][CC.s9..i]=900
						end						
					end
				end
			end
		 end
	end
	
     if JY.Person[0][CC.s23]==JY.LEQ and Tp==1 then
	     SetS(4,5,5,5,8)
		 SetS(4,5,5,4,1)                 
         JY.Person[0][CC.s6]="CBWS"
		 JY.Thing[201][WZ7]=8		 
     end
     if JY.Person[0][CC.s23]==JY.SQ and Tp==1 then
	     SetS(4,5,5,5,8)
		 SetS(4,5,5,4,2)	     
         JY.Person[0][CC.s6]="BHGZ" 		     
		 JY.Thing[201][WZ7]=8		
     end
     if JY.Person[0][CC.s23]==JY.XYK and Tp==1 then  
         SetS(4,5,5,5,8)
		 SetS(4,5,5,4,3) 
		 JY.Person[0][CC.s6]="XYJS"         
		 JY.Thing[201][WZ7]=8		
     end
	 
	 local p3=JY.Person[0][CC.s23];
	 if p3==CC.s10 then JY.Person[0][CC.s23]=CC.EVB108 end
	    
	 if (p3==JY.LEQ or p3==JY.SQ or p3==JY.XYK) and Tp~=1 then
	     JY.Person[0][CC.s23]=CC.EVB108
	 end
	
	if JY.Person[0][CC.s6]==" " then
		ClsN();
		lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK);
					ShowScreen();
					lib.Delay(10);
	
		
		JY.TF=JYMsgBox(CC.s14,TFXZSAY1,TFE,7,50);
		SetS(10,0,6,0,1)
		
			if JY.TF==1 then
			   SetS(4,5,5,5,1)
			   JY.Thing[201][WZ7]=1
			   JY.Person[0][CC.s15]=40
			elseif JY.TF==2 then
			   SetS(4,5,5,5,2)
			   JY.Thing[201][WZ7]=2
			   JY.Person[0][CC.s16]=40
			elseif JY.TF==3 then
			   SetS(4,5,5,5,3)
			   JY.Thing[201][WZ7]=3
			   JY.Person[0][CC.s17]=40			   
			elseif JY.TF==4 then		   
			   SetS(4,5,5,5,4)
			   JY.Thing[201][WZ7]=4
			   JY.Person[0][CC.s18]=40
			elseif JY.TF==5 then 
			   JY.Person[0][CC.s19]=500
			   JY.Person[0][CC.s20]=2
		       JY.Thing[201][WZ7]=5
		       SetS(4,5,5,5,5)
			elseif JY.TF==6 then  
			   JY.Person[0][CC.s21]=100
			   JY.Person[0][CC.s15]=40
			   JY.Person[0][CC.s16]=40
			   JY.Person[0][CC.s17]=40
			   JY.Person[0][CC.s18]=40			   
			   JY.Thing[201][WZ7]=6
			   SetS(4,5,5,5,6)
			elseif JY.TF==7 then 
			   JY.Person[0]["医疗能力"]=200
			   JY.Person[0]["用毒能力"]=200
			   JY.Person[0]["解毒能力"]=200
			   JY.Thing[201][WZ7]=7
			   SetS(4,5,5,5,7)  
			end
	end				
    
	for i=1,51 do
	    SetS(5,i,6,5,2)	
    end

    for x=22,32 do
		for y=26,36 do
				   SetS(70,x,y,0,569*2)
				   SetS(70,x,y,1,0)
		end
	end
	for x=23,31 do
		for y=27,35 do
				   SetS(70,x,y,0,512*2)		   
		end
	end	
	
	SetD(2,3,5,4375*2)
	SetD(2,3,6,4375*2)
	SetD(2,3,7,4375*2)

	SetS(2,24,31,1,4381*2)
	SetS(2,30,34,1,4384*2)
	SetS(2,27,27,1,4379*2)
						   	
	JY.Wugong[34][WZ5]=13225
	SetS(34,34,34,5,13225)
	SetD(34,34,8,13225)
	JY.Thing[201][WZ6]=7
	SetS(34,34,34,4,7)
	SetD(34,33,8,7)
	
	SetS(34,0,9,3,80)
	local l=math.random(20000)+10000;
	JY.Wugong[34][WZ4]=l;
	SetS(34,0,9,5,l)
	SetD(34,80,8,l)
	
    FINALWORK2()
end

function Game_Cycle()       --游戏主循环
    lib.Debug("Start game cycle");
local function getmaindelay()
	local speed=JY.Person[0]['轻功'];
	if JY.Person[0]['武器']>0 then
		speed=speed+JY.Thing[JY.Person[0]['武器']]['加轻功']
	end
	if JY.Person[0]['防具']>0 then
		speed=speed+JY.Thing[JY.Person[0]['防具']]['加轻功']
	end
	if speed>300 then
		return 1--40-(speed-300)/10
	elseif speed>150 then
		return 1--50-(speed-150)/15
	else
		return 1--65-speed/10
	end
end
    while JY.Status ~=GAME_END do
        local tstart=lib.GetTime();

	    JY.MyTick=JY.MyTick+1;    --20个节拍无击键，则主角变为站立状态
	    JY.MyTick2=JY.MyTick2+1;    --20个节拍无击键，则主角变为站立状态

		if JY.MyTick==20 then
            JY.MyCurrentPic=0;
			JY.MyTick=0;
		end

        if JY.MyTick2==1000 then
            JY.MYtick2=0;
        end

        if JY.Status==GAME_FIRSTMMAP then  --首次显示主场景，重新调用主场景贴图，渐变显示。然后转到正常显示
			CleanMemory();
            lib.ShowSlow(50,1)
            JY.MmapMusic=16;
            JY.Status=GAME_MMAP;

            Init_MMap();

            lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],GetMyPic());
			lib.ShowSlow(50,0);
        elseif JY.Status==GAME_MMAP then
            Game_MMap();
 		elseif JY.Status==GAME_SMAP then
            Game_SMap()
		end

		collectgarbage("step",0);

		local tend=lib.GetTime();
		local FrameTime=getmaindelay()--CC.Frame+15-math.modf(JY.Person[0]['轻功']/12)
		--if tend-tstart<FrameTime then
            --lib.Delay(FrameTime-(tend-tstart));
	    --end
		lib.Delay(JY.XZSPD);
	end
end

function Init_MMap()   --初始化主地图数据
	lib.PicInit();
	lib.LoadMMap(CC.MMapFile[1],CC.MMapFile[2],CC.MMapFile[3],
			CC.MMapFile[4],CC.MMapFile[5],CC.MWidth,CC.MHeight,JY.Base["人X"],JY.Base["人Y"]);

	lib.PicLoadFile(CC.MMAPPicFile[1],CC.MMAPPicFile[2],0);
	lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	--lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],100,200);
	if CC.LoadThingPic==1 then
	    lib.PicLoadFile(CC.ThingPicFile[1],CC.ThingPicFile[2],2);
	end

	JY.EnterSceneXY=nil;         --设为空，强制重新生成场景入口数据。防止有事件更改了场景入口。
	JY.oldMMapX=-1;
	JY.oldMMapY=-1;
	JY.MAPKJ=0

    PlayMIDI(JY.MmapMusic);	    
	AutoMoveTab={[0]=0}
end


function Game_MMap()      --主地图
    if JY.MAPKJ==0 then
		DrawString(60,575,CC.EVB119,C_GOLD,25)
		JY.MAPKJ=1
		ShowScreen();
		lib.Delay(500);
		WaitKey();
		Cls();
		ShowScreen();
	end
    local direct = -1;
    local keypress = lib.GetKey();
    if keypress ~= -1 then
	    JY.MyTick=0;
		if keypress==VK_ESCAPE then
			MMenu();
			if JY.Status==GAME_FIRSTMMAP then
				return ;
			end
			JY.oldMMapX=-1;         --强制重绘
			JY.oldMMapY=-1;
		elseif keypress==VK_UP then
			direct=0;
		elseif keypress==VK_DOWN then
			direct=3;
		elseif keypress==VK_LEFT then
			direct=2;
		elseif keypress==VK_RIGHT then
			direct=1;
		elseif keypress==9 then
			--Systeam()
		elseif keypress>1999999 then
			local mx=math.modf((keypress-2000000)/1000)
			local my=math.fmod(keypress-2000000,1000)
			mx=mx-CC.ScreenW/2
			my=my-CC.ScreenH/2
			mx=mx/CC.XScale
			my=my/CC.YScale
			mx,my=(mx+my)/2,(my-mx)/2
			if mx>0 then mx=mx+0.99 else mx=mx-0.01 end
			if my>0 then my=my+0.99 else mx=mx-0.01 end
			mx=math.modf(mx)
			my=math.modf(my)
			walkto(mx,my)
			--return
		elseif keypress==45 then
			CC.MapSize=limitX(CC.MapSize-1,8,math.modf(math.min(CC.ScreenW/32,CC.ScreenH/16)));
		elseif keypress==61 then
			CC.MapSize=limitX(CC.MapSize+1,8,math.modf(math.min(CC.ScreenW/32,CC.ScreenH/16)));
		elseif keypress==109 then
			CC.MapKind=CC.MapKind+1;
			if CC.MapKind>2 then
				CC.MapKind=0;
			end
		end
    end
	FKJGN(keypress)	
	if JY.Status~=GAME_MMAP then
		return
	end
	if AutoMoveTab[0]~=0 then
		if direct==-1 then
			direct=AutoMoveTab[AutoMoveTab[0]]
			AutoMoveTab[AutoMoveTab[0]]=nil
			AutoMoveTab[0]=AutoMoveTab[0]-1
		else
			AutoMoveTab={[0]=0}
		end
	end
    local x,y;              --按照方向键要到达的坐标
	local function CanMove(nd,nnd)
		local nx,ny=JY.Base["人X"]+CC.DirectX[nd+1],JY.Base["人Y"]+CC.DirectY[nd+1]
		if nnd~=nil then
			nx,ny=nx+CC.DirectX[nnd+1],ny+CC.DirectY[nnd+1]
		end
		if CC.hx~=nil or (lib.GetMMap(nx,ny,3)==0 and lib.GetMMap(nx,ny,4)==0) or CanEnterScene(nx,ny)~=-1 then
			return true
		else
			return false
		end
	end
	--[[
	local direct1,direct2,direct3
	if direct==0 then
		direct1=1
		direct2=2
	elseif direct==1 then
		direct1=3
		direct2=0
	elseif direct==2 then
		direct1=0
		direct2=3
	elseif direct==3 then
		direct1=2
		direct2=1
	end
	direct3=direct
	local change=false
    if direct ~= -1 then   --按下了光标键
		if not CanMove(direct) then     --没有建筑，可以到达
			if JY.Person[500]['声望']==0 then
				--direct=direct1
			elseif JY.Person[500]['声望']==1 then
				direct1,direct2=direct2,direct1
				change=true
			end
			direct=direct1
			if CanMove(direct) and CanMove(direct,direct3) then
				if change then
					JY.Person[500]['声望']=1
				else
					JY.Person[500]['声望']=0
				end
			else
				direct=direct2
				if CanMove(direct) and CanMove(direct,direct3) then
				if change then
					JY.Person[500]['声望']=0
				else
					JY.Person[500]['声望']=1
				end
				else
					direct=direct3
				end
			end
		end
	end
	]]--
	if direct ~= -1 then
        AddMyCurrentPic();         --增加主角贴图编号，产生走路效果
		x=JY.Base["人X"]+CC.DirectX[direct+1];
		y=JY.Base["人Y"]+CC.DirectY[direct+1];
		JY.Base["人方向"]=direct;
    else
        x=JY.Base["人X"];
        y=JY.Base["人Y"];
    end
	if direct~=-1 then
		JY.SubScene=CanEnterScene(x,y);   --判断是否进入子场景
	end
	if CC.hx~=nil or (lib.GetMMap(x,y,3)==0 and lib.GetMMap(x,y,4)==0) then
		JY.Base["人X"]=x;
		JY.Base["人Y"]=y;
	end
		
    JY.Base["人X"]=limitX(JY.Base["人X"],10,CC.MWidth-10);           --限制坐标不能超出范围
    JY.Base["人Y"]=limitX(JY.Base["人Y"],10,CC.MHeight-10);

    if CC.MMapBoat[lib.GetMMap(JY.Base["人X"],JY.Base["人Y"],0)]==1 then
	    JY.Base["乘船"]=1;
	else
	    JY.Base["乘船"]=0;
	end

	local pic=GetMyPic();

    if CONFIG.FastShowScreen==1 then  --设置快速显示，并且主角位置不变，则显示裁剪窗口
        if JY.oldMMapX==JY.Base["人X"] and JY.oldMMapY==JY.Base["人Y"] then
			if JY.oldMMapPic>=0 and JY.oldMMapPic ~= pic then        --主角贴图有变化，则刷新显示。
				local rr=ClipRect(Cal_PicClip(0,0,JY.oldMMapPic,0,0,0,pic,0));
				if rr~=nil then
					lib.SetClip(rr.x1,rr.y1,rr.x2,rr.y2);
					lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],pic);             --显示主地图
				end
			end
		else
			lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);
			lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],pic);             --显示主地图
		end
	else  --全部显示
		lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],pic);             --显示主地图
	end

	if CC.ShowXY==1 then
		DrawString(10,CC.ScreenH-20,string.format("大地图 %d %d",JY.Base["人X"],JY.Base["人Y"]) ,C_GOLD,16);
		DrawString(CC.ScreenW-150,8,os.date("%c"),C_GOLD,16);
	end
	if JY.JB==1 then JYZTB() end
	--DrawMMapMini()
	--DrawString(55,575,CC.EVB119,C_GOLD,25)
	ShowScreen(CONFIG.FastShowScreen);
	lib.SetClip(0,0,0,0);

	JY.oldMMapX=JY.Base["人X"];
	JY.oldMMapY=JY.Base["人Y"];
	JY.oldMMapPic=pic;

    if JY.SubScene >= 0 then          --进入子场景
        CleanMemory();
		lib.UnloadMMap();
        lib.PicInit();
        --lib.ShowSlow(0,1)

		JY.Status=GAME_SMAP;
        JY.MmapMusic=-1;

        JY.MyPic=GetMyPic();
        JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"]
        JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"]

        Init_SMap(1);
    end

end

--showname  =1 显示场景名 0 不显示
function Init_SMap(showname)   --初始化场景数据
	lib.PicInit();
	lib.PicLoadFile(CC.SMAPPicFile[1],CC.SMAPPicFile[2],0);
	--lib.PicLoadFile(CC.SMAPPicFile[1],CC.SMAPPicFile[2],90,100);
	lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	--lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],100,200);
	if CC.LoadThingPic==1 then
	    lib.PicLoadFile(CC.ThingPicFile[1],CC.ThingPicFile[2],2);
	end
	lib.PicLoadFile(string.format(CC.FightPicFile[1],0),
		                string.format(CC.FightPicFile[2],0),
						3);
    
	if math.random(2)==1 then 
	   JY.Scene[70]["进门音乐"]=33 
    else
       JY.Scene[70]["进门音乐"]=28
	end	
	PlayMIDI(JY.Scene[JY.SubScene]["进门音乐"]);

	JY.oldSMapX=-1;
	JY.oldSMapY=-1;

	JY.SubSceneX=0;
	JY.SubSceneY=0;
	JY.OldDPass=-1;

    JY.D_Valid=nil;

	DrawSMap();
	--lib.ShowSlow(0,0)
	lib.GetKey();

	if showname==1 then
		DrawStrBox(-1,10,JY.Scene[JY.SubScene]["名称"],C_WHITE,CC.DefaultFont);
		DrawString(100,575,CC.EVB118,C_GOLD,25)
		ShowScreen();
		WaitKey();
		Cls();
		ShowScreen();
    end

	AutoMoveTab={[0]=0}
end

--计算贴图改变形成的Clip裁剪
--(dx1,dy1) 新贴图和绘图中心点的坐标偏移。在场景中，视角不同而主角动时用到
--pic1 旧的贴图编号
--id1 贴图文件加载编号
--(dx2,dy2) 新贴图和绘图中心点的偏移
--pic2 旧的贴图编号
--id2 贴图文件加载编号
--返回，裁剪矩形 {x1,y1,x2,y2}
function Cal_PicClip(dx1,dy1,pic1,id1,dx2,dy2,pic2,id2)   --计算贴图改变形成的Clip裁剪

	local w1,h1,x1_off,y1_off=lib.PicGetXY(id1,pic1*2);
	local old_r={};
	old_r.x1=CC.XScale*(dx1-dy1)+CC.ScreenW/2-x1_off;
    old_r.y1=CC.YScale*(dx1+dy1)+CC.ScreenH/2-y1_off;
    old_r.x2=old_r.x1+w1;
	old_r.y2=old_r.y1+h1;

	local w2,h2,x2_off,y2_off=lib.PicGetXY(id2,pic2*2);
	local new_r={};
	new_r.x1=CC.XScale*(dx2-dy2)+CC.ScreenW/2-x2_off;
    new_r.y1=CC.YScale*(dx2+dy2)+CC.ScreenH/2-y2_off;
    new_r.x2=new_r.x1+w2;
	new_r.y2=new_r.y1+h2;

	return MergeRect(old_r,new_r);
end

function MergeRect(r1,r2)     --合并矩形
	local res={};
	res.x1=math.min(r1.x1, r2.x1);
	res.y1=math.min(r1.y1, r2.y1);
	res.x2=math.max(r1.x2, r2.x2);
	res.y2=math.max(r1.y2, r2.y2);
	return res;
end

----对矩形进行屏幕剪裁
--返回剪裁后的矩形，如果超出屏幕，返回空
function ClipRect(r)    --对矩形进行屏幕剪裁
	if r.x1>=CC.ScreenW or r.x2<= 0 or r.y1>=CC.ScreenH or r.y2 <=0 then
	    return nil
	else
	    local res={};
        res.x1=limitX(r.x1,0,CC.ScreenW);
        res.x2=limitX(r.x2,0,CC.ScreenW);
        res.y1=limitX(r.y1,0,CC.ScreenH);
        res.y2=limitX(r.y2,0,CC.ScreenH);
        return res;
	end
end

function GetMyPic()      --计算主角当前贴图
    local n;
	if JY.Status==GAME_MMAP and JY.Base["乘船"]==1 then
		if JY.MyCurrentPic >=4 then
			JY.MyCurrentPic=0
		end
	else
		if JY.MyCurrentPic >6 then
			JY.MyCurrentPic=1
		end
	end

	if JY.Base["乘船"]==0 then
        n=CC.MyStartPic+JY.Base["人方向"]*7+JY.MyCurrentPic;
	else
	    n=CC.BoatStartPic+JY.Base["人方向"]*4+JY.MyCurrentPic;
	end
	return n;
end

--增加当前主角走路动画帧, 主地图和场景地图都使用
function AddMyCurrentPic()        ---增加当前主角走路动画帧,
    JY.MyCurrentPic=JY.MyCurrentPic+1;
end

--场景是否可进
--id 场景代号
--x,y 当前主地图坐标
--返回：场景id，-1表示没有场景可进
function CanEnterScene(x,y)         --场景是否可进
    if JY.EnterSceneXY==nil then    --如果为空，则重新产生数据。
	    Cal_EnterSceneXY();
	end

    local id=JY.EnterSceneXY[y*CC.MWidth+x];
    if id~=nil then
        local e=JY.Scene[id]["进入条件"];
		if e==0 then        --可进
			return id;
		elseif e==1 then    --不可进
			return -1
		elseif e==2 then    --有轻功高者进
			for i=1,CC.TeamNum do
				local pid=JY.Base["队伍" .. i];
				if pid>=0 then
					if JY.Person[pid]["轻功"]>=70 then
						return id;
					end
				end
			end
		end
	end
    return -1;
end

function Cal_EnterSceneXY()   --计算哪些坐标可以进入场景
    JY.EnterSceneXY={};
    for id = 0,JY.SceneNum-1 do
		local scene=JY.Scene[id];
        if scene["外景入口X1"]>0 and scene["外景入口Y1"] then
            JY.EnterSceneXY[scene["外景入口Y1"]*CC.MWidth+scene["外景入口X1"]]=id;
		end
        if scene["外景入口X2"]>0 and scene["外景入口Y2"] then
            JY.EnterSceneXY[scene["外景入口Y2"]*CC.MWidth+scene["外景入口X2"]]=id;
		end
    end
end

--主菜单
function MMenu()      --主菜单
    Cls();   
    local menu={      {"医疗",Menu_Doctor,1},
	                  {"解毒",Menu_DecPoison,1},
	                  {"物品",Menu_Thing,1},
	                  {"状态",Menu_Status,1},
	                  {"离队",Menu_PersonExit,1},
	                  {"系统",Menu_System,1},      };
    if JY.Status==GAME_SMAP then  --子场景，后两个菜单不可见
        --menu[5][3]=0;
        --menu[6][3]=0;
    end
    ShowMenu(menu,6,0,CC.MainMenuX,CC.MainMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE)
end

function SelectThing(thing,thingnum)    --显示物品菜单

    local xnum=CC.MenuThingXnum;
    local ynum=CC.MenuThingYnum;

	local w=CC.ThingPicWidth*xnum+(xnum-1)*CC.ThingGapIn+2*CC.ThingGapOut;  --总体宽度
	local h=CC.ThingPicHeight*ynum+(ynum-1)*CC.ThingGapIn+2*CC.ThingGapOut; --物品栏高度

	local dx=(CC.ScreenW-w)/2;
	local dy=(CC.ScreenH-h-2*(CC.ThingFontSize+2*CC.MenuBorderPixel+5))/2-50;


    local y1_1,y1_2,y2_1,y2_2,y3_1,y3_2;                  --名称，说明和图片的Y坐标

    local cur_line=0;
    local cur_x=0;
    local cur_y=0;
    local cur_thing=-1;

	while true do
	    Cls();
		y1_1=dy;
        y1_2=y1_1+CC.ThingFontSize+2*CC.MenuBorderPixel;
        DrawBox(dx,y1_1,dx+w,y1_2,C_WHITE);
		y2_1=y1_2+5
		y2_2=y2_1+CC.ThingFontSize+2*CC.MenuBorderPixel
        DrawBox(dx,y2_1,dx+w,y2_2,C_WHITE);
        y3_1=y2_2+5;
        y3_2=y3_1+h;
		DrawBox(dx,y3_1,dx+w,y3_2,C_WHITE);

        for y=0,ynum-1 do
            for x=0,xnum-1 do
                local id=y*xnum+x+xnum*cur_line         --当前待选择物品
				local boxcolor;
                if x==cur_x and y==cur_y then
				    boxcolor=C_WHITE;
                    if thing[id]>=0 then
                        cur_thing=thing[id];
                        local str=JY.Thing[thing[id]]["名称"];
                        if JY.Thing[thing[id]]["类型"]==1 or JY.Thing[thing[id]]["类型"]==2 then
                            if JY.Thing[thing[id]]["使用人"] >=0 then
                                str=str .. "(" .. JY.Person[JY.Thing[thing[id]]["使用人"]]["姓名"] .. ")";
                            end
                        end
                        str=string.format("%s X %d",str,thingnum[id]);
						local str2=JY.Thing[thing[id]]["物品说明"];
						if thing[id]==182 then
							str2=str2..string.format('(人%3d,%3d)',JY.Base['人X'],JY.Base['人Y'])
						end

     			        DrawString(dx+CC.ThingGapOut,y1_1+CC.MenuBorderPixel,str,C_GOLD,CC.ThingFontSize);
     			        DrawString(dx+CC.ThingGapOut,y2_1+CC.MenuBorderPixel,str2,C_ORANGE,CC.ThingFontSize);
						local myfont=math.modf(CC.ThingFontSize*0.7)--20
						local mx,my=dx+4*myfont,y3_2+2--130,365
						local myflag=0
						local myThing=JY.Thing[thing[id]]
						local function drawitem(ss,str,news)
							local mys
							if str==nil then
								mys=ss
							elseif myThing[ss]~=0 then
								if news==nil then
									if myflag==0 then
										mys=string.format(str..':%+d',myThing[ss])
									elseif myflag==1 then
										mys=string.format(str..':%d',myThing[ss])
									end
								else
									if myThing[ss]<0 then
										return
									end
									mys=string.format(str..':%s',news[myThing[ss]])
								end
							else
								return
							end
							local mylen=myfont*string.len(mys)/2+12
							if mx+mylen>CC.ScreenW-dx then
								my=my+myfont+10
								mx=dx+4*myfont
							end
							DrawStrBox(mx,my,mys,C_GOLD,myfont)
							mx=mx+mylen
						end
						if myThing['练出武功']>0 then
							local kfname='习得:'..JY.Wugong[myThing['练出武功']]['名称']
							DrawStrBox(mx,my,kfname,C_GOLD,myfont)
							mx=mx+myfont*string.len(kfname)/2+12
						end
						if myThing['类型']>0 then
						drawitem('加生命','生命')
						drawitem('加生命最大值','生命最值')
						drawitem('加中毒解毒','中毒')
						drawitem('加体力','体力')
						if myThing['改变内力性质']==2 then
							drawitem('内力门路阴阳合一')
						end
						drawitem('加内力','内力')
						drawitem('加内力最大值','内力最值')
						drawitem('加攻击力','攻击')
						drawitem('加轻功','轻功')
						drawitem('加防御力','防御')
						drawitem('加医疗能力','医疗')
						drawitem('加用毒能力','用毒')
						drawitem('加解毒能力','解毒')
						drawitem('加抗毒能力','抗毒')
						drawitem('加拳掌功夫','拳掌')
						drawitem('加御剑能力','御剑')
						drawitem('加耍刀技巧','耍刀')
						drawitem('加特殊兵器','特殊')
						drawitem('加暗器技巧','暗器')
						drawitem('加武学常识','武常')
						drawitem('加品德','品德')
						drawitem('加攻击次数','左右',{[0]='否','是'})
						drawitem('加攻击带毒','带毒')
						if mx~=dx or my~=y3_2+2 then
							DrawStrBox(dx,y3_2+2,' 效果:',C_RED,myfont)
						end
						end
						if myThing['类型']==1 or myThing['类型']==2 then
						if mx~=dx then
							mx=dx+4*myfont
							my=my+myfont+10
						end
						myflag=1
						local my2=my
						if myThing['仅修炼人物']>-1 then
							--drawitem('仅修炼人物','仅限',{[myThing['仅修炼人物']]=JY.Person[myThing['仅修炼人物']]['姓名']})
							drawitem('仅限:'..JY.Person[myThing['仅修炼人物']]['姓名'])
						end
						drawitem('需内力性质','阴阳',{[0]='阴','阳','不限'})
						drawitem('需内力','内力')
						drawitem('需攻击力','攻击')
						drawitem('需轻功','轻功')
						drawitem('需用毒能力','用毒')
						drawitem('需医疗能力','医疗')
						drawitem('需解毒能力','解毒')
						drawitem('需拳掌功夫','拳掌')
						drawitem('需御剑能力','御剑')
						drawitem('需耍刀技巧','耍刀')
						drawitem('需特殊兵器','特殊')
						drawitem('需暗器技巧','暗器')
						drawitem('需资质','资质')
						drawitem('需经验','修炼经验')
						if mx~=dx or my~=my2 then
							DrawStrBox(dx,my2,' 需求:',C_RED,myfont)
						end
						end
                    else
                        cur_thing=-1;
                    end
                else
 				    boxcolor=C_BLACK;
                end
				local boxx=dx+CC.ThingGapOut+x*(CC.ThingPicWidth+CC.ThingGapIn);
				local boxy=y3_1+CC.ThingGapOut+y*(CC.ThingPicHeight+CC.ThingGapIn);
                lib.DrawRect(boxx,boxy,boxx+CC.ThingPicWidth+1,boxy+CC.ThingPicHeight+1,boxcolor);
                if thing[id]>=0 then
				    if CC.LoadThingPic==1 then
					    lib.PicLoadCache(2,thing[id]*2,boxx+1,boxy+1,1);
					else
                        lib.PicLoadCache(0,(thing[id]+CC.StartThingPic)*2,boxx+1,boxy+1,1);
					end
                end
            end
        end

        ShowScreen();
	    local keypress=WaitKey(1);
        lib.Delay(100);
        if keypress==VK_ESCAPE then
            cur_thing=-1;
            break;
        elseif keypress==VK_RETURN or keypress==VK_SPACE then
            break;
        elseif keypress==VK_UP then
            if  cur_y == 0 then
                if  cur_line > 0 then
                    cur_line = cur_line - 1;
                end
            else
                cur_y = cur_y - 1;
            end
        elseif keypress==VK_DOWN then
            if  cur_y ==ynum-1 then
                if  cur_line < (math.modf(200/xnum)-ynum) then
                    cur_line = cur_line + 1;
                end
            else
                cur_y = cur_y + 1;
            end
        elseif keypress==VK_LEFT then
            if  cur_x > 0 then
                cur_x=cur_x-1;
            else
                cur_x=xnum-1;
            end
        elseif keypress==VK_RIGHT then
            if  cur_x ==xnum-1 then
                cur_x=0;
            else
                cur_x=cur_x+1;
            end
		elseif keypress==888 and cur_line>0 then
			cur_line=cur_line-1
		elseif keypress==999 and cur_line<(math.modf(200/xnum)-ynum) then
			cur_line=cur_line+1
		elseif keypress>999999 then
			local k,mx,my
			k=math.modf(keypress/1000000)
			keypress=math.fmod(keypress,1000000)
			mx=math.modf(keypress/1000)
			my=math.fmod(keypress,1000)
			if mx>dx and my>dy and mx<CC.ScreenW-dx and my<CC.ScreenH-dy then
				cur_x=math.modf((mx-dx-CC.ThingGapOut/2)/(CC.ThingPicWidth+CC.ThingGapIn))
				cur_y=math.modf((my-y3_1-CC.ThingGapOut/2)/(CC.ThingPicHeight+CC.ThingGapIn))
				if k==2 then
					break
				end
			end
        end

	end

    Cls();
    return cur_thing;
end

--新的系统子菜单，增加控制音乐和音效
function Menu_System()

	local menu={
	             {"读取进度",Menu_ReadRecord,1},
                 {"保存进度",Menu_SaveRecord,1},--2
				 {"关闭音乐",Menu_SetMusic,1},
				 {"关闭音效",Menu_SetSound,1},--4
				 {"全屏切换",Menu_FullScreen,1},                    
				 {"队伍排序",Menu_DDTH,1},--6
				 {"物品整理",Menu_WPZL,1},
				 {"回营整备",nil,1},--8
				 {"马车传送",nil,1},
				 {"简易信息",Menu_JYZTB,1},--10
				 {"头像选择",Menu_HEADXZ,1},
				 {"我的代码",Menu_MYDIY,1},
				 {"离开游戏",Menu_Exit,1},};--13

				 
    if JY.EnableMusic==0 then
	    menu[3][1]="打开音乐";
	end

	if JY.EnableSound==0 then
	    menu[4][1]="打开音效";
    end

	if JY.Status==GAME_SMAP then
	   menu[8][3]=0
	   menu[9][3]=0
	    if JY.SubScene==42 or JY.SubScene==82 or JY.SubScene==13 or JY.SubScene==99 then
	      menu[1][3]=0
	      menu[2][3]=0
	    end
	end
	
	if JY.Thing[202][WZ7]<2 then menu[11][3]=0 end

    local r=ShowMenu(menu,13,0,CC.MainSubMenuX,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);   
   if r==8 then
	   Menu_HYZB()
	   return 1;
	end
	if r==9 then
	   Menu_MCCS()
	   return 1;
	end	
	if r == 0 then
        return 0;
    elseif r<0 then   --要退出全部菜单，
        return 1;
 	end
end

function Menu_MYDIY()
    Cls();
    local MS=JYMsgBox("RUNDIY","确定要运行DIY文件吗？",{"确定","放弃"},2,280);
    if MS==1 then
      dofile(CONFIG.ScriptPath .. "DIY.lua");
	end
	return 1;
end    

function Menu_HEADXZ()
    if JY.HEADXZ==1 then
	   JY.HEADXZ=2
	   CC.HeadPicFile={CONFIG.DataPath .. "atmb.idx",CONFIG.DataPath .. "atmb.grp"};
       lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	   QZXS(CC.EVB166)
	else
	   JY.HEADXZ=1
	   CC.HeadPicFile={CONFIG.DataPath .. "atm.idx",CONFIG.DataPath .. "atm.grp"};
       lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	   QZXS(CC.EVB166)
	end
	return 1;
end    

function Menu_JYZTB()
    if JY.JB==1 then 
       JY.JB=0 
	   Cls();
	   DrawStrBox(-1,-1,"关闭简易信息显示",C_GOLD,30);
	   ShowScreen()
	   WaitKey();
	else
	   JY.JB=1
	   Cls();
	   DrawStrBox(-1,-1,"打开简易信息显示",C_GOLD,30);
	   ShowScreen()
	   WaitKey();
	end
	return 1;
end

function Menu_FullScreen()
    lib.FullScreen();
	lib.Debug("finish fullscreen");
end

function Menu_SetMusic()
    if JY.EnableMusic==0 then
	    JY.EnableMusic=1;
		PlayMIDI(JY.CurrentMIDI);
	else
	    JY.EnableMusic=0;
		lib.PlayMIDI("");
	end
	return 1;
end

function Menu_SetSound()
    if JY.EnableSound==0 then
	    JY.EnableSound=1;
	else
	    JY.EnableSound=0;
	end
	return 1;
end

function Menu_DDTH()	
    Cls();		  
	DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,CC.s34,C_WHITE,CC.DefaultFont);
		local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
		local r1=SelectTeamMenu(CC.MainSubMenuX,nexty);
		if r1==nil or r1<1 then return end
		local p1=JY.Base[CC.s37..r1]
		if p1==0 then
		   Cls();
		   DrawStrBoxWaitKey(CC.s35,C_WHITE,30)
		   return;
		end	
	Cls();
	DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,CC.s36,C_WHITE,CC.DefaultFont);
		local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
		local r2=SelectTeamMenu(CC.MainSubMenuX,nexty);
		if r2==nil or r2<1 then return end
		local p2=JY.Base[CC.s37..r2]		
		if p2==0 then
			Cls();
			DrawStrBoxWaitKey(CC.s35,C_WHITE,30)
			return;
	    end		
			JY.Base[CC.s37..r1]=p2
			JY.Base[CC.s37..r2]=p1		
end

function Menu_WPZL()  
		   for i=1,200 do
               if JY.Base["物品"..i]>-1 then 
                  for ii=i+1,200 do
                      if JY.Base["物品"..ii]>-1 then 
                         if JY.Base["物品"..i]>JY.Base["物品"..ii] then
                            JY.Base["物品"..i],JY.Base["物品"..ii]=JY.Base["物品"..ii],JY.Base["物品"..i]
                            JY.Base["物品数量"..i],JY.Base["物品数量"..ii]=JY.Base["物品数量"..ii],JY.Base["物品数量"..i]
                         end        
                      end 
                  end
               end   
           end
		   Cls();
		   DrawStrBoxWaitKey(CC.s33,C_WHITE,30)
end

function Menu_HYZB()      
		if JY.SubScene~=25 then
		   JY.SubScene=70
		   JY.Base["人X1"]=8
		   JY.Base["人Y1"]=28
		   JY.Base["人X"]=358
		   JY.Base["人Y"]=235
		end
end

function Menu_MCCS()
        Cls()
		local md=JYMsgBox(CC.s59,CC.s60,{CC.s61,CC.s62},2,119);
		if md==1 then			
			local r=SelectSceneMenu(24,24)
			if r>0 and JY.Scene[r-1]["进入条件"]==0 and JY.SubScene~=25 and r~=84 and r~=83 and r~=81 and r~=82 then
				JY.SubScene=r-1;
				--lib.ShowSlow(0,1);
				local ss=JY.SubScene
                           
				while JY.Scene[ss]["外景入口X1"]==0 and JY.Scene[ss]["外景入口Y1"]==0 do
					ss=JY.Scene[ss]["跳转场景"]
				end
				JY.Base["人X"]=JY.Scene[ss]["外景入口X1"]
				JY.Base["人Y"]=JY.Scene[ss]["外景入口Y1"]
				if JY.Scene[JY.SubScene]["外景入口X1"]==0 and JY.Scene[JY.SubScene]["外景入口Y1"]==0 then
					JY.Base["人X1"]=JY.Scene[JY.SubScene]["跳转口X2"];         --外部场景，即从其他内部场景跳回。
					JY.Base["人Y1"]=JY.Scene[JY.SubScene]["跳转口Y2"];
				else
					JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"];            --新场景的外景入口为0，表示这是一个内部场景
					JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"];
				end
			Init_SMap(1);
                        else
                        say(CC.s63,119,5,CC.s64)    				
			end
        else
            local r=GetPinyin1(32,CC.ScreenH-CC.Fontbig*6)		  
			  for i=0,105 do
				   if r==""..i then
				      if JY.Scene[i]["进入条件"]==0 and JY.SubScene~=25 and i~=82 and i~=83 and i~=81 and i~=84 then
					     JY.SubScene=i
						 --lib.ShowSlow(50,1);
							local ss=JY.SubScene
									   
							while JY.Scene[ss]["外景入口X1"]==0 and JY.Scene[ss]["外景入口Y1"]==0 do
								ss=JY.Scene[ss]["跳转场景"]
							end
							JY.Base["人X"]=JY.Scene[ss]["外景入口X1"]
							JY.Base["人Y"]=JY.Scene[ss]["外景入口Y1"]
							if JY.Scene[JY.SubScene]["外景入口X1"]==0 and JY.Scene[JY.SubScene]["外景入口Y1"]==0 then
								JY.Base["人X1"]=JY.Scene[JY.SubScene]["跳转口X2"];         --外部场景，即从其他内部场景跳回。
								JY.Base["人Y1"]=JY.Scene[JY.SubScene]["跳转口Y2"];
							else
								JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"];            --新场景的外景入口为0，表示这是一个内部场景
								JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"];
							end
						 Init_SMap(1);
                      else
                         say(CC.s63,119,5,CC.s64) 
					  end
					  break
					end  
			  end
        end			  
end

--离开菜单
function Menu_Exit()      --离开菜单
    Cls();
    if DrawStrBoxYesNo(-1,-1,"是否真的要离开游戏？",C_WHITE,CC.DefaultFont) == true then
        JY.Status =GAME_END;
    end
    return 1;
end

function Menu_SaveRecord()         --保存进度菜单
	local menu={ {"进度一",nil,1},
                 {"进度二",nil,1},
                 {"进度三",nil,1},  };
    local r=ShowMenu(menu,3,0,CC.MainSubMenuX2,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
    if r>0 then
		if JY.Status==GAME_SMAP then 			--保存部分和场景地图存档相关信息
			JY.Base["无用"]=JY.SubScene
			
		else
			JY.Base["无用"]=-1
			
		end
        DrawStrBox(CC.MainSubMenuX2,CC.MainSubMenuY,"请稍候......",C_WHITE,CC.DefaultFont);
        ShowScreen();
        SBLDATAS(r);
        Cls(CC.MainSubMenuX2,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
	end
    return 0;
end

function Menu_ReadRecord()        --读取进度菜单
	local menu={ {"进度一",nil,1},
                 {"进度二",nil,1},
                 {"进度三",nil,1},  };
    local r=ShowMenu(menu,3,0,CC.MainSubMenuX2,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r == 0 then
        return 0;
    elseif r>0 then
        DrawStrBox(CC.MainSubMenuX2,CC.MainSubMenuY,"请稍候......",C_WHITE,CC.DefaultFont);
        ShowScreen();
        SBLDATAL(r);
		if JY.Base["无用"]~=-1 then 
			if JY.SubScene < 0 then          --处于大地图
				CleanMemory();
				lib.UnloadMMap();
			end
			lib.PicInit();
			lib.ShowSlow(50,1)
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["无用"]
			
			JY.MmapMusic=-1;
			JY.MyPic=GetMyPic();
			Init_SMap(1);
		else 
			JY.SubScene=-1;
			JY.Status=GAME_FIRSTMMAP;
		end
        return 1;
	end
end

--状态子菜单
function Menu_Status()           --状态子菜单
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"要查阅谁的状态",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;

    local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
    if r >0 then
        ShowPersonStatus(r)
		return 1;
	else
		Cls();
        return 0;
	end
end

--离队Exit
function Menu_PersonExit()        --离队Exit
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"要求谁离队",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;

	local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
    if r==1 then
        DrawStrBoxWaitKey("抱歉！没有你游戏进行不下去",C_WHITE,CC.DefaultFont,1);
    elseif JY.SubScene==82 then
	    --
	elseif r>0 and JY.SubScene==55 and JY.Base["队伍" .. r]==35 then
	    --
	elseif r>1 then
        local personid=JY.Base["队伍" .. r];
        for i,v in ipairs(CC.PersonExit) do         --在离队列表中调用离队函数
             if personid==v[1] then
			    if OEVENTLUA[v[2]]~=nil then
				   OEVENTLUA[v[2]]()
				else
                    oldCallEvent(v[2]);
			    end
             end
        end
    end
    Cls();
    return 0;
end

--队伍选择人物菜单
function SelectTeamMenu(x,y)          --队伍选择人物菜单
   
	local menu={};
	for i=1,CC.TeamNum do
		menu[i]={"",nil,0};
		local id=JY.Base["队伍" .. i]
		if id>=0 then
			if JY.Person[id]["生命"]>0 then
				menu[i][1]=JY.Person[id]["姓名"];
				menu[i][3]=1;
			end
		end
	end
    return ShowMenu(menu,CC.TeamNum,0,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
end

function GetTeamNum()            --得到队友个数
    local r=CC.TeamNum;
	for i=1,CC.TeamNum do
	    if JY.Base["队伍" .. i]<0 then
		    r=i-1;
		    break;
		end
    end
	return r;
end

---显示队友状态
-- 左右键翻页，上下键换队友
function ShowPersonStatus(teamid)---显示队友状态	
	local page=1;
	local pagenum=2;
	local teamnum=GetTeamNum();

	while true do
	    Cls();
        local id=JY.Base["队伍" .. teamid];
        ShowPersonStatus_sub(id,page);

        ShowScreen();
	    local keypress=WaitKey();
        lib.Delay(100);
        if keypress==VK_ESCAPE then
            break;
        elseif keypress==VK_UP then
		    teamid=teamid-1;
        elseif keypress==VK_DOWN then
		    teamid=teamid+1;
        elseif keypress==VK_LEFT then
		    page=page-1;
        elseif keypress==VK_RIGHT then
		    page=page+1;
		elseif keypress==VK_SPACE or keypress>1999999 then
		    Cls();
			if TFNLJS[JY.Person[id]["姓名"]]~=nil then
			    say(TFNLJS[JY.Person[id]["姓名"]],id,5)	 
		    end
		elseif CC.Debug==nil then
			
		--[[elseif keypress==108 then	--L LVUPFY
			local lv=JY.Person[id]["等级"];
		  while lv<30 do
			AddPersonAttrib(id,"经验",CC.Exp[lv]-JY.Person[id]["经验"]);
			if War_AddPersonLVUP(id) then
			   
			end
		    lv=JY.Person[id]["等级"];
			if lv==30 then
				DrawStrBox(-1,-1,string.format("%s 升级了",JY.Person[id]["姓名"]),C_WHITE,CC.DefaultFont);
				ShowScreen();
				WaitKey();
			end
		  end		  
		  JY.Person[id]["修炼点数"]=30000
		  War_PersonTrainBook(id) 		  
		   
		elseif keypress==99 then	--C
			--AddPersonAttrib(id,'资质',1)
			local lv=JY.Person[id]["等级"];
			AddPersonAttrib(id,"经验",CC.Exp[lv]-JY.Person[id]["经验"]);
			if War_AddPersonLVUP(id) then
			   
			end
		elseif keypress==102 then	--F
			--AddPersonAttrib(id,'资质',-1)
		]]	
        end
		teamid=limitX(teamid,1,teamnum);
		page=limitX(page,1,pagenum);
	end
end

--id 人物编号
--page 显示页数，目前共两页
function ShowPersonStatus_sub(id,page)    --显示人物状态页面
   
    local size=CC.DefaultFont;    --字体大小
    local p=JY.Person[id];
    local p0=JY.Person[0];
    local width=18*size+15;             --18个汉字字符宽
	local h=size+CC.PersonStateRowPixel;
	local height=13*h+10;                --12个汉字字符高
	local dx=(CC.ScreenW-width)/2;
	local dy=(CC.ScreenH-height)/2;

	local i=1;
    local x1,y1,x2;

    DrawBox(dx,dy,dx+width,dy+height,C_WHITE);

    x1=dx+5;
	y1=dy+5;
	x2=4*size;
	local headw,headh=lib.PicGetXY(1,p["头像代号"]*2);		
    local headx=(width/2-headw)/3;
	local heady=(h*6-headh)/6;
	local hid;

	if id==0 then
	    if GetS(4,5,5,5)<8 then
           hid=280+GetS(4,5,5,5)		
		  --lib.PicLoadCache(1,(280+GetS(4,5,5,5))*2,x1+headx,y1+heady,1);
	    else
		   hid=287+GetS(4,5,5,4)
		  --lib.PicLoadCache(1,(287+GetS(4,5,5,4))*2,x1+headx,y1+heady,1);
	    end
	else
	    hid=p["头像代号"]
        --lib.PicLoadCache(1,p["头像代号"]*2,x1+headx,y1+heady,1);
	end
	lib.PicLoadCache(1,hid*2,x1+headx,y1+heady,1);
	
	
	i=4;
    DrawString(x1,y1+h*i,p[CC.s23],C_WHITE,size);
    DrawString(x1+10*size/2,y1+h*i,string.format("%3d",p["等级"]),C_GOLD,size);
    DrawString(x1+13*size/2,y1+h*i,"级",C_ORANGE,size);
    i=i+1
         DrawString(x1,y1+h*i,CC.s24,C_GOLD,size);  --天赋
		 if id==0 and p[CC.s23]~=JY.LEQ and p[CC.s23]~=JY.SQ and p[CC.s23]~=JY.XYK then
		     DrawString(x1+size*3,y1+h*i,ZJTF[JY.Thing[201][WZ7]],C_GOLD,size);
         end		 
         if p[CC.s23]==JY.LEQ and id==0 then
         DrawString(x1+size*3,y1+h*i,RWTFLB['01'],C_GOLD,size);
         end
         if p[CC.s23]==JY.SQ and id==0 then
         DrawString(x1+size*3,y1+h*i,RWTFLB['02'],C_GOLD,size);
         end
         if p[CC.s23]==JY.XYK and id==0 then
         DrawString(x1+size*3,y1+h*i,RWTFLB['03'],C_GOLD,size);
         end
		 if id~=0 and RWTFLB[id]~=nil then
		    DrawString(x1+size*3,y1+h*i,RWTFLB[id],C_GOLD,size);
		 end
		 
    i=i+1
         DrawString(x1,y1+h*i,CC.s25,C_GOLD,size); 
         if RWWH[id]~=nil and id~=35 then		 
            DrawString(x1+size*3,y1+h*i,RWWH[id],C_GOLD,size);
		 end
		 if id==35 then
     		if GetS(10,1,1,0)==1 then
		       DrawString(x1+size*3,y1+h*i,RWWH['35'],C_GOLD,size);
	        else
			   DrawString(x1+size*3,y1+h*i,RWWH[id],C_GOLD,size);
		    end
		 end		 
		 if id==0 and p[CC.s23]==JY.LEQ then
		    if GetS(10,0,7,0)==1 then
		       DrawString(x1+size*3,y1+h*i,RWWH['01b'],C_GOLD,size);
			else
			   DrawString(x1+size*3,y1+h*i,RWWH['01'],C_GOLD,size);
			end
		 end
         if id==0 and p[CC.s23]==JY.SQ then
		    DrawString(x1+size*3,y1+h*i,RWWH['02'],C_GOLD,size);
		 end
		 if id==0 and p[CC.s23]==JY.XYK then
		    DrawString(x1+size*3,y1+h*i,RWWH['03'],C_GOLD,size);
		 end
		 if id==0 and GetS(10,0,7,0)==1 and JY.Thing[201][WZ7]~=8 then
		    DrawString(x1+size*3,y1+h*i,RWWH['04'],C_GOLD,size);
		 end
         if JY.Person[49]["武功1"]==8 and id==49 then 
		    DrawString(x1+size*3,y1+h*i,RWWH['49'],C_GOLD,size);
		 end		 
		 for w=1,10 do
		     if JY.Person[38]["武功"..w]<=0 then break end
		     if JY.Person[38]["武功"..w]==102 and id==38 then
			    DrawString(x1+size*3,y1+h*i,RWWH['38'],C_GOLD,size);
                break;				
			 end
	     end
		 --end
        
	local function DrawAttrib(str,color1,color2,v)    --定义内部函数
        v=v or 0;
        DrawString(x1,y1+h*i,str,color1,size);
        DrawString(x1+x2,y1+h*i,string.format("%5d",p[str]+v),color2,size);
        i=i+1;
    end

if page==1 then
    local color;              --显示生命和最大值，根据受伤和中毒显示不同颜色
    if p["受伤程度"]<33 then
        color =RGB(236,200,40);
    elseif p["受伤程度"]<66 then
        color=RGB(244,128,32);
    else
        color=RGB(232,32,44);
    end
	i=i+1;
    DrawString(x1,y1+h*i,"生命",C_ORANGE,size);
    DrawString(x1+2*size,y1+h*i,string.format("%5d",p["生命"]),color,size);
    DrawString(x1+9*size/2,y1+h*i,"/",C_GOLD,size);

    if p["中毒程度"]==0 then
        color =RGB(252,148,16);
    elseif p["中毒程度"]<50 then
        color=RGB(120,208,88);
    else
        color=RGB(56,136,36);
    end
    DrawString(x1+5*size,y1+h*i,string.format("%5s",p["生命最大值"]),color,size);

    i=i+1;              --显示内力和最大值，根据内力性质显示不同颜色
    if p["内力性质"]==0 then
        color=RGB(208,152,208);
    elseif p["内力性质"]==1 then
        color=RGB(236,200,40);
    else
        color=RGB(236,236,236);
    end
	if GetS(4,5,5,5)==5 and id==0 then
	   color=RGB(216, 20, 24) 
	end
    DrawString(x1,y1+h*i,"内力",C_ORANGE,size);
    DrawString(x1+2*size,y1+h*i,string.format("%5d/%5d",p["内力"],p["内力最大值"]),color,size);

    i=i+1;
    --DrawAttrib("体力",C_ORANGE,C_GOLD)
    --DrawAttrib("经验",C_ORANGE,C_GOLD)
	DrawString(x1,y1+h*i,"体力",C_ORANGE,size)
	DrawString(x1+size*2+8,y1+h*i,p["体力"],C_GOLD,size)
	DrawString(x1+size*4+16,y1+h*i,"体质",C_ORANGE,size)
	DrawString(x1+size*6+32,y1+h*i,p["生命增长"],C_GOLD,size)
	i=i+1;
	DrawString(x1,y1+h*i,"实战",C_ORANGE,size)  --JPS
	for j=1,51 do
	      if id==TeamP[j] then
		     local num,cl=GetS(5,j,6,5)-2,C_GOLD;
			 if num>499 then 
			    num="极" 
				cl=C_RED
			 end
	         DrawString(x1+size*2+8,y1+h*i,num,cl,size)
		     break
		  end
	end
	DrawString(x1+size*4+16,y1+h*i,"互搏",C_ORANGE,size)
	local hb;
	if p["左右互搏"]==1 then
	   hb="◎"
	else
	   hb="※"
	end
	DrawString(x1+size*6+24,y1+h*i,hb,C_GOLD,size)	
	i=i+1
    DrawString(x1,y1+h*i,"升级",C_ORANGE,size);
	local kk;
	if p["等级"] >=30 then
	   kk='   =';
	else
	   kk=2*(p["经验"]-CC.Exp[p["等级"]-1])
	   if kk<0 then 
	      kk='  0' 
	   elseif kk<10 then
	      kk='   '..kk
	   elseif kk<100 then
	      kk='  '..kk 
	   elseif kk<1000 then
	      kk=' '..kk
	   end	 
	end
	
    DrawString(x1+size*2+16,y1+h*i,kk,C_GOLD,size);	
    local tmp;
	if p["等级"] >=CC.Level then
	    tmp="=";
	else
        tmp=2*(CC.Exp[p["等级"]]-CC.Exp[p["等级"]-1]);
	end
    --DrawString(x1,y1+h*i,"升级",C_ORANGE,size);
    DrawString(x1+size*4+16,y1+h*i,'/'..tmp,C_GOLD,size);

    local tmp1,tmp2,tmp3=0,0,0;
    if p["武器"]>-1 then
        tmp1=tmp1+JY.Thing[p["武器"]]["加攻击力"];
        tmp2=tmp2+JY.Thing[p["武器"]]["加防御力"];
        tmp3=tmp3+JY.Thing[p["武器"]]["加轻功"];
	end
    if p["防具"]>-1 then
        tmp1=tmp1+JY.Thing[p["防具"]]["加攻击力"];
        tmp2=tmp2+JY.Thing[p["防具"]]["加防御力"];
        tmp3=tmp3+JY.Thing[p["防具"]]["加轻功"];
	end

    i=i+1; --NZT
    --DrawString(x1,y1+h*i,"左右键翻页，上下键查看其它队友",C_RED,size);
    
    DrawString(x1,y1+h*i,"中毒",C_ORANGE,size);
	DrawString(x1+size*2+10,y1+h*i,p["中毒程度"],C_BLACK,size);
	DrawString(x1+size*4+25,y1+h*i,"内伤",C_ORANGE,size);
	DrawString(x1+size*6+35,y1+h*i,p["受伤程度"],C_RED,size);
	DrawString(x1+size*8+50,y1+h*i,"封穴",C_ORANGE,size);
      if JY.Status==GAME_WMAP and WAR.FXDS[id]~=nil then     	  
	DrawString(x1+size*10+60,y1+h*i,WAR.FXDS[id],C_GOLD,size);
	  else	
	DrawString(x1+size*10+60,y1+h*i,0,C_GOLD,size);
	  end
	DrawString(x1+size*12+75,y1+h*i,"流血",C_ORANGE,size);
	  if JY.Status==GAME_WMAP and WAR.LXZT[id]~=nil then  
	DrawString(x1+size*14+85,y1+h*i,WAR.LXZT[id],C_RED,size);
	  else
	DrawString(x1+size*14+85,y1+h*i,0,C_RED,size);
	  end
		
    i=0;
	x1=dx+width/2-24;
    DrawAttrib("攻击力",C_WHITE,C_GOLD);
    DrawString(x1+210,y1,"↑ "..tmp1,C_GOLD,size);    
    DrawAttrib("防御力",C_WHITE,C_GOLD);
    DrawString(x1+210,y1+h,"↑ "..tmp2,C_GOLD,size);  
    DrawAttrib("轻功",C_WHITE,C_GOLD);
	if tmp3>-1 then
    DrawString(x1+210,y1+h*2,"↑ "..tmp3,C_GOLD,size); 
    else
    tmp3=-tmp3
    DrawString(x1+210,y1+h*2,"↓ "..tmp3,C_GOLD,size);
	end
    DrawAttrib("医疗能力",C_WHITE,C_GOLD);
    DrawAttrib("用毒能力",C_WHITE,C_GOLD);
    DrawAttrib("解毒能力",C_WHITE,C_GOLD);


    DrawAttrib("拳掌功夫",C_WHITE,C_GOLD);
    DrawAttrib("御剑能力",C_WHITE,C_GOLD);
    DrawAttrib("耍刀技巧",C_WHITE,C_GOLD);
    DrawAttrib("特殊兵器",C_WHITE,C_GOLD);
    DrawAttrib("暗器技巧",C_WHITE,C_GOLD);
    DrawAttrib("资质",C_WHITE,C_GOLD);

elseif page==2 then
	i=i+1;
    DrawString(x1,y1+h*i,"武器:",C_ORANGE,size);
	if p["武器"]>-1 then
        DrawString(x1+size*3,y1+h*i,JY.Thing[p["武器"]]["名称"],C_GOLD,size);
    end
	i=i+1;
    DrawString(x1,y1+h*i,"防具:",C_ORANGE,size);
	if p["防具"]>-1 then
        DrawString(x1+size*3,y1+h*i,JY.Thing[p["防具"]]["名称"],C_GOLD,size);
    end
    i=i+1;
    DrawString(x1,y1+h*i,"修炼物品",C_ORANGE,size);
	local thingid=p["修炼物品"];
	if thingid>0 then
	    i=i+1;
        DrawString(x1+size,y1+h*i,JY.Thing[thingid]["名称"],C_GOLD,size);
		i=i+1;
        local n=TrainNeedExp(id);
		if n <math.huge then
            DrawString(x1+size,y1+h*i,string.format("%5d/%5d",p["修炼点数"],n),C_GOLD,size);
		else
            DrawString(x1+size,y1+h*i,string.format("%5d/===",p["修炼点数"]),C_GOLD,size);
		end
	else
	    i=i+2;
	end

    i=i+1;
    DrawString(x1,y1+h*i,"左右键翻页 上下键换人 空格键能力解说",C_RED,size);

    i=0;
	x1=dx+width/2;
    DrawString(x1,y1+h*i,"所会功夫",C_ORANGE,size);
	local T={"一","二","三","四","五","六","七","八","九","十","极"}
	if JY.Person[0]["武功1"]>108 and JY.Person[0]["武功等级1"]<900 then JY.Person[0]["武功等级1"]=900 end
	for j=1,10 do
        i=i+1
		local wugong=p["武功" .. j];
		if wugong > 0 then
    		local level=math.modf(p["武功等级" .. j] / 100)+1;
			if p["武功等级" .. j]==999 then level=11 end
            DrawString(x1+size,y1+h*i,string.format("%s",JY.Wugong[wugong]["名称"]),C_GOLD,size);
			if p["武功等级" .. j]>900 then
				lib.SetClip(x1+size,y1+h*1,x1+size+string.len(JY.Wugong[wugong]["名称"])*size*(p["武功等级" .. j]-900)/200,y1+h*i+h)
				DrawString(x1+size,y1+h*i,string.format("%s",JY.Wugong[wugong]["名称"]),C_ORANGE,size);
				lib.SetClip(0,0,0,0)
			end
            DrawString(x1+size*7,y1+h*i,T[level],C_WHITE,size);
		end
	end
	i=11
	DrawString(x1+size,y1+h*i,"怒气",C_ORANGE,size);
	if JY.Status==GAME_WMAP and WAR.LQZ[id]~=nil then
	   DrawString(x1+size*3+10,y1+h*i,WAR.LQZ[id],C_GOLD,size);
	else
	   DrawString(x1+size*3+10,y1+h*i,0,C_GOLD,size);
	end
	DrawString(x1+size*5+10,y1+h*i,"※※",C_ORANGE,size);
	DrawString(x1+size*7+20,y1+h*i,0,C_GOLD,size);

end

end


--计算人物修炼成功需要的点数
--id 人物id
function TrainNeedExp(id)         --计算人物修炼物品成功需要的点数
    local thingid=JY.Person[id]["修炼物品"];
	local r =0;
	if thingid >= 0 then
        if JY.Thing[thingid]["练出武功"] >=0 then
            local level=0;          --此处的level是实际level-1。这样没有武功時和炼成一级是一样的。
			for i =1,10 do               -- 查找当前已经炼成武功等级
			    if JY.Person[id]["武功" .. i]==JY.Thing[thingid]["练出武功"] then
                    level=math.modf(JY.Person[id]["武功等级" .. i] /100);
					break;
                end
            end
			if level <9 then
                r=(150-JY.Person[id]["资质"])*JY.Thing[thingid]["需经验"]*(level+1)/50;
			else
                r=math.huge;
				return r
			end
		else
            r=(150-JY.Person[id]["资质"])*JY.Thing[thingid]["需经验"]*2/50;
		end
	end
    return math.modf(r);
end

--医疗菜单
function Menu_Doctor()       --医疗菜单
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"谁要使用医术",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    DrawStrBox(CC.MainSubMenuX,nexty,"医疗能力",C_ORANGE,CC.DefaultFont);

	local menu1={};
	for i=1,CC.TeamNum do
        menu1[i]={"",nil,0};
		local id=JY.Base["队伍" .. i]
        if id >=0 then
            if JY.Person[id]["医疗能力"]>=20 then
                 menu1[i][1]=string.format("%-10s%4d",JY.Person[id]["姓名"],JY.Person[id]["医疗能力"]);
                 menu1[i][3]=1;
            end
        end
	end

    local id1,id2;
	nexty=nexty+CC.SingleLineHeight;
    local r=ShowMenu(menu1,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r >0 then
	    id1=JY.Base["队伍" .. r];
        Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"要医治谁",C_WHITE,CC.DefaultFont);
        nexty=CC.MainSubMenuY+CC.SingleLineHeight;

		local menu2={};
		for i=1,CC.TeamNum do
			menu2[i]={"",nil,0};
			local id=JY.Base["队伍" .. i]
			if id>=0 then
				 menu2[i][1]=string.format("%-10s%4d/%4d",JY.Person[id]["姓名"],JY.Person[id]["生命"],JY.Person[id]["生命最大值"]);
				 menu2[i][3]=1;
			end
		end

		local r2=ShowMenu(menu2,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);

		if r2 >0 then
	        id2=JY.Base["队伍" .. r2];
            local num=ExecDoctor(id1,id2);
			if num>0 then
                AddPersonAttrib(id1,"体力",-2);
			end
            DrawStrBoxWaitKey(string.format("%s 生命增加 %d",JY.Person[id2]["姓名"],num),C_ORANGE,CC.DefaultFont);
		end
	end

	Cls();

    return 0;
end

--执行医疗
--id1 医疗id2, 返回id2生命增加点数
function ExecDoctor(id1,id2)      --执行医疗
	if JY.Person[id1]["体力"]<50 then
        return 0;
	end

	local add=JY.Person[id1]["医疗能力"];
    local value=JY.Person[id2]["受伤程度"];
    if value > add+20 then
        return 0;
	end
	
	if id1==28 and JY.Status==GAME_WMAP then
	   add=math.modf(JY.Person[id1]["医疗能力"]*(1+WAR.PYZ/10));
    end
		
	if JY.Status==GAME_WMAP then
		for i,v in pairs(CC.AddDoc) do
			if v[1]==id1 then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["人物编号"]==v[2] and  WAR.Person[wid]["死亡"]==false then
						add=add+v[3];
					end
				end
			end
		end
	end
	
	add=add-add*value/200;
 	add=math.modf(add)+Rnd(5);

    AddPersonAttrib(id2,"受伤程度",-math.modf(add/10));
    return AddPersonAttrib(id2,"生命",add)
end


--解毒
function Menu_DecPoison()         --解毒
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"谁要帮人解毒",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    DrawStrBox(CC.MainSubMenuX,nexty,"解毒能力",C_ORANGE,CC.DefaultFont);

	local menu1={};
	for i=1,CC.TeamNum do
        menu1[i]={"",nil,0};
		local id=JY.Base["队伍" .. i]
        if id>=0 then
            if JY.Person[id]["解毒能力"]>=20 then
                 menu1[i][1]=string.format("%-10s%4d",JY.Person[id]["姓名"],JY.Person[id]["解毒能力"]);
                 menu1[i][3]=1;
            end
        end
	end

    local id1,id2;
 	nexty=nexty+CC.SingleLineHeight;
    local r=ShowMenu(menu1,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r >0 then
	    id1=JY.Base["队伍" .. r];
         Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"替谁解毒",C_WHITE,CC.DefaultFont);
		nexty=CC.MainSubMenuY+CC.SingleLineHeight;

        DrawStrBox(CC.MainSubMenuX,nexty,"中毒程度",C_WHITE,CC.DefaultFont);
	    nexty=nexty+CC.SingleLineHeight;

		local menu2={};
		for i=1,CC.TeamNum do
			menu2[i]={"",nil,0};
			local id=JY.Base["队伍" .. i]
			if id>=0 then
				 menu2[i][1]=string.format("%-10s%5d",JY.Person[id]["姓名"],JY.Person[id]["中毒程度"]);
				 menu2[i][3]=1;
			end
		end

		local r2=ShowMenu(menu2,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
		if r2 >0 then
	        id2=JY.Base["队伍" .. r2];
            local num=ExecDecPoison(id1,id2);
            DrawStrBoxWaitKey(string.format("%s 中毒程度减少 %d",JY.Person[id2]["姓名"],num),C_ORANGE,CC.DefaultFont);
		end
	end
    Cls();
    return 0;
end

--解毒
--id1 解毒id2, 返回id2中毒减少点数
function ExecDecPoison(id1,id2)     --执行解毒
    local add=JY.Person[id1]["解毒能力"];
    local value=JY.Person[id2]["中毒程度"];

    if value > add+20 then
        return 0;
	end

 	add=limitX(math.modf(add/3)+Rnd(10)-Rnd(10),0,value);
    return -AddPersonAttrib(id2,"中毒程度",-add);
end

--物品菜单
function Menu_Thing()       --物品菜单
                            --新武功条件

	 

    local menu={ {"全部物品",nil,1},
                 {"剧情物品",nil,1},
                 {"神兵宝甲",nil,1},
                 {"武功秘笈",nil,1},
                 {"灵丹妙药",nil,1},
                 {"伤人暗器",nil,1}, };

    local r=ShowMenu(menu,CC.TeamNum,0,CC.MainSubMenuX,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

	if r>0 then
        local thing={};
        local thingnum={};

		for i = 0,CC.MyThingNum-1 do
			thing[i]=-1;
			thingnum[i]=0;
		end

        local num=0
		for i = 0,CC.MyThingNum-1 do
		    local id=JY.Base["物品" .. i+1];
			
			if id>=0 then
				if r==1 then
					thing[i]=id
					thingnum[i]=JY.Base["物品数量" ..i+1];
				else
					if JY.Thing[id]["类型"]==r-2 then             --对应于类型0-4
 					    thing[num]=id;
					    thingnum[num]=JY.Base["物品数量" ..i+1];
						num=num+1;
					end
				end
			end
		end

        local r=SelectThing(thing,thingnum);
		if r>236 then OVERZB() end
        if r>=0 then
            UseThing(r);           --使用物品
			return 1;             --退出主菜单
		end
	end
	return 0;
end

--场景处理主函数
function Game_SMap()         --场景处理主函数
	
	DrawSMap(CONFIG.FastShowScreen);
	--DrawSMapMini()
	if CC.ShowXY==1 then
		DrawString(10,CC.ScreenH-20,string.format("%s %d %d",JY.Scene[JY.SubScene]["名称"],JY.Base["人X1"],JY.Base["人Y1"]) ,C_GOLD,16);
		--DrawString(CC.ScreenW-9*CC.DefaultFont,10,os.date("%Y年%m月%d日 %H:%M:%S"),RGB(216, 20, 24) ,16);
		DrawString(CC.ScreenW-150,8,os.date("%c"),C_GOLD,16);
	end
	
	if JY.JB==1 then JYZTB() end
	if JY.WGLVXS==1 then
	   --DrawString(10,CC.ScreenH-25,JY.SubScene.." "..JY.Scene[JY.SubScene]["名称"] ,C_GOLD,20);
	end
	
	ShowScreen(CONFIG.FastShowScreen);

	lib.SetClip(0,0,0,0);

    local d_pass=GetS(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],3);   --当前路过事件
    if d_pass>=0 then
        if d_pass ~=JY.OldDPass then     --避免重复触发
            EventExecute(d_pass,3);       --路过触发事件
            JY.OldDPass=d_pass;
		    JY.oldSMapX=-1;
	        JY.oldSMapY=-1;
			JY.D_Valid=nil;
			if JY.Status~=GAME_SMAP then
				return ;
			end
        end
    else
        JY.OldDPass=-1;
    end

    local isout=0;                --是否碰到出口
    if (JY.Scene[JY.SubScene]["出口X1"] ==JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y1"] ==JY.Base["人Y1"]) or
       (JY.Scene[JY.SubScene]["出口X2"] ==JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y2"] ==JY.Base["人Y1"]) or
       (JY.Scene[JY.SubScene]["出口X3"] ==JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y3"] ==JY.Base["人Y1"]) then
       isout=1;
    end

    if isout==1 then    --出去，返回主地图
        JY.Status=GAME_MMAP;

		lib.PicInit();
		CleanMemory();
        --lib.ShowSlow(50,1)

        if JY.MmapMusic<0 then
		   if CONFIG.MP3==1 then
		      JY.MmapMusic=39+math.random(5)--JY.Scene[JY.SubScene]["出门音乐"];
		   else
              JY.MmapMusic=25
		   end
        end

		Init_MMap();



        JY.SubScene=-1;
		JY.oldSMapX=-1;
		JY.oldSMapY=-1;

        lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],GetMyPic());
        --lib.ShowSlow(50,0)
        lib.GetKey();
        return;
    end

    --是否跳转到其他场景
    if JY.Scene[JY.SubScene]["跳转场景"] >=0 then
        if JY.Base["人X1"]==JY.Scene[JY.SubScene]["跳转口X1"] and JY.Base["人Y1"]==JY.Scene[JY.SubScene]["跳转口Y1"] then
			local OldScene=JY.SubScene;
            JY.SubScene=JY.Scene[JY.SubScene]["跳转场景"];
            lib.ShowSlow(50,1);
--[[
            if JY.Scene[JY.SubScene]["外景入口X1"]==0 and JY.Scene[JY.SubScene]["外景入口Y1"]==0 then
                JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"];            --新场景的外景入口为0，表示这是一个内部场景
                JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"];
            else
                JY.Base["人X1"]=JY.Scene[JY.SubScene]["跳转口X2"];         --外部场景，即从其他内部场景跳回。
                JY.Base["人Y1"]=JY.Scene[JY.SubScene]["跳转口Y2"];
            end
]]--
            if JY.Scene[OldScene]["外景入口X1"]~=0 then
				JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"];            --新场景的外景入口为0，表示这是一个内部场景
                JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"];
            else
                JY.Base["人X1"]=JY.Scene[JY.SubScene]["跳转口X2"];         --外部场景，即从其他内部场景跳回。
                JY.Base["人Y1"]=JY.Scene[JY.SubScene]["跳转口Y2"];
			end
			Init_SMap(1);

            return;
        end
    end

    local x,y;
    local keypress = lib.GetKey();
    local direct=-1;
    if keypress ~= -1 then
		JY.MyTick=0;
		if keypress==VK_ESCAPE then
			MMenu();
			JY.oldSMapX=-1;
	        JY.oldSMapY=-1;
		elseif keypress==VK_UP then
			direct=0;
		elseif keypress==VK_DOWN then
			direct=3;
		elseif keypress==VK_LEFT then
			direct=2;
		elseif keypress==VK_RIGHT then
			direct=1;
		elseif keypress==9 then
			--Systeam()
		elseif keypress==45 then
			CC.MapSize=limitX(CC.MapSize-1,8,math.modf(math.min(CC.ScreenW/32,CC.ScreenH/16)));
		elseif keypress==61 then
			CC.MapSize=limitX(CC.MapSize+1,8,math.modf(math.min(CC.ScreenW/32,CC.ScreenH/16)));
		elseif keypress==109 then
			CC.MapKind=CC.MapKind+1;
			if CC.MapKind>2 then
				CC.MapKind=0;
			end
		elseif keypress>1999999 then
			local mx=math.modf((keypress-2000000)/1000)
			local my=math.fmod(keypress-2000000,1000)
			mx=mx-CC.ScreenW/2
			my=my-CC.ScreenH/2
			mx=mx/CC.XScale
			my=my/CC.YScale
			mx,my=(mx+my)/2,(my-mx)/2
			if mx>0 then mx=mx+0.99 else mx=mx-0.01 end
			if my>0 then my=my+0.99 else mx=mx-0.01 end
			mx=math.modf(mx)
			my=math.modf(my)
			for i=1,20 do
				if JY.Base["人X1"]+mx+i >63 or JY.Base["人Y1"]+my+i>63 then
					break
				end
				if math.abs(GetS(JY.SubScene,JY.Base["人X1"]+mx+i,JY.Base["人Y1"]+my+i,4)-CC.YScale*i*2)<8 then
					mx=mx+i
					my=my+i
					break
				end
			end
			if math.abs(mx)+math.abs(my)==1 then
                local d_num=GetS(JY.SubScene,JY.Base["人X1"]+mx,JY.Base["人Y1"]+my,3);
                if d_num>=0 then
                    EventExecute(d_num,1);       --空格触发事件
					JY.oldSMapX=-1;
					JY.oldSMapY=-1;
					JY.D_Valid=nil;
                end
			end
			walkto(mx,my)
		elseif keypress==VK_SPACE or keypress==VK_RETURN  then
            if JY.Base["人方向"]>=0 then        --当前方向下一个位置				
                local d_num=GetS(JY.SubScene,JY.Base["人X1"]+CC.DirectX[JY.Base["人方向"]+1],JY.Base["人Y1"]+CC.DirectY[JY.Base["人方向"]+1],3);
                if d_num>=0 then
                    EventExecute(d_num,1);       --空格触发事件
					JY.oldSMapX=-1;
					JY.oldSMapY=-1;
					JY.D_Valid=nil;
                end
            end
		end
    end
    if keypress==VK_RETURN then keypress=VK_SPACE end
	NEvent(keypress);
	FKJGN(keypress);	
	
	if AutoMoveTab[0]~=0 then
		if direct==-1 then
			direct=AutoMoveTab[AutoMoveTab[0]]
			AutoMoveTab[AutoMoveTab[0]]=nil
			AutoMoveTab[0]=AutoMoveTab[0]-1
		else
			AutoMoveTab={[0]=0}
		end
	end

    if JY.Status~=GAME_SMAP then
        return ;
    end
	

    if direct ~= -1 then
        AddMyCurrentPic();
        x=JY.Base["人X1"]+CC.DirectX[direct+1];
        y=JY.Base["人Y1"]+CC.DirectY[direct+1];
        JY.Base["人方向"]=direct;
    else
        x=JY.Base["人X1"];
        y=JY.Base["人Y1"];
    end

    JY.MyPic=GetMyPic();

    DtoSMap();

    if direct~=-1 and (CC.cq~=nil or SceneCanPass(x,y)==true) then          --新的坐标可以走过去
        JY.Base["人X1"]=x;
        JY.Base["人Y1"]=y;
    end

    JY.Base["人X1"]=limitX(JY.Base["人X1"],1,CC.SWidth-2);
    JY.Base["人Y1"]=limitX(JY.Base["人Y1"],1,CC.SHeight-2);

end

--场景坐标(x,y)是否可以通过
--返回true,可以，false不能
function SceneCanPass(x,y)  --场景坐标(x,y)是否可以通过
    local ispass=true;        --是否可以通过
	if x>63 or x<0 or y>63 or x<0 then ispass=false end
    if GetS(JY.SubScene,x,y,1)>0 then     --场景层1有物品，不可通过
        ispass=false;
    end

    local d_data=GetS(JY.SubScene,x,y,3);     --事件层4
    if d_data>=0 then
        if GetD(JY.SubScene,d_data,0)~=0 then  --d*数据为不能通过
            ispass=false;
        end
    end

    if CC.SceneWater[GetS(JY.SubScene,x,y,0)] ~= nil then   --水面，不可进入
        ispass=false;
    end
	
	local hb1,hb2
	hb1=GetS(JY.SubScene,JY.Base['人X1'],JY.Base['人Y1'],4)
	hb2=GetS(JY.SubScene,x,y,4)
	if math.abs(hb1-hb2)>14 then
		ispass=false
	end
    return ispass;
end

function Cal_D_Valid()     --计算200个D中有效的D
    if JY.D_Valid~=nil then
	    return ;
	end

    local sceneid=JY.SubScene;
	JY.D_Valid={};
	JY.D_Valid_Num=0;
    for i=0,CC.DNum-1 do
        local x=GetD(sceneid,i,9);
        local y=GetD(sceneid,i,10);
        local v=GetS(sceneid,x,y,3);
		if v>=0 then
            JY.D_Valid[JY.D_Valid_Num]=i;
			JY.D_Valid_Num=JY.D_Valid_Num+1;
		end
	end
end

function DtoSMap()          ---D*中的事件处理动画效果。
    local sceneid=JY.SubScene;
    JY.NumD_PicChange=0;
    JY.D_PicChange={};

	if JY.D_Valid==nil then
	    Cal_D_Valid();
	end

	for k=0,JY.D_Valid_Num-1 do
	    local i=JY.D_Valid[k];

		local p1=GetD(sceneid,i,5);
		if p1>0 then
			local p2=GetD(sceneid,i,6);
			local p3=GetD(sceneid,i,7);
			if p1 ~= p2 then
				local old_p3=p3;
				local delay=GetD(sceneid,i,8);
				if not (p3>=CC.SceneFlagPic[1]*2 and p3<=CC.SceneFlagPic[2]*2 and CC.ShowFlag==0) then --是否显示旗帜
					if p3<=p1 then     --动画已停止
						if JY.MyTick2 %100 > delay then
							p3=p3+2;
						end
					else
						if JY.MyTick2 % 4 ==0 then      --4个节拍动画增加一次
							p3=p3+2;
						end
					end
					if p3>p2 then
						 p3=p1;
					end
				end
				if old_p3 ~=p3 then    --动画改变了，增加一个
                    local x=GetD(sceneid,i,9);
                    local y=GetD(sceneid,i,10);
					local dy=GetS(sceneid,x,y,4);       --海拔
					JY.D_PicChange[JY.NumD_PicChange]={x=x, y=y, dy=dy, p1=old_p3/2, p2=p3/2}
					JY.NumD_PicChange=JY.NumD_PicChange+1;
					SetD(sceneid,i,7,p3);
				end
			end
		end
    end
end

--fastdraw = 0 or nil 全部重绘。用于事件中
--           1 考虑脏矩形 用于显示场景循环
function DrawSMap(fastdraw)         --绘场景地图
    if fastdraw==nil then
	    fastdraw=0;
	end
	local x0=JY.SubSceneX+JY.Base["人X1"]---1;    --绘图中心点
	local y0=JY.SubSceneY+JY.Base["人Y1"]---1;
	local x=x0-JY.Base["人X1"]--limitX(x0,CC.SceneXMin,CC.SceneXMax)-JY.Base["人X1"];
	local y=y0-JY.Base["人Y1"]--limitX(y0,CC.SceneYMin,CC.SceneYMax)-JY.Base["人Y1"];
--x,y=0,0
--y=GetS(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],4)
    if fastdraw==0 then
		lib.DrawSMap(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],x,y,JY.MyPic);
    else
		if JY.oldSMapX>=0 and JY.oldSMapY>=0 and
		   JY.oldSMapX+JY.oldSMapXoff==JY.Base["人X1"]+x and         --绘图中心点不变，人走路也可以用裁剪方式绘图
		   JY.oldSMapY+JY.oldSMapYoff==JY.Base["人Y1"]+y then

			local num_clip=0;
			local clip={};

			for i=0,JY.NumD_PicChange-1 do   --计算D*中贴图改变的矩形
			    local dx=JY.D_PicChange[i].x-JY.Base["人X1"]-x;
				local dy=JY.D_PicChange[i].y-JY.Base["人Y1"]-y;
				clip[num_clip]=Cal_PicClip(dx,dy,JY.D_PicChange[i].p1,0,
										   dx,dy,JY.D_PicChange[i].p2,0 );
				clip[num_clip].y1=clip[num_clip].y1-JY.D_PicChange[i].dy
				clip[num_clip].y2=clip[num_clip].y2-JY.D_PicChange[i].dy
				num_clip=num_clip+1;
			end

			if JY.oldSMapPic>=0 then  --计算主角矩形
			    if not ( JY.oldSMapX==JY.Base["人X1"] and    --主角有变化
				         JY.oldSMapY==JY.Base["人Y1"] and
						 JY.oldSMapPic==JY.MyPic ) then
					local dy1=GetS(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],4);   --海拔
					local dy2=GetS(JY.SubScene,JY.oldSMapX,JY.oldSMapY,4);
					local dy=math.max(dy1,dy2);
					clip[num_clip]=Cal_PicClip(-JY.oldSMapXoff,-JY.oldSMapYoff,JY.oldSMapPic,0,
												-x,-y,JY.MyPic,0)
					clip[num_clip].y1=clip[num_clip].y1- dy;
					clip[num_clip].y2=clip[num_clip].y2- dy;
					num_clip=num_clip+1;
				end
			end

			local area=0;          --计算所有脏矩形面积
			for i=0,num_clip-1 do
				clip[i]=ClipRect(clip[i]);    --矩形屏幕剪裁
				if clip[i]~=nil then
					area=area+(clip[i].x2-clip[i].x1)*(clip[i].y2-clip[i].y1)
				end
			end

			if area <CC.ScreenW*CC.ScreenH/2 and num_clip<15 then        --面积足够小，矩形数目少，则更新脏矩形。
				for i=0,num_clip-1 do
					if clip[i]~=nil then
						lib.SetClip(clip[i].x1,clip[i].y1,clip[i].x2,clip[i].y2);
						lib.DrawSMap(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],x,y,JY.MyPic);
					end
				end
			else    --面积太大，直接重绘
				lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);   --由于redraw=0，必须给出裁剪矩形以后才能ShowSurface
				lib.DrawSMap(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],x,y,JY.MyPic);
			end
		else
			lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);
			lib.DrawSMap(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],x,y,JY.MyPic);
		end
    end
	--lib.PicLoadCache(0,CC.ScreenW/2,CC.ScreenH/2-GetS(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],4),JY.MyPic)
	--[[if CC.forg==true then
		local dx,dy=x-y,x+y
		dx=-dx*18-320
		dy=-dy*9-240
		lib.LoadPicture(".\\pic\\forg.png",dx,dy)
	end]]--
	JY.oldSMapX=JY.Base["人X1"];
	JY.oldSMapY=JY.Base["人Y1"];
	JY.oldSMapPic=JY.MyPic;
    JY.oldSMapXoff=x;
    JY.oldSMapYoff=y;
	if CC.forg then
		--lib.Background(0,0,639,119,0)
		--lib.Background(0,360,639,479,0)
		--lib.Background(0,119,199,360,0)
		--lib.Background(440,119,639,360,0)
		local step=10
		--for i=199,440,step do
		--	for j=119,360,step do
		for i=0,639,step do
			for j=0,479,step do
				lib.Background(i,j,i+step,j+step,Bright[i][j])
			end
		end
	end
	--lib.ShowCave(120,120)
end


-- 读取游戏进度
-- id=0 新进度，=1/2/3 进度
--
--这里是先把数据读入Byte数组中。然后定义访问相应表的方法，在访问表时直接从数组访问。
--与以前的实现相比，从文件中读取和保存到文件的时间显著加快。而且内存占用少了
function SBLDATAL(id)       -- 读取游戏进度
    local sid=id;
	JY.LID=id
	local v=0;
    

    local t1=lib.GetTime();

	--[[for i,v in pairs(CC.Mem_Base) do
		if CC.Mem_Base[i]~=nil then CC.Mem_Base[i]=nil end
	end
	for i,v in pairs(CC.Mem_Person) do
		if CC.Mem_Person[i]~=nil then CC.Mem_Person[i]=nil end
	end
	for i,v in pairs(CC.Mem_Thing) do
		if CC.Mem_Thing[i]~=nil then CC.Mem_Thing[i]=nil end
	end
	for i,v in pairs(CC.Mem_Wugong) do
		if CC.Mem_Wugong[i]~=nil then CC.Mem_Wugong[i]=nil end
	end
	for i,v in pairs(CC.Mem_Scene) do
		if CC.Mem_Scene[i]~=nil then CC.Mem_Scene[i]=nil end
	end
	for i,v in pairs(CC.Mem_Shop) do
		if CC.Mem_Shop[i]~=nil then CC.Mem_Shop[i]=nil end
	end]]
	
   CC.SBL_Base={};
   CC.SBL_Person={};
   CC.SBL_Thing={};
   CC.SBL_Scene={};
   CC.SBL_Wugong={};
   CC.SBL_Shop={};
	
    --读取R*.idx文件
    local data=Byte.create(6*4);
    Byte.loadfile(data,CC.R_IDXFilename[id],0,6*4);

	local idx={};
	idx[0]=0;
	for i =1,6 do
	    idx[i]=Byte.get32(data,4*(i-1));
	end

    --读取R*.grp文件
    JY.Data_Base=Byte.create(idx[1]-idx[0]);              --基本数据
    Byte.loadfile(JY.Data_Base,CC.R_GRPFilename[id],idx[0],idx[1]-idx[0]);

    --设置访问基本数据的方法，这样就可以用访问表的方式访问了。而不用把二进制数据转化为表。节约加载时间和空间
	local meta_t={
	    __index=function(t,k)
	        return GetDataFromStruct(JY.Data_Base,0,CC.Base_S,k);
		end,

		__newindex=function(t,k,v)
	        SetDataFromStruct(JY.Data_Base,0,CC.Base_S,k,v);
	 	end
	}
    setmetatable(JY.Base,meta_t);


    JY.PersonNum=math.floor((idx[2]-idx[1])/CC.PersonSize);   --人物

	JY.Data_Person=Byte.create(CC.PersonSize*JY.PersonNum);
	Byte.loadfile(JY.Data_Person,CC.R_GRPFilename[id],idx[1],CC.PersonSize*JY.PersonNum);

	for i=0,JY.PersonNum-1 do
		JY.Person[i]={};
		local meta_t={
			__index=function(t,k)
				return GetDataFromStruct(JY.Data_Person,i*CC.PersonSize,CC.Person_S,k);
			end,

			__newindex=function(t,k,v)
				SetDataFromStruct(JY.Data_Person,i*CC.PersonSize,CC.Person_S,k,v);
			end
		}
        setmetatable(JY.Person[i],meta_t);
	end

    JY.ThingNum=math.floor((idx[3]-idx[2])/CC.ThingSize);     --物品
	JY.Data_Thing=Byte.create(CC.ThingSize*JY.ThingNum);
	Byte.loadfile(JY.Data_Thing,CC.R_GRPFilename[id],idx[2],CC.ThingSize*JY.ThingNum);
	for i=0,JY.ThingNum-1 do
		JY.Thing[i]={};
		local meta_t={
			__index=function(t,k)
				return GetDataFromStruct(JY.Data_Thing,i*CC.ThingSize,CC.Thing_S,k);
			end,

			__newindex=function(t,k,v)
				SetDataFromStruct(JY.Data_Thing,i*CC.ThingSize,CC.Thing_S,k,v);
			end
		}
        setmetatable(JY.Thing[i],meta_t);
	end

    JY.SceneNum=math.floor((idx[4]-idx[3])/CC.SceneSize);     --场景
	JY.Data_Scene=Byte.create(CC.SceneSize*JY.SceneNum);
	Byte.loadfile(JY.Data_Scene,CC.R_GRPFilename[id],idx[3],CC.SceneSize*JY.SceneNum);
	for i=0,JY.SceneNum-1 do
		JY.Scene[i]={};
		local meta_t={
			__index=function(t,k)
				return GetDataFromStruct(JY.Data_Scene,i*CC.SceneSize,CC.Scene_S,k);
			end,

			__newindex=function(t,k,v)
				SetDataFromStruct(JY.Data_Scene,i*CC.SceneSize,CC.Scene_S,k,v);
			end
		}
        setmetatable(JY.Scene[i],meta_t);
	end

    JY.WugongNum=math.floor((idx[5]-idx[4])/CC.WugongSize);     --武功
	JY.Data_Wugong=Byte.create(CC.WugongSize*JY.WugongNum);
	Byte.loadfile(JY.Data_Wugong,CC.R_GRPFilename[id],idx[4],CC.WugongSize*JY.WugongNum);
	for i=0,JY.WugongNum-1 do
		JY.Wugong[i]={};
		local meta_t={
			__index=function(t,k)
				return GetDataFromStruct(JY.Data_Wugong,i*CC.WugongSize,CC.Wugong_S,k);
			end,

			__newindex=function(t,k,v)
				SetDataFromStruct(JY.Data_Wugong,i*CC.WugongSize,CC.Wugong_S,k,v);
			end
		}
        setmetatable(JY.Wugong[i],meta_t);
	end

    JY.ShopNum=math.floor((idx[6]-idx[5])/CC.ShopSize);     --小宝商店
	JY.Data_Shop=Byte.create(CC.ShopSize*JY.ShopNum);
	Byte.loadfile(JY.Data_Shop,CC.R_GRPFilename[id],idx[5],CC.ShopSize*JY.ShopNum);
	for i=0,JY.ShopNum-1 do
		JY.Shop[i]={};
		local meta_t={
			__index=function(t,k)
				return GetDataFromStruct(JY.Data_Shop,i*CC.ShopSize,CC.Shop_S,k);
			end,

			__newindex=function(t,k,v)
				SetDataFromStruct(JY.Data_Shop,i*CC.ShopSize,CC.Shop_S,k,v);
			end
		}
        setmetatable(JY.Shop[i],meta_t);

    end	
	lib.LoadSMap(CC.S_Filename[id],CC.TempS_Filename,JY.SceneNum,CC.SWidth,CC.SHeight,CC.D_Filename[id],CC.DNum,11);
	collectgarbage();
	--lib.Debug(string.format("Loadrecord time=%d",lib.GetTime()-t1));	
	JY.LOADTIME=lib.GetTime()	
	local sid=id	
	FINALWORK() 
    if id>0 then 	FINALWORK2() end
end

-- 写游戏进度
-- id=0 新进度，=1/2/3 进度
function SBLDATAS(id)         -- 写游戏进度
    --读取R*.idx文件
    local t1=lib.GetTime();
	JY.SAVETIME=lib.GetTime();
	JY.GTIME=math.modf((JY.SAVETIME-JY.LOADTIME)/60000)
	--JY.Person[10]["无用"]=JY.Person[10]["无用"]+JY.GTIME
	SetS(14,2,1,4,GetS(14,2,1,4)+JY.GTIME)
	JY.LOADTIME=lib.GetTime()
	local sid=id	
    JY.SID=id	
	--RSDLSJLJC(4)
	
    local data=Byte.create(6*4);
    Byte.loadfile(data,CC.R_IDXFilename[id],0,6*4);

	local idx={};
	idx[0]=0;
	for i =1,6 do
	    idx[i]=Byte.get32(data,4*(i-1));
	end

    --写R*.grp文件
    Byte.savefile(JY.Data_Base,CC.R_GRPFilename[id],idx[0],idx[1]-idx[0]);

	Byte.savefile(JY.Data_Person,CC.R_GRPFilename[id],idx[1],CC.PersonSize*JY.PersonNum);

	Byte.savefile(JY.Data_Thing,CC.R_GRPFilename[id],idx[2],CC.ThingSize*JY.ThingNum);

	Byte.savefile(JY.Data_Scene,CC.R_GRPFilename[id],idx[3],CC.SceneSize*JY.SceneNum);

	Byte.savefile(JY.Data_Wugong,CC.R_GRPFilename[id],idx[4],CC.WugongSize*JY.WugongNum);

	Byte.savefile(JY.Data_Shop,CC.R_GRPFilename[id],idx[5],CC.ShopSize*JY.ShopNum);

    lib.SaveSMap(CC.S_Filename[id],CC.D_Filename[id]);
    --lib.Debug(string.format("SaveRecord time=%d",lib.GetTime()-t1));
    
	local v=0;

end
-------------------------------------------------------------------------------------
-----------------------------------通用函数-------------------------------------------

function filelength(filename)         --得到文件长度
    local inp=io.open(filename,"rb");
    local l= inp:seek("end");
	inp:close();
    return l;
end

--读S×数据, (x,y) 坐标，level 层 0-5
function GetS(id,x,y,level)       --读S×数据
	if x>63 or y>63 then lib.Debug(string.format('error:%d,%d',x,y)) end
    return lib.GetS(id,x,y,level);
end

--写S×
function SetS(id,x,y,level,v)       --写S×
    lib.SetS(id,x,y,level,v);
end

--读D*
--sceneid 场景编号，
--id D*编号
--要读第几个数据, 0-10
function GetD(Sceneid,id,i)          --读D*
    return lib.GetD(Sceneid,id,i);
end

--写D×
function SetD(Sceneid,id,i,v)         --写D×
    lib.SetD(Sceneid,id,i,v);
end

--从数据的结构中翻译数据
--data 二进制数组
--offset data中的偏移
--t_struct 数据的结构，在jyconst中有很多定义
--key  访问的key
function GetDataFromStruct(data,offset,t_struct,key)  --从数据的结构中翻译数据，用来取数据
    local t=t_struct[key];
	local r;
	if t[2]==0 then
		r=Byte.get16(data,t[1]+offset);
	elseif t[2]==1 then
		r=Byte.getu16(data,t[1]+offset);
	elseif t[2]==2 then
		if CC.SrcCharSet==0 then
			r=lib.CharSet(Byte.getstr(data,t[1]+offset,t[3]),0);
		else
			r=Byte.getstr(data,t[1]+offset,t[3]);
		end
	end
	return r;
end

function SetDataFromStruct(data,offset,t_struct,key,v)  --从数据的结构中翻译数据，保存数据
    local t=t_struct[key];
	if t[2]==0 then
		Byte.set16(data,t[1]+offset,v);
	elseif t[2]==1 then
		Byte.setu16(data,t[1]+offset,v);
	elseif t[2]==2 then
		local s;
		if CC.SrcCharSet==0 then
			s=lib.CharSet(v,1);
		else
			s=v;
		end
		Byte.setstr(data,t[1]+offset,t[3],s);
	end
end

--按照t_struct 定义的结构把数据从data二进制串中读到表t中
function LoadData(t,t_struct,data)        --data二进制串中读到表t中
    for k,v in pairs(t_struct) do
        if v[2]==0 then
            t[k]=Byte.get16(data,v[1]);
        elseif v[2]==1 then
            t[k]=Byte.getu16(data,v[1]);
		elseif v[2]==2 then
            if CC.SrcCharSet==0 then
                t[k]=lib.CharSet(Byte.getstr(data,v[1],v[3]),0);
		    else
		        t[k]=Byte.getstr(data,v[1],v[3]);
		    end
		end
	end
end

--按照t_struct 定义的结构把数据写入data Byte数组中。
function SaveData(t,t_struct,data)      --数据写入data Byte数组中。
    for k,v in pairs(t_struct) do
        if v[2]==0 then
            Byte.set16(data,v[1],t[k]);
		elseif v[2]==1 then
            Byte.setu16(data,v[1],t[k]);
		elseif v[2]==2 then
		    local s;
			if CC.SrcCharSet==0 then
			    s=lib.CharSet(t[k],1);
            else
			    s=t[k];
		    end
            Byte.setstr(data,v[1],v[3],s);
		end
	end
end

function limitX(x,minv,maxv)       --限制x的范围
    if x<minv then
	    x=minv;
	elseif x>maxv then
	    x=maxv;
	end
	return x
end

function RGB(r,g,b)          --设置颜色RGB
   return r*65536+g*256+b;
end

function GetRGB(color)      --分离颜色的RGB分量
    color=color%(65536*256);
    local r=math.floor(color/65536);
    color=color%65536;
    local g=math.floor(color/256);
    local b=color%256;
    return r,g,b
end

--等待键盘输入
function WaitKey(flag)       --等待键盘输入
    local keyPress=-1;
    while true do
		keyPress=lib.GetKey();
		if keyPress ~=-1 then
			if flag or keyPress<1000000 or keyPress>1999999 then
				break;
			end
	    end
        lib.Delay(20);
	end
	return keyPress;
end

--返回 [0 , i-1] 的整形随机数
function Rnd(i)           --随机数
	if i==nil or i==0 then return 0 end
    local r=math.random(i);
    return r-1;
end

--增加人物属性，如果有最大值限制，则应用最大值限制。最小值则限制为0
--id 人物id
--str属性字符串
--value 要增加的值，负数表示减少
--返回1,实际增加的值
--返回2，字符串：xxx 增加/减少 xxxx，用于显示药品效果
function AddPersonAttrib(id,str,value)            --增加人物属性
    local oldvalue=JY.Person[id][str];
    local attribmax=math.huge;
    if str=="生命" then
        attribmax=JY.Person[id]["生命最大值"] ;
    elseif str=="内力" then
        attribmax=JY.Person[id]["内力最大值"] ;
    else
        if CC.PersonAttribMax[str] ~= nil then
            attribmax=CC.PersonAttribMax[str];			
        end
			   
		if str=='内力最大值' then
		    local nlmax=math.modf((JY.Person[id]['资质']-1)/15)
			attribmax=9500-nlmax*750;
			--attribmax=attribmax+100*math.modf(50-JY.Person[id]['资质']*0.5)
                       if T1LEQ(id) or id==53 then
                          attribmax=10000
                       end 
					   for i=1,10 do
					       if JY.Person[id]["武功"..i]==85 or JY.Person[id]["武功"..i]==88 then
						      attribmax=attribmax+750
						   end
					   end
					   if id==58 then
					      attribmax=attribmax-JY.Person[300]["声望"]*100
						  if attribmax<500 then attribmax=500 end
					   end
					   if attribmax>10000 then attribmax=10000 end
		end
		if str=="用毒能力" and id==2 then
		   attribmax=500
		end
		if str=="用毒能力" and (id==25 or id==83 or id==17) then
		    attribmax=400
		end		
		if str=="医疗能力" and (id==16 or id==28 or id==45) then
		   attribmax=500
		end
		if str=="医疗能力" and id==85 then  attribmax=400 end
        if (str=="医疗能力" or str=="用毒能力" or str=="解毒能力") and (id==0 and GetS(4,5,5,5)==7) then attribmax=400 end
   end
    local newvalue=limitX(oldvalue+value,0,attribmax);
    JY.Person[id][str]=newvalue;
    local add=newvalue-oldvalue;

    local showstr="";
    if add>0 then
        showstr=string.format("%s 增加 %d",str,add);
    elseif add<0 then
        showstr=string.format("%s 减少 %d",str,-add);
    end
    return add,showstr;
end

--播放midi
function PlayMIDI(id)             --播放midiMV
    JY.CurrentMIDI=id;
    if JY.EnableMusic==0 then
        return ;
    end
    if id>=0 then	    
        lib.PlayMIDI(string.format(CC.MIDIFile,id+1));
		--lib.PlayMIDI(string.format(CONFIG.SoundPath .. "%d.MP3",id));
	--else
	   --CC.mp3File=CONFIG.SoundPath .. "game%02d.mp3";
       --lib.PlayMIDI(string.format(CC.mp3File,id+1));
    end
end

--播放音效atk***
function PlayWavAtk(id)             --播放音效atk***
    if JY.EnableSound==0 then
        return ;
    end
    if id>=0 then
	    --if id<31 then
           lib.PlayWAV(string.format(CC.ATKFile,id));
		--else
		   --lib.PlayWAV(string.format(CC.ATKFileM,id));
		--end
    end
end

--播放音效e**
function PlayWavE(id)              --播放音效e**
    if JY.EnableSound==0 then
        return ;
    end
    if id>=0 then
        lib.PlayWAV(string.format(CC.EFile,id));
    end
end

function ShowScreen(flag)              --刷新屏幕显示
--flag =0 or nil 全部刷新屏幕
--      1 考虑脏矩形的快速刷新
    if JY.Darkness==0 then
	    if flag==nil then
		    flag=0;
		end
	    lib.ShowSurface(flag);
    end
end

--通用菜单函数
-- menuItem 表，每项保存一个子表，内容为一个菜单项的定义
--          菜单项定义为  {   ItemName,     菜单项名称字符串
--                          ItemFunction, 菜单调用函数，如果没有则为nil
--                          Visible       是否可见  0 不可见 1 可见, 2 可见，作为当前选择项。只能有一个为2，
--                                        多了则只取第一个为2的，没有则第一个菜单项为当前选择项。
--                                        在只显示部分菜单的情况下此值无效。
--                                        此值目前只用于是否菜单缺省显示否的情况
--                       }
--          菜单调用函数说明：         itemfunction(newmenu,id)
--
--       返回值
--              0 正常返回，继续菜单循环 1 调用函数要求退出菜单，不进行菜单循环
--
-- numItem      总菜单项个数
-- numShow      显示菜单项目，如果总菜单项很多，一屏显示不下，则可以定义此值
--                =0表示显示全部菜单项

-- (x1,y1),(x2,y2)  菜单区域的左上角和右下角坐标，如果x2,y2=0,则根据字符串长度和显示菜单项自动计算x2,y2
-- isBox        是否绘制边框，0 不绘制，1 绘制。若绘制，则按照(x1,y1,x2,y2)的矩形绘制白色方框，并使方框内背景变暗
-- isEsc        Esc键是否起作用 0 不起作用，1起作用
-- Size         菜单项字体大小
-- color        正常菜单项颜色，均为RGB
-- selectColor  选中菜单项颜色,
--;
-- 返回值  0 Esc返回
--         >0 选中的菜单项(1表示第一项)
--         <0 选中的菜单项，调用函数要求退出父菜单，这个用于退出多层菜单

function ShowMenu(menuItem,numItem,numShow,x1,y1,x2,y2,isBox,isEsc,size,color,selectColor)     --通用菜单函数
    local w=0;
    local h=0;   --边框的宽高
    local i=0;
    local num=0;     --实际的显示菜单项
    local newNumItem=0;  --能够显示的总菜单项数

    lib.GetKey();

    local newMenu={};   -- 定义新的数组，以保存所有能显示的菜单项

    --计算能够显示的总菜单项数
    for i=1,numItem do
        if menuItem[i][3]>0 then
            newNumItem=newNumItem+1;
            newMenu[newNumItem]={menuItem[i][1],menuItem[i][2],menuItem[i][3],i};   --新数组多了[4],保存和原数组的对应
        end
    end
if newNumItem==0 then
	return 0
end

    --计算实际显示的菜单项数
    if numShow==0 or numShow > newNumItem then
        num=newNumItem;
    else
        num=numShow;
    end

    --计算边框实际宽高
    local maxlength=0;
    if x2==0 and y2==0 then
        for i=1,newNumItem do
            if string.len(newMenu[i][1])>maxlength then
                maxlength=string.len(newMenu[i][1]);
            end
        end
        w=size*maxlength/2+2*CC.MenuBorderPixel;        --按照半个汉字计算宽度，一边留4个象素
        h=(size+CC.RowPixel)*num+CC.MenuBorderPixel;            --字之间留4个象素，上面再留4个象素
    else
        w=x2-x1;
        h=y2-y1;
    end

    local start=1;             --显示的第一项

	local current =1;          --当前选择项
	for i=1,newNumItem do
	    if newMenu[i][3]==2 then
		    current=i;
			break;
		end
	end
	if numShow~=0 then
	    current=1;
	end
	local surid=lib.SaveSur(0,0,CC.ScreenW,CC.ScreenH);

    local keyPress =-1;
    local returnValue =0;
	if isBox==1 then
		DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
	end

    while true do
	    if num ~=0 then
	        --Cls(x1,y1,x1+w,y1+h);
			lib.LoadSur(surid,0,0);
			if isBox==1 then
				DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
			end
		end

	    for i=start,start+num-1 do
  	        local drawColor=color;           --设置不同的绘制颜色
	        if i==current then
	            drawColor=selectColor;
				lib.Background(x1+CC.MenuBorderPixel,y1+CC.MenuBorderPixel+(i-start)*(size+CC.RowPixel),
							  x1-CC.MenuBorderPixel+w,y1+CC.MenuBorderPixel+(i-start)*(size+CC.RowPixel)+size,128,color)
	        end
			DrawString(x1+CC.MenuBorderPixel,y1+CC.MenuBorderPixel+(i-start)*(size+CC.RowPixel),
			           newMenu[i][1],drawColor,size);

	    end
		if numItem==12 and menuItem[12][1]=="自动" then
		   DrawString(100,575,CC.EVB117,C_GOLD,25) 
	    end
		ShowScreen();
		keyPress=WaitKey(1);
		lib.Delay(100);
		if keyPress==VK_ESCAPE then                  --Esc 退出
		    if isEsc==1 then
		        break;
		    end
		elseif keyPress==VK_DOWN then                --Down
		    current = current +1;
		    if current > (start + num-1) then
		        start=start+1;
		    end
		    if current > newNumItem then
		        start=1;
		        current =1;
		    end
		elseif keyPress==VK_UP then                  --Up
		    current = current -1;
		    if current < start then
		        start=start-1;
		    end
		    if current < 1 then
		        current = newNumItem;
		        start =current-num+1;
		    end
		elseif keyPress==VK_RIGHT then
		    current = current +10;
			if current > (start + num-1) then
		        start=start+10;
		    end
			if current > newNumItem then
			    current = newNumItem;
		        start =current-num+1;
			end
		elseif keyPress==VK_LEFT then
		    current = current -10;
		    if current < start then
		        start=start-10;
		    end
		    if current < 1 then		        
				start= 1
			    current = 1
		    end
		
		elseif   (keyPress==VK_SPACE) or (keyPress==VK_RETURN)  then
		    if newMenu[current][2]==nil then
		        returnValue=newMenu[current][4];
		        break;
		    else
		        local r=newMenu[current][2](newMenu,current);               --调用菜单函数
		        if r==1 then
		            returnValue= -newMenu[current][4];
		            break;
				else
			        --Cls(x1,y1,x1+w,y1+h);
			lib.LoadSur(surid,0,0);
					if isBox==1 then
						DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
					end
		        end
		    end
		elseif keyPress==888 and start>1 then
			start=start-1
			--current=current-1
		elseif keyPress==999 and start<newNumItem-num+1 then
			start=start+1
		elseif keyPress>999999 then
			local kind,mx,my
			if keyPress>1999999 then
				kind=1
				keyPress=keyPress-2000000
			else
				kind=0
				keyPress=keyPress-1000000
			end
			mx=math.modf(keyPress/1000)
			my=math.fmod(keyPress,1000)
			if mx>x1 and mx<x1+w and my>y1 and my<y1+h then
				current=start+math.modf((my-y1-CC.MenuBorderPixel)/(size+CC.RowPixel))
				if kind==1 then
		    if newMenu[current][2]==nil then
		        returnValue=newMenu[current][4];
		        break;
		    else
		        local r=newMenu[current][2](newMenu,current);               --调用菜单函数
		        if r==1 then
		            returnValue= -newMenu[current][4];
		            break;
				else
			        --Cls(x1,y1,x1+w,y1+h);
			lib.LoadSur(surid,0,0);
					if isBox==1 then
						DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
					end
		        end
		    end
				end
			end
	    elseif numItem==12 and menuItem[12][1]=="自动" then
		    if keyPress==97 then --攻击
			    if menuItem[2][3]==1 then
				   local r=War_FightMenu();
				    if r==1 then
				       returnValue=-2
			           break;
					end
				end				
			end
			if keyPress==100 then --防御
			   if menuItem[8][3]==1 then
			      local r=War_DefupMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
			if keyPress==112 then  --蓄力
			   if menuItem[7][3]==1 then
			      local r=War_ActupMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
			if keyPress==105 then  --物品
			   if menuItem[6][3]==1 then
			      local r=War_ThingMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
			if keyPress==114 then  --休息
			   if menuItem[10][3]==1 then
			      local r=War_RestMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
		end
    end

    --Cls(x1,y1,x1+w+1,y1+h+1,0,1);
	lib.LoadSur(surid,0,0);
	lib.FreeSur(surid);

    return returnValue;
end

--横向显示菜单，参数和ShowMenu一样
function ShowMenu2(menuItem,numItem,numShow,x1,y1,x2,y2,isBox,isEsc,size,color,selectColor)     --通用菜单函数
    local w=0;
    local h=0;   --边框的宽高
    local i=0;
    local num=0;     --实际的显示菜单项
    local newNumItem=0;  --能够显示的总菜单项数

    lib.GetKey();

    local newMenu={};   -- 定义新的数组，以保存所有能显示的菜单项

    --计算能够显示的总菜单项数
    for i=1,numItem do
        if menuItem[i][3]>0 then
            newNumItem=newNumItem+1;
            newMenu[newNumItem]={menuItem[i][1],menuItem[i][2],menuItem[i][3],i};   --新数组多了[4],保存和原数组的对应
        end
    end

    --计算实际显示的菜单项数
    if numShow==0 or numShow > newNumItem then
        num=newNumItem;
    else
        num=numShow;
    end

    --计算边框实际宽高
    local maxlength=0;
    if x2==0 and y2==0 then
        for i=1,newNumItem do
            if string.len(newMenu[i][1])>maxlength then
                maxlength=string.len(newMenu[i][1]);
            end
        end
		w=(size*maxlength/2+CC.RowPixel)*num+CC.MenuBorderPixel;
		h=size+2*CC.MenuBorderPixel;
    else
        w=x2-x1;
        h=y2-y1;
    end

    local start=1;             --显示的第一项

    local current =1;          --当前选择项
	for i=1,newNumItem do
	    if newMenu[i][3]==2 then
		    current=i;
			break;
		end
	end
	if numShow~=0 then
	    current=1;
	end

    local keyPress =-1;
    local returnValue =0;
	if isBox==1 then
		DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
	end
    while true do
	    if numShow ~=0 then
	        Cls(x1,y1,x1+w,y1+h);
			if isBox==1 then
				DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
			end
		end

	    for i=start,start+num-1 do
  	        local drawColor=color;           --设置不同的绘制颜色
	        if i==current then
	            drawColor=selectColor;
	        end
			DrawString(x1+CC.MenuBorderPixel+(i-start)*(size*maxlength/2+CC.RowPixel),
			           y1+CC.MenuBorderPixel,newMenu[i][1],drawColor,size);
	    end
	    ShowScreen();
		keyPress=WaitKey(1);
		lib.Delay(100);

		if keyPress==VK_ESCAPE then                  --Esc 退出
		    if isEsc==1 then
		        break;
		    end
		elseif keyPress==VK_RIGHT then                --Down
		    current = current +1;
		    if current > (start + num-1) then
		        start=start+1;
		    end
		    if current > newNumItem then
		        start=1;
		        current =1;
		    end
		elseif keyPress==VK_LEFT then                  --Up
		    current = current -1;
		    if current < start then
		        start=start-1;
		    end
		    if current < 1 then
		        current = newNumItem;
		        start =current-num+1;
		    end
		elseif   (keyPress==VK_SPACE) or (keyPress==VK_RETURN)  then
		    if newMenu[current][2]==nil then
		        returnValue=newMenu[current][4];
		        break;
		    else
		        local r=newMenu[current][2](newMenu,current);               --调用菜单函数
		        if r==1 then
		            returnValue= -newMenu[current][4];
		            break;
				else
			        Cls(x1,y1,x1+w,y1+h);
					if isBox==1 then
						DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
					end
		        end
		    end
		elseif keyPress>999999 then
			local kind,mx,my
			if keyPress>1999999 then
				kind=1
				keyPress=keyPress-2000000
			else
				kind=0
				keyPress=keyPress-1000000
			end
			mx=math.modf(keyPress/1000)
			my=math.fmod(keyPress,1000)
			if mx>x1 and mx<x1+w and my>y1 and my<y1+h then
				current=1+math.modf((mx-x1-CC.MenuBorderPixel)/(size*maxlength/2+CC.RowPixel))
				if kind==1 then
		    if newMenu[current][2]==nil then
		        returnValue=newMenu[current][4];
		        break;
		    else
		        local r=newMenu[current][2](newMenu,current);               --调用菜单函数
		        if r==1 then
		            returnValue= -newMenu[current][4];
		            break;
				else
			        Cls(x1,y1,x1+w,y1+h);
					if isBox==1 then
						DrawBox(x1,y1,x1+w,y1+h,C_WHITE);
					end
		        end
		    end
				end
			end
		--elseif menuItem==warmenu then
		    --if keyPress==108 then
			   --returnValue=2
			--end
		end
    end

    Cls(x1,y1,x1+w+1,y1+h+1,0,1);
    return returnValue;
end

------------------------------------------------------------------------------------
--------------------------------------物品使用---------------------------------------
--物品使用模块
--当前物品id
--返回1 使用了物品， 0 没有使用物品。可能是某些原因不能使用

function UseThing(id)             --物品使用
    --调用函数
	if JY.ThingUseFunction[id]==nil then
	    return DefaultUseThing(id);
	else
        return JY.ThingUseFunction[id](id);
    end
end

--缺省物品使用函数，实现原始游戏效果
--id 物品id
function DefaultUseThing(id)                --缺省物品使用函数
    if JY.Thing[id]["类型"]==0 then
        return UseThing_Type0(id);
    elseif JY.Thing[id]["类型"]==1 then
        return UseThing_Type1(id);
    elseif JY.Thing[id]["类型"]==2 then
        return UseThing_Type2(id);
    elseif JY.Thing[id]["类型"]==3 then
        return UseThing_Type3(id);
    elseif JY.Thing[id]["类型"]==4 then
        return UseThing_Type4(id);
    end
end

--剧情物品，触发事件
function UseThing_Type0(id)              --剧情物品使用
    if JY.SubScene>=0 then
		local x=JY.Base["人X1"]+CC.DirectX[JY.Base["人方向"]+1];
		local y=JY.Base["人Y1"]+CC.DirectY[JY.Base["人方向"]+1];
        local d_num=GetS(JY.SubScene,x,y,3)
        if d_num>=0 then
            JY.CurrentThing=id;
            EventExecute(d_num,2);       --物品触发事件
            JY.CurrentThing=-1;
			return 1;
		else
		    return 0;
        end
    end
end

--装备物品
function UseThing_Type1(id)            --装备物品使用
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("谁要配备%s?",JY.Thing[id]["名称"]),C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
    local pp1,pp2=0,0;

    if r>0 then
        local personid=JY.Base["队伍" ..r]
        if CanUseThing(id,personid) or T2SQ(personid) then
            if JY.Thing[id]["装备类型"]==0 then
                if JY.Thing[id]["使用人"]>=0 then
                   if JY.Person[JY.Thing[id]["使用人"]]["姓名"]==JY.SQ then
                      JY.Thing[id]["加攻击力"]=JY.Thing[id]["加攻击力"]/2
                      JY.Thing[id]["加防御力"]=JY.Thing[id]["加防御力"]/2
                      JY.Thing[id]["加轻功"]=JY.Thing[id]["加轻功"]/2
                   end
                   JY.Person[JY.Thing[id]["使用人"]]["武器"]=-1;                
                end
                if JY.Person[personid]["武器"]>=0 then
                   if T2SQ(personid) then
           JY.Thing[JY.Person[personid]["武器"]]["加攻击力"]=JY.Thing[JY.Person[personid]["武器"]]["加攻击力"]/2
           JY.Thing[JY.Person[personid]["武器"]]["加防御力"]=JY.Thing[JY.Person[personid]["武器"]]["加防御力"]/2
           JY.Thing[JY.Person[personid]["武器"]]["加轻功"]=JY.Thing[JY.Person[personid]["武器"]]["加轻功"]/2
                   end
                   JY.Thing[JY.Person[personid]["武器"]]["使用人"]=-1    
                end
                JY.Person[personid]["武器"]=id;
                if T2SQ(personid) then
                   JY.Thing[id]["加攻击力"]=JY.Thing[id]["加攻击力"]*2
                   JY.Thing[id]["加防御力"]=JY.Thing[id]["加防御力"]*2
                   JY.Thing[id]["加轻功"]=JY.Thing[id]["加轻功"]*2
                   end        
            elseif JY.Thing[id]["装备类型"]==1 then
                if JY.Thing[id]["使用人"]>=0 then
                    if JY.Person[JY.Thing[id]["使用人"]]["姓名"]==JY.SQ then
                      JY.Thing[id]["加攻击力"]=JY.Thing[id]["加攻击力"]/2
                      JY.Thing[id]["加防御力"]=JY.Thing[id]["加防御力"]/2
                      JY.Thing[id]["加轻功"]=JY.Thing[id]["加轻功"]/2
                   end
                    JY.Person[JY.Thing[id]["使用人"]]["防具"]=-1;                   
                end
                if JY.Person[personid]["防具"]>=0 then
                   if T2SQ(personid) then
           JY.Thing[JY.Person[personid]["防具"]]["加攻击力"]=JY.Thing[JY.Person[personid]["防具"]]["加攻击力"]/2
           JY.Thing[JY.Person[personid]["防具"]]["加防御力"]=JY.Thing[JY.Person[personid]["防具"]]["加防御力"]/2
           JY.Thing[JY.Person[personid]["防具"]]["加轻功"]=JY.Thing[JY.Person[personid]["防具"]]["加轻功"]/2
                   end
                    JY.Thing[JY.Person[personid]["防具"]]["使用人"]=-1
                end
                JY.Person[personid]["防具"]=id;
                 if T2SQ(personid) then
                   JY.Thing[id]["加攻击力"]=JY.Thing[id]["加攻击力"]*2
                   JY.Thing[id]["加防御力"]=JY.Thing[id]["加防御力"]*2
                   JY.Thing[id]["加轻功"]=JY.Thing[id]["加轻功"]*2
                 end        
            end
            JY.Thing[id]["使用人"]=personid    
        else
            DrawStrBoxWaitKey("此人不适合配备此物品",C_WHITE,CC.DefaultFont);
			return 0;
        end
    end
--    Cls();
--    ShowScreen();
           
	return 1;
end

--判断一个人是否可以装备或修炼一个物品
--返回 true可以修炼，false不可
function CanUseThing(id,personid)           --判断一个人是否可以装备或修炼一个物品
    local str="";
  if personid==76 and id>63 then
        return true;
    elseif (id==220 or id==221) and personid==0 then
	    return true;
    --elseif (id==97 or id==115) and personid==9 then
	     --return true;	
    elseif (id>186 and id<194) and personid==44 then
         return true
    elseif id==114 and personid==0 and GetS(4,5,5,5)==2 and JY.Person[0]["御剑能力"]>99 then
         return true
    elseif id==86 and personid==0 and GetS(4,5,5,5)==1 and JY.Person[0]["拳掌功夫"]>119 then
	     return true
	else
    
    if JY.Thing[id]["仅修炼人物"] >=0 then
        if JY.Thing[id]["仅修炼人物"] ~= personid  then
            return false;
        end
    end

    if JY.Thing[id]["需内力性质"] ~=2 and JY.Person[personid]["内力性质"] ~=2 then
        if JY.Thing[id]["需内力性质"] ~= JY.Person[personid]["内力性质"] then
            return false;
        end
    end
   
    if JY.Thing[id]["需内力"] > JY.Person[personid]["内力最大值"] then
        return false;
    end
    if JY.Thing[id]["需攻击力"] > JY.Person[personid]["攻击力"] then
        return false;
    end
    if JY.Thing[id]["需轻功"] > JY.Person[personid]["轻功"] then
        return false;
    end
    if JY.Thing[id]["需用毒能力"] > JY.Person[personid]["用毒能力"] then
        return false;
    end
    if JY.Thing[id]["需医疗能力"] > JY.Person[personid]["医疗能力"] then
        return false;
    end
    if JY.Thing[id]["需解毒能力"] > JY.Person[personid]["解毒能力"] then
        return false;
    end
    if JY.Thing[id]["需拳掌功夫"] > JY.Person[personid]["拳掌功夫"] then
        return false;
    end
    if JY.Thing[id]["需御剑能力"] > JY.Person[personid]["御剑能力"] then
        return false;
    end
    if JY.Thing[id]["需耍刀技巧"] > JY.Person[personid]["耍刀技巧"] then
        return false;
    end
    if JY.Thing[id]["需特殊兵器"] > JY.Person[personid]["特殊兵器"] then
        return false;
    end
    if JY.Thing[id]["需暗器技巧"] > JY.Person[personid]["暗器技巧"] then
        return false;
    end
    if JY.Thing[id]["需资质"] >= 0 then
        if JY.Thing[id]["需资质"] > JY.Person[personid]["资质"] then
            return false;
        end
    else
        if -JY.Thing[id]["需资质"] < JY.Person[personid]["资质"] then
            return false;
        end
    end   
    if JY.Person[personid]["姓名"]==CC.s10 then
        return false;
    end
	if id==118 then
	   local R=JY.Person[personid];
	   local wp=R["拳掌功夫"]+R["御剑能力"]+R["耍刀技巧"]+R["特殊兵器"];
	    if wp<120 then 
	      return false;
		end
	end
  end
    
    return true
  
end

--秘籍物品
function UseThing_Type2(id) --秘籍物品使用
    
    if JY.Thing[id]["使用人"]>=0 then
        if DrawStrBoxYesNo(-1,-1,CC.EVB140,C_WHITE,CC.DefaultFont)==false then
            Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
            ShowScreen();
            return 0;
        end
    end

    Cls();
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format(CC.EVB141,JY.Thing[id]["名称"]),C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    local r=SelectTeamMenu(CC.MainSubMenuX,nexty);

    if r>0 then
        local personid=JY.Base["队伍" ..r]
		local yes,full;
        if JY.Thing[id]["练出武功"]>=0 then
            yes=0;
			full=1;
            for i = 1,10 do
                if JY.Person[personid]["武功"..i]==JY.Thing[id]["练出武功"] then
                    yes=1;             --武功已经有了
                    break;
                end
				if JY.Person[personid]["武功"..i]==0 then
					full=0;
				end
                         --if id>186 and id<194 or id==235 or id==220 or id==221 then
                                --yes=2
                         --end
            end
           
            if yes==0 and full==1 then              
                DrawStrBoxWaitKey(CC.EVB142,C_WHITE,CC.DefaultFont);
                return 0;               
            end
        end

       if CC.Shemale[id]==1 then                --辟邪和葵花
            if T1LEQ(personid) or T2SQ(personid) or T3XYK(personid) then
               say(CC.EVB143)
               say(CC.EVB144)
               say(CC.EVB145)
               say(CC.EVB146)
            else
		    if JY.Person[personid]["性别"]==0 and CanUseThing(id,personid) then
				Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
				if DrawStrBoxYesNo(-1,-1,CC.EVB147,C_WHITE,CC.DefaultFont)==false then
					return 0;
				else
					lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_RED,128);
					ShowScreen();
					lib.Delay(80);
					lib.ShowSlow(15,1);
					--[[for offset=CC.ScreenW,-CC.Fontsmall*10,-1 do
						lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK);
						DrawString(offset,0,JY.Person[personid]["姓名"]..'昏迷中...江湖血泪  太监无罪',C_WHITE,CC.Fontsmall);
						ShowScreen();
						lib.Delay(15);
					end]]
					Cls();
					lib.ShowSlow(100,0);
					JY.Person[personid]["性别"]=2;
					local add,str=AddPersonAttrib(personid,"攻击力",-15);           --增加攻击力
					DrawStrBoxWaitKey(JY.Person[personid]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
					add,str=AddPersonAttrib(personid,"防御力",-25);           --增加攻击力
					DrawStrBoxWaitKey(JY.Person[personid]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
				end
			elseif JY.Person[personid]["性别"]==1 then
				DrawStrBoxWaitKey(CC.EVB148,C_WHITE,CC.DefaultFont);
				return 0;
			end
             end
        end


        if yes==1 or CanUseThing(id,personid) or (CanUseThing(id,personid) and yes==2)  then
            if JY.Thing[id]["使用人"]==personid then
                return 0;
            end

            if JY.Person[personid]["修炼物品"]>=0 then
                JY.Thing[JY.Person[personid]["修炼物品"]]["使用人"]=-1;
            end

            if JY.Thing[id]["使用人"]>=0 then
                JY.Person[JY.Thing[id]["使用人"]]["修炼物品"]=-1;
                --JY.Person[JY.Thing[id]["使用人"]]["修炼点数"]=0;
                JY.Person[JY.Thing[id]["使用人"]]["物品修炼点数"]=0;
            end

            JY.Thing[id]["使用人"]=personid
            JY.Person[personid]["修炼物品"]=id;
            --JY.Person[personid]["修炼点数"]=0;
            JY.Person[personid]["物品修炼点数"]=0;
        else
            DrawStrBoxWaitKey("此人不适合修炼此物品",C_WHITE,CC.DefaultFont);
			return 0;
        end
    end

	return 1;
end

--药品物品
function UseThing_Type3(id)        --药品物品使用
    local usepersonid=-1;
    if JY.Status==GAME_MMAP or JY.Status==GAME_SMAP then
        Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("谁要使用%s?",JY.Thing[id]["名称"]),C_WHITE,CC.DefaultFont);
	    local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
        local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
        if r>0 then
            usepersonid=JY.Base["队伍" ..r]
        end
    elseif JY.Status==GAME_WMAP then           ---战斗场景使用药品
        if WAR.Person[WAR.CurID]["人物编号"]==16 then
		    War_CalMoveStep(WAR.CurID,8,1);
			local x,y=War_SelectMove()
			if x~=nil then
				local emeny=GetWarMap(x,y,2);
				if emeny>=0 then
					if WAR.Person[WAR.CurID]["我方"] == WAR.Person[emeny]["我方"] then       --不是敌人
						usepersonid=WAR.Person[emeny]["人物编号"] 
					end
				end
			end
			if usepersonid==-1 then return 0 end--usepersonid=16 end
		else		
		    usepersonid=WAR.Person[WAR.CurID]["人物编号"];
	    end
    end

    if usepersonid>=0 then
        if UseThingEffect(id,usepersonid)==1 then       --使用有效果
            instruct_32(id,-1);            --物品数量减少
            WaitKey();
        else
            return 0;
        end
    end

 --   Cls();
 --   ShowScreen();
	return 1;
end

--药品使用实际效果XWXG
--id 物品id，
--personid 使用人id
--返回值：0 使用没有效果，物品数量应该不变。1 使用有效果，则使用后物品数量应该-1
function UseThingEffect(id,personid)          --药品使用实际效果
    local str={};
    str[0]=string.format("使用 %s",JY.Thing[id]["名称"]);
    local strnum=1;
    local addvalue;

    if JY.Thing[id]["加生命"] >0 then
        local add=JY.Thing[id]["加生命"]-math.modf(JY.Thing[id]["加生命"]*JY.Person[personid]["受伤程度"]/200)+Rnd(5);
        if JY.Status==GAME_WMAP then
		   if inteam(personid) and inteam(16) then
		      for w=0,WAR.PersonNum-1 do
			        if WAR.Person[w]["人物编号"]==16 then
					   if WAR.Person[w]["死亡"]==false and WAR.Person[w]["我方"] then
					       add=math.modf(add*1.3)
						   break;
						end
					end
				end
			end
		end		
		      
		if add <=0 then
            add=5+Rnd(5);
        end
		add=math.modf(add);
		if inteam(personid) then
           AddPersonAttrib(personid,"受伤程度",-math.modf(add/10));
		else
           AddPersonAttrib(personid,"受伤程度",-math.modf(add/4));
		end	
           addvalue,str[strnum]=AddPersonAttrib(personid,"生命",add);	
		   if not inteam(personid) then
		      str[strnum]=string.format("生命 增加 %s",add*2)
		   end
			  
        if addvalue ~=0 then
            strnum=strnum+1
        end
    end

    local function ThingAddAttrib(s)     ---定义局部函数，处理吃药后增加属性
        if JY.Thing[id]["加" .. s] ~=0 then
            addvalue,str[strnum]=AddPersonAttrib(personid,s,JY.Thing[id]["加" .. s]);
            if addvalue ~=0 then
                strnum=strnum+1
            end
        end
    end

    ThingAddAttrib("生命最大值");

    if JY.Thing[id]["加中毒解毒"] <0 then
        addvalue,str[strnum]=AddPersonAttrib(personid,"中毒程度",math.modf(JY.Thing[id]["加中毒解毒"]/2));
        if addvalue ~=0 then
            strnum=strnum+1
        end
    end

    ThingAddAttrib("体力");

    if JY.Thing[id]["改变内力性质"] ==2 then
        str[strnum]="内力门路改为阴阳合一"
        strnum=strnum+1
    end

    ThingAddAttrib("内力");
    ThingAddAttrib("内力最大值");
    ThingAddAttrib("攻击力");
    ThingAddAttrib("防御力");
    ThingAddAttrib("轻功");
    ThingAddAttrib("医疗能力");
    ThingAddAttrib("用毒能力");
    ThingAddAttrib("解毒能力");
    ThingAddAttrib("抗毒能力");
    ThingAddAttrib("拳掌功夫");
    ThingAddAttrib("御剑能力");
    ThingAddAttrib("耍刀技巧");
    ThingAddAttrib("特殊兵器");
    ThingAddAttrib("暗器技巧");
    ThingAddAttrib("武学常识");
    ThingAddAttrib("攻击带毒");

    if strnum>1 then
        local maxlength=0      --计算字符串最大长度
        for i = 0,strnum-1 do
            if #str[i] > maxlength then
                maxlength=#str[i];
            end
        end
        Cls();

		local ww=maxlength*CC.DefaultFont/2+CC.MenuBorderPixel*2;
		local hh=strnum*CC.DefaultFont+(strnum-1)*CC.RowPixel+2*CC.MenuBorderPixel;
        local x=(CC.ScreenW-ww)/2;
		local y=(CC.ScreenH-hh)/2;
		DrawBox(x,y,x+ww,y+hh,C_WHITE);
        DrawString(x+CC.MenuBorderPixel,y+CC.MenuBorderPixel,str[0],C_WHITE,CC.DefaultFont);
        for i =1,strnum-1 do
            DrawString(x+CC.MenuBorderPixel,y+CC.MenuBorderPixel+(CC.DefaultFont+CC.RowPixel)*i,str[i],C_ORANGE,CC.DefaultFont);
        end
        ShowScreen();
        return 1;
    else
	    DrawStrBox(-1,-1,str[0],C_WHITE,30)
		ShowScreen();
        return 1;
    end

end

--暗器物品
function UseThing_Type4(id)             --暗器物品使用
    if JY.Status==GAME_WMAP then
         return War_UseAnqi(id);
    end
	return 0;
end

--------------------------------------------------------------------------------
--------------------------------------事件调用-----------------------------------

--事件调用主入口
--id，d*中的编号
--flag 1 空格触发，2，物品触发，3，路过触发
function EventExecute(id,flag)               --事件调用主入口
    JY.CurrentD=id;
    if JY.SceneNewEventFunction[JY.SubScene]==nil then         --没有定义新的事件处理函数，调用旧的
        oldEventExecute(flag)
	else
        JY.SceneNewEventFunction[JY.SubScene](flag)         --调用新的事件处理函数
    end
    JY.CurrentD=-1;
	JY.Darkness=0;
end

--调用原有的指定位置的函数
--旧的函数名字格式为  oldevent_xxx();  xxx为事件编号
function oldEventExecute(flag)            --调用原有的指定位置的函数

	local eventnum;
	if flag==1 then
		eventnum=GetD(JY.SubScene,JY.CurrentD,2);
	elseif flag==2 then
		eventnum=GetD(JY.SubScene,JY.CurrentD,3);
	elseif flag==3 then
		eventnum=GetD(JY.SubScene,JY.CurrentD,4);
	end

	if eventnum>0 then
	    --QZXS(eventnum)
	    if OEVENTLUA[eventnum]~=nil then
	      OEVENTLUA[eventnum]()
		else		  
	      oldCallEvent(eventnum);
		end
	end

end

function oldCallEvent(eventnum)     --执行旧的事件函数
	local eventfilename=string.format("oldevent_%d.lua",eventnum);
	lib.Debug(eventfilename);
	dofile(CONFIG.OldEventPath .. eventfilename);
end

--改变大地图坐标，从场景出去后移动到相应坐标
function ChangeMMap(x,y,direct)          --改变大地图坐标
	JY.Base["人X"]=x;
	JY.Base["人Y"]=y;
	JY.Base["人方向"]=direct;
end

--改变当前场景
function ChangeSMap(sceneid,x,y,direct)       --改变当前场景
    JY.SubScene=sceneid;
	JY.Base["人X1"]=x;
	JY.Base["人Y1"]=y;
	JY.Base["人方向"]=direct;
end

--清除(x1,y1)-(x2,y2)矩形内的文字等。
--如果没有参数，则清除整个屏幕表面
--注意该函数并不直接刷新显示屏幕
function Cls(x1,y1,x2,y2)                    --清除屏幕
    if x1==nil then        --第一个参数为nil,表示没有参数，用缺省
	    x1=0;
		y1=0;
		x2=0;
		y2=0;
	end

	lib.SetClip(x1,y1,x2,y2);

	if JY.Status==GAME_START then
	    lib.FillColor(0,0,0,0,0);
        lib.LoadPicture(CC.FirstFile,-1,-1);
	elseif JY.Status==GAME_START2 then
	    lib.FillColor(0,0,0,0,0);
	elseif JY.Status==GAME_MMAP then
        lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],GetMyPic());             --显示主地图
	elseif JY.Status==GAME_SMAP then
        DrawSMap();
	elseif JY.Status==GAME_WMAP then
        WarDrawMap(0);
	elseif JY.Status==GAME_DEAD then
	    lib.FillColor(0,0,0,0,0);
        lib.LoadPicture(CC.DeadFile,-1,-1);
	end
	lib.SetClip(0,0,0,0);
end

function ClsN(x1,y1,x2,y2)                    --清除屏幕
    if x1==nil then        --第一个参数为nil,表示没有参数，用缺省
	    x1=0;
		y1=0;
		x2=0;
		y2=0;
	end

	lib.SetClip(x1,y1,x2,y2);
	lib.FillColor(0,0,0,0,0);
	lib.SetClip(0,0,0,0);
end

--测试指令，占位置用
function instruct_test(s)
    DrawStrBoxWaitKey(s,C_ORANGE,24);
end

--清屏
function instruct_0()         --清屏
    Cls();
end

--对话
--talkid: 为数字，则为对话编号；为字符串，则为对话本身。
--headid: 头像id
--flag :对话框位置：0 屏幕上方显示, 左边头像，右边对话
--            1 屏幕下方显示, 左边对话，右边头像
--            2 屏幕上方显示, 左边空，右边对话
--            3 屏幕下方显示, 左边对话，右边空
--            4 屏幕上方显示, 左边对话，右边头像
--            5 屏幕下方显示, 左边头像，右边对话

function instruct_1(talkid,headid,flag)        --对话
    local s=ReadTalk(talkid);
	if s==nil then        --对话id不存在
	    return ;
	end
    TalkEx(s,headid,flag);
end

--根据oldtalk.grp文件来idx索引文件。供后面读对话使用     --syp
function GenTalkIdx()         --生成对话索引文件
end

--从old_talk.lua中读取编号为talkid的字符串。
--需要的时候读取，可以节约内存占用，不用再把整个文件读入内存数据了。
function ReadTalk(talkid)            --从文件读取一条对话
	local idxfile=CC.TalkIdxFile
    local grpfile=CC.TalkGrpFile

	local length=filelength(idxfile);

	if talkid<0 and talkid>=length/4 then
	    return
	end

	local data=Byte.create(2*4);
	local id1,id2;
	if talkid==0 then
        Byte.loadfile(data,idxfile,0,4);
		id1=0;
	    id2=Byte.get32(data,0);
    else
        Byte.loadfile(data,idxfile,(talkid-1)*4,4*2);
		id1=Byte.get32(data,0);
	    id2=Byte.get32(data,4);
    end

    local p=io.open(grpfile,"r");
    p:seek("set",id1);
	local talk=p:read("*line");
	p:close();

	return talk;

end

function instruct_11_new()              --是否住宿
    Cls();
    return DrawStrBoxYesNo(-1,-1,"是否(Y/N)?",C_ORANGE,CC.DefaultFont);
end

function instruct_45_new(id,value)        --增加轻功
    local add,str=AddPersonAttrib(id,"轻功",value);
end


function instruct_46_new(id,value)            --增加内力
    local add,str=AddPersonAttrib(id,"内力最大值",value);
    AddPersonAttrib(id,"内力",0);
end


function instruct_47_new(id,value)
    local add,str=AddPersonAttrib(id,"攻击力",value);           --增加攻击力
end


function instruct_48_new(id,value)         --增加生命
    local add,str=AddPersonAttrib(id,"生命最大值",value);
    AddPersonAttrib(id,"生命",0);
end

--得到物品
function instruct_2(thingid,num)            --得到物品
    if JY.Thing[thingid]==nil then   --无此物品id
        return ;
	end

    instruct_32(thingid,num);    --增加物品
	if num>0 then
       DrawStrBoxWaitKey(string.format("得到物品:%s %d",JY.Thing[thingid]["名称"],num),C_ORANGE,CC.DefaultFont);
    else
	   DrawStrBoxWaitKey(string.format("失去物品:%s %d",JY.Thing[thingid]["名称"],-num),C_ORANGE,CC.DefaultFont);
	end
	instruct_2_sub();         --是否可得武林帖
end

--声望>200以及14天书后得到武林帖
function instruct_2_sub()               --声望>200以及14天书后得到武林帖

    if JY.Person[0]["声望"] < 200 then
        return ;
    end

    if instruct_18(189) ==true then            --有武林帖， 189 武林帖id
        return;
    end

    local booknum=0;
    for i=1,CC.BookNum do
        if instruct_18(CC.BookStart+i-1)==true then
            booknum=booknum+1;
        end
    end

    if booknum==CC.BookNum then        --设置主角居桌子上的武林帖事件
        instruct_3(70,11,-1,1,932,-1,-1,7968,7968,7968,-2,-2,-2);
    end
end

--修改D*
-- sceneid 场景id, -2表示当前场景
-- id  D*的id， -2表示当前id
-- v0 - v10 D*参数， -2表示此参数不变
function instruct_3(sceneid,id,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10)     --修改D*
    if sceneid==-2 then
        sceneid=JY.SubScene;
    end
    if id==-2 then
        id=JY.CurrentD;
    end

    if v0~=-2 then
        SetD(sceneid,id,0,v0)
    end
    if v1~=-2 then
        SetD(sceneid,id,1,v1)
    end
    if v2~=-2 then
        SetD(sceneid,id,2,v2)
    end
    if v3~=-2 then
        SetD(sceneid,id,3,v3)
    end
    if v4~=-2 then
        SetD(sceneid,id,4,v4)
    end
    if v5~=-2 then
        SetD(sceneid,id,5,v5)
    end
    if v6~=-2 then
        SetD(sceneid,id,6,v6)
    end
    if v7~=-2 then
        SetD(sceneid,id,7,v7)
    end
    if v8~=-2 then
        SetD(sceneid,id,8,v8)
    end

    if v9~=-2 and v10 ~=-2 then
	    if v9>0 and v10 >0 then   --为了和苍龙兼容，修改的坐标不能为0
            SetS(sceneid,GetD(sceneid,id,9),GetD(sceneid,id,10),3,-1);   --如果xy坐标移动了，那么S中相应数据要修改。
            SetD(sceneid,id,9,v9)
            SetD(sceneid,id,10,v10)
            SetS(sceneid,GetD(sceneid,id,9),GetD(sceneid,id,10),3,id);
		end
	end
end

--是否使用物品触发
function instruct_4(thingid)         --是否使用物品触发
    if JY.CurrentThing==thingid then
        return true;
    else
        return false;
    end
end


function instruct_5()         --选择战斗
    return DrawStrBoxYesNo(-1,-1,"是否与之过招(Y/N)?",C_ORANGE,CC.DefaultFont);
end


function instruct_6(warid,tmp,tmp,flag)      --战斗
    return WarMain(warid,flag);
end


function instruct_7()                 --已经翻译为return了
    instruct_test("指令7测试")
end


function instruct_8(musicid)            --改变主地图音乐
    JY.MmapMusic=musicid;
end


function instruct_9()                --是否要求加入队伍
    Cls();
    return DrawStrBoxYesNo(-1,-1,"是否要求加入(Y/N)?",C_ORANGE,CC.DefaultFont);
end


function instruct_10(personid)            --加入队员
    if JY.Person[personid]==nil then
        lib.Debug("instruct_10 error: person id not exist");
		return ;
    end
    local add=0;
    for i =2, CC.TeamNum do             --第一个位置是主角，从第二个开始
        if JY.Base["队伍"..i]<0 then
            JY.Base["队伍"..i]=personid;
            add=1;
            break;
        end
    end
    if add==0 then
        lib.Debug("instruct_10 error: 加入队伍已满");
        return ;
    end

    for i =1,4 do                --个人物品归公
        local id =JY.Person[personid]["携带物品" .. i];
        local n=JY.Person[personid]["携带物品数量" .. i];
		if n==0 then n=0 end
        if id>=0 and n>0 then
            instruct_2(id,n);
            JY.Person[personid]["携带物品" .. i]=-1;
            JY.Person[personid]["携带物品数量" .. i]=0;
        end
    end
	--[[
	local pid=personid
	local leveladd=JY.Person[pid]["等级"]-1
	local function cleveradd()
		local ca
		if JY.Person[pid]["资质"]>100 then JY.Person[pid]["资质"]=100 end
		ca=JY.Person[pid]["资质"]+(110-JY.Person[pid]["资质"])/2
		ca=ca/15
		return ca
	end
	
	
	local function mymodf(x)
		local x1=math.modf(x)
		if math.random(1)<x-x1 then return x1+1
		else return x1 end
	end
	local tmp
	tmp=(JY.Person[pid]["生命增长"]+1)*leveladd*3+50
    if JY.Person[pid]["生命最大值"]<tmp and JY.Person[pid]["生命最大值"]>tmp/4 then
		JY.Person[pid]["生命最大值"]=tmp
		JY.Person[pid]["生命"]=JY.Person[pid]["生命最大值"];
	end
	tmp=math.modf(leveladd*((10-JY.Person[pid]["生命增长"])*5+150/cleveradd()))+50
    if JY.Person[pid]["内力最大值"]<tmp and JY.Person[pid]["内力最大值"]>tmp/4 then
		JY.Person[pid]["内力最大值"]=tmp
		JY.Person[pid]["内力"]=JY.Person[pid]["内力最大值"];
	end
	tmp=mymodf(cleveradd()*leveladd)+30
    if JY.Person[pid]["攻击力"]<tmp and JY.Person[pid]["攻击力"]>tmp/4 then
		JY.Person[pid]["攻击力"]=tmp
	end
	tmp=mymodf(cleveradd()*leveladd)+30
    if JY.Person[pid]["防御力"]<tmp and JY.Person[pid]["防御力"]>tmp/4 then
		JY.Person[pid]["防御力"]=tmp
	end
	tmp=mymodf(cleveradd()*leveladd/2)+30
    if JY.Person[pid]["轻功"]<tmp and JY.Person[pid]["轻功"]>tmp/4 then
		JY.Person[pid]["轻功"]=tmp
	end
	
	]]--
end


function instruct_11()              --是否住宿
    Cls();
    return DrawStrBoxYesNo(-1,-1,"是否住宿(Y/N)?",C_ORANGE,CC.DefaultFont);
end


function instruct_12(flag)             --住宿，回复体力
    for i=1,CC.TeamNum do
        local id=JY.Base["队伍" .. i];
        if id>=0 then
			--if flag~=nil then
				JY.Person[id]["受伤程度"]=0;
				JY.Person[id]["中毒程度"]=0;
			--end
            if JY.Person[id]["受伤程度"]<33 and JY.Person[id]["中毒程度"]<=0 then
                JY.Person[id]["受伤程度"]=0;
                AddPersonAttrib(id,"体力",math.huge);     --给一个很大的值，自动限制为最大值
                AddPersonAttrib(id,"生命",math.huge);
                AddPersonAttrib(id,"内力",math.huge);
            end
        end
    end
end


function instruct_13()            --场景变亮
    Cls();
    JY.Darkness=0;
    lib.ShowSlow(50,0)
	lib.GetKey();
end


function instruct_14()             --场景变黑
    lib.ShowSlow(50,1);
    JY.Darkness=1;
end

function instruct_15()          --game over
    JY.Status=GAME_DEAD;
    Cls();
    DrawString(CC.GameOverX,CC.GameOverY,JY.Person[0]["姓名"],RGB(0,0,0),CC.DefaultFont);

	local x=CC.ScreenW-9*CC.DefaultFont;
    DrawString(x,10,os.date("%Y-%m-%d %H:%M"),RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+CC.DefaultFont+CC.RowPixel,"在地球的某处",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*2,"当地人口的失踪数",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*3,"又多了一笔。。。",RGB(216, 20, 24) ,CC.DefaultFont);

    local loadMenu={ {"载入进度一",nil,1},
                     {"载入进度二",nil,1},
                     {"载入进度三",nil,1},
                     {"回家睡觉去",nil,1} };
    local y=CC.ScreenH-4*(CC.DefaultFont+CC.RowPixel)-10;
    local r=ShowMenu(loadMenu,4,0,x,y,0,0,0,0,CC.DefaultFont,C_ORANGE, C_WHITE)

    if r<4 then
        SBLDATAL(r);
		--JY.OldDPass=-1;
        --JY.Status=GAME_FIRSTMMAP;
		if JY.Base["无用"]~=-1 then
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["无用"]
			
			JY.MmapMusic=-1;
			JY.MyPic=GetMyPic();
			Init_SMap(1);
		else
			JY.SubScene=-1;
			JY.Status=GAME_FIRSTMMAP;
		end
		ShowScreen();
		lib.LoadPicture("",0,0);
		lib.GetKey();
		Game_Cycle();
    else
        JY.Status=GAME_END;
    end

end

function inteam(pid)
	return instruct_16(pid)
end

function instruct_16(personid)      --队伍中是否有某人
    local r=false;
	--[[if JY.Status==GAME_WMAP then
		if WAR.tmp[1000+personid]~=nil then
			return false;
		end
	end]]
    for i = 1, CC.TeamNum do
        if personid==JY.Base["队伍" .. i] then
            r=true;
            break;
        end
    end;
    return r;
end


function instruct_17(sceneid,level,x,y,v)     --修改场景图形
    if sceneid==-2 then
        sceneid=JY.SubScene;
    end
    SetS(sceneid,x,y,level,v);
end


function instruct_18(thingid)           --是否有某种物品
    for i = 1,CC.MyThingNum do
        if JY.Base["物品" .. i]==thingid then
            return true;
        end
    end
    return false;
end


function instruct_19(x,y)             --改变主角位置
    JY.Base["人X1"]=x;
    JY.Base["人Y1"]=y;
	JY.SubSceneX=0;
	JY.SubSceneY=0;
end


function instruct_20()                 --判断队伍是否满
    if JY.Base["队伍" .. CC.TeamNum ] >=0 then
        return true;
    end
    return false;
end


function instruct_21(personid)               --离队
    if JY.Person[personid]==nil then
        lib.Debug("instruct_21 error: personid not exist");
        return ;
    end
    local j=0;
    for i = 1, CC.TeamNum do
        if personid==JY.Base["队伍" .. i] then
            j=i;
            break;
        end
    end;
    if j==0 then
       return;
    end

    for  i=j+1,CC.TeamNum do
        JY.Base["队伍" .. i-1]=JY.Base["队伍" .. i];
    end
    JY.Base["队伍" .. CC.TeamNum]=-1;

    if JY.Person[personid]["武器"]>=0 then
        JY.Thing[JY.Person[personid]["武器"]]["使用人"]=-1;
        JY.Person[personid]["武器"]=-1
    end
    if JY.Person[personid]["防具"]>=0 then
        JY.Thing[JY.Person[personid]["防具"]]["使用人"]=-1;
        JY.Person[personid]["防具"]=-1;
    end

    if JY.Person[personid]["修炼物品"]>=0 then
        JY.Thing[JY.Person[personid]["修炼物品"]]["使用人"]=-1;
        JY.Person[personid]["修炼物品"]=-1;
    end

    --JY.Person[personid]["修炼点数"]=0;
    JY.Person[personid]["物品修炼点数"]=0;
end


function instruct_22()            --内力降为0
    for i = 1, CC.TeamNum do
        if JY.Base["队伍" .. i] >=0 then
            JY.Person[JY.Base["队伍" .. i]]["内力"]=0;
        end
    end
end


function instruct_23(personid,value)           --设置用毒
    JY.Person[personid]["用毒能力"]=value;
    AddPersonAttrib(personid,"用毒能力",0)
end

--空指令
function instruct_24()
    instruct_test("指令24测试")
end

--场景移动
--为简化，实际上是场景移动(x2-x1)，(y2-y1)。先y后x。因此，x1,y1可设为0
function instruct_25(x1,y1,x2,y2)             --场景移动
    local sign;
    if y1 ~= y2 then
        if y2<y1 then
            sign=-1;
        else
            sign=1;
        end
        for i=y1+sign,y2,sign do
            local t1=lib.GetTime();
            JY.SubSceneY=JY.SubSceneY+sign;
	        --JY.oldSMapX=-1;
		    --JY.oldSMapY=-1;
            DrawSMap();
            ShowScreen();
            local t2=lib.GetTime();
            if (t2-t1)<CC.SceneMoveFrame then
                lib.Delay(CC.SceneMoveFrame-(t2-t1));
            end
        end
    end

    if x1 ~= x2 then
        if x2<x1 then
            sign=-1;
        else
            sign=1;
        end
        for i=x1+sign,x2,sign do
            local t1=lib.GetTime();
            JY.SubSceneX=JY.SubSceneX+sign;
			--JY.oldSMapX=-1;
			--JY.oldSMapY=-1;

            DrawSMap();
            ShowScreen();
            local t2=lib.GetTime();
            if (t2-t1)<CC.SceneMoveFrame then
                lib.Delay(CC.SceneMoveFrame-(t2-t1));
            end
        end
    end
end


function instruct_26(sceneid,id,v1,v2,v3)           --增加D*编号
    if sceneid==-2 then
        sceneid=JY.SubScene;
    end

    local v=GetD(sceneid,id,2);
    SetD(sceneid,id,2,v+v1);
    v=GetD(sceneid,id,3);
    SetD(sceneid,id,3,v+v2);
    v=GetD(sceneid,id,4);
    SetD(sceneid,id,4,v+v3);
end

--显示动画 id=-1 主角位置动画
function instruct_27(id,startpic,endpic)           --显示动画
    local old1,old2,old3;
	if id ~=-1 then
        old1=GetD(JY.SubScene,id,5);
        old2=GetD(JY.SubScene,id,6);
        old3=GetD(JY.SubScene,id,7);
    end

    --Cls();
	--ShowScreen();
    for i =startpic,endpic,2 do
        local t1=lib.GetTime();
        if id==-1 then
            JY.MyPic=i/2;
        else
            SetD(JY.SubScene,id,5,i);
            SetD(JY.SubScene,id,6,i);
            SetD(JY.SubScene,id,7,i);
        end
        DtoSMap();
        DrawSMap();
        ShowScreen();
        local t2=lib.GetTime();
    	if t2-t1<CC.AnimationFrame then
            lib.Delay(CC.AnimationFrame-(t2-t1));
	    end
    end
	if id ~=-1 then
        SetD(JY.SubScene,id,5,old1);
        SetD(JY.SubScene,id,6,old2);
        SetD(JY.SubScene,id,7,old3);
    end
end

--判断品德
function instruct_28(personid,vmin,vmax)          --判断品德
    local v=JY.Person[personid]["品德"];
    if v >=vmin and v<=vmax then
        return true;
    else
        return false;
    end
end

--判断攻击力
function instruct_29(personid,vmin,vmax)           --判断攻击力
    local v=JY.Person[personid]["攻击力"];
    if v >=vmin and v<=vmax then
        return true;
    else
        return false
    end
end

--主角走动
--为简化，走动使用相对值(x2-x1)(y2-y1),因此x1,y1可以为0，不必一定要为当前坐标。
function instruct_30(x1,y1,x2,y2)                --主角走动
    --Cls();
    --ShowScreen();

    if x1<x2 then
        for i=x1+1,x2 do
            local t1=lib.GetTime();
            instruct_30_sub1(1);
            local t2=lib.GetTime();
            if (t2-t1)<CC.PersonMoveFrame then
                lib.Delay(CC.PersonMoveFrame-(t2-t1));
            end
        end
    elseif x1>x2 then
        for i=x2+1,x1 do
            local t1=lib.GetTime();
            instruct_30_sub1(2);
            local t2=lib.GetTime();
            if (t2-t1)<CC.PersonMoveFrame then
                lib.Delay(CC.PersonMoveFrame-(t2-t1));
            end
        end
    end

    if y1<y2 then
        for i=y1+1,y2 do
            local t1=lib.GetTime();
            instruct_30_sub1(3);
            local t2=lib.GetTime();
            if (t2-t1)<CC.PersonMoveFrame then
                lib.Delay(CC.PersonMoveFrame-(t2-t1));
            end
        end
    elseif y1>y2 then
        for i=y2+1,y1 do
            local t1=lib.GetTime();
            instruct_30_sub1(0);
            local t2=lib.GetTime();
            if (t2-t1)<CC.PersonMoveFrame then
                lib.Delay(CC.PersonMoveFrame-(t2-t1));
            end
        end
    end
end
function instruct_30_sub1(direct)
	local x,y
    AddMyCurrentPic();
    x=JY.Base["人X1"]+CC.DirectX[direct+1];
    y=JY.Base["人Y1"]+CC.DirectY[direct+1];
    JY.Base["人方向"]=direct;
    JY.MyPic=GetMyPic();
    DtoSMap();

    if  SceneCanPass(x,y)==true then
        JY.Base["人X1"]=x;
        JY.Base["人Y1"]=y;
    end
    JY.Base["人X1"]=limitX(JY.Base["人X1"],1,CC.SWidth-2);
    JY.Base["人Y1"]=limitX(JY.Base["人Y1"],1,CC.SHeight-2);

    DrawSMap();
--    Cls();
    ShowScreen();
	return 1
end
--主角走动sub
function instruct_30_sub(direct)            --主角走动sub
    local x,y;
    local d_pass=GetS(JY.SubScene,JY.Base["人X1"],JY.Base["人Y1"],3);   --当前路过事件
    if d_pass>=0 then
        if d_pass ~=JY.OldDPass then     --避免重复触发
            EventExecute(d_pass,3);       --路过触发事件
            JY.OldDPass=d_pass;
		    JY.oldSMapX=-1;
	        JY.oldSMapY=-1;
			JY.D_Valid=nil;
        end
    else
        JY.OldDPass=-1;
    end

    local isout=0;                --是否碰到出口
    if (JY.Scene[JY.SubScene]["出口X1"] ==JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y1"] ==JY.Base["人Y1"]) or
       (JY.Scene[JY.SubScene]["出口X2"] ==JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y2"] ==JY.Base["人Y1"]) or
       (JY.Scene[JY.SubScene]["出口X3"] ==JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y3"] ==JY.Base["人Y1"]) then
       isout=1;
    end

    if isout==1 then    --出去，返回主地图
        JY.Status=GAME_MMAP;

		lib.PicInit();
		CleanMemory();
        lib.ShowSlow(50,1)

        if JY.MmapMusic<0 then
            JY.MmapMusic=JY.Scene[JY.SubScene]["出门音乐"];
        end

		Init_MMap();



        JY.SubScene=-1;
		JY.oldSMapX=-1;
		JY.oldSMapY=-1;

        lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],GetMyPic());
        lib.ShowSlow(50,0)
        lib.GetKey();
        return;
    end

    --是否跳转到其他场景
    if JY.Scene[JY.SubScene]["跳转场景"] >=0 then
        if JY.Base["人X1"]==JY.Scene[JY.SubScene]["跳转口X1"] and JY.Base["人Y1"]==JY.Scene[JY.SubScene]["跳转口Y1"] then
            JY.SubScene=JY.Scene[JY.SubScene]["跳转场景"];
            lib.ShowSlow(50,1);

            if JY.Scene[JY.SubScene]["外景入口X1"]==0 and JY.Scene[JY.SubScene]["外景入口Y1"]==0 then
                JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"];            --新场景的外景入口为0，表示这是一个内部场景
                JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"];
            else
                JY.Base["人X1"]=JY.Scene[JY.SubScene]["跳转口X2"];         --外部场景，即从其他内部场景跳回。
                JY.Base["人Y1"]=JY.Scene[JY.SubScene]["跳转口Y2"];
            end

			Init_SMap(1);

            return;
        end
    end
    AddMyCurrentPic();
    x=JY.Base["人X1"]+CC.DirectX[direct+1];
    y=JY.Base["人Y1"]+CC.DirectY[direct+1];
    JY.Base["人方向"]=direct;
    JY.MyPic=GetMyPic();
    DtoSMap();

    if  SceneCanPass(x,y)==true then
        JY.Base["人X1"]=x;
        JY.Base["人Y1"]=y;
    end
    JY.Base["人X1"]=limitX(JY.Base["人X1"],1,CC.SWidth-2);
    JY.Base["人Y1"]=limitX(JY.Base["人Y1"],1,CC.SHeight-2);

    DrawSMap();
--    Cls();
    ShowScreen();
	return 1
end

--判断是否够钱
function instruct_31(num)             --判断是否够钱
    local r=false;
    for i =1,CC.MyThingNum do
        if JY.Base["物品" .. i]==CC.MoneyID then
            if JY.Base["物品数量" .. i]>=num then
                r=true;
            end
            break;
        end
    end
    return r;
end

--增加物品
--num 物品数量，负数则为减少物品
function instruct_32(thingid,num)           --增加物品
    local p=1;
    for i=1,CC.MyThingNum do
        if JY.Base["物品" .. i]==thingid then
            JY.Base["物品数量" .. i]=JY.Base["物品数量" .. i]+num
            p=i;
            break;
        elseif JY.Base["物品" .. i]==-1 then
            JY.Base["物品" .. i]=thingid;
            JY.Base["物品数量" .. i]=num;
            p=i;
            break;
        end
    end
	
	if thingid==174 then JY.GOLD=JY.GOLD+num end
	if thingid==155 and num==1 then instruct_32(219,-1) end	   

    if JY.Base["物品数量" .. p] <=0 then
        for i=p+1,CC.MyThingNum do
            JY.Base["物品" .. i-1]=JY.Base["物品" .. i];
            JY.Base["物品数量" .. i-1]=JY.Base["物品数量" .. i];
        end
        JY.Base["物品" .. CC.MyThingNum]=-1;
        JY.Base["物品数量" .. CC.MyThingNum]=0;
    end
end

--学会武功
function instruct_33(personid,wugongid,flag)           --学会武功
    local add=0;
    for i=1,10 do
        if JY.Person[personid]["武功" .. i]==0 then
            JY.Person[personid]["武功" .. i]=wugongid;
            JY.Person[personid]["武功等级" .. i]=0;
            add=1
            break;
        end
    end

    if add==0 then      --，武功已满，覆盖最后一个武功
        JY.Person[personid]["武功10" ]=wugongid;
        JY.Person[personid]["武功等级10"]=0;
    end

    if flag==0 then
        DrawStrBoxWaitKey(string.format("%s 学会武功 %s",JY.Person[personid]["姓名"],JY.Wugong[wugongid]["名称"]),C_ORANGE,CC.DefaultFont);
    end
end

--资质增加
function instruct_34(id,value)              --资质增加
    local add,str=AddPersonAttrib(id,"资质",value);
    DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
end

--设置武功
function instruct_35(personid,id,wugongid,wugonglevel)         --设置武功
    if id>=0 then
        JY.Person[personid]["武功" .. id+1]=wugongid;
        JY.Person[personid]["武功等级" .. id+1]=wugonglevel;
    else
        local flag=0;
        for i =1,10 do
            if JY.Person[personid]["武功" .. i]==0 then
                flag=1;
                JY.Person[personid]["武功" .. i]=wugongid;
                JY.Person[personid]["武功等级" .. i]=wugonglevel;
                return;
            end
        end
        if flag==0 then
            JY.Person[personid]["武功" .. 1]=wugongid;
            JY.Person[personid]["武功等级" .. 1]=wugonglevel;
        end
    end
end

--判断主角性别
function instruct_36(sex)               --判断主角性别
    if JY.Person[0]["性别"]==sex then
        return true;
    else
        return false;
    end
end


function instruct_37(v)              --增加品德
    AddPersonAttrib(0,"品德",v);
end

--修改场景某层贴图
function instruct_38(sceneid,level,oldpic,newpic)         --修改场景某层贴图
    if sceneid==-2 then
        sceneid=JY.SubScene;
    end

    for i=0,CC.SWidth-1 do
        for j=1, CC.SHeight-1 do
            if GetS(sceneid,i,j,level)==oldpic then
                SetS(sceneid,i,j,level,newpic)
            end
        end
    end
end


function instruct_39(sceneid)             --打开场景
    JY.Scene[sceneid]["进入条件"]=0;
end


function instruct_40(v)                --改变主角方向
    JY.Base["人方向"]=v;
    JY.MyPic=GetMyPic();
end


function instruct_41(personid,thingid,num)        --其他人员增加物品
    local k=0;
    for i =1, 4 do        --已有物品
        if JY.Person[personid]["携带物品" .. i]==thingid then
            JY.Person[personid]["携带物品数量" .. i]=JY.Person[personid]["携带物品数量" .. i]+num;
            k=i;
            break
        end
    end

    --物品减少到0，则后面物品往前移动
    --[[if k>0 and JY.Person[personid]["携带物品数量" .. k] <=0 then
        for i=k+1,4 do
            JY.Person[personid]["携带物品" .. i-1]=JY.Person[personid]["携带物品" .. i];
            JY.Person[personid]["携带物品数量" .. i-1]=JY.Person[personid]["携带物品数量" .. i];
        end
        JY.Person[personid]["携带物品" .. 4]=-1;
        JY.Person[personid]["携带物品数量" .. 4]=0;
    end]]
    
	if k>0 and JY.Person[personid]["携带物品数量" .. k] <=0 then
	   JY.Person[personid]["携带物品" .. k]=-1
	end

    if k==0 then    --没有物品，注意此处不考虑超过4个物品的情况，如果超过，则无法加入。
        for i =1, 4 do        --已有物品
            if JY.Person[personid]["携带物品" .. i]==-1 then
                JY.Person[personid]["携带物品" .. i]=thingid;
                JY.Person[personid]["携带物品数量" .. i]=num;
                break
            end
        end
    end
end


function instruct_42()          --队伍中是否有女性
    local r=false;
    for i =1,CC.TeamNum do
        if JY.Base["队伍" .. i] >=0 then
            if JY.Person[JY.Base["队伍" .. i]]["性别"]==1 then
                r=true;
            end
        end
    end
    return r;
end


function instruct_43(thingid)        --是否有某种物品
    return instruct_18(thingid);
end


function instruct_44(id1,startpic1,endpic1,id2,startpic2,endpic2)     --同时显示两个动画
    local old1=GetD(JY.SubScene,id1,5);
    local old2=GetD(JY.SubScene,id1,6);
    local old3=GetD(JY.SubScene,id1,7);
    local old4=GetD(JY.SubScene,id2,5);
    local old5=GetD(JY.SubScene,id2,6);
    local old6=GetD(JY.SubScene,id2,7);

    --Cls();
    --ShowScreen();
    for i =startpic1,endpic1,2 do
        local t1=lib.GetTime();
        if id1==-1 then
            JY.MyPic=i/2;
        else
            SetD(JY.SubScene,id1,5,i);
            SetD(JY.SubScene,id1,6,i);
            SetD(JY.SubScene,id1,7,i);
        end
        if id2==-1 then
            JY.MyPic=i/2;
        else
            SetD(JY.SubScene,id2,5,i-startpic1+startpic2);
            SetD(JY.SubScene,id2,6,i-startpic1+startpic2);
            SetD(JY.SubScene,id2,7,i-startpic1+startpic2);
        end
        DtoSMap();
        DrawSMap();
        ShowScreen();
        local t2=lib.GetTime();
    	if t2-t1<CC.AnimationFrame then
            lib.Delay(CC.AnimationFrame-(t2-t1));
	    end
    end
    SetD(JY.SubScene,id1,5,old1);
    SetD(JY.SubScene,id1,6,old2);
    SetD(JY.SubScene,id1,7,old3);
    SetD(JY.SubScene,id2,5,old4);
    SetD(JY.SubScene,id2,6,old5);
    SetD(JY.SubScene,id2,7,old6);

end


function instruct_45(id,value)        --增加轻功
    local add,str=AddPersonAttrib(id,"轻功",value);
    DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
end


function instruct_46(id,value)            --增加内力
    local add,str=AddPersonAttrib(id,"内力最大值",value);
    AddPersonAttrib(id,"内力",0);
    DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
end


function instruct_47(id,value)
    local add,str=AddPersonAttrib(id,"攻击力",value);           --增加攻击力
    DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
end


function instruct_48(id,value)         --增加生命
    local add,str=AddPersonAttrib(id,"生命最大值",value);
    AddPersonAttrib(id,"生命",0);
    if instruct_16(id)==true then             --我方队员，显示增加
        DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str,C_ORANGE,CC.DefaultFont);
    end
end


function instruct_49(personid,value)       --设置内力属性
    JY.Person[personid]["内力性质"]=value;
end

--判断是否有5种物品
function instruct_50(id1,id2,id3,id4,id5)       --判断是否有5种物品
    local num=0;
    if instruct_18(id1)==true then
        num=num+1;
    end
    if instruct_18(id2)==true then
        num=num+1;
    end
    if instruct_18(id3)==true then
        num=num+1;
    end
    if instruct_18(id4)==true then
        num=num+1;
    end
    if instruct_18(id5)==true then
        num=num+1;
    end
    if num==5 then
        return true;
    else
        return false;
    end
end


function instruct_51()     --问软体娃娃
    instruct_1(2547+Rnd(18),114,0);
end


function instruct_52()       --看品德
    DrawStrBoxWaitKey(string.format("你现在的品德指数为: %d",JY.Person[0]["品德"]),C_ORANGE,CC.DefaultFont);
end


function instruct_53()        --看声望
    DrawStrBoxWaitKey(string.format("你现在的声望指数为: %d",JY.Person[0]["声望"]),C_ORANGE,CC.DefaultFont);
end


function instruct_54()        --开放其他场景
    for i = 0, JY.SceneNum-1 do
        JY.Scene[i]["进入条件"]=0;
    end
    JY.Scene[2]["进入条件"]=2;    --云鹤崖
    JY.Scene[38]["进入条件"]=2;   --摩天崖
    JY.Scene[75]["进入条件"]=1;   --桃花岛
    JY.Scene[80]["进入条件"]=1;   --绝情谷底
end


function instruct_55(id,num)      --判断D*编号的触发事件
    if GetD(JY.SubScene,id,2)==num then
        return true;
    else
        return false;
    end
end


function instruct_56(v)             --增加声望
    JY.Person[0]["声望"]=JY.Person[0]["声望"]+v;
    instruct_2_sub();     --是否可以增加武林帖
end

--高昌迷宫劈门
function instruct_57()       --高昌迷宫劈门
    instruct_27(-1,7664,7674);
    --Cls();
	--ShowScreen();
    for i=0,56,2 do
	    local t1=lib.GetTime();
        if JY.MyPic< 7688/2 then
            JY.MyPic=(7676+i)/2;
        end
        SetD(JY.SubScene,2,5,i+7690);
        SetD(JY.SubScene,2,6,i+7690);
        SetD(JY.SubScene,2,7,i+7690);
        SetD(JY.SubScene,3,5,i+7748);
        SetD(JY.SubScene,3,6,i+7748);
        SetD(JY.SubScene,3,7,i+7748);
        SetD(JY.SubScene,4,5,i+7806);
        SetD(JY.SubScene,4,6,i+7806);
        SetD(JY.SubScene,4,7,i+7806);

        DtoSMap();
        DrawSMap();
        ShowScreen();
        local t2=lib.GetTime();
    	if t2-t1<CC.AnimationFrame then
            lib.Delay(CC.AnimationFrame-(t2-t1));
	    end
    end
end

--武道大会比武
function instruct_58()           --武道大会比武
    local group=5           --比武的组数
    local num1 = 6          --每组有几个战斗
    local num2 = 3          --选择的战斗数
    local startwar=102      --起始战斗编号
    local flag={};

    for i = 0,group-1 do
        for j=0,num1-1 do
            flag[j]=0;
        end

        for j = 1,num2 do
            local r;
            while true do          --选择一场战斗
                r=Rnd(num1);
                if flag[r]==0 then
                    flag[r]=1;
                    break;
                end
            end
            local warnum =r+i*num1;      --武道大会战斗编号
            WarLoad(warnum + startwar);
            instruct_1(2854+warnum, JY.Person[WAR.Data["敌人1"]]["头像代号"], 0);
            instruct_0();
            if WarMain(warnum + startwar, 0) ==true  then     --赢
                instruct_0();
                instruct_13();
                TalkEx("还有那位前辈肯赐教？", 0, 1)
                instruct_0();
            else
                instruct_15();
                return;
            end
        end

        if i < group - 1 then
            TalkEx("少侠已连战三场，*可先休息再战．", 70, 0);
            instruct_0();
            instruct_14();
            lib.Delay(300);
            if JY.Person[0]["受伤程度"] < 50 and JY.Person[0]["中毒程度"] <= 0 then
               JY.Person[0]["受伤程度"] = 0
               AddPersonAttrib(0,"体力",math.huge);
               AddPersonAttrib(0,"内力",math.huge);
               AddPersonAttrib(0,"生命",math.huge);
            end
            instruct_13();
            TalkEx("我已经休息够了，*有谁要再上？",0,1);
            instruct_0();
        end
    end

    TalkEx("接下来换谁？**．．．．*．．．．***没有人了吗？",0,1);
    instruct_0();
    TalkEx("如果还没有人要出来向这位*少侠挑战，那麽这武功天下*第一之名，武林盟主之位，*就由这位少侠夺得．***．．．．．．*．．．．．．*．．．．．．*好，恭喜少侠，这武林盟主*之位就由少侠获得，而这把*”武林神杖”也由你保管．",70,0);
    instruct_0();
    TalkEx("恭喜少侠！",12,0);
    instruct_0();
    TalkEx("小兄弟，恭喜你！",64,4);
    instruct_0();
    TalkEx("好，今年的武林大会到此已*圆满结束，希望明年各位武*林同道能再到我华山一游．",19,0);
    instruct_0();
    instruct_14();
    for i = 24,72 do
        instruct_3(-2, i, 0, 0, -1, -1, -1, -1, -1, -1, -2, -2, -2)
    end
    instruct_0();
    instruct_13();
    TalkEx("历经千辛万苦，我终於打败*群雄，得到这武林盟主之位*及神杖．*但是”圣堂”在那呢？*为什麽没人告诉我，难道大*家都不知道．*这会儿又有的找了．", 0, 1)
    instruct_0();
    instruct_2(143, 1)           --得到神杖

end

--全体队员离队
function instruct_59()           --全体队员离队
    for i=CC.TeamNum,2,-1 do
	    if JY.Base["队伍" .. i]>=0 then
            instruct_21(JY.Base["队伍" .. i]);
	    end
    end

    for i,v in ipairs(CC.AllPersonExit) do
        instruct_3(v[1],v[2],0,0,-1,-1,-1,-1,-1,-1,0,-2,-2);
    end
end

--判断D*图片
function instruct_60(sceneid,id,num)          --判断D*图片
    if sceneid==-2 then
         sceneid=JY.SubScene;
    end

    if id==-2 then
         id=JY.CurrentD;
    end

    if GetD(sceneid,id,5)==num then
        return true;
    else
        return false;
    end
end

--判断是否放完14天书
function instruct_61()               --判断是否放完14天书
    for i=11,24 do
        if GetD(JY.SubScene,i,5) ~= 4664 then
            return false;
        end
    end
    return true;
end

--播放时空机动画，结束
function instruct_62(id1,startnum1,endnum1,id2,startnum2,endnum2)      --播放时空机动画，结束
      JY.MyPic=-1;
      instruct_44(id1,startnum1,endnum1,id2,startnum2,endnum2);

      --此处应该插入正规的片尾动画。这里暂时用图片代替

	  --lib.LoadPicture(CONFIG.PicturePath .."end.png",-1,-1);
	  ShowScreen();	  
	  lib.Delay(2000);
	  say(CC.s56,280,5,CC.s57)
	  --lib.GetKey();	 	  
	  lib.LoadSMap(CC.S_Filename[0],CC.TempS_Filename,JY.SceneNum,CC.SWidth,CC.SHeight,CC.D_Filename[0],CC.DNum,11);
      if JY.Thing[202][WZ7]>=GetS(100,10,10,4) then
	     SetS(100,10,10,4,JY.Thing[202][WZ7]+1)
	  end
      if GetS(100,10,10,4)>3 then SetS(100,10,10,4,3) end	  
      SetS(100,10,10,5,GZMYZM[GetS(100,10,10,4)])
      --QZXS(	GetS(100,10,10,5))      
	  lib.SaveSMap(CC.S_Filename[0],CC.D_Filename[0]);
	  PlayMIDI(60)	  
	  Cls();
	  lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK);
					ShowScreen();
					lib.Delay(1000);				
	  DrawStrBox(-1,-1,CC.EVB120,C_WHITE,30);
	  ShowScreen();
	  WaitKey();
	  ClsN();
	  DrawStrBox(-1,-1,CC.EVB121,C_WHITE,30);
	  ShowScreen();
	  WaitKey();	      
	  --lib.PlayMPEG(CONFIG.DataPath .. "start.mpg",VK_ESCAPE);	  	 	          
	  JY.Status=xx;
end

--设置性别
function instruct_63(personid,sex)          --设置性别
    JY.Person[personid]["性别"]=sex
end

--小宝卖东西
function instruct_64()                 --小宝卖东西
    local headid=223;           --小宝头像

    local ts=0;
    local id=-1;
    for i=0,JY.ShopNum-1 do                --找到当前商店id
        if CC.ShopScene[i].sceneid==JY.SubScene then
            id=i;
            break;
        end
    end
    if id<0 then
        return ;
    end

    TalkEx("这位小哥，看看有什麽需要*的，小店卖的东西价钱绝*对公道．",headid,0);

    local menu={};
    for i=1,5 do
        menu[i]={};
        local thingid=JY.Shop[id]["物品" ..i];
        menu[i][1]=string.format("%-12s %5d",JY.Thing[thingid]["名称"],JY.Shop[id]["物品价格" ..i]);
        menu[i][2]=nil;
        if JY.Shop[id]["物品数量" ..i] >0 then
            menu[i][3]=1;
        else
            menu[i][3]=0;
        end			  
    end
	for i=1,200 do 
			if JY.Base["物品"..i]>143 and JY.Base["物品"..i]<158 then
				ts=ts+1
			end
	end		   
	if ts<6 and id==0 then menu[5][3]=0 end
	if ts<8 and id==4 then menu[5][3]=0 end

    local x1=(CC.ScreenW-9*CC.DefaultFont-2*CC.MenuBorderPixel)/2;
    local y1=(CC.ScreenH-5*CC.DefaultFont-4*CC.RowPixel-2*CC.MenuBorderPixel)/2;

    local r=ShowMenu(menu,5,0,x1,y1,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

	
	
		
    if r>0 then
	    
		
        if instruct_31(JY.Shop[id]["物品价格" ..r])==false then
            TalkEx("非常抱歉，*你身上的钱似乎不够．",headid,0);
        else
            JY.Shop[id]["物品数量" ..r]=JY.Shop[id]["物品数量" ..r]-1;
            instruct_32(CC.MoneyID,-JY.Shop[id]["物品价格" ..r]);
            instruct_32(JY.Shop[id]["物品" ..r],1);
            TalkEx("大爷买了小店的东西，*保证绝不後悔．",headid,0);
        end
    end
		
    for i,v in ipairs(CC.ShopScene[id].d_leave) do
        instruct_3(-2,v,0,-2,-1,-1,939,-1,-1,-1,-2,-2,-2);      --设置离开场景时触发小宝离开事件，
    end
end

--小宝去其他客栈
function instruct_65()           --小宝去其他客栈
    local id=-1;
    for i=0,JY.ShopNum-1 do                --找到当前商店id
        if CC.ShopScene[i].sceneid==JY.SubScene then
            id=i;
            break;
        end
    end
    if id<0 then
        return ;
    end

    ---清除当前商店所有小宝D×
    instruct_3(-2,CC.ShopScene[id].d_shop,0,-2,-1,-1,-1,-1,-1,-1,-2,-2,-2);
    for i,v in ipairs(CC.ShopScene[id].d_leave) do
        instruct_3(-2,v,0,-2,-1,-1,-1,-1,-1,-1,-2,-2,-2);
    end

    local newid=id+1;              --暂时用顺序取代随机，
    if newid>=5 then
        newid=0;
    end

    --设置新的小宝商店位置
    instruct_3(CC.ShopScene[newid].sceneid,CC.ShopScene[newid].d_shop,1,-2,938,-1,-1,8256,8256,8256,-2,-2,-2);
end

--播放音乐
function instruct_66(id)       --播放音乐
    PlayMIDI(id);
end

--播放音效
function instruct_67(id)      --播放音效
     PlayWavAtk(id);
end



function Shurufa(x,y)
	local pinyin=""				--用于保存拼音字符串
	local word=""				--用于保存已输入的文本
	while true do
		local tmp;
		pinyin,tmp=GetPinyin(x,y,word)
			if tmp~=nil then word=tmp end
			if pinyin=="finish" then break;
			elseif pinyin~=-1 and pinyin~="" then
				word=word..SeleteHanzi(x,y,word,pinyin)
			end
	end
return word
end

function SeleteHanzi(x,y,word,pinyin)--选字
	local T1=
{
de=
{
"的","地","得","德","底","锝"
},
di=
{
"的","地","第","提","低","底","抵","弟","迪","递","帝","敌","堤","蒂","缔","滴","涤","翟","娣","笛","棣","荻","谛","狄","邸","嘀","砥","坻","诋","嫡","镝","碲","骶","氐","柢","绨","籴","羝","睇","觌"
},
yi=
{
"一","以","已","意","议","义","益","亿","易","医","艺","依","移","衣","异","伊","仪","宜","遗","疑","毅","谊","亦","疫","役","忆","抑","乙","译","翼","溢","椅","沂","逸","蚁","夷","邑","怡","绎","彝","裔","姨","熠","贻","矣","屹","颐","倚","诣","胰","奕","翌","弈","轶","驿","壹","猗","臆","弋","铱","旖","漪","迤","佚","翊","诒","怿","痍","懿","饴","峄","揖","眙","镒","仡","黟","肄","咿","翳","挹","缢","呓","刈","咦","嶷","羿","钇","殪","荑","薏","蜴","镱","噫","癔","苡","悒","嗌","瘗","欹","佾","埸","圯","舣","酏","劓"
},
guo=
{
"国","过","果","郭","锅","裹","帼","涡","椁","蝈","虢","聒","埚","掴","猓","崞","蜾","呙","馘"
},
zai=
{
"在","再","灾","载","栽","仔","宰","哉","崽","甾"
},
ren=
{
"人","任","认","仁","忍","韧","刃","纫","饪","妊","荏","稔","壬","仞","轫","衽","葚"
},
le=
{
"了","乐","勒","肋","叻","鳓","仂","泐"
},
liao=
{
"了","料","疗","辽","廖","聊","寥","僚","燎","缭","撂","撩","嘹","潦","镣","寮","蓼","獠","钌","尥","鹩"
},
you=
{
"有","由","又","优","游","油","友","右","邮","尤","忧","幼","犹","诱","悠","幽","佑","釉","柚","铀","鱿","囿","酉","攸","黝","莠","猷","蝣","疣","呦","蚴","莸","莜","铕","宥","繇","卣","牖","鼬","蝤","尢","蚰","侑"
},
zhong=
{
"中","重","种","众","终","钟","忠","仲","衷","肿","踵","冢","盅","忪","锺","舯","螽"
},
shi=
{
"是","市","时","实","事","十","使","世","施","式","势","视","识","师","史","示","石","食","始","士","失","适","试","什","室","似","诗","饰","殖","释","驶","氏","逝","湿","蚀","狮","誓","拾","尸","匙","仕","柿","矢","峙","侍","噬","嗜","拭","嘘","屎","恃","轼","虱","舐","莳","铈","谥","炻","豕","鲥","螫","酾","筮","埘","弑","蓍","鲺","贳"
},
nian=
{
"年","念","酿","粘","碾","廿","捻","撵","拈","蔫","鲶","埝","鲇","辇","黏"
},
he=
{
"和","合","河","何","核","贺","喝","赫","荷","盒","鹤","吓","呵","禾","菏","壑","褐","涸","阂","阖","劾","诃","颌","嗬","貉","曷","翮","纥","蚵","盍"
},
hu=
{
"和","护","户","核","湖","互","乎","呼","胡","戏","忽","虎","沪","糊","壶","葫","狐","蝴","弧","瑚","浒","鹄","琥","扈","唬","滹","惚","祜","囫","斛","笏","醐","猢","怙","唿","戽","槲","觳","煳","鹕","冱","瓠","岵","鹱","烀","轷"
},
huo=
{
"和","活","或","货","获","火","伙","惑","霍","祸","豁","嚯","藿","锪","蠖","钬","耠","镬","夥","劐","攉"
},
da=
{
"大","达","打","答","塔","搭","沓","瘩","嗒","哒","耷","鞑","疸","靼","褡","笪","怛","妲"
},
dai=
{
"大","代","带","待","贷","戴","袋","歹","呆","逮","岱","傣","怠","殆","黛","甙","埭","绐","玳","呔","迨","骀"
},
ye=
{
"业","也","夜","叶","野","液","冶","页","爷","耶","邪","咽","椰","哗","烨","掖","拽","曳","晔","谒","腋","噎","揶","靥","邺","铘"
},
bu=
{
"不","部","步","布","补","捕","堡","埔","卜","埠","簿","哺","怖","钚","卟","瓿","逋","晡","醭","钸"
},
wei=
{
"为","位","委","未","维","卫","围","违","威","伟","危","味","微","遗","唯","谓","伪","慰","尾","魏","韦","胃","畏","帷","喂","巍","萎","蔚","纬","潍","尉","渭","惟","薇","苇","炜","圩","娓","诿","玮","崴","桅","偎","逶","猥","囗","葳","隗","痿","猬","涠","嵬","韪","煨","艉","帏","闱","洧","沩","隈","鲔","軎"
},
fa=
{
"发","法","罚","乏","伐","阀","筏","砝","垡","珐"
},
hui=
{
"会","回","挥","汇","惠","辉","恢","徽","绘","毁","慧","灰","贿","卉","悔","徊","秽","溃","荟","晖","彗","讳","诲","珲","堕","诙","蕙","晦","麾","烩","茴","喙","桧","蛔","洄","浍","虺","恚","蟪","咴","隳","缋","哕"
},
kuai=
{
"会","快","块","筷","脍","蒯","侩","浍","郐","狯","哙"
},
gong=
{
"工","公","共","供","功","红","贡","攻","宫","巩","龚","恭","拱","躬","弓","汞","蚣","珙","觥","肱"
},
jing=
{
"镜","京","精","境","竞","景","警","竟","井","惊","径","静","劲","敬","净","镜","睛","晶","荆","兢","靖","泾","憬","鲸","茎","腈","菁","胫","阱","旌","粳","靓","痉","儆","迳","婧","肼","刭","弪","獍"
},
shang=
{
"上","商","尚","伤","赏","汤","裳","墒","晌","垧","觞","殇","熵","绱"
},
yao=
{
"要","约","药","邀","陶","摇","耀","腰","遥","姚","窑","瑶","咬","尧","钥","谣","肴","夭","侥","吆","疟","妖","幺","杳","舀","窈","曜","鹞","爻","繇","徭","轺","铫","鳐","崾","珧"
},
ge=
{
"个","合","各","革","格","歌","哥","盖","隔","割","阁","戈","葛","鸽","搁","屹","胳","舸","疙","铬","骼","蛤","咯","圪","镉","颌","仡","硌","嗝","鬲","膈","纥","袼","搿","塥","哿","虼"
},
chan=
{
"产","单","阐","缠","掺","禅","颤","铲","蝉","搀","潺","蟾","馋","忏","婵","孱","觇","廛","谄","谗","澶","骣","羼","镡","躔","蒇","冁"
},
zhe=
{
"这","者","着","浙","折","哲","蔗","遮","辙","辄","柘","锗","褶","蜇","蛰","鹧","谪","赭","摺","磔"
},
chu=
{
"出","处","础","初","除","储","畜","触","楚","厨","雏","矗","橱","锄","褚","滁","躇","怵","绌","搐","刍","蜍","黜","杵","蹰","亍","樗","憷","楮"
},
xing=
{
"行","省","性","形","型","兴","星","刑","幸","姓","醒","邢","杏","腥","猩","悻","荥","陉","惺","饧","擤","硎","荇"
},
hang=
{
"行","航","杭","巷","夯","吭","珩","沆","绗","颃"
},
heng=
{
"行","衡","横","恒","亨","哼","珩","桁","蘅"
},
zuo=
{
"作","做","座","左","坐","昨","佐","琢","凿","搓","撮","祚","柞","唑","嘬","怍","笮","阼","胙"
},
sheng=
{
"生","省","声","升","胜","盛","乘","圣","剩","牲","绳","笙","甥","嵊","晟","渑","眚"
},
jia=
{
"家","加","价","假","佳","架","甲","嘉","贾","驾","嫁","夹","稼","钾","茄","挟","迦","伽","颊","浃","枷","戛","荚","痂","镓","笳","珈","岬","胛","嘏","袈","郏","葭","袷","瘕","铗","跏","蛱","恝"
},
jie=
{
"家","结","解","价","界","接","节","届","介","阶","街","借","杰","洁","截","姐","揭","捷","劫","戒","皆","竭","桔","诫","楷","秸","睫","藉","拮","芥","诘","碣","嗟","颉","蚧","孑","婕","疖","桀","讦","疥","偈","羯","喈","鲒","骱"
},
cheng=
{
"成","程","城","承","称","盛","乘","诚","呈","惩","撑","澄","秤","橙","骋","逞","瞠","丞","铛","埕","塍","噌","蛏","柽","铖","酲","裎","枨"
},
dao=
{
"到","道","导","岛","倒","刀","盗","稻","蹈","悼","捣","叨","祷","焘","氘","纛","帱","忉"
},
ri=
{
"日"
},
min=
{
"民","敏","闽","闵","皿","泯","岷","悯","珉","抿","黾","缗","玟","愍","苠","鳘"
},
lai=
{
"来","莱","赖","睐","徕","籁","涞","赉","濑","癞","崃","铼"
},
wo=
{
"我","握","窝","沃","卧","挝","涡","斡","渥","幄","蜗","喔","倭","莴","龌","肟","硪"
},
dui=
{
"对","队","敦","兑","堆","碓","怼","憝"
},
jin=
{
"进","金","今","近","仅","紧","尽","津","斤","禁","锦","劲","晋","谨","筋","巾","浸","襟","靳","瑾","烬","缙","觐","堇","馑","荩","噤","廑","妗","槿","赆","衿","卺"
},
duo=
{
"多","度","夺","朵","躲","铎","咄","堕","舵","驮","垛","惰","哆","踱","跺","掇","剁","柁","缍","沲","裰","哚"
},
quan=
{
"全","权","券","泉","圈","拳","劝","犬","铨","痊","诠","荃","醛","蜷","颧","绻","筌","鬈","悛","辁","畎"
},
jian=
{
"建","间","件","见","坚","检","健","监","减","简","艰","践","兼","鉴","键","渐","柬","剑","尖","肩","舰","荐","箭","浅","剪","俭","碱","茧","奸","歼","拣","捡","煎","贱","溅","槛","涧","笺","谏","饯","锏","缄","睑","謇","蹇","腱","菅","翦","戬","毽","笕","犍","硷","鞯","牮","枧","湔","鲣","囝","裥","踺","搛","缣","鹣","蒹","谫","僭","戋","趼","楗"
},
ta=
{
"他","它","她","拓","塔","踏","塌","榻","沓","漯","獭","嗒","挞","蹋","趿","遢","铊","鳎","溻","闼"
},
kai=
{
"开","凯","慨","楷","恺","揩","锴","铠","忾","垲","剀","锎","蒈"
},
men=
{
"们","门","闷","扪","焖","懑","钔"
},
chang=
{
"场","长","厂","常","偿","昌","唱","畅","倡","尝","肠","敞","倘","猖","娼","裳","徜","昶","怅","嫦","菖","鲳","阊","伥","苌","氅","惝","鬯"
},
zhan=
{
"展","战","占","站","崭","粘","湛","沾","瞻","颤","詹","斩","盏","辗","绽","毡","栈","蘸","旃","谵","搌"
},
li=
{
"理","力","利","立","里","李","历","例","离","励","礼","丽","黎","璃","厉","厘","粒","莉","梨","隶","栗","荔","沥","犁","漓","哩","狸","藜","罹","篱","鲤","砺","吏","澧","俐","骊","溧","砾","莅","锂","笠","蠡","蛎","痢","雳","俪","傈","醴","栎","郦","俚","枥","喱","逦","娌","鹂","戾","唳","坜","疠","蜊","黧","猁","鬲","粝","蓠","呖","跞","疬","缡","鲡","鳢","嫠","詈","悝","苈","篥","轹"
},
xin=
{
"新","心","信","寻","辛","欣","薪","馨","鑫","芯","锌","忻","昕","衅","歆","囟","镡"
},
fang=
{
"方","放","房","防","访","纺","芳","仿","坊","妨","肪","邡","舫","彷","枋","鲂","钫"
},
zhu=
{
"主","术","住","注","助","属","逐","著","筑","驻","朱","珠","祝","猪","诸","柱","竹","铸","株","瞩","嘱","贮","煮","烛","褚","蛛","拄","铢","洙","竺","蛀","渚","伫","杼","侏","诛","茱","箸","炷","躅","翥","潴","邾","槠","舳","橥","瘃","麈","疰"
},
qi=
{
"奇","其","起","期","气","七","器","汽","奇","齐","启","旗","棋","妻","弃","歧","欺","骑","契","迄","亟","漆","戚","岂","稽","岐","琦","栖","缉","琪","泣","乞","砌","祁","崎","绮","祺","蹊","祈","凄","淇","杞","脐","麒","圻","岖","憩","芪","俟","畦","荠","耆","葺","沏","萋","骐","鳍","綦","讫","蕲","屺","颀","亓","碛","柒","汔","綮","萁","嘁","蛴","槭","欹","芑","桤","蜞"
},
zi=
{
"资","自","子","字","咨","滋","仔","姿","紫","兹","孜","淄","籽","梓","鲻","渍","姊","吱","秭","恣","孳","訾","滓","锱","辎","趑","龇","赀","眦","缁","呲","笫","谘","嵫","髭","茈","粢","觜","耔"
},
xue=
{
"学","血","雪","削","薛","穴","靴","谑","噱","鳕","踅","泶"
},
bao=
{
"报","保","包","宝","暴","胞","薄","爆","炮","饱","抱","堡","剥","鲍","曝","葆","瀑","豹","刨","褒","雹","孢","苞","煲","褓","趵","鸨","龅"
},
zhi=
{
"制","之","治","质","职","只","志","至","指","织","支","值","知","识","直","致","执","置","止","植","纸","智","殖","秩","旨","址","滞","氏","枝","芝","脂","帜","汁","肢","挚","稚","酯","掷","峙","炙","栉","侄","芷","窒","咫","吱","趾","痔","蜘","郅","桎","雉","祉","陟","痣","蛭","帙","枳","踯","徵","胝","栀","贽","祗","豸","鸷","摭","轵","卮","轾","彘","觯","絷","跖","埴","黹","忮","骘","膣","踬"
},
zheng=
{
"政","正","证","争","整","征","郑","丁","症","挣","蒸","睁","铮","筝","拯","帧","峥","怔","诤","狰","徵","钲"
},
ji=
{
"济","机","其","技","基","记","计","系","革","期","际","及","集","级","几","给","积","极","己","纪","即","继","击","既","激","绩","急","奇","吉","季","齐","疾","迹","鸡","剂","辑","籍","寄","挤","圾","冀","亟","寂","暨","脊","跻","肌","稽","忌","饥","祭","缉","棘","矶","汲","畸","姬","藉","瘠","骥","羁","妓","讥","稷","蓟","悸","嫉","岌","叽","伎","鲫","诘","楫","荠","戟","箕","霁","嵇","觊","麂","畿","玑","笈","犄","芨","唧","屐","髻","戢","佶","偈","笄","跽","蒺","乩","咭","赍","嵴","虮","掎","齑","殛","鲚","剞","洎","丌","墼","蕺","芰","哜"
},
yong=
{
"用","永","拥","勇","涌","泳","庸","俑","踊","佣","咏","雍","甬","镛","臃","邕","蛹","恿","慵","壅","痈","鳙","墉","饔","喁"
},
tong=
{
"同","通","统","童","痛","铜","桶","桐","筒","彤","侗","佟","潼","捅","酮","砼","瞳","恸","峒","仝","恫","嗵","垌","茼"
},
yu=
{
"于","与","育","余","预","域","予","遇","语","誉","玉","鱼","雨","渔","裕","谷","愈","娱","欲","吁","舆","宇","羽","逾","豫","郁","寓","狱","喻","御","浴","愉","禹","俞","蔚","榆","愚","渝","尉","淤","虞","屿","峪","粥","驭","瑜","禺","毓","钰","隅","芋","熨","瘀","迂","煜","昱","於","臾","盂","聿","竽","萸","妪","腴","圄","谕","觎","揄","龉","谀","俣","馀","庾","妤","瘐","鬻","欤","腧","鹬","阈","嵛","雩","鹆","菀","圉","蜮","伛","纡","窬","窳","饫","蓣","狳","舁","蝓","燠"
},
gao=
{
"高","告","搞","稿","膏","糕","镐","皋","羔","锆","杲","郜","睾","诰","藁","篙","缟","槁","槔"
},
zhang=
{
"长","张","章","障","涨","掌","帐","胀","彰","丈","仗","漳","樟","账","杖","璋","嶂","仉","瘴","蟑","獐","幛","鄣","嫜"
},
xian=
{
"现","先","县","见","线","限","显","险","献","鲜","洗","宪","纤","陷","闲","贤","仙","衔","掀","咸","嫌","羡","弦","腺","痫","娴","舷","馅","酰","铣","冼","涎","暹","籼","锨","苋","蚬","跹","岘","藓","燹","鹇","氙","莶","霰","跣","猃","祆","筅"
},
ben=
{
"本","奔","苯","笨","夯","贲","锛","畚","坌"
},
yue=
{
"月","说","约","越","乐","跃","阅","岳","粤","悦","曰","钥","栎","钺","樾","瀹","龠","刖"
},
ding=
{
"定","订","顶","丁","鼎","盯","钉","锭","叮","仃","铤","町","酊","啶","碇","腚","疔","玎","耵"
},
hua=
{
"化","华","划","话","花","画","滑","哗","豁","骅","桦","猾","铧","砉"
},
dong=
{
"动","东","董","冬","洞","懂","冻","栋","侗","咚","峒","氡","恫","胴","硐","垌","鸫","岽","胨"
},
pin=
{
"品","贫","聘","频","拼","苹","拚","颦","姘","嫔","榀","牝"
},
chong=
{
"重","种","充","冲","涌","崇","虫","宠","忡","憧","舂","茺","铳","艟"
},
guan=
{
"关","管","观","馆","官","贯","冠","惯","灌","罐","莞","纶","棺","矜","倌","鹳","鳏","盥","掼","涫"
},
fen=
{
"分","份","纷","奋","粉","氛","芬","愤","粪","坟","汾","焚","酚","吩","忿","棼","玢","鼢","瀵","偾","鲼"
},
wai=
{
"外","歪"
},
qu=
{
"区","去","取","且","曲","趋","渠","趣","驱","屈","躯","衢","娶","祛","瞿","戌","岖","龋","觑","朐","蛐","癯","蛆","苣","阒","诎","劬","蕖","蘧","氍","黢","蠼","璩","麴","鸲","磲"
},
ou=
{
"区","欧","偶","殴","呕","藕","讴","鸥","瓯","沤","耦","怄"
},
neng=
{
"能"
},
she=
{
"设","社","摄","涉","射","折","舍","蛇","舌","奢","慑","赦","赊","佘","麝","歙","畲","厍","摺","猞","滠"
},
hou=
{
"后","候","厚","侯","猴","喉","吼","逅","篌","糇","骺","後","鲎","瘊","堠"
},
jiu=
{
"就","究","九","酒","久","救","旧","纠","舅","灸","疚","揪","咎","韭","玖","臼","柩","赳","鸠","鹫","厩","啾","阄","桕","僦","鬏"
},
deng=
{
"等","登","邓","灯","澄","凳","瞪","蹬","噔","磴","嶝","镫","簦","戥"
},
ti=
{
"体","提","题","替","梯","踢","惕","剔","蹄","啼","屉","剃","涕","锑","倜","悌","逖","嚏","荑","醍","绨","鹈","缇","裼"
},
xia=
{
"下","夏","峡","厦","辖","霞","虾","狭","吓","侠","暇","遐","瞎","匣","瑕","唬","呷","黠","硖","罅","狎","瘕","柙"
},
wan=
{
"万","完","晚","湾","玩","碗","顽","挽","弯","蔓","丸","莞","皖","宛","婉","腕","蜿","惋","烷","娩","琬","畹","豌","剜","纨","绾","脘","菀","芄"
},
mo=
{
"万","无","没","模","末","冒","莫","摩","墨","默","磨","摸","漠","脉","膜","魔","沫","陌","抹","寞","蘑","摹","蓦","馍","茉","嘿","谟","秣","貉","嫫","镆","殁","耱","瘼","貊","貘"
},
yuan=
{
"元","员","院","原","源","远","愿","园","援","圆","缘","袁","怨","渊","苑","冤","媛","猿","垣","沅","塬","垸","鸳","辕","鸢","瑗","圜","爰","芫","鼋","橼","螈","眢","箢","掾"
},
qian=
{
"前","千","钱","签","潜","迁","欠","纤","牵","浅","遣","谦","乾","铅","歉","黔","谴","嵌","倩","钳","茜","虔","堑","钎","骞","阡","掮","钤","扦","芊","犍","箬","荨","仟","芡","悭","缱","佥","愆","褰","肷","岍","搴","箝","慊","椠"
},
mian=
{
"面","棉","免","绵","缅","勉","眠","冕","娩","腼","渑","湎","沔","眄"
},
nong=
{
"农","浓","弄","脓","侬","哝"
},
shuo=
{
"说","数","硕","烁","朔","铄","妁","槊","蒴","搠"
},
shui=
{
"说","水","税","谁","睡"
},
yun=
{
"员","运","均","云","允","孕","蕴","韵","酝","耘","晕","匀","芸","陨","纭","熨","郧","恽","韫","郓","氲","殒","愠","昀","狁"
},
er=
{
"而","二","尔","儿","耳","迩","饵","洱","贰","铒","珥","佴","鸸","鲕"
},
wu=
{
"务","物","无","五","武","午","吴","舞","伍","污","乌","误","亡","恶","屋","晤","悟","吾","雾","芜","梧","勿","巫","侮","坞","毋","诬","呜","钨","邬","捂","鹜","兀","婺","妩","於","戊","鹉","浯","蜈","唔","骛","仵","焐","芴","鋈","庑","鼯","牾","怃","圬","忤","痦","迕","杌","寤","阢"
},
dian=
{
"电","点","店","典","奠","甸","碘","淀","殿","垫","颠","滇","癫","巅","惦","掂","癜","玷","佃","踮","靛","钿","簟","坫","阽"
},
wen=
{
"文","问","闻","稳","温","纹","吻","蚊","雯","紊","瘟","汶","刎","璺","阌"
},
ke=
{
"可","科","克","客","刻","课","颗","渴","壳","柯","棵","呵","坷","恪","苛","咳","磕","珂","稞","瞌","溘","轲","窠","嗑","疴","蝌","岢","颏","髁","缂","氪","骒","钶","锞"
},
zong=
{
"总","综","宗","纵","踪","棕","粽","鬃","偬","枞","腙"
},
xmjc=
{"零","镜","奇","二","四","七","水"},
gai=
{
"改","该","盖","概","溉","钙","丐","芥","赅","垓","陔","戤"
},
san=
{
"三","散","伞","叁","糁","馓","毵"
},
hao=
{
"好","号","毫","豪","耗","浩","郝","皓","昊","镐","蒿","壕","灏","嚎","濠","蚝","貉","颢","嗥","薅","嚆"
},
si=
{
"司","四","思","斯","食","私","死","似","丝","饲","寺","厕","肆","撕","泗","伺","嗣","祀","厮","驷","嘶","锶","俟","巳","蛳","咝","耜","笥","鸶","缌","澌","姒","汜","厶","兕"
},
cong=
{
"从","丛","匆","聪","葱","囱","琮","淙","骢","苁","璁"
},
ping=
{
"平","评","凭","瓶","冯","屏","萍","苹","乒","坪","枰","娉","俜","鲆"
},
dang=
{
"当","党","档","荡","挡","宕","砀","裆","凼","菪","谠"
},
tian=
{
"天","田","添","填","甜","恬","腆","佃","舔","阗","忝","殄","畋","掭"
},
nei=
{
"内","那","哪","馁"
},
xiao=
{
"小","效","销","消","校","晓","笑","肖","削","孝","萧","潇","硝","宵","啸","嚣","霄","淆","哮","筱","逍","箫","骁","枭","哓","绡","蛸","崤","枵","魈"
},
mu=
{
"目","模","木","亩","幕","母","牧","穆","姆","墓","慕","牟","牡","募","睦","沐","暮","拇","姥","钼","苜","仫","毪","坶"
},
hai=
{
"海","还","害","孩","亥","咳","骸","嘿","骇","氦","嗨","胲","醢"
},
suo=
{
"所","索","缩","锁","莎","梭","琐","嗦","唆","唢","娑","蓑","羧","挲","桫","嗍","睃"
},
ru=
{
"入","如","乳","儒","辱","汝","茹","褥","孺","濡","蠕","嚅","缛","溽","铷","洳","薷","襦","颥","蓐"
},
liang=
{
"量","两","粮","良","辆","亮","梁","凉","谅","粱","晾","靓","踉","莨","椋","魉","墚"
},
du=
{
"度","都","独","督","读","顿","毒","渡","杜","堵","赌","睹","肚","镀","渎","笃","嘟","犊","妒","牍","蠹","椟","黩","芏","髑"
},
bei=
{
"北","被","备","倍","背","杯","贝","辈","悲","碑","臂","卑","悖","惫","蓓","陂","钡","狈","呗","焙","碚","褙","埤","鞴","孛","鹎","萆","邶","鐾"
},
huan=
{
"还","环","换","欢","患","缓","唤","焕","幻","痪","桓","寰","涣","宦","洹","浣","豢","奂","郇","圜","獾","鲩","鬟","萑","逭","漶","锾","缳","擐"
},
dou=
{
"都","斗","读","豆","抖","兜","陡","逗","窦","蚪","痘","蔸","篼"
},
shu=
{
"术","书","数","属","树","输","束","述","署","熟","殊","蔬","舒","疏","鼠","淑","叔","暑","枢","墅","俞","曙","抒","竖","蜀","薯","梳","戍","恕","孰","沭","赎","庶","漱","塾","倏","澍","纾","姝","菽","黍","腧","秫","毹","殳","摅","丨"
},
ming=
{
"明","名","命","盟","鸣","铭","冥","茗","溟","酩","瞑","螟","暝"
},
zhao=
{
"着","照","招","找","召","朝","赵","兆","昭","肇","罩","钊","沼","嘲","爪","诏","啁","棹","笊"
},
zhuo=
{
"着","著","缴","桌","卓","捉","琢","灼","浊","酌","拙","茁","涿","镯","啄","濯","焯","倬","擢","斫","棹","诼","浞","禚"
},
ci=
{
"次","此","词","辞","刺","瓷","磁","兹","慈","茨","赐","祠","伺","雌","疵","鹚","糍","呲","茈"
},
jiang=
{
"将","强","江","奖","讲","降","疆","蒋","姜","浆","匠","酱","僵","桨","绛","缰","犟","豇","礓","洚","茳","糨","耩"
},
qiang=
{
"将","强","抢","墙","枪","腔","锵","呛","羌","蔷","襁","羟","跄","樯","戕","嫱","戗","炝","镪","锖","蜣"
},
zeng=
{
"增","曾","综","赠","憎","锃","甑","罾","缯"
},
xiang=
{
"向","项","相","想","乡","象","响","香","降","像","享","箱","祥","湘","详","橡","巷","翔","襄","厢","镶","飨","饷","缃","骧","芗","庠","鲞","葙","蟓"
},
ying=
{
"应","营","影","英","迎","映","硬","盈","赢","颖","婴","鹰","荧","莹","樱","瑛","蝇","萦","莺","颍","膺","缨","瀛","楹","罂","荥","萤","鹦","滢","蓥","郢","茔","嘤","璎","嬴","瘿","媵","撄","潆"
},
mei=
{
"美","没","每","煤","梅","媒","枚","妹","眉","魅","霉","谜","昧","媚","玫","酶","镁","湄","寐","莓","袂","楣","糜","嵋","镅","浼","猸","鹛"
},
gui=
{
"规","贵","归","轨","桂","柜","圭","鬼","硅","瑰","跪","龟","闺","诡","癸","炔","鳜","桧","皈","鲑","刽","晷","傀","妫","炅","庋","簋","刿","宄","匦"
},
xie=
{
"些","解","协","写","血","叶","谢","械","鞋","胁","斜","携","懈","契","卸","谐","泄","蟹","邪","歇","泻","屑","挟","燮","榭","蝎","撷","偕","亵","楔","颉","缬","邂","瀣","勰","榍","薤","绁","渫","廨","獬","躞"
},
biao=
{
"表","标","彪","勺","镖","裱","膘","飙","镳","婊","骠","飑","杓","髟","鳔","瘭"
},
xi=
{
"系","西","席","息","希","习","吸","喜","细","析","戏","洗","悉","锡","溪","惜","稀","袭","夕","晰","昔","牺","腊","烯","熙","媳","栖","膝","隙","犀","蹊","硒","兮","熄","曦","禧","茜","嬉","玺","奚","汐","徙","羲","铣","淅","嘻","歙","熹","矽","蟋","郗","唏","皙","隰","樨","浠","蜥","檄","翕","阋","舾","屣","葸","螅","粞","觋","欷","僖","醯","鼷","裼","穸","饩","舄","禊","菥","蓰"
},
ban=
{
"办","版","半","班","般","板","颁","伴","搬","斑","扮","拌","扳","瓣","坂","阪","绊","钣","瘢","舨","癍"
},
jiao=
{
"教","交","较","校","角","觉","叫","脚","缴","胶","轿","郊","焦","骄","浇","椒","礁","佼","娇","矫","搅","绞","酵","剿","嚼","饺","窖","跤","蛟","侥","狡","姣","皎","茭","峤","铰","醮","鲛","湫","徼","鹪","僬","噍","艽","挢","敫"
},
tiao=
{
"条","调","挑","跳","迢","眺","苕","窕","笤","佻","粜","髫","祧","龆","蜩","鲦"
},
zui=
{
"最","罪","堆","嘴","醉","咀","蕞"
},
te=
{
"特","忑","忒","铽","慝"
},
shou=
{
"收","手","受","首","售","授","守","熟","寿","瘦","兽","狩","绶","艏"
},
bing=
{
"并","病","兵","冰","屏","饼","炳","秉","丙","摒","柄","槟","禀","邴"
},
an=
{
"厂","广","安","案","按","岸","暗","鞍","氨","俺","胺","铵","谙","庵","黯","鹌","桉","埯","犴","揞"
},
kou=
{
"口","扣","寇","叩","抠","蔻","芤","眍","筘"
},
diao=
{
"调","掉","雕","鸟","吊","钓","刁","貂","凋","碉","鲷","叼","铫","铞"
},
zu=
{
"组","族","足","祖","租","阻","卒","俎","诅","镞","菹"
},
lu=
{
"路","率","律","旅","六","陆","录","绿","虑","露","鲁","卢","炉","履","吕","铝","屡","鹿","禄","赂","芦","庐","碌","氯","缕","滤","麓","侣","颅","驴","泸","卤","潞","鹭","辘","榈","虏","璐","漉","噜","闾","褛","戮","鲈","掳","橹","轳","逯","渌","蓼","撸","鸬","栌","氇","胪","镥","簏","膂","舻","辂","稆","垆"
},
guang=
{
"广","光","逛","犷","胱","咣","桄"
},
bi=
{
"比","必","币","笔","毕","秘","避","闭","辟","壁","弊","彼","逼","碧","鼻","臂","蔽","拂","泌","璧","庇","痹","毙","弼","匕","鄙","陛","裨","贲","敝","蓖","吡","篦","俾","铋","毖","筚","荸","薜","婢","哔","跸","埤","濞","秕","荜","愎","睥","妣","芘","箅","庳","髀","畀","滗","狴","萆","嬖","襞","舭"
},
tou=
{
"投","头","透","偷","钭","骰"
},
jue=
{
"决","绝","角","觉","脚","掘","崛","诀","獗","抉","爵","嚼","倔","厥","蕨","攫","珏","矍","蹶","谲","镢","嗟","噱","桷","噘","撅","橛","孓","觖","劂","爝"
},
nan=
{
"南","难","男","楠","喃","囡","赧","腩","囝","蝻"
},
na=
{
"南","那","纳","拿","呢","哪","娜","钠","呐","捺","衲","镎","肭"
},
ling=
{
"领","令","另","零","灵","龄","陵","岭","凌","玲","铃","菱","棱","伶","拎","羚","苓","聆","翎","泠","瓴","囹","绫","呤","棂","蛉","酃","鲮","柃"
},
qing=
{
"情","青","清","请","亲","轻","庆","倾","顷","卿","晴","氢","擎","氰","罄","磬","蜻","箐","鲭","綮","苘","黥","圊","檠","謦"
},
shan=
{
"山","单","善","陕","闪","衫","擅","汕","扇","杉","珊","禅","删","膳","缮","赡","鄯","栅","煽","姗","跚","鳝","嬗","潸","讪","舢","苫","疝","掸","膻","钐","剡","蟮","芟","埏","骟"
},
che=
{
"车","彻","撤","尺","扯","澈","掣","坼","砗"
},
ju=
{
"车","局","据","具","举","居","剧","巨","聚","距","句","拒","俱","柜","菊","拘","炬","桔","惧","矩","鞠","驹","锯","踞","咀","瞿","枸","掬","沮","莒","橘","飓","疽","钜","趄","踽","遽","琚","龃","椐","苣","裾","榘","狙","倨","榉","苴","讵","雎","锔","窭","鞫","犋","屦","醵"
},
ran=
{
"然","染","燃","冉","苒","髯","蚺"
},
yin=
{
"因","引","银","印","音","烟","饮","阴","隐","姻","殷","淫","尹","荫","吟","瘾","寅","茵","圻","垠","鄞","湮","蚓","氤","胤","龈","窨","喑","铟","洇","狺","夤","吲","霪","茚","堙"
},
ba=
{
"把","八","巴","拔","吧","坝","爸","霸","罢","芭","跋","扒","叭","靶","疤","笆","耙","鲅","粑","岜","灞","钯","捌","菝","魃","茇"
},
chi=
{
"持","吃","池","迟","赤","驰","尺","斥","齿","翅","匙","痴","耻","炽","侈","弛","叱","啻","坻","嗤","墀","哧","茌","豉","敕","笞","饬","踟","蚩","媸","魑","篪","褫","彳","鸱","螭","瘛","眵","傺"
},
dan=
{
"但","单","石","担","丹","胆","旦","弹","蛋","淡","诞","氮","郸","耽","殚","惮","儋","眈","疸","澹","掸","啖","箪","聃","萏","瘅","赕"
},
cun=
{
"村","存","寸","蹲","忖","皴"
},
qiu=
{
"求","球","秋","丘","邱","仇","酋","裘","龟","囚","遒","鳅","虬","蚯","泅","楸","湫","犰","逑","巯","俅","蝤","赇","鼽","糗"
},
fu=
{
"府","服","副","负","富","复","福","夫","妇","幅","付","扶","父","符","附","腐","赴","佛","浮","覆","辅","傅","伏","抚","赋","辐","腹","弗","肤","阜","袱","缚","甫","氟","斧","孚","敷","俯","拂","俘","咐","腑","孵","芙","涪","釜","脯","茯","馥","绂","讣","呋","罘","麸","蝠","匐","芾","蜉","跗","凫","滏","蝮","驸","绋","蚨","砩","桴","赙","菔","趺","苻","拊","鲋","怫","稃","郛","莩","幞","祓","艴","黻","黼","鳆"
},
yan=
{
"研","严","验","演","言","眼","烟","沿","延","盐","炎","燕","岩","宴","艳","颜","殷","彦","掩","淹","阎","衍","铅","雁","咽","厌","焰","堰","砚","唁","焉","晏","檐","蜒","奄","俨","腌","妍","谚","兖","筵","焱","偃","闫","嫣","鄢","湮","赝","胭","琰","滟","阉","魇","酽","郾","恹","崦","芫","阏","剡","鼹","菸","餍","谳","厣","罨","阽"
},
jun=
{
"军","均","俊","君","峻","菌","竣","钧","骏","龟","浚","郡","筠","皲","麇","捃"
},
yo=
{
"育","哟","唷"
},
gan=
{
"干","感","赶","敢","甘","肝","杆","赣","乾","柑","尴","竿","秆","橄","矸","淦","苷","擀","酐","绀","泔","坩","旰","疳","澉"
},
tuan=
{
"团","湍","疃","抟","彖"
},
zao=
{
"造","早","遭","枣","噪","灶","燥","糟","凿","躁","藻","皂","澡","蚤","唣"
},
lian=
{
"联","连","练","廉","炼","脸","莲","恋","链","帘","怜","涟","敛","琏","镰","濂","楝","鲢","殓","潋","裢","裣","臁","奁","蠊","蔹"
},
zhuan=
{
"专","转","传","赚","砖","撰","篆","沌","馔","啭","颛"
},
shao=
{
"少","绍","召","烧","稍","邵","哨","韶","捎","勺","梢","鞘","芍","苕","劭","艄","筲","杓","蛸","潲"
},
fei=
{
"费","非","飞","肥","废","菲","肺","啡","沸","匪","斐","蜚","妃","诽","扉","翡","霏","吠","绯","腓","痱","芾","淝","悱","狒","榧","鲱","篚","镄"
},
shen=
{
"深","参","身","神","什","审","申","甚","沈","伸","慎","渗","肾","绅","莘","呻","婶","娠","砷","蜃","哂","椹","葚","渖","诜","谂","矧","胂"
},
geng=
{
"更","耕","颈","庚","耿","梗","埂","羹","哽","赓","绠","鲠"
},
kan=
{
"看","刊","勘","堪","坎","砍","侃","嵌","槛","瞰","阚","龛","戡","莰"
},
tai=
{
"台","太","态","泰","抬","胎","汰","钛","苔","薹","肽","跆","邰","鲐","呔","酞","骀","炱"
},
yang=
{
"样","养","央","阳","洋","扬","杨","羊","氧","仰","秧","痒","漾","疡","泱","殃","恙","鸯","徉","佯","怏","炀","烊","鞅","蛘"
},
lao=
{
"老","劳","落","络","牢","捞","涝","烙","姥","佬","崂","唠","酪","潦","痨","醪","铑","铹","栳","耢"
},
liu=
{
"流","刘","六","留","陆","柳","瘤","硫","溜","碌","浏","榴","琉","馏","遛","鎏","骝","绺","镏","旒","熘","鹨","锍"
},
hen=
{
"很","狠","恨","痕"
},
gei=
{
"给"
},
chuang=
{
"创","床","窗","闯","幢","疮","怆"
},
lun=
{
"论","轮","伦","仑","纶","沦","抡","囵"
},
bie=
{
"别","鳖","憋","瘪","蹩"
},
bian=
{
"变","便","边","编","遍","辩","鞭","辨","贬","匾","扁","卞","汴","辫","飚","砭","苄","蝙","鳊","弁","窆","笾","煸","褊","碥","忭","缏"
},
feng=
{
"风","丰","封","峰","奉","凤","锋","冯","逢","缝","蜂","枫","疯","讽","烽","俸","沣","酆","砜","葑","唪"
},
pi=
{
"批","否","皮","坏","辟","啤","匹","披","疲","僻","毗","坯","脾","譬","劈","媲","屁","琵","邳","裨","痞","癖","陂","丕","枇","噼","霹","吡","纰","砒","铍","淠","郫","埤","睥","芘","蚍","圮","鼙","罴","蜱","疋","貔","仳","庀","擗","甓","陴"
},
cha=
{
"查","察","差","茶","插","叉","刹","茬","楂","岔","诧","碴","嚓","喳","姹","杈","汊","衩","搽","槎","镲","檫","馇","锸","猹"
},
zha=
{
"查","扎","炸","诈","轧","闸","渣","蜡","咋","乍","榨","楂","札","栅","眨","咤","柞","喳","喋","铡","蚱","吒","砟","揸","痄","哳","齄"
},
lin=
{
"林","临","邻","赁","琳","磷","淋","麟","霖","鳞","凛","遴","蔺","吝","粼","嶙","躏","廪","檩","啉","辚","膦","瞵","懔"
},
zhuai=
{
"转","拽","曳"
},
huai=
{
"划","怀","坏","淮","徊","槐","踝"
},
zhun=
{
"准","屯","谆","肫","窀"
},
xu=
{
"需","许","续","须","序","徐","蓄","畜","虚","吁","绪","叙","旭","恤","墟","栩","絮","圩","婿","戌","胥","嘘","浒","煦","酗","诩","盱","蓿","溆","洫","顼","勖","糈","砉","醑"
},
chuan=
{
"传","川","船","穿","串","喘","椽","舛","钏","遄","氚","巛","舡"
},
gou=
{
"构","购","够","句","沟","狗","钩","勾","苟","垢","枸","篝","佝","媾","诟","岣","彀","缑","笱","鞲","觏","遘"
},
bai=
{
"百","白","败","摆","伯","拜","柏","佰","掰","捭","稗"
},
cai=
{
"才","采","财","材","菜","彩","裁","蔡","猜","踩","睬"
},
can=
{
"参","残","餐","灿","惨","蚕","璨","惭","粲","孱","骖","黪"
},
cen=
{
"参","岑","涔"
},
zhen=
{
"镇","真","针","圳","振","震","珍","阵","诊","侦","臻","贞","枕","桢","赈","祯","甄","斟","缜","箴","疹","砧","榛","鸩","轸","稹","溱","蓁","胗","椹","朕","畛","浈"
},
tui=
{
"推","退","腿","褪","颓","蜕","忒","煺"
},
sai=
{
"思","赛","塞","腮","噻","鳃"
},
zou=
{
"走","邹","奏","揍","诹","驺","陬","鄹","鲰"
},
zhuang=
{
"装","状","庄","壮","撞","妆","幢","桩","奘","僮"
},
ze=
{
"责","则","泽","择","侧","咋","啧","仄","箦","赜","笮","舴","昃","迮","帻"
},
zhou=
{
"州","周","洲","舟","骤","轴","昼","宙","粥","皱","肘","咒","帚","胄","绉","纣","妯","啁","诌","繇","碡","籀","酎","荮"
},
que=
{
"确","却","缺","雀","鹊","阙","瘸","榷","炔","阕","悫"
},
mao=
{
"贸","毛","矛","冒","貌","茂","茅","帽","猫","髦","锚","懋","袤","牦","卯","铆","耄","峁","瑁","蟊","茆","旄","泖","昴","瞀"
},
fan=
{
"反","范","犯","繁","饭","泛","翻","凡","返","番","贩","烦","帆","樊","藩","矾","梵","蕃","钒","幡","畈","蘩","蹯","燔"
},
xuan=
{
"选","宣","券","旋","悬","轩","喧","玄","绚","渲","璇","炫","萱","癣","漩","眩","暄","煊","铉","楦","泫","谖","痃","碹","揎","镟","儇"
},
ya=
{
"亚","压","雅","牙","押","匹","鸭","呀","涯","崖","芽","哑","讶","鸦","娅","衙","丫","蚜","垭","伢","氩","桠","琊","揠","睚","痖","迓","岈","砑"
},
me=
{
"么","麽"
},
ma=
{
"么","马","吗","摩","麻","码","妈","玛","嘛","骂","抹","蚂","唛","蟆","犸","杩","嬷"
},
wang=
{
"王","望","往","网","忘","亡","旺","汪","芒","枉","妄","惘","罔","辋","魍","尢"
},
ce=
{
"策","测","册","侧","厕","恻"
},
nu=
{
"女","努","怒","奴","弩","钕","驽","衄","孥","胬","恧"
},
tan=
{
"谈","探","坦","摊","弹","炭","坛","滩","贪","叹","谭","潭","碳","毯","瘫","檀","痰","袒","坍","忐","昙","郯","澹","钽","锬","镡"
},
kuang=
{
"况","矿","框","狂","旷","眶","匡","筐","邝","圹","哐","贶","夼","诳","诓","纩"
},
se=
{
"色","塞","瑟","涩","啬","穑","铯"
},
shai=
{
"色","筛","晒"
},
tsmz=
{"中岛美雪","SYP","水镜四奇","零二七"},
lie=
{
"列","烈","劣","裂","猎","冽","咧","趔","洌","鬣","埒","捩","躐"
},
gang=
{
"港","钢","刚","岗","纲","冈","杠","缸","扛","肛","罡","戆","筻"
},
kuan=
{
"款","宽","髋"
},
la=
{
"拉","落","蓝","垃","腊","啦","辣","蜡","喇","剌","旯","砬","邋","瘌"
},
gu=
{
"股","古","顾","故","固","鼓","骨","估","谷","贾","姑","孤","雇","辜","菇","沽","咕","呱","锢","钴","鹄","箍","汩","梏","痼","崮","轱","鸪","牯","蛊","诂","毂","鹘","菰","罟","嘏","臌","觚","瞽","蛄","酤","牿","鲴"
},
gen=
{
"根","跟","亘","艮","哏","茛"
},
tu=
{
"土","突","图","途","徒","涂","吐","屠","兔","秃","凸","荼","钍","菟","堍","酴"
},
qun=
{
"群","裙","逡"
},
su=
{
"速","素","苏","诉","缩","塑","肃","俗","宿","粟","溯","酥","夙","愫","簌","稣","僳","谡","涑","蔌","嗉","觫"
},
lei=
{
"类","累","雷","勒","泪","蕾","垒","磊","擂","镭","肋","羸","耒","儡","嫘","缧","酹","嘞","诔","檑"
},
xun=
{
"讯","训","迅","寻","询","循","旬","巡","汛","勋","逊","熏","徇","浚","殉","驯","鲟","荤","薰","荀","浔","洵","峋","埙","巽","郇","醺","恂","窨","蕈","曛","獯"
},
zhua=
{
"抓","挝"
},
re=
{
"热","若","惹"
},
mi=
{
"米","密","秘","迷","弥","蜜","谜","觅","靡","泌","眯","麋","猕","谧","咪","糜","宓","汨","醚","嘧","弭","脒","幂","祢","縻","蘼","芈","糸","敉"
},
pei=
{
"配","培","赔","佩","陪","沛","裴","胚","霈","旆","帔","呸","醅","辔","锫"
},
kao=
{
"考","靠","烤","拷","铐","栲","尻","犒"
},
duan=
{
"断","段","短","端","锻","缎","煅","椴","簖"
},
luo=
{
"落","罗","络","洛","逻","螺","锣","骆","萝","裸","漯","烙","摞","骡","咯","箩","珞","捋","荦","硌","雒","椤","镙","瘰","泺","脶","猡","倮","蠃"
},
e=
{
"额","俄","恶","鹅","遏","鄂","厄","饿","峨","扼","娥","鳄","蛾","噩","愕","讹","锷","垩","婀","鹗","萼","谔","莪","腭","锇","颚","呃","屙","苊","轭"
},
shuang=
{
"双","爽","霜","孀","泷"
},
rang=
{
"让","壤","攘","嚷","瓤","穰","禳"
},
qie=
{
"切","且","窃","茄","砌","锲","怯","伽","惬","妾","挈","郄","箧","慊"
},
pian=
{
"便","片","篇","偏","骗","翩","扁","骈","胼","蹁","谝","犏","缏"
},
kong=
{
"空","控","孔","恐","倥","崆","箜"
},
ni=
{
"你","尼","呢","泥","拟","尿","逆","倪","妮","腻","匿","霓","溺","旎","昵","坭","铌","鲵","伲","怩","睨","祢","猊","慝"
},
ceng=
{
"层","曾","蹭"
},
huang=
{
"黄","荒","煌","皇","凰","慌","晃","潢","谎","惶","簧","璜","恍","幌","湟","蝗","磺","隍","徨","遑","肓","篁","鳇","蟥","癀"
},
suan=
{
"算","酸","蒜","狻"
},
po=
{
"破","繁","坡","迫","颇","朴","泊","婆","泼","魄","粕","鄱","珀","陂","钹","叵","笸","泺","皤","钋","钷","攴"
},
tie=
{
"铁","贴","帖","餮","萜"
},
man=
{
"满","慢","曼","漫","蔓","瞒","蛮","鳗","馒","幔","谩","螨","熳","缦","镘","颟","墁","鞔"
},
ai=
{
"爱","埃","艾","碍","癌","呆","哀","挨","矮","隘","蔼","唉","皑","哎","霭","捱","暧","嫒","嗳","瑷","嗌","锿","砹"
},
rong=
{
"容","荣","融","绒","溶","蓉","熔","戎","榕","茸","冗","嵘","肜","狨","蝾"
},
chen=
{
"称","陈","沈","沉","晨","琛","臣","尘","辰","衬","趁","忱","郴","宸","谌","碜","嗔","抻","榇","伧","谶","龀"
},
pai=
{
"牌","排","派","拍","迫","徘","湃","俳","哌","蒎"
},
cu=
{
"促","粗","簇","醋","卒","蹴","猝","蹙","酢","蔟","殂","徂"
},
kun=
{
"困","昆","坤","捆","琨","锟","鲲","醌","髡","悃","阃"
},
chao=
{
"超","朝","潮","炒","钞","抄","巢","吵","剿","绰","嘲","晁","焯","耖","怊"
},
sui=
{
"随","岁","虽","碎","尿","隧","遂","髓","穗","绥","隋","邃","睢","祟","濉","燧","谇","眭","荽"
},
chun=
{
"春","纯","醇","淳","唇","椿","蠢","鹑","莼","蝽"
},
kuo=
{
"适","扩","括","阔","廓","栝","蛞"
},
hong=
{
"红","宏","洪","轰","虹","鸿","弘","哄","烘","泓","訇","蕻","闳","讧","荭","黉","薨"
},
mai=
{
"买","卖","麦","迈","脉","埋","霾","荬","劢"
},
xiu=
{
"修","秀","休","宿","袖","绣","臭","朽","锈","羞","嗅","岫","溴","庥","馐","咻","髹","鸺","貅"
},
qin=
{
"亲","勤","侵","秦","钦","琴","禽","芹","沁","寝","擒","覃","噙","矜","嗪","揿","溱","芩","衾","廑","锓","吣","檎","螓"
},
cuo=
{
"措","错","磋","挫","搓","撮","蹉","锉","厝","嵯","痤","矬","瘥","脞","鹾"
},
long=
{
"龙","隆","弄","垄","笼","拢","聋","陇","胧","珑","窿","茏","咙","砻","垅","泷","栊","癃"
},
dun=
{
"吨","顿","盾","敦","蹲","墩","囤","沌","钝","炖","盹","遁","趸","砘","镦","礅"
},
kang=
{
"康","抗","扛","慷","炕","亢","糠","伉","钪","闶"
},
pu=
{
"普","暴","铺","浦","朴","堡","葡","谱","埔","扑","仆","蒲","曝","瀑","溥","莆","圃","璞","濮","菩","脯","蹼","匍","噗","氆","镨","镤"
},
reng=
{
"仍","扔"
},
bo=
{
"波","博","播","勃","拨","薄","伯","玻","搏","柏","泊","舶","剥","渤","魄","卜","驳","脖","膊","簸","菠","礴","箔","掰","铂","亳","钵","帛","擘","饽","跛","钹","趵","檗","啵","鹁","孛","踣"
},
lan=
{
"兰","览","蓝","篮","栏","岚","烂","滥","缆","揽","澜","拦","懒","榄","斓","婪","阑","褴","罱","谰","镧","漤"
},
piao=
{
"票","朴","漂","飘","嫖","瓢","剽","缥","殍","瞟","骠","嘌","莩","螵"
},
sun=
{
"损","孙","笋","荪","榫","隼","狲","飧"
},
ning=
{
"宁","凝","苎","拧","泞","柠","咛","狞","佞","聍","甯"
},
ku=
{
"苦","库","哭","酷","裤","枯","窟","骷","堀","绔","刳","喾"
},
nao=
{
"努","脑","闹","恼","挠","瑙","淖","孬","垴","铙","呶","硇","猱","蛲"
},
tao=
{
"套","讨","陶","涛","逃","桃","萄","淘","掏","滔","韬","叨","焘","洮","啕","绦","饕","鼗"
},
song=
{
"送","松","宋","讼","颂","耸","诵","嵩","淞","怂","悚","崧","凇","忪","竦","菘"
},
mou=
{
"某","谋","牟","缪","眸","哞","蝥","鍪","蛑","侔"
},
pa=
{
"派","怕","帕","爬","扒","趴","琶","啪","葩","耙","杷","钯","筢"
},
lue=
{
"略","掠","锊"
},
hei=
{
"黑","嘿"
},
chai=
{
"差","拆","柴","钗","豺","侪","虿","瘥"
},
a=
{
"阿","啊","呵","腌","嗄","吖","锕"
},
ting=
{
"听","庭","停","厅","廷","挺","亭","艇","婷","汀","铤","烃","霆","町","蜓","葶","梃","莛"
},
sha=
{
"沙","厦","杀","纱","砂","啥","莎","刹","杉","傻","煞","鲨","霎","嗄","痧","裟","挲","铩","唼","歃"
},
tuo=
{
"托","脱","拓","拖","妥","魄","驼","陀","沱","鸵","舵","驮","唾","椭","坨","佗","砣","跎","庹","柁","橐","乇","铊","酡","鼍","箨","柝"
},
pan=
{
"判","盘","番","潘","攀","盼","拚","畔","胖","叛","蹒","磐","爿","蟠","泮","袢","襻"
},
gua=
{
"括","挂","瓜","刮","寡","卦","呱","褂","剐","胍","诖","鸹","栝"
},
lou=
{
"楼","露","漏","陋","娄","搂","篓","喽","镂","偻","瘘","髅","耧","蝼","嵝","蒌"
},
han=
{
"汉","韩","含","旱","寒","汗","涵","函","喊","憾","罕","焊","翰","邯","撼","瀚","憨","捍","酣","悍","阚","鼾","邗","颔","蚶","晗","菡","顸","焓","撖"
},
cao=
{
"草","操","曹","槽","糙","嘈","漕","螬","艚"
},
cang=
{
"藏","仓","苍","沧","舱"
},
zang=
{
"藏","脏","葬","赃","臧","奘","驵"
},
shun=
{
"顺","瞬","舜","吮"
},
ka=
{
"卡","喀","咖","咔","咯","佧","胩"
},
qia=
{
"卡","恰","洽","伽","掐","髂","袷","葜"
},
qiao=
{
"桥","乔","侨","巧","悄","敲","俏","壳","雀","蕉","瞧","翘","窍","峭","锹","撬","荞","跷","樵","憔","鞘","橇","峤","诮","谯","愀","鞒","硗","劁","缲"
},
fou=
{
"否","缶"
},
bang=
{
"帮","邦","榜","棒","膀","镑","绑","傍","磅","蚌","谤","梆","浜","蒡"
},
ao=
{
"奥","澳","傲","熬","凹","嚣","鳌","敖","遨","鏖","袄","坳","翱","嗷","拗","懊","岙","螯","骜","獒","鏊","媪","廒","聱"
},
zhai=
{
"债","择","宅","寨","侧","摘","窄","斋","祭","翟","砦","瘵"
},
zhui=
{
"追","坠","缀","椎","锥","赘","惴","骓","缒"
},
chou=
{
"筹","抽","绸","酬","愁","丑","臭","仇","畴","稠","瞅","踌","惆","俦","瘳","雠","帱"
},
zen=
{
"怎","谮"
},
kui=
{
"亏","奎","愧","魁","馈","溃","匮","葵","窥","盔","逵","睽","馗","聩","喟","夔","篑","岿","喹","揆","隗","傀","暌","跬","蒉","愦","悝","蝰"
},
ha=
{
"哈","虾","蛤","铪"
},
za=
{
"杂","扎","咱","砸","咋","匝","咂"
},
luan=
{
"乱","卵","滦","峦","鸾","栾","銮","挛","孪","脔","娈"
},
xiong=
{
"雄","兄","熊","胸","凶","匈","汹","芎"
},
ne=
{
"呢","哪","呐","讷"
},
zan=
{
"赞","暂","咱","攒","昝","簪","糌","瓒","錾","趱","拶"
},
rui=
{
"瑞","锐","睿","芮","蕊","蕤","蚋","枘"
},
tang=
{
"堂","唐","糖","汤","塘","躺","趟","倘","棠","烫","淌","膛","搪","镗","傥","螳","溏","帑","羰","樘","醣","螗","耥","铴","瑭"
},
run=
{
"润","闰"
},
kua=
{
"跨","夸","垮","挎","胯","侉"
},
wa=
{
"瓦","挖","娃","洼","袜","蛙","凹","哇","佤","娲","腽"
},
meng=
{
"蒙","盟","梦","猛","孟","萌","氓","朦","锰","檬","勐","懵","蜢","虻","蠓","艨","甍","艋","瞢","礞"
},
bin=
{
"宾","滨","斌","彬","濒","殡","缤","鬓","槟","摈","膑","玢","镔","豳","髌","傧"
},
leng=
{
"冷","愣","棱","楞","塄"
},
peng=
{
"鹏","朋","彭","膨","蓬","碰","棚","捧","烹","篷","澎","抨","硼","怦","砰","嘭","蟛","堋"
},
niu=
{
"牛","纽","扭","钮","拗","妞","忸","狃"
},
rou=
{
"肉","柔","揉","糅","鞣","蹂"
},
ruo=
{
"若","弱","偌"
},
sen=
{
"森"
},
sa=
{
"萨","洒","撒","飒","卅","仨","挲","脎"
},
juan=
{
"卷","捐","俊","眷","娟","倦","绢","隽","镌","涓","鹃","鄄","蠲","狷","锩","桊"
},
pao=
{
"跑","炮","泡","抛","刨","袍","咆","疱","庖","狍","匏","脬"
},
ruan=
{
"软","阮","朊"
},
lang=
{
"浪","朗","郎","廊","狼","琅","榔","螂","阆","锒","莨","啷","蒗","稂"
},
zun=
{
"尊","遵","鳟","樽","撙"
},
ken=
{
"肯","垦","恳","啃","裉"
},
hun=
{
"婚","混","魂","浑","昏","荤","馄","诨","溷","阍"
},
en=
{
"恩","嗯","摁","蒽"
},
qiong=
{
"穷","琼","穹","邛","茕","筇","跫","蛩","銎"
},
rao=
{
"绕","扰","饶","娆","桡","荛"
},
mang=
{
"忙","盲","茫","芒","氓","莽","蟒","邙","硭","漭"
},
nuo=
{
"诺","挪","娜","糯","懦","傩","喏","搦","锘"
},
teng=
{
"腾","疼","藤","滕","誊"
},
nin=
{
"您"
},
miao=
{
"苗","秒","妙","描","庙","瞄","缪","渺","淼","藐","缈","邈","鹋","杪","眇","喵"
},
mie=
{
"灭","蔑","篾","乜","咩","蠛"
},
niang=
{
"娘"
},
nai=
{
"乃","奶","耐","奈","鼐","萘","氖","柰","艿"
},
sang=
{
"桑","丧","嗓","搡","颡","磉"
},
ca=
{
"拆","擦","嚓","礤"
},
sao=
{
"扫","骚","嫂","梢","缫","搔","瘙","臊","埽","缲","鳋"
},
zuan=
{
"钻","赚","纂","攥","缵","躜"
},
shua=
{
"刷","耍","唰"
},
gun=
{
"滚","棍","辊","衮","磙","鲧","绲"
},
guai=
{
"怪","拐","乖"
},
pang=
{
"旁","庞","乓","膀","胖","磅","螃","彷","滂","逄","耪"
},
nuan=
{
"暖"
},
shuai=
{
"衰","帅","摔","甩","蟀"
},
cui=
{
"衰","催","崔","脆","翠","萃","粹","摧","璀","瘁","悴","淬","啐","隹","毳","榱"
},
niao=
{
"鸟","尿","溺","袅","脲","茑","嬲"
},
die=
{
"跌","叠","蝶","迭","碟","爹","谍","牒","耋","喋","踮","堞","瓞","鲽","垤","揲","蹀"
},
pen=
{
"喷","盆","湓"
},
chui=
{
"吹","垂","锤","炊","椎","陲","槌","捶","棰"
},
ang=
{
"昂","盎","肮"
},
keng=
{
"坑","铿","吭"
},
tun=
{
"吞","屯","囤","褪","豚","臀","饨","暾","氽"
},
diu=
{
"丢","铥"
},
weng=
{
"翁","嗡","瓮","蓊","蕹"
},
sou=
{
"艘","搜","擞","嗽","嗖","叟","馊","薮","飕","嗾","溲","锼","螋","瞍"
},
ga=
{
"夹","嘎","尬","胳","噶","旮","尕","钆","尜"
},
lia=
{
"俩"
},
nen=
{
"嫩","恁"
},
nang=
{
"囊","馕","囔","曩","攮"
},
nie=
{
"聂","捏","涅","镍","孽","蘖","啮","蹑","嗫","臬","镊","颞","乜","陧"
},
beng=
{
"泵","崩","蚌","蹦","迸","绷","甭","嘣","甏"
},
cou=
{
"凑","辏","腠","楱"
},
pou=
{
"剖","掊","裒"
},
seng=
{
"僧"
},
nue=
{
"虐"
},
cuan=
{
"窜","攒","篡","蹿","撺","爨","汆","镩"
},
chuo=
{
"辍","绰","戳","啜","龊","踔"
},
chuai=
{
"揣","踹","啜","嘬","搋","膪"
},
jiong=
{
"窘","炯","迥","炅","扃"
},
shuan=
{
"栓","拴","涮","闩"
},
zei=
{
"贼"
},
pie=
{
"瞥","撇","苤","氕","丿"
},
miu=
{
"谬"
},
o=
{
"哦","噢","喔"
},
dia=
{
"嗲"
},
nou=
{
"耨"
},
ei=
{
"诶"
},
s=
{
"S"
},
y=
{
"Y"
},
p=
{
"P"
},
sz=
{
"1","2","3","4","5","6","7","8","9","0"
}
}

	local T2=T1[pinyin]
	if T2==nil then 			--如果输入的拼音无匹配项
		Cls()
		DrawStrBox(x,y,"查无此字，请重新输入",C_GOLD,24) 
		lib.ShowSurface(0)
		lib.Delay(2000)
		return ""
	end
	local page=0				--选字页面，初始当然是第一页了
	local str=""				--用于保存候选字符
	while true do
		str="";
		for i=1,9 do
			if(T2[i+9*page]==nil) then 
				break;
			else 
				str=str..i.."."..T2[i+9*page].." ";
			end
		end		
		ShowPinyin(x,y,word,pinyin,str)
	    local keypress=WaitKey();
        lib.Delay(100);
		if keypress==VK_DOWN and T2[9*(page+1)+1]~=nil then
			page=page+1;
		elseif keypress==VK_UP and page>0 then
			page=page-1;
		elseif keypress==27 then 
			return "";
		elseif keypress>48 and keypress<58 then
			return T2[page*9+keypress-48];
		end	
	end
end

function GetPinyin(x,y,word)--输入拼音
	local T3={"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	local T4={"０","１","２","３","４","５","６","７","８","９"}
	local str=""
	while true do
		ShowPinyin(x,y,word,str)
	    local keypress=WaitKey();
        lib.Delay(100);
		if keypress>96 and keypress<123 then
			str=str..T3[keypress-96]
		elseif keypress==8 then
			if string.len(str)==0 then word=string.sub(word,1,-3)
			else str=string.sub(str,1,-2)
			end
		elseif keypress>47 and keypress<58 then
			return-1,word..T4[keypress-47];
		elseif keypress==VK_RETURN and str=="" then
			return "finish";
		elseif keypress==VK_SPACE or keypress==VK_RETURN then
			return str,word;
		elseif keypress==VK_ESCAPE then
			return -1;
		end
	end
end

function GetPinyin1(x,y)--输入拼音
	local T3={"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	local T4={"0","1","2","3","4","5","6","7","8","9"}
	local str=""
	while true do
		ShowPinyin1(x,y,str)
	    local keypress=WaitKey();
        lib.Delay(100);
		if keypress>96 and keypress<123 then
			str=str..T3[keypress-96]
		elseif keypress==8 then
			str=string.sub(str,1,-2)
		elseif keypress>47 and keypress<58 then
			str=str..T4[keypress-47];
		elseif keypress==VK_SPACE  then
			str=str..' '
		elseif keypress==VK_RETURN then
			return str;
		--elseif keypress==VK_ESCAPE then
		--	return -1;
		end
	end
end

function ShowPinyin(x,y,str1,str2,str3)
	Cls()
	local size=24
	DrawBox(x,y+size,CC.ScreenW-x,y+5*size,C_ORANGE)
	if str3==nil then						--输入拼音状态
		DrawStrBox(x,y-size/2,"请输入(拼)",C_WHITE,size)
	else									--选字状态
		DrawStrBox(x,y-size/2,"请选择",C_WHITE,size)
		DrawString(x+15,y+size*3.5,str3,C_WHITE,size)
	end
	lib.DrawRect(x+10,y+size*3,CC.ScreenW-10-x,y+size*3+2,C_WHITE)
	DrawString(x+20,y+size*1.6,str1,C_RED,size)
	DrawString(x+20+size*string.len(str1)/2,y+size*1.6,str2,C_GOLD,size)
	lib.ShowSurface(0)
end

function ShowPinyin1(x,y,str2,str3)
	Cls()
	local size=24
	DrawBox(x,y+size,640-x,y+5*size,C_ORANGE)
	if str3==nil then						--输入拼音状态
		DrawStrBox(x,y-size/2,"请输入(拼)",C_WHITE,size)
	else									--选字状态
		DrawStrBox(x,y-size/2,"请选择",C_WHITE,size)
		DrawString(x+15,y+size*3.5,str3,C_WHITE,size)
	end
	lib.DrawRect(x+10,y+size*3,630-x,y+size*3+2,C_WHITE)
	--DrawString(x+20,y+size*1.6,str1,C_RED,size)
	DrawString(x+20,y+size*1.6,str2,C_GOLD,size)
	lib.ShowSurface(0)
end

function SelectWarMenu(x,y)
	local menu={};
	local num=0
	local warname={	'杀苗人凤','中阎基计','杀阎基','救苗人凤','单挑苗','千年人蔘','闯王宝藏','血刀老祖','明教分舵','战昆仑',
								'成崑奸计','战华山','战崆峒','弑杀成崑','波斯三使','光明圣火','杀狄云','闹崆峒','救庸医','闹崑仑',
								'夺倚天剑','峨嵋围攻','三丰指导','闯见性峰','斗定闲','斗泰山','斗天门','闯衡山','斗莫大','闯嵩山',
								'徐降天门','徐降定闲','徐降莫大','徐降左','杀林平之','令降定闲','令降莫大','令降左','再斗嵩山','再斗定闲',
								'再斗天门','再斗莫大','落花流水','斗丹青生','斗秃笔翁','斗黑白子','斗黄钟公','斗四友','救林平之','青城四秀',
								'斗余沧海','平之复仇','战李莫愁','帮田伯光','东方不败','葵花宝典','笑傲江湖','任与东方','凌霄城外','斗白万剑',
								'战雪山派','蜘蛛洞一','蜘蛛洞二','蜘蛛洞三','蜘蛛洞四','蜘蛛洞五','救神鵰','战老顽童','杀一灯','战欧阳克',
								'铁掌帮外','战裘千仞','再战铁掌','战七子','战金轮','战杨龙','挑战郭靖','挑欧阳克','蟒牯朱蛤','少林练功',
								'灭少林','少林群战','破打狗阵','丐帮帮主','丐帮四老','慕容奸计','杀丁春秋','救阿紫','战游坦之','闯鳄鱼潭',
								'斗岳老三','沙漠废墟','救李文秀','抢连城诀','闯神龙岛','斗洪教主','闯五毒教','找韦小宝','斗蓝凤凰','闯金轮寺',
								'战鸠摩智','战袁承志','大会斗白','大会斗段','大会斗冯','大会斗丁','大会斗裘','大会斗岳','大会斗萧','大会斗洪',
								'大会斗玄','大会斗鸠','大会斗任','大会斗洪','大会斗金','大会斗欧','大会斗周','大会斗王','大会斗张','大会斗黄',
								'大会斗唐','大会斗唐','大会斗唐','大会斗唐','大会斗唐','大会斗唐','大会斗唐','大会斗唐','日本忍者','日本剑客',
								'日本大名','日本战犯','战萧中慧','十大恶人','十大善人','战老顽童','战台湾','战萧半和','红花会一','红花会二',
								'红花会三','帮霍青桐','救文泰来','战张召重','战陈家洛','战朱长龄','张战昆仑','张战华山','张战崆峒','单挑空性',
								'单挑灭绝','火蟾','灭崆峒','灭华山','灭峨嵋','灭昆仑','战金花','战何红药','会两仪','战梅剑和',
								'救金龙帮','挑玉真子','斗五仙教','五仙教众','挑何铁手','斗穆人清','丁氏门人','关东四门','丁氏兄弟','张三李四',
								'龙木岛主','一战西毒','二战西毒','三战西毒','四战西毒','五战西毒','六战西毒','挑王重阳','杀欧阳克','渔人',
								'樵子','农夫','书生','抢射雕二','抢射雕三','抢射雕四','射雕中线','抢射雕一','战北丐','江南七怪',
								'救钟灵','四大恶人','聚贤庄一','聚贤庄二','聚贤庄三','聚贤庄四','聚贤庄五','少林挑游','少林挑慕','战游慕',
								'战游慕鸠','战霍都','战李秋水','遇林平之','挑令狐冲','挑成不忧','桃谷六仙','救华山派','抢刀谱','挑王元霸',
								'救向问天','战任我行','木人巷一','木人巷二','木人巷三','铜人巷一','铜人巷二','铜人巷三','救任盈盈','青城练功',
								'全真练功','七星剑谱','闯崆峒','少林箱子','足球队','战莫声谷','救李沅芷','迷宫','AI比试'}
	
	
	for i=1,229 do
	    local bh=i-1;
		menu[i]={bh..warname[i],nil,1};
		--lib.Debug(bh.."--"..warname[i])
		num=num+1
	end
    return ShowMenu(menu,num,15,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function SelectSceneMenu(x,y)
	local menu={};
	local num=0
	for i=1,200 do
	    local bh=i-1
		if JY.Scene[i]==nil then break end
		menu[i]={bh..JY.Scene[i-1]["名称"],nil,1};
		num=num+1		
	end
    return ShowMenu(menu,num,15,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function SelectFaceMenu(x,y)
	local menu={};
	local num=0
	
	for i=1,588 do 
		local r=JY.Person[i]["头像代号"]
		if r>num then num=r end
		if menu[r]==nil then
			menu[r]={JY.Person[i]["姓名"],nil,1};
		end
	end
	
	for i=1,num do
		if menu[i]==nil then menu[i]={'UNKNOW',nil,0} end
	end
	
    return ShowMenu(menu,num,15,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function migong(x,y)
	local mg={}
	--标记0,不通  1,通
	--已经访问,正要访问,还没访问
	for i=1,64 do
		mg[i]={}
		for j=1,64 do
			mg[i][j]=0
		end
	end
	mg[2][2]=1
	local data={[0]=2,{4,2},{2,4}}--{[0]=4,{34,32},{32,34},{30,32},{32,30}}
	
	local function ranselect()
		if data[0]==0 then return end
		local select
		if data[0]>1 then
			select=math.random(data[0])
		else 
			select=1 
		end
		local xy=data[select]
		mg[xy[1]][xy[2]]=1
		for i=select,data[0]-1 do
			data[i]=data[i+1]
		end
		data[data[0]]=nil
		data[0]=data[0]-1
		
		
		local function indata(nx,ny)
			for i=1,data[0] do
				if data[i]=={nx,ny} then
					return false
				end
			end
			return true
		end
		
			local function ff(x)
			if x==1 then
				if xy[1]-2>0 and mg[xy[1]-2][xy[2]]==1 then
					mg[xy[1]-1][xy[2]]=1
					return true
				end
			elseif x==2 then
				if xy[1]+2<65 and mg[xy[1]+2][xy[2]]==1 then
					mg[xy[1]+1][xy[2]]=1
					return true
				end
			elseif x==3 then
				if xy[2]-2>0 and mg[xy[1]][xy[2]-2]==1 then
					mg[xy[1]][xy[2]-1]=1
					return true
				end
			elseif x==4 then
				if xy[2]+2<65 and mg[xy[1]][xy[2]+2]==1 then
					mg[xy[1]][xy[2]+1]=1
					return true
				end
			end
			return false
		end	
		
		if mg[xy[1]-1][xy[2]]==0 and mg[xy[1]][xy[2]-1]==0 and mg[xy[1]][xy[2]+1]==0 and mg[xy[1]+1][xy[2]]==0 then
			local nn={[0]=4,1,2,3,4}
			local n1
			while nn[0]>0 do
				if nn[0]>1 then
					n1=math.random(nn[0])
				else
					n1=1
				end
				if ff(nn[n1]) then break end
				for i=n1,nn[0]-1 do
					nn[i]=nn[i+1]
				end
				nn[nn[0]]=nil
				nn[0]=nn[0]-1
			end
		end
		
		if xy[1]-2>1 and mg[xy[1]-2][xy[2]]==0 and indata(xy[1]-2,xy[2]) then
			data[0]=data[0]+1
			data[data[0]]={xy[1]-2,xy[2]}
			--mg[xy[1]-2][xy[2]]=1
		end
		if xy[2]-2>1 and mg[xy[1]][xy[2]-2]==0 and indata(xy[1],xy[2]-2) then
			data[0]=data[0]+1
			data[data[0]]={xy[1],xy[2]-2}
			--mg[xy[1]][xy[2]-2]=1
		end
		if xy[1]+2<64 and mg[xy[1]+2][xy[2]]==0 and indata(xy[1]+2,xy[2]) then
			data[0]=data[0]+1
			data[data[0]]={xy[1]+2,xy[2]}
			--mg[xy[1]+2][xy[2]]=1
		end
		if xy[2]+2<64 and mg[xy[1]][xy[2]+2]==0 and indata(xy[1],xy[2]+2) then
			data[0]=data[0]+1
			data[data[0]]={xy[1],xy[2]+2}
			--mg[xy[1]][xy[2]+2]=1
		end
		
		ranselect()
		--return num
	end
	
	ranselect()
	for i=1,64 do
		for j=1,64 do
			local pic
			if mg[i][j]==0 then 
				pic=2316
			else
				pic=-1
			end
			lib.SetS(JY.SubScene,i-1,j-1,0,140)
			lib.SetS(JY.SubScene,i-1,j-1,1,pic)
			--lib.SetWarMap(i-1,j-1,1,pic)
		end
	end
	local cx,cy
	cx=1+2*Rnd(31)
	cy=1+2*Rnd(31)
	cx,cy=migong2(cx,cy)
	JY.Base['人X1']=cx
	JY.Base['人Y1']=cy
	cx,cy=migong2(cx,cy)
	lib.SetS(JY.SubScene,cx,cy,1,5100)
end

function migong2(cx,cy)
	local data={}
	data[1]={
				num=1,
				x={cx},
				y={cy},
			}
	local mg={}
	for i=0,63 do
		mg[i]={}
		for j=0,63 do
			if SceneCanPass(i,j) then
				mg[i][j]=1
			else
				mg[i][j]=0
			end
		end
	end
	local function findnext(data,step)
		local n=0
		if data[step].num>0 then
			data[step+1]={}
			data[step+1].x={}
			data[step+1].y={}
		else
			return
		end
		for i=1,data[step].num do
			if data[step].x[i]<1 or data[step].x[i]>62 or data[step].y[i]<1 or data[step].y[i]>62 then
				break
			end
			if mg[data[step].x[i]+1][data[step].y[i]]==1 then
				mg[data[step].x[i]+1][data[step].y[i]]=step+1
				n=n+1
				data[step+1].x[n]=data[step].x[i]+1
				data[step+1].y[n]=data[step].y[i]
			end
			if mg[data[step].x[i]-1][data[step].y[i]]==1 then
				mg[data[step].x[i]-1][data[step].y[i]]=step+1
				n=n+1
				data[step+1].x[n]=data[step].x[i]-1
				data[step+1].y[n]=data[step].y[i]
			end
			if mg[data[step].x[i]][data[step].y[i]+1]==1 then
				mg[data[step].x[i]][data[step].y[i]+1]=step+1
				n=n+1
				data[step+1].x[n]=data[step].x[i]
				data[step+1].y[n]=data[step].y[i]+1
			end
			if mg[data[step].x[i]][data[step].y[i]-1]==1 then
				mg[data[step].x[i]][data[step].y[i]-1]=step+1
				n=n+1
				data[step+1].x[n]=data[step].x[i]
				data[step+1].y[n]=data[step].y[i]-1
			end
		end
		if n>0 then
			data[step+1].num=n
			findnext(data,step+1)
		end
	end
	findnext(data,1)
	for i=0,63 do
		for j=0,63 do
			if mg[i][j]>mg[cx][cy] then
				cx,cy=i,j
			end
		end
	end
	return cx,cy
end

function demostr(t)
	local tt=t-CC.Timer.stime;
	tt=math.modf(tt/30)%(CC.ScreenW+CC.Timer.len*CC.Fontsmall);
	if runword(CC.Timer.str,C_WHITE,CC.Fontsmall,1,tt)==1 then
		if Rnd(2)==1 then
			CC.Timer.status=0;
			CC.Timer.stime=t;
		end
	end
end

function runword(str,color,size,place,offset)
	offset=CC.ScreenW-offset;
	local y1,y2
	if place==0 then
		y1=0;
		y2=size;
	elseif place==1 then
		y1=CC.ScreenH-size;
		y2=CC.ScreenH;
	end
	lib.Background(0,y1,CC.ScreenW,y2,128);
	if -offset>(CC.Timer.len-1)*size then
		return 1;
	end
	DrawString(offset,y1,str,color,size);
	return 0;
end

function Show_Position() --罗盘函数，显示主地图主角位置
    if JY.Status ~=GAME_MMAP then
        return 0;
    end
    DrawStrBoxWaitKey(string.format("当前位置(%d,%d)",JY.Base["人X"],JY.Base["人Y"]),C_ORANGE,CC.DefaultFont);
	return 1;
end

function noad()
	return;
end

function walkto(xx,yy,x,y,flag)
	local x,y
	AutoMoveTab={[0]=0}
	if JY.Status==GAME_SMAP  then
		x=x or JY.Base['人X1']
		y=y or JY.Base['人Y1']
	elseif JY.Status==GAME_MMAP then
		x=x or JY.Base['人X']
		y=y or JY.Base['人Y']
	end
	xx,yy=xx+x,yy+y
	if JY.Status==GAME_SMAP and SceneCanPass(xx,yy)==false then
		return
	end
	if JY.Status==GAME_MMAP and ((lib.GetMMap(xx,yy,3)==0 and lib.GetMMap(xx,yy,4)==0) or CanEnterScene(xx,yy)~=-1)==false then
		return
	end
	local steparray={};
	local stepmax;
	local xy={}
	if JY.Status==GAME_SMAP then
		for i=0,63 do
			xy[i]={}
		end
	elseif JY.Status==GAME_MMAP then
		for i=0,479 do
			xy[i]={}
		end
	end
	if flag~=nil then
		stepmax=640
	else
		stepmax=240
	end
	for i=0,stepmax do
	    steparray[i]={};
        steparray[i].x={};
        steparray[i].y={};
	end
	local function canpass(nx,ny)
		if JY.Status==GAME_SMAP and (nx>63 or ny>63 or nx<1 or ny<1) then 
			return false 
		end
		if JY.Status==GAME_MMAP and (nx>479 or ny>479 or nx<1 or ny<1) then 
			return false 
		end
		if xy[nx][ny]==nil then
			if JY.Status==GAME_SMAP then
				if  SceneCanPass(nx,ny) then
					return true
				end
			elseif JY.Status==GAME_MMAP then
				if (lib.GetMMap(nx,ny,3)==0 and lib.GetMMap(nx,ny,4)==0) or CanEnterScene(nx,ny)~=-1 then
					return true
				end
			end
		end
		return false
	end
	
	local function FindNextStep(step)
		if step==stepmax then
			return
		end
		local step1=step+1
		local num=0
		for i=1,steparray[step].num do
			
			if steparray[step].x[i]==xx and steparray[step].y[i]==yy then
				return
			end
			
			if canpass(steparray[step].x[i]+1,steparray[step].y[i]) then
				num=num+1
				steparray[step1].x[num]=steparray[step].x[i]+1
				steparray[step1].y[num]=steparray[step].y[i]
				xy[steparray[step1].x[num]][steparray[step1].y[num]]=step1
			end
			if canpass(steparray[step].x[i]-1,steparray[step].y[i]) then
				num=num+1
				steparray[step1].x[num]=steparray[step].x[i]-1
				steparray[step1].y[num]=steparray[step].y[i]
				xy[steparray[step1].x[num]][steparray[step1].y[num]]=step1
			end
			if canpass(steparray[step].x[i],steparray[step].y[i]+1) then
				num=num+1
				steparray[step1].x[num]=steparray[step].x[i]
				steparray[step1].y[num]=steparray[step].y[i]+1
				xy[steparray[step1].x[num]][steparray[step1].y[num]]=step1
			end
			if canpass(steparray[step].x[i],steparray[step].y[i]-1) then
				num=num+1
				steparray[step1].x[num]=steparray[step].x[i]
				steparray[step1].y[num]=steparray[step].y[i]-1
				xy[steparray[step1].x[num]][steparray[step1].y[num]]=step1
			end
		end
		if num>0 then
			steparray[step1].num=num
			FindNextStep(step1)
		end
	end
	
    steparray[0].num=1;
	steparray[0].x[1]=x;
	steparray[0].y[1]=y;
	xy[x][y]=0
	FindNextStep(0);
	
	
    local movenum=xy[xx][yy];
	
	if movenum==nil then
		return
	end
	AutoMoveTab[0]=movenum
	for i=movenum,1,-1 do
        if xy[xx-1][yy]==i-1 then
            xx=xx-1;
            AutoMoveTab[1+movenum-i]=1;
        elseif xy[xx+1][yy]==i-1 then
            xx=xx+1;
            AutoMoveTab[1+movenum-i]=2;
        elseif xy[xx][yy-1]==i-1 then
            yy=yy-1;
            AutoMoveTab[1+movenum-i]=3;
        elseif xy[xx][yy+1]==i-1 then
            yy=yy+1;
            AutoMoveTab[1+movenum-i]=0;
        end
	end
end

function ssssdad()
    local movetable={};  --   记录每步移动
    for i=movenum,1,-1 do    --从目的位置反着找到初始位置，作为移动的次序
        movetable[i]={};
        movetable[i].x=xx;
        movetable[i].y=yy;
        if xy[xx-1][yy]==i-1 then
            xx=xx-1;
            movetable[i].direct=1;
        elseif xy[xx+1][yy]==i-1 then
            xx=xx+1;
            movetable[i].direct=2;
        elseif xy[xx][yy-1]==i-1 then
            yy=yy-1;
            movetable[i].direct=3;
        elseif xy[xx][yy+1]==i-1 then
            yy=yy+1;
            movetable[i].direct=0;
        end
    end
	local rmove=-1
    for i=1,movenum do
        local t1=lib.GetTime();
		--JY.Base["人X1"]=movetable[i].x
		--JY.Base["人Y1"]=movetable[i].y
		if JY.Status==GAME_SMAP then
			if instruct_30_sub(movetable[i].direct) ==nil then 
				break
			end
		elseif JY.Status==GAME_MMAP then
			if MMAPMovesub(movetable[i].direct) ==nil then 
				break
			end
		end
		ShowScreen();
		local key=lib.GetKey()
        local t2=lib.GetTime();
		if i<movenum then
			if (t2-t1)< 2*CC.Frame then
				lib.Delay(2*CC.Frame-(t2-t1));
			end
		end
		if key~=-1 then
			if key>1999999 then
				rmove=key-2000000
				break
			elseif key<1000000 then
				break
			end
		end
    end
	if rmove~=-1 then
			local mx=math.modf(rmove/1000)
			local my=math.fmod(rmove,1000)
			mx=mx-CC.ScreenW/2
			my=my-CC.ScreenH/2
			mx=mx/CC.XScale
			my=my/CC.YScale
			mx,my=(mx+my)/2,(my-mx)/2
			if mx>0 then mx=mx+0.99 else mx=mx-0.01 end
			if my>0 then my=my+0.99 else mx=mx-0.01 end
			mx=math.modf(mx)
			my=math.modf(my)
			for i=1,20 do
				if JY.Status==GAME_MMAP or mx+i >63 or my+i>63 then
					break
				end
				if math.abs(GetS(JY.SubScene,JY.Base["人X1"]+mx+i,JY.Base["人Y1"]+my+i,4)-CC.YScale*i*2)<8 then
					mx=mx+i
					my=my+i
					break
				end
			end
			walkto(mx,my)
	end
end

function MMAPMovesub(direct)
	local x,y
	if direct ~= -1 then
        AddMyCurrentPic();         --增加主角贴图编号，产生走路效果
		x=JY.Base["人X"]+CC.DirectX[direct+1];
		y=JY.Base["人Y"]+CC.DirectY[direct+1];
		JY.Base["人方向"]=direct;
    else
        x=JY.Base["人X"];
        y=JY.Base["人Y"];
    end
	if direct~=-1 then
		JY.SubScene=CanEnterScene(x,y);   --判断是否进入子场景
	end
	if CC.hx~=nil or (lib.GetMMap(x,y,3)==0 and lib.GetMMap(x,y,4)==0) then
		JY.Base["人X"]=x;
		JY.Base["人Y"]=y;
	end
		
    JY.Base["人X"]=limitX(JY.Base["人X"],10,CC.MWidth-10);           --限制坐标不能超出范围
    JY.Base["人Y"]=limitX(JY.Base["人Y"],10,CC.MHeight-10);

    if CC.MMapBoat[lib.GetMMap(JY.Base["人X"],JY.Base["人Y"],0)]==1 then
	    JY.Base["乘船"]=1;
	else
	    JY.Base["乘船"]=0;
	end

	local pic=GetMyPic();
	lib.DrawMMap(JY.Base["人X"],JY.Base["人Y"],pic);             --显示主地图
--    Cls();
    ShowScreen();
	JY.oldMMapX=JY.Base["人X"];
	JY.oldMMapY=JY.Base["人Y"];
	JY.oldMMapPic=pic;

    if JY.SubScene >= 0 then          --进入子场景
        CleanMemory();
		lib.UnloadMMap();
        lib.PicInit();
        lib.ShowSlow(50,1)

		JY.Status=GAME_SMAP;
        JY.MmapMusic=-1;

        JY.MyPic=GetMyPic();
        JY.Base["人X1"]=JY.Scene[JY.SubScene]["入口X"]
        JY.Base["人Y1"]=JY.Scene[JY.SubScene]["入口Y"]

        Init_SMap(1);
		return
	else
		return 1
    end
end

function hhinstruct_15()          --game over
    JY.Status=GAME_DEAD;
    Cls();
    DrawString(CC.GameOverX,CC.GameOverY,JY.Person[0]["姓名"],RGB(0,0,0),CC.DefaultFont);

	local x=CC.ScreenW-9*CC.DefaultFont;
    DrawString(x,10,os.date("%Y-%m-%d %H:%M"),RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+CC.DefaultFont+CC.RowPixel,"在地球的某处",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*2,"当地人口的失踪数",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*3,"又多了一笔。。。",RGB(216, 20, 24) ,CC.DefaultFont);

    local loadMenu={ {"载入进度一",nil,1},
                     {"载入进度二",nil,1},
                     {"载入进度三",nil,1},
                     {"回家睡觉去",nil,1} };
    local y=CC.ScreenH-4*(CC.DefaultFont+CC.RowPixel)-10;
    local r=ShowMenu(loadMenu,4,0,x,y,0,0,0,0,CC.DefaultFont,C_ORANGE, C_WHITE)

    if r<4 then
		CleanMemory();
        SBLDATAL(r);
		if JY.Base["无用"]~=-1 then 
			if JY.SubScene < 0 then          --处于大地图
				CleanMemory();
				lib.UnloadMMap();
			end
			lib.PicInit();
			lib.ShowSlow(50,1)
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["无用"]
			--JY.Base["人X1"]=JY.Person[99]["武功3"]
			--JY.Base["人Y1"]=JY.Person[99]["武功4"]
			--JY.Base["人X"]=JY.Person[99]["武功5"]
			--JY.Base["人Y"]=JY.Person[99]["武功6"]
			--JY.Base["人方向"]=JY.Person[99]["武功7"]
			JY.MmapMusic=-1;
			JY.MyPic=GetMyPic();
			Init_SMap(1);
		else 
			JY.SubScene=-1;
			JY.Status=GAME_FIRSTMMAP;
		end
		--JY.oldSMapX=-1;
		--JY.oldSMapY=-1;
    else
        JY.Status=GAME_END;
    end

end

function DrawMMapMini()
	local t=lib.GetTime();
	if JY.Status==GAME_SMAP or JY.Status==GAME_MMAP then
		if CC.Timer.status==0  then
			if t-CC.Timer.stime>900000 then
				CC.Timer.stime=t;
				CC.Timer.status=1;
				CC.Timer.str=CC.RUNSTR[math.random(10)];
				CC.Timer.len=string.len(CC.Timer.str)/2+3;
			end
		else
			CC.Timer.fun(t);
		end
	end
	local len=CC.MapSize
if CC.MapKind==2 then
	len=math.modf(len*1.5);
	for xx=-len,len do
		for yy=math.abs(xx)-len,len-math.abs(xx) do
			local dx,dy;
			local x=xx+JY.Base["人X"];
			local y=yy+JY.Base["人Y"];
			dx=CC.ScreenW-len*4+(xx-yy)*4;
			dy=len*2+(xx+yy)*2;
			if x==JY.Base["人X"] and y==JY.Base["人Y"] then
				lib.FillColor(dx,dy,dx+5,dy+5,C_RED)
			elseif x>=0 and y>=0 and x<=479 and y<=479 then
				if lib.GetMMap(x,y,1)~=0 then
					lib.Background(dx,dy,dx+4,dy+4,196)
				elseif lib.GetMMap(x,y,2)~=0 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(0,128,0))
				elseif lib.GetMMap(x,y,3)~=0 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(160,82,45))
				elseif CC.MMapBoat[lib.GetMMap(x,y,0)]==1 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(65,105,225))
				end
			end
		end
	end
	local Sce={};
	for xx=-len,len do
		for yy=math.abs(xx)-len,len-math.abs(xx) do
			local dx,dy;
			local x=xx+JY.Base["人X"];
			local y=yy+JY.Base["人Y"];
			dx=CC.ScreenW-len*4+(xx-yy)*4;
			dy=len*2+(xx+yy)*2;
			if x>=0 and y>=0 and x<=479 and y<=479 then
				local sid=CanEnterScene(x,y);
				if sid>=0 and Sce[sid]==nil then
					Sce[sid]=true;
					local str=JY.Scene[sid]["名称"];
					lib.FillColor(dx,dy,dx+3,dy+3,C_ORANGE);
					lib.Background(dx-string.len(str)*4,dy+4,dx+string.len(str)*4,dy+20,128);
					DrawString(dx-string.len(str)*4,dy+4,str,C_WHITE,16);
				end
			end
		end
	end
elseif CC.MapKind==1 then
	for x=JY.Base["人X"]-len,JY.Base["人X"]+len do
		for y=JY.Base["人Y"]-len,JY.Base["人Y"]+len do
			local dx,dy;
			local xx=x-JY.Base["人X"];
			local yy=y-JY.Base["人Y"];
			dx=CC.ScreenW-len*8+(xx-yy)*4;
			dy=len*4+(xx+yy)*2;
			if x==JY.Base["人X"] and y==JY.Base["人Y"] then
				lib.FillColor(dx,dy,dx+5,dy+5,C_RED)
			elseif x>=0 and y>=0 and x<=479 and y<=479 then
				if lib.GetMMap(x,y,1)~=0 then
					lib.Background(dx,dy,dx+4,dy+4,196)
				elseif lib.GetMMap(x,y,2)~=0 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(0,128,0))
				elseif lib.GetMMap(x,y,3)~=0 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(160,82,45))
				elseif CC.MMapBoat[lib.GetMMap(x,y,0)]==1 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(65,105,225))
				end
			end
		end
	end
	local Sce={};
	for x=JY.Base["人X"]-len,JY.Base["人X"]+len do
		for y=JY.Base["人Y"]-len,JY.Base["人Y"]+len do
			local dx,dy;
			local xx=x-JY.Base["人X"];
			local yy=y-JY.Base["人Y"];
			dx=CC.ScreenW-len*8+(xx-yy)*4;
			dy=len*4+(xx+yy)*2;
			if x>=0 and y>=0 and x<=479 and y<=479 then
				local sid=CanEnterScene(x,y);
				if sid>=0 and Sce[sid]==nil then
					Sce[sid]=true;
					local str=JY.Scene[sid]["名称"];
					lib.FillColor(dx,dy,dx+3,dy+3,C_ORANGE);
					lib.Background(dx-string.len(str)*4,dy+4,dx+string.len(str)*4,dy+20,128);
					DrawString(dx-string.len(str)*4,dy+4,str,C_WHITE,16);
				end
			end
		end
	end
end
end

function DrawSMapMini()
	local t=lib.GetTime();
	if JY.Status==GAME_SMAP or JY.Status==GAME_MMAP then
		if CC.Timer.status==0  then
			if t-CC.Timer.stime>900000 then
				CC.Timer.stime=t;
				CC.Timer.status=1;
				CC.Timer.str=CC.RUNSTR[math.random(10)];
				CC.Timer.len=string.len(CC.Timer.str)/2+3;
			end
		else
			CC.Timer.fun(t);
		end
	end
	local len=CC.MapSize;
if CC.MapKind==2 then
	len=math.modf(len*1.5);
	for xx=-len,len do
		for yy=math.abs(xx)-len,len-math.abs(xx) do
			local dx,dy;
			local x=xx+JY.Base["人X1"];
			local y=yy+JY.Base["人Y1"];
			dx=CC.ScreenW-len*4+(xx-yy)*4;
			dy=len*2+(xx+yy)*2;
			if x==JY.Base["人X1"] and y==JY.Base["人Y1"] then
				lib.FillColor(dx,dy,dx+5,dy+5,C_RED)
			elseif x>=0 and y>=0 and x<=63 and y<=63 then
				if CC.MMapBoat[GetS(JY.SubScene,x,y,0)]==1 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(65,105,225))
				elseif SceneCanPass(x,y) then
						--lib.Background(dx,dy,dx+4,dy+4,64)
						--lib.FillColor(dx,dy,dx+4,dy+4,C_GOLD)
				else
						--lib.DrawRect(dx,dy,dx+1,dy+1,C_RED)
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(0,128,0))--C_ORANGE)
						--lib.Background(dx,dy,dx+4,dy+4,64)
				end
			end
		end
	end
elseif CC.MapKind==1 then
	for x=JY.Base["人X1"]-len,JY.Base["人X1"]+len do
		for y=JY.Base["人Y1"]-len,JY.Base["人Y1"]+len do
			local dx,dy;
			local xx=x-JY.Base["人X1"];
			local yy=y-JY.Base["人Y1"];
			dx=CC.ScreenW-len*8+(xx-yy)*4;
			dy=len*4+(xx+yy)*2;
			if x==JY.Base["人X1"] and y==JY.Base["人Y1"] then
				lib.FillColor(dx,dy,dx+5,dy+5,C_RED)
			elseif x>=0 and y>=0 and x<=63 and y<=63 then
				if CC.MMapBoat[GetS(JY.SubScene,x,y,0)]==1 then
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(65,105,225))
				elseif SceneCanPass(x,y) then
						--lib.Background(dx,dy,dx+4,dy+4,64)
						--lib.FillColor(dx,dy,dx+4,dy+4,C_GOLD)
				else
						--lib.DrawRect(dx,dy,dx+1,dy+1,C_RED)
					lib.FillColor(dx,dy,dx+3,dy+3,RGB(0,128,0))--C_ORANGE)
						--lib.Background(dx,dy,dx+4,dy+4,64)
				end
			end
		end
	end
end
end

function DrawSMapMini_bak()
	local rx1,ry1;
	local len;
	local s=JY.SubScene;
	local scale=1;
	local XScale,YScale;
	local cx,cy;
	rx1=JY.Base["人X1"];
	ry1=JY.Base["人Y1"];
	len=CC.MapSize;
	XScale=CC.XScale*scale;
	YScale=CC.YScale*scale;
	cx=CC.ScreenW-XScale*len*2;
	cy=YScale*len*2;
		for i=-len,len do
			for j=-len,len do
				if rx1+i>=0 and rx1+i<=63 and ry1+j>=0 and ry1+j<=63 then
					local drawx=cx+XScale*(i-j);
					local drawy=cy+YScale*(i+j);
					local d0=GetS(s,rx1+i,ry1+j,0);
					local d1=GetS(s,rx1+i,ry1+j,1);
					local d2=GetS(s,rx1+i,ry1+j,2);
					local d3=GetS(s,rx1+i,ry1+j,3);
					local d4=GetS(s,rx1+i,ry1+j,4);
					local d5=GetS(s,rx1+i,ry1+j,5);
					d4=d4*scale;
					d5=d5*scale;
					if d0>0 then
						lib.PicLoadCache(90,d0,drawx,drawy);
					end
					if d1>0 then
						lib.PicLoadCache(90,d1,drawx,drawy-d4);
					end
					if d2>0 then
						lib.PicLoadCache(90,d2,drawx,drawy-d5);
					end
					if d3>=0 and d3<=199 then
						local dpic=GetD(s,d3,5);
						if dpic>0 then
							lib.PicLoadCache(90,dpic,drawx,drawy-d4);
						end
					end
					if i==0 and j==0 then
						lib.PicLoadCache(90,JY.MyPic*2,drawx,drawy-d4);
					end
				end
			end
		end
end


function DrawStrBox(x,y,str,color,size)         --显示带框的字符串
--显示带框的字符串
--(x,y) 坐标，如果都为-1,则在屏幕中间显示	
	local strarray={}
	local num,maxlen
	maxlen=0
	num,strarray=Split(str,'*')
	for i=1,num do
		local len=string.len(strarray[i])
		if len>maxlen then
			maxlen=len
		end
	end
    local w=size*maxlen/2+2*CC.MenuBorderPixel;
	local h=2*CC.MenuBorderPixel+size*num;
	if x==-1 then
        x=(CC.ScreenW-size/2*maxlen-2*CC.MenuBorderPixel)/2;
	end
	if y==-1 then
        y=(CC.ScreenH-size*num-2*CC.MenuBorderPixel)/2;
	end
    DrawBox(x,y,x+w-1,y+h-1,C_WHITE);
	for i=1,num do
		DrawString(x+CC.MenuBorderPixel,y+CC.MenuBorderPixel+size*(i-1),strarray[i],color,size);
	end
end

function JYMsgBox(title,str,button,num,headid)
	--计算长宽,字号使用默认字号，CC.Fontbig
	local strArray={};
	local xnum,ynum;
	local width,height;
	local picw,pich=0,0;
	local x1,x2,y1,y2;
	if headid~=nil then
		headid=headid*2;
		picw,pich=lib.PicGetXY(1,headid);
		picw=picw+CC.MenuBorderPixel*2;
		pich=pich+CC.MenuBorderPixel*2;
	end
	ynum,strArray=Split(str,'*');
	xnum=0;
	for i=1,ynum do
		local len=string.len(strArray[i]);
		if len>xnum then
			xnum=len;
		end
	end
	if xnum<12 then
		xnum=12
	end
	width=CC.MenuBorderPixel*2+math.modf(CC.Fontbig*xnum/2)+picw;
	height=CC.MenuBorderPixel*2+(CC.Fontbig+CC.MenuBorderPixel)*ynum;
	if height<pich then
		height=pich;
	end
	y2=height
	height=height+CC.MenuBorderPixel*2+CC.Fontbig*2;
	x1=(CC.ScreenW-width)/2+CC.MenuBorderPixel;
	x2=x1+picw;
	y1=(CC.ScreenH-height)/2+CC.MenuBorderPixel+2+CC.Fontbig*0.7;
	y2=y2+y1-5;
	local select=1;
	--lib.FreeSur(0)
	local surid=lib.SaveSur((CC.ScreenW-width)/2-4,(CC.ScreenH-height)/2-CC.FontBig,(CC.ScreenW+width)/2+4,(CC.ScreenH+height)/2+4);
	while true do
		lib.LoadSur(surid,(CC.ScreenW-width)/2-4,(CC.ScreenH-height)/2-CC.FontBig)
		DrawBoxTitle(width,height,title,C_GOLD);
		if headid~=nil then
			lib.PicLoadCache(1,headid,x1,y1,1,0);
		end
		for i=1,ynum do
			DrawString(x2,y1+(CC.MenuBorderPixel+CC.Fontbig)*(i-1),strArray[i],C_WHITE,CC.Fontbig);
		end
		for i=1,num do
			local color;
			local bjcolor;
			if i==select then
				color=M_Yellow;
				bjcolor=M_DarkOliveGreen
			else
				color=M_DarkOliveGreen;
			end
			DrawStrBox2((CC.ScreenW-width)/2+width*i/(num+1)-string.len(button[i])*CC.Fontbig/4,y2,button[i],color,CC.Fontbig,bjcolor);
		end
		ShowScreen()
		--local event,key,mx,my=WaitKey(1)
		--if event==1 then
		local key=WaitKey();
			if key==VK_LEFT then
				select=select-1;
				if select<1 then select=num end
			elseif key==VK_RIGHT then			
				select=select+1;
				if select>num then select=1 end
			elseif key==VK_RETURN or key==VK_SPACE then
				break;
			end
		--[[elseif event==2 or event==3 then
			if between(my,y2,y2+CC.Fontbig+2*CC.MenuBorderPixel) then
				local tmp=0;
				for i=1,num do
					if between(mx,(CC.ScreenW-width)/2+width*i/(num+1)-string.len(button[i])*CC.Fontbig/4,
								(CC.ScreenW-width)/2+width*i/(num+1)+string.len(button[i])*CC.Fontbig/4+CC.MenuBorderPixel*2) then
						tmp=i;
						break;
					end
				end
				if tmp>0 then
					select=tmp;
					if event==3 then
						break;
					end
				end
			end
		end]]
		select=limitX(select,1,num);
	end
	lib.LoadSur(surid,(CC.ScreenW-width)/2-4,(CC.ScreenH-height)/2-CC.FontBig)
	ShowScreen()
	lib.FreeSur(surid);
	return select;
end

function NewDrawBoxTitle(width,height,str,color)
	--设置菜单也会用到的吧
    local s=4;
	local x1,y1,x2,y2,tx1,tx2;
	local fontsize=s+CC.Fontbig--math.min(CC.ScreenW/20,CC.ScreenH/15);
	local len=string.len(str)*fontsize/2
	x1=(CC.ScreenW-width)/2;
	x2=(CC.ScreenW+width)/2;
	y1=(CC.ScreenH-height)/2;
	y2=(CC.ScreenH+height)/2;
	tx1=(CC.ScreenW-len)/2;
	tx2=(CC.ScreenW+len)/2;
    lib.Background(x1,y1+s,x1+s,y2-s,128);    --阴影，四角空出,大窗体部分
    lib.Background(x1+s,y1,x2-s,y2,128);
    lib.Background(x2-s,y1+s,x2,y2-s,128);
    lib.Background(tx1,y1-fontsize/2+s,tx2,y1,128);    --阴影，四角空出,标题部分
    lib.Background(tx1+s,y1-fontsize/2,tx2-s,y1-fontsize/2+s,128);
    local r,g,b=GetRGB(color);
    DrawBoxTitle_sub(x1+1,y1+1,x2,y2,tx1+1,y1-fontsize/2+1,tx2,y1+fontsize/2,RGB(math.modf(r/2),math.modf(g/2),math.modf(b/2)));
    DrawBoxTitle_sub(x1,y1,x2-1,y2-1,tx1,y1-fontsize/2,tx2-1,y1+fontsize/2-1,color);
	DrawString(tx1+2*s,y1-(fontsize-s)/2,str,color,CC.Fontbig)
end

function DrawBoxTitle_sub(x1,y1,x2,y2,tx1,ty1,tx2,ty2,color)
    local s=4;
	lib.DrawRect(x1+s,y1,tx1,y1,color)
	lib.DrawRect(tx2,y1,x2-s,y1,color)
    lib.DrawRect(x2-s,y1,x2-s,y1+s,color);
    lib.DrawRect(x2-s,y1+s,x2,y1+s,color);
    lib.DrawRect(x2,y1+s,x2,y2-s,color);
    lib.DrawRect(x2,y2-s,x2-s,y2-s,color);
    lib.DrawRect(x2-s,y2-s,x2-s,y2,color);
    lib.DrawRect(x2-s,y2,x1+s,y2,color);
    lib.DrawRect(x1+s,y2,x1+s,y2-s,color);
    lib.DrawRect(x1+s,y2-s,x1,y2-s,color);
    lib.DrawRect(x1,y2-s,x1,y1+s,color);
    lib.DrawRect(x1,y1+s,x1+s,y1+s,color);
    lib.DrawRect(x1+s,y1+s,x1+s,y1,color);
	DrawBox_1(tx1,ty1,tx2,ty2,color)
end

function DrawStrBox2(x,y,str,color,size,bjcolor)         --显示带框的字符串
	
	local strarray={}
	local num,maxlen;
	maxlen=0
	num,strarray=Split(str,'*')
	for i=1,num do
		local len=string.len(strarray[i])
		if len>maxlen then
			maxlen=len
		end
	end
    local w=size*maxlen/2+2*CC.MenuBorderPixel;
	local h=2*CC.MenuBorderPixel+size*num;
	if x==-1 then
        x=(CC.ScreenW-size/2*maxlen-2*CC.MenuBorderPixel)/2;
	end
	if y==-1 then
        y=(CC.ScreenH-size*num-2*CC.MenuBorderPixel)/2;
	end
	DrawBox2(x,y,x+w-1,y+h-1,C_WHITE,bjcolor);
	for i=1,num do
		DrawString(x+CC.MenuBorderPixel,y+CC.MenuBorderPixel+size*(i-1),strarray[i],color,size);
	end
end

function between(v,Min,Max)
	if Min>Max then
		Min,Max=Max,Min;
	end
	if v>=Min and v<=Max then
		return true;
	end
	return false;
end

function DrawBox(x1,y1,x2,y2,color)         --绘制一个带背景的白色方框
 --绘制一个带背景的白色方框，四角凹进
    local s=4;
    --lib.Background(x1,y1+s,x1+s,y2-s,128);    --阴影，四角空出
    --lib.Background(x1+s,y1,x2-s,y2,128);
    --lib.Background(x2-s,y1+s,x2,y2-s,128);
	lib.Background(x1+4,y1,x2-4,y1+s,128);
	lib.Background(x1+1,y1+1,x1+s,y1+s,128);
	lib.Background(x2-s,y1+1,x2-1,y1+s,128);
	lib.Background(x1,y1+4,x2,y2-4,128);
	lib.Background(x1+1,y2-s,x1+s,y2-1,128);
	lib.Background(x2-s,y2-s+1,x2-1,y2,128);
	lib.Background(x1+4,y2-s,x2-4,y2,128);
    local r,g,b=GetRGB(color);
    DrawBox_1(x1+1,y1+1,x2,y2,RGB(math.modf(r/2),math.modf(g/2),math.modf(b/2)));
    DrawBox_1(x1,y1,x2-1,y2-1,color);
end

function DrawBox_1(x1,y1,x2,y2,color)       --绘制四角凹进的方框
    local s=4;
    --lib.DrawRect(x1+s,y1,x2-s,y1,color);
    --lib.DrawRect(x2-s,y1,x2-s,y1+s,color);
    --lib.DrawRect(x2-s,y1+s,x2,y1+s,color);
    --lib.DrawRect(x2,y1+s,x2,y2-s,color);
    --lib.DrawRect(x2,y2-s,x2-s,y2-s,color);
    --lib.DrawRect(x2-s,y2-s,x2-s,y2,color);
    --lib.DrawRect(x2-s,y2,x1+s,y2,color);
    --lib.DrawRect(x1+s,y2,x1+s,y2-s,color);
    --lib.DrawRect(x1+s,y2-s,x1,y2-s,color);
    --lib.DrawRect(x1,y2-s,x1,y1+s,color);
    --lib.DrawRect(x1,y1+s,x1+s,y1+s,color);
    --lib.DrawRect(x1+s,y1+s,x1+s,y1,color);
	lib.DrawRect(x1+s,y1,x2-s,y1,color);
	lib.DrawRect(x1+s,y2,x2-s,y2,color);
	lib.DrawRect(x1,y1+s,x1,y2-s,color);
	lib.DrawRect(x2,y1+s,x2,y2-s,color);
	lib.DrawRect(x1+2,y1+1,x1+s-1,y1+1,color);
	lib.DrawRect(x1+1,y1+2,x1+1,y1+s-1,color);
	lib.DrawRect(x2-s+1,y1+1,x2-2,y1+1,color);
	lib.DrawRect(x2-1,y1+2,x2-1,y1+s-1,color);
	
	lib.DrawRect(x1+2,y2-1,x1+s-1,y2-1,color);
	lib.DrawRect(x1+1,y2-s+1,x1+1,y2-2,color);
	lib.DrawRect(x2-s+1,y2-1,x2-2,y2-1,color);
	lib.DrawRect(x2-1,y2-s+1,x2-1,y2-2,color);
end

function DrawBox2(x1,y1,x2,y2,color,bjcolor)         --绘制一个带背景的白色方框
    local s=4;
	bjcolor=bjcolor or 0;
	if bjcolor>=0 then
		lib.Background(x1,y1+s,x1+s,y2-s,128,bjcolor);    --阴影，四角空出
		lib.Background(x1+s,y1,x2-s,y2,128,bjcolor);
		lib.Background(x2-s,y1+s,x2,y2-s,128,bjcolor);
	end
	if color>=0 then
		local r,g,b=GetRGB(color);
		DrawBox_2(x1+1,y1,x2,y2,RGB(math.modf(r/2),math.modf(g/2),math.modf(b/2)));
		DrawBox_2(x1,y1,x2-1,y2-1,color);
	end
end

function DrawBox_2(x1,y1,x2,y2,color)       --绘制四角凹进的方框
    local s=4;
    lib.DrawRect(x1+s,y1,x2-s,y1,color);
    lib.DrawRect(x2-s,y1,x2-s,y1+s,color);
    lib.DrawRect(x2-s,y1+s,x2,y1+s,color);
    lib.DrawRect(x2,y1+s,x2,y2-s,color);
    lib.DrawRect(x2,y2-s,x2-s,y2-s,color);
    lib.DrawRect(x2-s,y2-s,x2-s,y2,color);
    lib.DrawRect(x2-s,y2,x1+s,y2,color);
    lib.DrawRect(x1+s,y2,x1+s,y2-s,color);
    lib.DrawRect(x1+s,y2-s,x1,y2-s,color);
    lib.DrawRect(x1,y2-s,x1,y1+s,color);
    lib.DrawRect(x1,y1+s,x1+s,y1+s,color);
    lib.DrawRect(x1+s,y1+s,x1+s,y1,color);
end

function DrawString(x,y,str,color,size)         --显示阴影字符串
--    local r,g,b=GetRGB(color);
--    lib.DrawStr(x+1,y+1,str,RGB(math.modf(r/2),math.modf(g/2),math.modf(b/2)),size,CC.FontName,CC.SrcCharSet,CC.OSCharSet);
    lib.DrawStr(x,y,str,color,size,CC.FontName,CC.SrcCharSet,CC.OSCharSet);
end

function NewDrawString(x,y,str,color,size)
    local ll=#str;
    local w=size*ll/2+2*CC.MenuBorderPixel;
	local h=size+2*CC.MenuBorderPixel;		
	if x==-1 then
        x=(CC.ScreenW-size/2*ll-2*CC.MenuBorderPixel)/2;
    else
	    x=(x-size/2*ll-2*CC.MenuBorderPixel)/2;
	end
	if y==-1 then
        y=(CC.ScreenH-size-2*CC.MenuBorderPixel)/2;
	else
	    y=(y-size-2*CC.MenuBorderPixel)/2;
	end	
    lib.DrawStr(x,y,str,color,size,CC.FontName,CC.SrcCharSet,CC.OSCharSet);
end

function DrawStrBoxYesNo(x,y,str,color,size)        --显示字符串并询问Y/N
--显示并询问Y/N，如果点击Y，则返回true, N则返回false
--(x,y) 坐标，如果都为-1,则在屏幕中间显示
--改为用菜单询问是否    
	lib.GetKey();
    local ll=#str;
    local w=size*ll/2+2*CC.MenuBorderPixel;
	local h=size+2*CC.MenuBorderPixel;
	if x==-1 then
        x=(CC.ScreenW-size/2*ll-2*CC.MenuBorderPixel)/2;
	end
	if y==-1 then
        y=(CC.ScreenH-size-2*CC.MenuBorderPixel)/2;
	end

    DrawStrBox(x,y,str,color,size);
    local menu={{"确定/是",nil,1},
	            {"取消/否",nil,2}};

	local r=ShowMenu(menu,2,0,x+w-4*size-2*CC.MenuBorderPixel,y+h+CC.MenuBorderPixel,0,0,1,0,CC.DefaultFont,C_ORANGE, C_WHITE)

    if r==1 then
	    return true;
	else
	    return false;
	end

end

function DrawStrBoxWaitKey(s,color,size)          --显示字符串并等待击键
    lib.GetKey();
    Cls();
    DrawStrBox(-1,-1,s,color,size);
    ShowScreen();
    WaitKey();
end


function FINALWORK()  
    for i=311,319 do  --鳄鱼图
	     JY.Person[i]["头像代号"]=214
    end

    JY.MY=JY.Person[0]
	
	for i=1,200 do
		 if JY.Base["物品" .. i]==174 then
			JY.GOLD=JY.Base["物品数量" .. i]
			break
		 end
	end
end

function FINALWORK2()
    JY.Thing[74]["需内力"]=2000
	JY.Thing[6]["加内力"]=2000
	JY.Thing[96]["加轻功"]=1
	JY.Thing[100]["加轻功"]=1
	JY.Thing[134]["加轻功"]=1
	JY.Thing[121]["加轻功"]=1
	JY.Thing[65]["需资质"]=50
	JY.Thing[88]["名称"]=CC.s67
	JY.Thing[235]["需资质"]=-50
	JY.Thing[81]["需资质"]=70
	JY.Person[36]["携带物品1"]=78
	JY.Person[47]["携带物品1"]=8
	JY.Person[49]["携带物品1"]=75
	JY.Person[49]["携带物品2"]=200
	JY.Person[27]["左右互搏"]=0
	JY.Person[111]["头像代号"]=111
	if JY.Person[44]["武功10"]==-1 then JY.Person[44]["武功10"]=0 end
	JY.Shop[1]["物品价格5"]=1000
	JY.Shop[2]["物品价格5"]=600
	JY.Shop[3]["物品价格5"]=800
	JY.Shop[0]["物品价格5"]=4000
	
	CC.TSNGP={};
	
	for p=0,588 do
	        local r=0;	   	    
		    for i,v in pairs(CC.PersonExit) do
			    if v[1]==p then
				    r=1
					break;
			    end
			end
			if p==0 then r=1 end
			if r==0 then 
			    if JY.Thing[202][WZ7]>3 then JY.Thing[202][WZ7]=3 end
			    if JY.Person[p]["生命最大值"]<JY.Thing[202][WZ7]*50+50 then
				   JY.Person[p]["生命最大值"]=JY.Thing[202][WZ7]*50+50
				   JY.Person[p]["生命"]=JY.Person[p]["生命最大值"]
				end
				if JY.Person[p]["内力最大值"]<JY.Thing[202][WZ7]*300 then
				   JY.Person[p]["内力最大值"]=JY.Thing[202][WZ7]*300
				   JY.Person[p]["内力"]=JY.Person[p]["内力最大值"]
				end
		    end
	end			

	SetS(70,32,7,1,0)
	SetS(70,33,7,1,0)
	SetS(70,29,7,1,0)
	
	SetS(28,37,11,1,1)  --少林木-铜补地
	SetS(28,45,9,1,1)
	
	SetD(12,22,2,0)
	
	if GetS(10,0,17,0)~=1 then
	   SetD(83,48,4,0)
	end

    if GetS(4,5,5,5)==3 then --玄虚.无名
       JY.Thing[138]["需内力性质"]=2
	   JY.Thing[138]["名称"]=CC.s50
	   JY.Wugong[64]["名称"]=CC.s51
	    for i=1,10 do 
			JY.Wugong[64]["移动范围"..i]=4
			JY.Wugong[64]["杀伤范围"..i]=0
	    end
		JY.Wugong[64]["攻击范围"]=3
	end
	
	JY.Scene[54]["进门音乐"]=31
	JY.Scene[75]["进门音乐"]=25
	JY.Scene[70]["进门音乐"]=28
	JY.Scene[104]["进门音乐"]=32
	
	JY.HEADXZ=2;
	CC.HeadPicFile={CONFIG.DataPath .. "atmb.idx",CONFIG.DataPath .. "atmb.grp"};
   	if JY.Thing[202][WZ7]==1 then
	   JY.HEADXZ=1;
	   CC.HeadPicFile={CONFIG.DataPath .. "atm.idx",CONFIG.DataPath .. "atm.grp"};
   	end	
	
	local warzs={
	                     {137,12,5,6},--1
						 {138,11,4,5},--2
						 {139,9,2,3},--3
						 {150,11,3,4},--4
						 {142,12,5,6},--5
						 {141,12,5,6},--6
						 {143,8,1,2},--7
						 {144,8,1,2},
						 {145,8,1,2},
						 {146,8,1,2},
						 {147,8,1,2},
						 {148,8,1,2},--12
						 {154,9,1,2},--13
						 {152,9,3,4},--14
						 {153,11,5,6},--15
						 {151,16,7,8},--16
						 {158,9,4,5},--17
						 {159,8,1,2},--18
						 {157,9,4,5},--19
						 {160,8,1,2},--20
						 {162,9,6,7},--21
						 {163,9,6,7},--22
						 {164,9,3,4},--23
						 {189,9,6,7},--24
						 {171,11,4,5},--25
						 {166,12,8,9},--26
						 {169,14,6,7},--27
						 {170,14,6,7},--28
						 {172,11,4,5},--29
						 {174,8,1,2},--30
						 {173,8,1,2},--31
						 {173,8,1,2},--32						
						 {176,11,4,5},--33
						 {184,8,1,2},--34
						 {177,13,6,9},--35
						 {178,13,6,9},--36
						 {179,13,6,9},--37
						 {181,8,3,4},--38
						 {182,12,5,6},--39
						 {175,8,1,2},--40
						 {183,12,5,6},--41
						 {29,14,2,3},--42
						 {81,10,4,5},--43
						 {89,8,4,5},--44
						 
						 
						 }
						 
	for i=1,5 do
	      for z=1,44 do
			  JY.Person[warzs[z][1]]["出招动画帧数"..i]=0
			  JY.Person[warzs[z][1]]["出招动画延迟"..i]=0
			  JY.Person[warzs[z][1]]["武功音效延迟"..i]=0
		  end
	end
	for z=1,44 do
	     JY.Person[warzs[z][1]]["出招动画帧数1"]=warzs[z][2]
		 JY.Person[warzs[z][1]]["武功音效延迟1"]=warzs[z][3]
		 JY.Person[warzs[z][1]]["出招动画延迟1"]=warzs[z][4]
	end		 
	
	local wart={56,73,74,75,77,80,83,90,91,
	                   52,66,72,78,79,82,84,85,87,88,92,129,
	                   140,161,261,   --24
                       97,94,95,96,39,40,41,42,98,99,100,110,111,
                       103,104,112,113,114,117,118,122,121,128
                       	}--47				   
					   
	for i=1,5 do
	      for z=1,47 do
			  JY.Person[wart[z]]["出招动画帧数"..i]=0
			  JY.Person[wart[z]]["出招动画延迟"..i]=0
			  JY.Person[wart[z]]["武功音效延迟"..i]=0
		  end
	end
	
	JY.Person[128]["出招动画帧数1"]=11
	JY.Person[128]["出招动画延迟1"]=5
    JY.Person[128]["武功音效延迟1"]=4
	
	JY.Person[121]["出招动画帧数1"]=13
	JY.Person[121]["出招动画延迟1"]=7
    JY.Person[121]["武功音效延迟1"]=6
	
	JY.Person[122]["出招动画帧数1"]=11
	JY.Person[122]["出招动画延迟1"]=6
    JY.Person[122]["武功音效延迟1"]=5
	
	JY.Person[118]["出招动画帧数1"]=13
	JY.Person[118]["出招动画延迟1"]=9
    JY.Person[118]["武功音效延迟1"]=8
	
	JY.Person[117]["出招动画帧数1"]=10
	JY.Person[117]["出招动画延迟1"]=6
    JY.Person[117]["武功音效延迟1"]=5
	
	JY.Person[114]["出招动画帧数1"]=13
	JY.Person[114]["出招动画延迟1"]=6
    JY.Person[114]["武功音效延迟1"]=5
	
	JY.Person[113]["出招动画帧数1"]=11
	JY.Person[113]["出招动画延迟1"]=5
    JY.Person[113]["武功音效延迟1"]=4
	
	JY.Person[112]["出招动画帧数1"]=11
	JY.Person[112]["出招动画延迟1"]=5
    JY.Person[112]["武功音效延迟1"]=4
	
	JY.Person[104]["出招动画帧数1"]=11
	JY.Person[104]["出招动画延迟1"]=5
    JY.Person[104]["武功音效延迟1"]=4
	
	JY.Person[103]["出招动画帧数1"]=10
	JY.Person[103]["出招动画延迟1"]=2
    JY.Person[103]["武功音效延迟1"]=1
	
	JY.Person[111]["出招动画帧数1"]=10
	JY.Person[111]["出招动画延迟1"]=4
    JY.Person[111]["武功音效延迟1"]=3
	
	JY.Person[110]["出招动画帧数1"]=10
	JY.Person[110]["出招动画延迟1"]=4
    JY.Person[110]["武功音效延迟1"]=3
	
	JY.Person[100]["出招动画帧数1"]=11
	JY.Person[100]["出招动画延迟1"]=5
    JY.Person[100]["武功音效延迟1"]=4
	
	JY.Person[99]["出招动画帧数1"]=10
	JY.Person[99]["出招动画延迟1"]=2
    JY.Person[99]["武功音效延迟1"]=1
	
	JY.Person[98]["出招动画帧数1"]=16
	JY.Person[98]["出招动画延迟1"]=9
    JY.Person[98]["武功音效延迟1"]=8
	
	JY.Person[42]["出招动画帧数1"]=12
	JY.Person[42]["出招动画延迟1"]=6
    JY.Person[42]["武功音效延迟1"]=5
	
	JY.Person[41]["出招动画帧数1"]=12
	JY.Person[41]["出招动画延迟1"]=6
    JY.Person[41]["武功音效延迟1"]=5
	
	JY.Person[40]["出招动画帧数1"]=8
	JY.Person[40]["出招动画延迟1"]=2
    JY.Person[40]["武功音效延迟1"]=1
	
	JY.Person[39]["出招动画帧数1"]=9
	JY.Person[39]["出招动画延迟1"]=7
    JY.Person[39]["武功音效延迟1"]=6
	
	JY.Person[96]["出招动画帧数1"]=8
	JY.Person[96]["出招动画延迟1"]=2
    JY.Person[96]["武功音效延迟1"]=1
	
	JY.Person[95]["出招动画帧数1"]=9
	JY.Person[95]["出招动画延迟1"]=5
    JY.Person[95]["武功音效延迟1"]=4
	
	JY.Person[94]["出招动画帧数1"]=10
	JY.Person[94]["出招动画延迟1"]=2
    JY.Person[94]["武功音效延迟1"]=1
	
	JY.Person[97]["出招动画帧数1"]=10
	JY.Person[97]["出招动画延迟1"]=2
    JY.Person[97]["武功音效延迟1"]=1
	
	JY.Person[261]["出招动画帧数1"]=11
	JY.Person[261]["出招动画延迟1"]=5
    JY.Person[261]["武功音效延迟1"]=4
	
	JY.Person[161]["出招动画帧数1"]=9
	JY.Person[161]["出招动画延迟1"]=5
    JY.Person[161]["武功音效延迟1"]=4
	
	JY.Person[140]["出招动画帧数1"]=16
	JY.Person[140]["出招动画延迟1"]=7
    JY.Person[140]["武功音效延迟1"]=6
	
	JY.Person[129]["出招动画帧数1"]=9
	JY.Person[129]["出招动画延迟1"]=4
    JY.Person[129]["武功音效延迟1"]=3
	
	JY.Person[92]["出招动画帧数1"]=9
	JY.Person[92]["出招动画延迟1"]=2
    JY.Person[92]["武功音效延迟1"]=1
	
	JY.Person[88]["出招动画帧数1"]=11
	JY.Person[88]["出招动画延迟1"]=2
    JY.Person[88]["武功音效延迟1"]=1
	
	JY.Person[87]["出招动画帧数1"]=8
	JY.Person[87]["出招动画延迟1"]=5
    JY.Person[87]["武功音效延迟1"]=4
	
	JY.Person[85]["出招动画帧数1"]=13
	JY.Person[85]["出招动画延迟1"]=5
    JY.Person[85]["武功音效延迟1"]=4
	
	JY.Person[84]["出招动画帧数1"]=9
	JY.Person[84]["出招动画延迟1"]=5
    JY.Person[84]["武功音效延迟1"]=4
	
	JY.Person[82]["出招动画帧数1"]=11
	JY.Person[82]["出招动画延迟1"]=5
    JY.Person[82]["武功音效延迟1"]=4
	
	JY.Person[79]["出招动画帧数1"]=12
	JY.Person[79]["出招动画延迟1"]=9
    JY.Person[79]["武功音效延迟1"]=8
	
	JY.Person[78]["出招动画帧数1"]=13
	JY.Person[78]["出招动画延迟1"]=8
    JY.Person[78]["武功音效延迟1"]=7
	
	JY.Person[72]["出招动画帧数1"]=9
	JY.Person[72]["出招动画延迟1"]=5
    JY.Person[72]["武功音效延迟1"]=4
	
	JY.Person[66]["出招动画帧数1"]=10
	JY.Person[66]["出招动画延迟1"]=5
    JY.Person[66]["武功音效延迟1"]=4
	
	JY.Person[52]["出招动画帧数1"]=6
	JY.Person[52]["出招动画延迟1"]=3
    JY.Person[52]["武功音效延迟1"]=2
	
	JY.Person[56]["出招动画帧数1"]=10
	JY.Person[56]["出招动画延迟1"]=5
    JY.Person[56]["武功音效延迟1"]=3
	
    JY.Person[73]["出招动画帧数1"]=13
	JY.Person[73]["出招动画延迟1"]=7
    JY.Person[73]["武功音效延迟1"]=5
	
    JY.Person[74]["出招动画帧数1"]=9
	JY.Person[74]["出招动画延迟1"]=4
    JY.Person[74]["武功音效延迟1"]=2
	
	JY.Person[75]["出招动画帧数1"]=10
	JY.Person[75]["出招动画延迟1"]=3
    JY.Person[75]["武功音效延迟1"]=1
	
	JY.Person[77]["出招动画帧数1"]=8
	JY.Person[77]["出招动画延迟1"]=7
    JY.Person[77]["武功音效延迟1"]=6
	
	JY.Person[80]["出招动画帧数1"]=11
	JY.Person[80]["出招动画延迟1"]=5
    JY.Person[80]["武功音效延迟1"]=3
	
	JY.Person[83]["出招动画帧数1"]=7
	JY.Person[83]["出招动画延迟1"]=5
    JY.Person[83]["武功音效延迟1"]=4
	
	JY.Person[90]["出招动画帧数1"]=9
	JY.Person[90]["出招动画延迟1"]=6
    JY.Person[90]["武功音效延迟1"]=5
	
	JY.Person[91]["出招动画帧数1"]=9
	JY.Person[91]["出招动画延迟1"]=2
    JY.Person[91]["武功音效延迟1"]=1
	
end


function QZXS(s) 
     DrawStrBoxWaitKey(s,C_GOLD,30)
end

function PersonKF(p,kf) 
    for i=1,10 do
	     if JY.Person[p]["武功"..i]==kf then
		     return true;			 
		 end
    end
	return false;
end


function T1LEQ(id) 
    if id==0 and JY.Person[id]["姓名"]==JY.LEQ and GetS(4,5,5,4)==1 and GetS(4,5,5,5)==8 then
       return true
	else
	   return false
	end
end

function T2SQ(id)  
    if id==0 and JY.Person[id]["姓名"]==JY.SQ and GetS(4,5,5,4)==2 and GetS(4,5,5,5)==8 then
       return true
	else
	   return false
	end
end

function T3XYK(id) 
    if id==0 and JY.Person[id]["姓名"]==JY.XYK and GetS(4,5,5,4)==3 and GetS(4,5,5,5)==8 then
       return true
	else
	   return false
	end
end


function FKJGN(k)
	if k==282 then 
	    if JY.Status==GAME_MMAP then 
	       Menu_MCCS() 
		end
    elseif k==283 then
        if JY.XZSPD==1 then
	       JY.XZSPD=40
		   QZXS(CC.s66)
		else	
		   JY.XZSPD=1
		   QZXS(CC.s65)
	    end
		
	elseif k==284 then
        Menu_DDTH();
    elseif k==285 then
	   Menu_WPZL();
	elseif k==286 then
	   Menu_FullScreen();
	elseif k==287 then
	   Menu_SetMusic();
	elseif k==113 then
	    if DrawStrBoxYesNo(-1,-1,CC.s74,C_WHITE,30)==true then
	       JY.Status=x
	    end
    elseif k==105 then
	    Cls();
	    Menu_Thing();
    elseif k==115 then
	    Cls();		
	    local MS=JYMsgBox(CC.EVB111,CC.EVB112,KJDYSAVE,4,280);
        if MS<4 then 
			if JY.Status==GAME_SMAP then 			--保存部分和场景地图存档相关信息
				JY.Base["无用"]=JY.SubScene			
			else
				JY.Base["无用"]=-1			
			end
			SBLDATAS(MS);
			DrawStrBoxWaitKey(CC.EVB113,C_WHITE,30)
		end
    elseif k==108 then
	    Cls();		
	    local MS=JYMsgBox(CC.EVB114,CC.EVB115,KJDYLOAD,4,280);
        if MS<4 then		   		
		    SBLDATAL(MS);
		    if JY.Base["无用"]~=-1 then 
				if JY.SubScene < 0 then          
					CleanMemory();
					lib.UnloadMMap();
				end
				lib.PicInit();
				lib.ShowSlow(50,1)
				JY.Status=GAME_SMAP
				JY.SubScene=JY.Base["无用"]
				
				JY.MmapMusic=-1;
				JY.MyPic=GetMyPic();
				Init_SMap(1);
			else 
				JY.SubScene=-1;
				JY.Status=GAME_FIRSTMMAP;
		    end
		    DrawStrBoxWaitKey(CC.EVB116,C_WHITE,30)
		end
	elseif k==122 then
	    Cls();
		Menu_Status();		
	end
end

function NEvent(keypress)
   --NEvent1(keypress)
   NEvent2(keypress)
   NEvent3(keypress)
   NEvent4(keypress)
   NEvent5(keypress)
   NEvent6(keypress)
   NEvent7(keypress)
   NEvent8(keypress)
   NEvent9(keypress)
   NEvent10(keypress)
   NEvent11(keypress)
   NEvent12(keypress)
   
end

function NEvent1(keypress) 
        for i=1,4 do
		     SetS(70,34+i,23,3,110+i)
		     instruct_3(70,110+i,1,0,0,0,0,5106,5106,5106,0,34+i,23)
		end
		if JY.SubScene==70 and JY.Base[CC.EVB[2]]==24 then
		   if JY.Base[CC.EVB[1]]==35 and keypress==VK_SPACE and JY.Base[CC.EVB[3]]==0 then
		      say(CC.EVB[11],500,0,CC.EVB[4])
			  local menu={}
              local menu2={}
              local k=1
              for i=1,200 do
                   if JY.Base[CC.EVB[5]..i]>35 and JY.Base[CC.EVB[5]..i]<64 and JY.Base[CC.EVB[6]..i]==1 and JY.Thing[JY.Base[CC.EVB[5]..i]][CC.EVB[15]]==-1 and (JY.Base[CC.EVB[5]..i]~=40 or instruct_18(156)) then
                      menu[k]={JY.Thing[JY.Base[CC.EVB[5]..i]][CC.EVB[7]],nil,1};
	                  menu2[k]={JY.Base[CC.EVB[5]..i],nil,1};
	                  k=k+1
	               end
              end

              local r;
              local c=1
              while c==1 do
              r=ShowMenu(menu,k-1,10,1,1,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE)
                 if r>0 then
                    if DrawStrBoxYesNo(-1,-1,CC.EVB[8]..menu[r][1],C_ORANGE,CC.DefaultFont) then
                       instruct_32(menu2[r][1],-1) 
                       instruct_2(174,(JY.Thing[menu2[r][1]][CC.EVB[9]]+JY.Thing[menu2[r][1]][CC.EVB[10]]+JY.Thing[menu2[r][1]][CC.EVB[12]])*15+50+math.random(150))
                       c=2   
                    else
                      Cls()  
                    end
                else
                    c=2
                end
              end
		  end
		  
		   if JY.Base[CC.EVB[1]]==36 and keypress==VK_SPACE and JY.Base[CC.EVB[3]]==0 then
		        say(CC.EVB[13],500,0,CC.EVB[14])
		        local menu={}
				local menu2={}
				local k=1
				for i=1,200 do
					if ((JY.Base[CC.EVB[5]..i]>63 and JY.Base[CC.EVB[5]..i]<144) or (JY.Base[CC.EVB[5]..i]>157 and JY.Base[CC.EVB[5]..i]<194)) then
					 if JY.Thing[JY.Base[CC.EVB[5]..i]][CC.EVB[15]]==-1 and (JY.Base[CC.EVB[5]..i]~=174 and JY.Base[CC.EVB[5]..i]~=182) and JY.Base[CC.EVB[6]..i]==1 then
					   menu[k]={JY.Thing[JY.Base[CC.EVB[5]..i]][CC.EVB[7]],nil,1};
					   menu2[k]={JY.Base[CC.EVB[5]..i],nil,1};
					   k=k+1
					 end
					end
				end

				local r;
				local c=1
				while c==1 do
				r=ShowMenu(menu,k-1,15,1,1,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE)
				if r>0 then
				  if DrawStrBoxYesNo(-1,-1,CC.EVB[8]..menu[r][1],C_ORANGE,CC.DefaultFont) then
				   instruct_32(menu2[r][1],-1) 
				   instruct_2(174,JY.Thing[menu2[r][1]][CC.EVB[16]]*2+math.random(150))
				   c=2   
				  else
				   Cls()  
				  end
				else
				  c=2
				end
				end
		   end
           
		   if JY.Base[CC.EVB[1]]==37 and keypress==VK_SPACE and JY.Base[CC.EVB[3]]==0 then
		      say(CC.EVB[17],500,0,CC.EVB[18])
			    local c=1;
				for i=1,200 do
					if JY.Base[CC.EVB[5]..i]==174 and JY.Base[CC.EVB[6]..i]>1000 then
                          c=2;					
						  if DrawStrBoxYesNo(-1,-1,CC.EVB[19],C_ORANGE,CC.DefaultFont) then
							 instruct_2(209,50) 
							 instruct_32(174,-1000)
							 break
						  else
							 say(CC.EVB[20])
							 break
						  end
					end	      
				end
				if c==1 then say(CC.EVB[21],500,0,CC.EVB[18]) end
           end	

		   if JY.Base[CC.EVB[1]]==38 and keypress==VK_SPACE and JY.Base[CC.EVB[3]]==0 then
				  say(CC.EVB[22],500,0,CC.EVB[23])
				  local c=1;
					for i=1,200 do
						if JY.Base[CC.EVB[5]..i]==174 and JY.Base[CC.EVB[6]..i]>1000 then	 
						   c=2
							  if DrawStrBoxYesNo(-1,-1,CC.EVB[24],C_ORANGE,CC.DefaultFont) then
								 instruct_2(210,30) 
								 instruct_32(174,-1000)
								 break
							  else
								 say(CC.EVB[20])
								 break
							  end
						end	      
					end
					if c==1 then say(CC.EVB[21],500,0,CC.EVB[23])	end
			end						   
	    end	  
end

function NEvent2(keypress) 
        if 	JY.SubScene==70 and GetD(70,3,0)==0 and instruct_18(151) then
		     instruct_3(70,3,1,0,0,0,0,2610,2610,2610,0,-2,-2)
		end
		
		if GetD(70,3,5)==2610 and JY.SubScene==70 and JY.Base[CC.EVB1]==8 and JY.Base[CC.EVB2]==41 and JY.Base[CC.EVB3]==2 then
		    if keypress==VK_SPACE then
			   say(CC.EVB4)
			   instruct_2(174,5000) 
			   SetS(10,0,17,0,1)
			   SetD(83,48,4,882)
			   --say(CC.EVB168)
			   --say(CC.EVB169)
			    local wpz={JY.Person[0]["拳掌功夫"],JY.Person[0]["御剑能力"],
                       JY.Person[0]["耍刀技巧"],JY.Person[0]["特殊兵器"] }
				local maxwp,maxnum=0;

				for i=1,4 do
					if wpz[i]>maxwp then 
						maxwp=wpz[i] 
						maxnum=i
					end
				end

				local swg={109,110,111,112};
                say(CC.EVB168)
				say("３Ｇ"..JY.Wugong[swg[maxnum]]["名称"].."ＨＷ"..CC.EVB220)
                if DrawStrBoxYesNo(-1,-1,CC.EVB221,C_WHITE,30) then
				   JY.Person[0]["武功1"]=swg[maxnum]
				   JY.Person[0]["武功等级1"]=900
				   QZXS(CC.EVB167..JY.Wugong[swg[maxnum]]["名称"].."』")
				else
                   say(CC.EVB222)	
                end				   						   
			   instruct_3(70,3,1,0,0,0,0,2612,2612,2612,0,-2,-2)
			end
		end
end

function NEvent3(keypress)
        if JY.SubScene==24 and JY.Base[CC.EVB1]==18 and JY.Base[CC.EVB2]==23 and JY.Base[CC.EVB3]==2 then  
	          if keypress==VK_SPACE then
			    if GetS(10,0,3,0)~=1 and instruct_16(1) and instruct_18(145) and JY.Person[1][CC.EVB5]==999 then
			         say(CC.EVB6,1)
			         say(CC.EVB7,3)
					 say(CC.EVB8,1)
					 for i=1,10 do
					       if JY.Person[1][CC.EVB9..i]==0 then
						      JY.Person[1][CC.EVB9..i]=44
							  JY.Person[1][CC.EVB10..i]=50
							   DrawStrBox(-1,-1,CC.EVB11,C_ORANGE,CC.DefaultFont)
								 ShowScreen();
								 lib.Delay(1000);
								 Cls();
							  break
							end
				     end
					  instruct_2(117,1)
					  SetS(10,0,3,0,1)
				end
			  end
		end
end

function NEvent4(keypress) 
        if JY.SubScene==7 and JY.Base[CC.EVB1]==34 and JY.Base[CC.EVB2]==11 and JY.Base[CC.EVB3]==2 then  
		   local ts=0;
		   for i=1,200 do 
		         if JY.Base[CC.EVB12..i]>143 and JY.Base[CC.EVB12..i]<158 then
				    ts=ts+1
				 end
		   end
		
	       if ts>11 and instruct_16(35) and instruct_18(114) and GetS(10,1,1,0)~=1 and JY.Person[35][CC.EVB5]==999 then
			  if keypress==VK_SPACE then
			     SetS(7,34,12,3,102)
				 instruct_3(7,102,1,0,0,0,0,7148,7148,7148,0,34,12)
			     say(CC.EVB13,35,1)
				 say(CC.EVB14,140,0)
				 say(CC.EVB15,35)
				 instruct_14()
				 SetS(7,33,12,3,101)
				 instruct_3(7,101,1,0,0,0,0,5896,5896,5896,0,33,12)				 
				 instruct_13()
				 PlayMIDI(24) 
                 lib.Delay(2000);				 
				 say(CC.EVB16,140,0)
			     say(CC.EVB17,140,0)
				 say(CC.EVB18,35,1)
				 instruct_14()
	             instruct_3(7,101,0,0,0,0,0,-1,-1,-1,0,33,12)			 
				 instruct_13()
				 DrawStrBox(-1,-1,CC.EVB19,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
                 lib.Delay(1000);
				 say(CC.EVB20,35,1)
				 DrawStrBox(-1,-1,CC.EVB21,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
                 lib.Delay(2000);
				 Cls();
				 DrawStrBox(-1,-1,CC.EVB22,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
                 lib.Delay(1000);
                 Cls();
				 SetS(10,1,1,0,1)
				 instruct_3(7,102,0,0,0,0,0,-1,-1,-1,0,34,12)				 
			  end
			end
	    end
end

function NEvent5(keypress) 
        if JY.SubScene==28 and JY.Base[CC.EVB1]==15 and JY.Base[CC.EVB2]==28 and JY.Base[CC.EVB3]==2 then  
	       if GetD(11,109,0)~=1 and (instruct_16(73) or instruct_18(114)) and instruct_18(219) and not instruct_18(155) then
			  if keypress==VK_SPACE then
			     say(CC.EVB23)
				 say(CC.EVB24,70)
                 instruct_2(155,1)
			  end
		   end
		end
end

function NEvent6(keypress) 
        if JY.SubScene==10 then 
		   SetD(10,28,4,-1) 
		   SetS(10,23,22,1,2)
		   SetS(10,22,22,1,2)
		end
		
		if JY.SubScene==59 then 
		   JY.SubSceneX=0;
           JY.SubSceneY=0;
		end
		
        if JY.SubScene==65 and (GetD(70,7,5)~=0 or GetD(70,8,5)~=0) then --狄云入队
	        instruct_3(65,1,0,0,0,0,0,-1,-1,-1,0,-2,-2)
		end
end

function NEvent7(keypress) 
        if JY.SubScene==80 and GetS(10,0,7,0)~=1 then 
		    SetS(80,15,19,3,31)
			instruct_3(80,31,1,0,0,0,0,6824,6824,6824,0,-2,-2) 
			
			if JY.Base[CC.EVB1]==16 and JY.Base[CC.EVB2]==19 and JY.Base[CC.EVB3]==2 then
               if keypress==VK_SPACE and GetS(10,0,7,0)~=1 then
			      say(CC.EVB25,300,0,CC.EVB26)
			      
			       local ts=0;
				   for i=1,200 do 
						 if JY.Base[CC.EVB12..i]>143 and JY.Base[CC.EVB12..i]<158 then
							ts=ts+1
						 end
				   end
				   
				  if ts>9 then
			   
			      say(CC.EVB27,300,0,CC.EVB26)
				 if DrawStrBoxYesNo(-1,-1,CC.EVB28,C_ORANGE,CC.DefaultFont) then				  
				  local X1,X2,X3,X4,Z1,Z2,Z3,Z4,D1,D2,D3,D4;
				   X1=JY.Person[50][CC.EVB29]
				   X2=JY.Person[50][CC.EVB30]
				   X3=JY.Person[50][CC.EVB31]
				   X4=JY.Person[50][CC.EVB32]
				   JY.Person[50][CC.EVB29]=-1
				   JY.Person[50][CC.EVB30]=-1
				   JY.Person[50][CC.EVB31]=-1
				   JY.Person[50][CC.EVB32]=-1
				   Z1=JY.Person[5][CC.EVB29]
				   Z2=JY.Person[5][CC.EVB30]
				   Z3=JY.Person[5][CC.EVB31]
				   Z4=JY.Person[5][CC.EVB32]
				   JY.Person[5][CC.EVB29]=-1
				   JY.Person[5][CC.EVB30]=-1
				   JY.Person[5][CC.EVB31]=-1
				   JY.Person[5][CC.EVB32]=-1
				   D1=JY.Person[27][CC.EVB29]
				   D2=JY.Person[27][CC.EVB30]
				   D3=JY.Person[27][CC.EVB31]
				   D4=JY.Person[27][CC.EVB32]
				   JY.Person[27][CC.EVB29]=-1
				   JY.Person[27][CC.EVB30]=-1
				   JY.Person[27][CC.EVB31]=-1
				   JY.Person[27][CC.EVB32]=-1
				   
				   say(CC.EVB33,300,0,CC.EVB26)
				   WarMain(229)
				   say(CC.EVB34,300,0,CC.EVB26)
				   WarMain(230)
				   say(CC.EVB35,300,0,CC.EVB26)
				   WarMain(231)
				   say(CC.EVB36,300,0,CC.EVB26)
				   WarMain(232)
				   say(CC.EVB37,300,0,CC.EVB26)
				   WarMain(233)
				   say(CC.EVB38,300,0,CC.EVB26)
				   WarMain(234)
				   
				   JY.Person[50][CC.EVB29]=X1
				   JY.Person[50][CC.EVB30]=X2
				   JY.Person[50][CC.EVB31]=X3
				   JY.Person[50][CC.EVB32]=X4
				   JY.Person[5][CC.EVB29]=Z1
				   JY.Person[5][CC.EVB30]=Z2
				   JY.Person[5][CC.EVB31]=Z3
				   JY.Person[5][CC.EVB32]=Z4
				   JY.Person[27][CC.EVB29]=D1
				   JY.Person[27][CC.EVB30]=D2
				   JY.Person[27][CC.EVB31]=D3
				   JY.Person[27][CC.EVB32]=D4
				  else
				   instruct_14()   
				   instruct_13()  
				  end
				   
				   say(CC.EVB39)
				   if GetS(10,0,6,0)==1 and GetS(4,5,5,5)~=8 then
					   JY.Person[0][CC.EVB40]=91
					   JY.Person[0][CC.EVB41]=900			   
					   JY.Wugong[91][CC.EVB42]=CC.EVB43
					   JY.Wugong[91][CC.EVB44]=1300
					   JY.Wugong[91][CC.EVB45]=6
						DrawStrBox(-1,-1,CC.EVB46,C_ORANGE,CC.DefaultFont)
						 ShowScreen();
						 lib.Delay(2000);
						 Cls();
						  DrawStrBox(-1,-1,CC.EVB47,C_ORANGE,CC.DefaultFont)
						 ShowScreen();
						 lib.Delay(2000);
						 SetS(10,0,12,0,1)
						 SetD(43,4,2,0)
						 say(CC.EVB48,300,0,CC.EVB26)
				   else
				       JY.Person[0][PSX[33]]=JY.Person[0][PSX[33]]+30
					   JY.Person[0][PSX[35]]=JY.Person[0][PSX[35]]+30
					   JY.Person[0][PSX[34]]=JY.Person[0][PSX[34]]+30
					   DrawStrBox(-1,-1,CC.EVB49,C_ORANGE,CC.DefaultFont)
						 ShowScreen();
						 lib.Delay(1000);
						 SetD(43,4,2,314)
						if T1LEQ(0) then
						   JY.Person[0]["武学常识"]=100
						   QZXS(CC.EVB192)
						   QZXS(CC.EVB194)
						end
						if T2SQ(0) then
						   QZXS(CC.EVB193)
						end
                    end	
					say(CC.EVB50,300,0,CC.EVB26)
                    SetS(10,0,7,0,1)
                    instruct_3(80,31,0,0,0,0,0,0,0,0,0,-2,-2) 

                 else
 				    say(CC.EVB51,300,0,CC.EVB26)
				 end
			   end
			end
		end
end

function NEvent8(keypress) 
        if JY.SubScene==43 and GetS(10,0,12,0)==1 then
		   if JY.Base[CC.EVB1]==17 and JY.Base[CC.EVB2]==27 and JY.Base[CC.EVB3]==2 then
	           if keypress==VK_SPACE then
			      say(CC.EVB52,5)
				  say(CC.EVB53,5)
	              if DrawStrBoxYesNo(-1,-1,CC.EVB54,C_WHITE,CC.DefaultFont) then
	                 if WarMain(22) then
					   PlayMIDI(3)
					   say(CC.EVB55,5)
					   --instruct_14() 
					   --instruct_13() 
					   say(CC.EVB56)
					   say(CC.EVB57)
					   CLJDH()
					   DrawStrBoxWaitKey(string.format(CC.EVB58,JY.Person[0][CC.EVB59]),C_ORANGE,30)
					   JY.Wugong[91][CC.EVB60]=CC.EVB61
					   JY.Wugong[91][CC.EVB62]=1600
					   SetS(10,0,12,0,0)
					   SetD(43,4,2,314)
					   SetS(10,0,11,0,1)
					   SetS(80,48,36,3,100)
					   instruct_3(80,100,0,0,0,0,2002,0,0,0,0,-2,-2)     
					   say(CC.EVB63,5)
					 else
					    say(CC.EVB64,5)
					 end
				  else
				      say(CC.EVB65,5)
				  end
	            end
			end	
		end
end		

function NEvent9(keypress) 
        if JY.SubScene==25 and GetS(10,0,8,0)~=1 and GetD(25,74,5)==2610 then --十五大
		    SetS(25,40,33,3,101)
			instruct_3(25,101,1,0,0,0,0,6824,6824,6824,0,-2,-2) 
			
			if JY.Base[CC.EVB1]==41 and JY.Base[CC.EVB2]==33 and JY.Base[CC.EVB3]==2 then
               if keypress==VK_SPACE then
			      say(CC.EVB66,300,0,CC.EVB26)
				    if DrawStrBoxYesNo(-1,-1,CC.EVB67,C_ORANGE,CC.DefaultFont) then
					   if JY.Person[0][CC.EVB68]>50 then
					      if WarMain(133) then
						     say(CC.EVB69,300,0,CC.EVB26)
							 instruct_14()    
							 JY.Base[CC.EVB1]=11
					         JY.Base[CC.EVB2]=44
						     instruct_13() 
							 SetS(10,0,8,0,1)
							 instruct_3(25,72,0,0,0,0,0,0,0,0,0,-2,-2) 
							 instruct_3(25,101,0,0,0,0,0,0,0,0,0,-2,-2) 
						   else
						      say(CC.EVB70,300,0,CC.EVB26)
						   end
					    else
						    if WarMain(134) then
					         say(CC.EVB69,300,0,CC.EVB26)
							 instruct_14()    
							 JY.Base[CC.EVB1]=11
					         JY.Base[CC.EVB2]=44
						     instruct_13() 
							 SetS(10,0,8,0,1)
							 instruct_3(25,72,0,0,0,0,0,0,0,0,0,-2,-2) 
							 instruct_3(25,101,0,0,0,0,0,0,0,0,0,-2,-2) 
							else
							  say(CC.EVB70,300,0,CC.EVB26)
						    end
					    end
					else
                        say(CC.EVB71,300,0,CC.EVB26)
					end
                end
            end
		end	
end

function NEvent10(keypress) 
        if JY.SubScene==25 and GetS(10,0,9,0)~=1 then			   
		    SetS(25,9,44,3,103)
			instruct_3(25,103,1,0,0,0,0,7100,7100,7100,0,-2,-2) 
			if JY.Base[CC.EVB1]==10 and JY.Base[CC.EVB2]==44 and JY.Base[CC.EVB3]==2 then
               if keypress==VK_SPACE and GetD(25,82,5)==4662 then
			      say(CC.EVB73,300,0,CC.EVB72)
			      instruct_14() 
				  for i=79,92 do
				       if i~=82 then
					      instruct_3(25,i,1,0,0,0,0,4664,4664,4664,0,-2,-2) 
					   end
				  end
				  for ii=144,157 do
				       if ii~=147 then
					      instruct_32(ii,-1)
					   end
				  end
				  instruct_13() 
				   say(CC.EVB74,300,0,CC.EVB72)
			      SetS(10,0,9,0,1)
				  instruct_3(25,103,0,0,0,0,0,0,0,0,0,-2,-2) 
			   end
			end
			for i=79,92 do			
				if GetD(25,i,5)~=4662 then 
					SetS(10,0,9,0,1)
					instruct_3(25,103,0,0,0,0,0,0,0,0,0,-2,-2) 
				end
			end
	    end
end

function NEvent11(keypress) 
        if JY.SubScene==104 and JY.Person[104][CC.s68]~=CC.s70 then
		   instruct_3(104,91,1,0,0,0,0,6086,6086,6086,0,-2,-2) 
		end
		
		if JY.SubScene==104 and JY.Base[CC.EVB1]==42 and JY.Base[CC.EVB2]==38 and JY.Base[CC.EVB3]==0 then
               if keypress==VK_SPACE and GetD(104,91,0)==1 then
			      say(CC.EVB76,104)
		          instruct_2(8,10) 
			      say(CC.EVB77,104)
				  instruct_3(104,91,0,0,0,0,0,0,0,0,0,-2,-2) 
				  JY.Person[104][CC.s68]=CC.s70
			   end
		end
end

function NEvent12(keypress) 
        if JY.SubScene==95 and GetD(95,4,5)~=0 then
		   if JY.Thing[40][CC.EVB78]~=-1 then		      
			  JY.Person[JY.Thing[40][CC.EVB78]][CC.EVB79]=-1
			  JY.Thing[40][CC.EVB78]=-1
			  JY.Thing[40][CC.EVB80]=10
			  JY.Thing[40][CC.EVB81]=20
		   end
		end
end

OEVENTLUA={};

OEVENTLUA[33]=function() 
     if instruct_16(4,2,0) ==false then 	 --  16(10):队伍是否有[阎基]是则跳转到:Label0        
		do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label0


    if instruct_16(72,2,0) ==false then    --  16(10):队伍是否有[田归农]是则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_14();   --  14(E):场景变黑
    instruct_37(-3);   --  37(25):增加道德-3
    instruct_3(3,9,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[有间客栈]:场景事件编号 [9]
    instruct_3(3,12,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[有间客栈]:场景事件编号 [12]
    instruct_3(3,11,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[有间客栈]:场景事件编号 [11]
    instruct_3(3,10,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[有间客栈]:场景事件编号 [10]
    instruct_3(-2,1,0,0,0,0,0,7994,7994,7994,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_1(171,72,1);   --  1(1):[田归农]说: 一切按计划行事
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(172,4,1);   --  1(1):[阎基]说: 您就放心吧，嘿嘿
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_30(41,31,35,31);   --  30(1E):主角走动41-31--35-31
    instruct_1(173,72,1);   --  1(1):[田归农]说: 苗兄，别来无恙？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(50,3,0);   --  1(1):[苗人凤]说: 姓田的，亏你还有脸来见我*！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(51,72,1);   --  1(1):[田归农]说: 苗兄，何必这么大的火气，*伤了你我兄弟的和气。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(52,3,0);   --  1(1):[苗人凤]说: ……**她还好吗？……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(174,72,1);   --  1(1):[田归农]说: ＜这个死阎基怎么还不动手*……＞
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(175,4,1);   --  1(1):[阎基]说: 着——！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(176,3,0);   --  1(1):[苗人凤]说: 啊——
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,1,0,0,0,0,0,5212,5212,5212,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(177,72,1);   --  1(1):[田归农]说: 哈哈，我看你是见不到她了*。这药是从毒手药王那弄来*的断肠草粉末，药效也真够*狠，现下你双眼已瞎，我看*"打遍天下无敌手"的金面佛*苗人凤，今日要上西天了，*小兄弟，咱们上！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(178,1,0);   --  1(1):[胡斐]说: 苗大侠莫慌，我来帮你。
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(0,4,0,0) ==false then    --  6(6):战斗[0]是则跳转到:Label2
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_15(0);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label2

    instruct_3(-2,1,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_2(144,1);   --  2(2):得到物品[飞狐外传][1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(117,1);   --  2(2):得到物品[苗家剑法][1]
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_31(10000,0,7) ==true then    --  31(1F):判断银子是否够10000否则跳转到:Label3
        instruct_2(225,1);   --  2(2):得到物品[闯王藏宝图][1]
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_39(5);   --  39(27):打开场景山洞
        do return; end
    end    --:Label3


    if instruct_31(5000,0,8) ==true then    --  31(1F):判断银子是否够5000否则跳转到:Label4
        instruct_2(226,1);   --  2(2):得到物品[闯王藏宝图][1]
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_39(84);   --  39(27):打开场景山洞
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label4

    instruct_2(227,1);   --  2(2):得到物品[闯王藏宝图][1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_39(85);   --  39(27):打开场景山洞
end

OEVENTLUA[50]=function() 
    if GetS(4,5,5,5)==6 then return end

    if instruct_28(0,5,999,6,0) ==false then    --  28(1C):判断AAA品德2-999是则跳转到:Label0
        instruct_1(235,0,1);   --  1(1):[AAA]说: 功德箱里已经没有钱了……
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label0

    instruct_1(234,0,1);   --  1(1):[AAA]说: 功德箱里有一些香火钱，现*在四下无人，我是不是拿来*一点花花？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_11(0,8) ==true then    --  11(B):是否住宿否则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_2(174,100);   --  2(2):得到物品[银两][30]
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_37(-5);   --  37(25):增加道德-2
        do return; end
    end    --:Label1

end

OEVENTLUA[51]=function() 

    if instruct_4(174,0,21) ==true then    --  4(4):是否使用物品[银两]？否则跳转到:Label0

        if instruct_31(100,6,0) ==false then    --  31(1F):判断银子是否够100是则跳转到:Label1
            instruct_1(237,0,1);   --  1(1):[AAA]说: 我身上的银子也不多了……
            instruct_0();   --  0(0)::空语句(清屏)
            do return; end
        end    --:Label1

        instruct_1(236,0,1);   --  1(1):[AAA]说: 银子太多了也没啥用，拿出*100两做慈善事业吧。
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_32(174,-100);   --  32(20):物品[银两]+[-100]
		if JY.Person[0]["品德"]<65 then
           instruct_37(1);   --  37(25):增加道德1
		end
        do return; end
    end    --:Label0

    instruct_0();   --  0(0)::空语句(清屏)
end
      

OEVENTLUA[56]=function() 
    instruct_3(-2,-2,1,0,0,0,0,2608,2608,2608,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
	if GetS(4,5,5,5)==3 then say(CC.s52) end
	instruct_0();   --  0(0)::空语句(清屏)   
    instruct_2(138,1);   --  2(2):得到物品[玄虚刀法][1]
    instruct_0();   --  0(0)::空语句(清屏)   
end

OEVENTLUA[198]=function() 
    --instruct_1(3997,0,0);   --  1(1):[AAA]说: 李姑娘，你先回小村，有需*要时，我再去找你帮忙。
    say(string.sub(JY.Person[92][CC.s23],1,2)..CC.EVB210,0,5)
	instruct_0();   --  0(0)::空语句(清屏)
    instruct_21(92);   --  21(15):[李沅芷]离队
    instruct_3(70,1,1,0,199,0,0,7266,7266,7266,-2,-2,-2);   --  3(3):修改事件定义:场景[小村]:场景事件编号 [1]
end

OEVENTLUA[199]=function() 
    --instruct_1(390,92,0);   --  1(1):[???]说: 有需要我帮忙的地方吗？
    instruct_0();   --  0(0)::空语句(清屏)
	say(CC.EVB211,JY.Person[92]["头像代号"],0,JY.Person[92][CC.s23])

    if instruct_9(0,29) ==true then    --  9(9):是否要求加入?否则跳转到:Label0

        if instruct_20(20,0) ==false then    --  20(14):队伍是否满？是则跳转到:Label1
            instruct_10(92);   --  10(A):加入人物[李沅芷]
            instruct_14();   --  14(E):场景变黑
            instruct_3(-2,-2,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
            instruct_0();   --  0(0)::空语句(清屏)
            instruct_13();   --  13(D):重新显示场景
            do return; end
        end    --:Label1

        instruct_1(391,92,0);   --  1(1):[???]说: 你的队伍已满，我无法加入。
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0
end

OEVENTLUA[267]=function()    
    instruct_1(793,0,1);   --  1(1):[AAA]说: 看我的，乾坤大挪移——！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_57();   --  57(39):高昌迷宫劈门
    instruct_3(-2,3,0,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,4,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_3(-2,2,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(11,100,0,0,0,0,0,0,0,0,-2,-2,-2);	
end

OEVENTLUA[292]=function() 
    instruct_1(793,0,1);   --  1(1):[AAA]说: 看我的，乾坤大挪移——！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_57();   --  57(39):高昌迷宫劈门
    instruct_3(-2,3,0,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,4,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_3(-2,2,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_3(9,1,1,0,293,0,0,5296,5296,5296,-2,-2,-2);   --  3(3):修改事件定义:场景[成崑居]:场景事件编号 [1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(963,0,1);   --  1(1):[AAA]说: 不知道这成昆跑哪去了，应*该离此不远吧，我好好找找*。
    instruct_0();   --  0(0)::空语句(清屏)
	instruct_3(11,100,0,0,0,0,0,0,0,0,-2,-2,-2);
end

OEVENTLUA[315]=function() 
    if instruct_16(9,2,0) ==false then    --  16(10):队伍是否有[张无忌]是则跳转到:Label0
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label0

    instruct_37(1);   --  37(25):增加道德1
    instruct_1(1111,9,1);   --  1(1):[张无忌]说: 太师父，太师父，*无忌回来看你了。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1112,5,0);   --  1(1):[张三丰]说: 无忌，真的是你。好孩子，*你没有死，翠山可有後了。*是蝶谷医仙将你医好的吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1113,9,1);   --  1(1):[张无忌]说: 不是的。我是有了一番奇遇*。。。。如此如此。。。。*这般这般。。。*後来修习了九阳神功，*才将我身上的寒毒化去。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1114,5,0);   --  1(1):[张三丰]说: 很好，很好，真难为你了。*现在你已经做了明教的教主*，记得要约束教众，不可为*非作歹。*记得常存侠义之心，*才是我辈中人。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1115,9,1);   --  1(1):[张无忌]说: 太师父教诲，无忌谨记在心*。。。。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1124,5,0);   --  1(1):[张三丰]说: 这是当年我传授你爹的一套*武功，如今就传给你吧。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(169,1);   --  2(2):得到物品[倚天屠龙功][1]
    instruct_0();   --  0(0)::空语句(清屏)
	say(CC.EVB91,5)
	instruct_14() 
	instruct_13() 
    local tjq=0;
    for a=1,10 do
         if JY.Person[9]["武功"..a]==16 then 
		    tjq=1 
			break;
	     end
    end
	if tjq==0 then JY.Person[9]["武功2"]=16 end	
	JY.Person[9]["武功等级2"]=50
	for a=1,10 do
	     if JY.Person[9]["武功"..a]==0 then
		    JY.Person[9]["武功"..a]=46
			JY.Person[9]["武功等级"..a]=50
			break;
	     end
	end
    instruct_1(1125,9,0);   --  1(1):[张无忌]说: 多谢太师父
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1116,5,0);   --  1(1):[张三丰]说: 呵呵呵，翠山有后了，翠山*有后了……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,5,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [5]
    instruct_3(-2,10,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [10]
    instruct_3(-2,9,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [9]
    instruct_3(-2,8,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [8]
    instruct_3(-2,7,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [7]
    instruct_3(-2,6,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [6]
    instruct_0();   --  0(0)::空语句(清屏)
end

OEVENTLUA[331]=function() 
    instruct_1(1231,201,0);   --  1(1):[???]说: 金龙帮弟子正在练功，这是*我们最新设计的343阵法。*我是金龙帮总教头，姓米，*名卢，是宋代着名书法家米*芾的后人。
    instruct_0();   --  0(0)::空语句(清屏)
    say(CC.s47,201,5,"米卢")
end

OEVENTLUA[353]=function() 
    instruct_3(-2,-2,1,0,361,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_1(1323,0,1);   --  1(1):[AAA]说: 姑娘……可是这金龙帮之人*？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1324,239,0);   --  1(1):[???]说: 是又怎么样？你想连我也一*起杀么？你来呀，你来呀！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1325,245,1);   --  1(1):[???]说: 哼，别说这些人不是我杀的*，就算是我杀的又如何？不*过是为了帮闵二爷报仇而已*。你这小丫头再跟我罗嗦，*我就让你和他们一样！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1326,239,0);   --  1(1):[???]说: 你杀了我容易，可是你想要*的东西就永远得不到了。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1327,0,1);   --  1(1):[AAA]说: 什么东西？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1328,239,0);   --  1(1):[???]说: 你不是在找十四天书吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1329,0,1);   --  1(1):[AAA]说: 神啊，为什么每个人都知道*我要找十四天书……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1330,239,0);   --  1(1):[???]说: 其中一本《碧血剑》，只有*我知道在哪里。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1331,0,1);   --  1(1):[AAA]说: 那你要怎么样？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1332,239,0);   --  1(1):[???]说: 我要你替我金龙帮报仇！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1333,0,1);   --  1(1):[AAA]说: 你让我去杀闵子华？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1334,239,0);   --  1(1):[???]说: 哼，仙都派那几个人，本姑*娘我自由办法对付。在灭我*金龙帮的人当中，有几个是*华山派穆人清的徒弟，哼哼*，你帮我把他们杀了，《碧*血剑》一书就是你的了。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1335,0,1);   --  1(1):[AAA]说: ……为了天书，好，我答应*你，你也要说话算话，不许*反悔！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1336,239,0);   --  1(1):[???]说: 那是自然。听说穆人清有个*徒弟叫袁承志，刚刚去了云*南五仙教，你就先去找他吧*。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1337,244,1);   --  1(1):[???]说: ＜袁公子，你不要怪我，虽*然我们也算是朋友，不过现*在……＞
    instruct_0();   --  0(0)::空语句(清屏)   
    instruct_3(96,0,0,0,0,0,354,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:场景[五仙教]:场景事件编号 [0]
    instruct_17(95,0,12,48,986);   --  17(11):修改场景贴图:场景[大功坊]层0坐标C-30
    instruct_3(95,10,1,0,343,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[大功坊]:场景事件编号 [10]
    instruct_37(-1);   --  37(25):增加道德-1
end

OEVENTLUA[360]=function() 
    instruct_3(-2,-2,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(156,1);   --  2(2):得到物品[碧血剑][1]
    instruct_0();   --  0(0)::空语句(清屏)
	say(CC.EVB170)
    instruct_14()  
    instruct_13()  
	instruct_3(-2,4,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_3(-2,14,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [14]
    instruct_3(-2,15,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [15]
    instruct_3(-2,9,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [9]
    instruct_3(-2,8,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [8]
    instruct_3(-2,7,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [7]
    instruct_3(-2,6,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [6]
    instruct_3(-2,5,0,0,0,0,0,0,0,0,-2,-2,-2); 
end

OEVENTLUA[621]=function() 
    --instruct_1(2678,0,1);   --  1(1):[AAA]说: 这些图画，似乎记载着某种*武功……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,-2,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
end

OEVENTLUA[690]=function() 
    local r=JYMsgBox(CC.EVB153,CC.EVB154,CC.EVB155,3,261);
    if r==2 then	   
		instruct_14();   --  14(E):场景变黑
		instruct_12();   --  12(C):住宿休息
		instruct_13();   --  13(D):重新显示场景
		instruct_1(2830,261,0);   --  1(1):[???]说: 公子，早上好！*昨晚休息的好吗？*赶快开始新的旅程吧！
		instruct_0();   --  0(0)::空语句(清屏)
	elseif r==1 then
	                JY.Person[445]["等级"]=JY.Person[0]["等级"]*30
					JY.Person[446]["等级"]=JY.Person[445]["等级"]					                                                                    
					JY.Person[445]["头像代号"]=math.random(190)
					JY.Person[446]["头像代号"]=math.random(190)
					JY.Person[445]["生命最大值"]=50
					JY.Person[446]["生命最大值"]=50
					JY.Person[445]["生命"]=JY.Person[445]["生命最大值"]
					JY.Person[446]["生命"]=JY.Person[446]["生命最大值"]
					
					instruct_6(226,8,0,1) 
					
					JY.Person[445]["等级"]=10
					JY.Person[446]["等级"]=10
					                                                                    
					JY.Person[445]["头像代号"]=208
					JY.Person[446]["头像代号"]=208
	end				
end

OEVENTLUA[691]=function() 
    instruct_66(42);   --  66(42):播放音乐2
    instruct_3(-2,0,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [0]
    instruct_19(16,31);   --  19(13):主角移动至10-1F
    instruct_40(2);   --  40(28):改变主角站立方向2
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_30(16,31,9,31);   --  30(1E):主角走动16-31--9-31 
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,62,0,0,0,0,0,8250,8250,8250,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [62]
    instruct_3(-2,4,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]   
    --instruct_13();   --  13(D):重新显示场景	
    instruct_0();   --  0(0)::空语句(清屏)
    --instruct_14();   --  14(E):场景变黑
    instruct_3(-2,2,1,0,690,0,0,6086,6086,6086,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_0();   --  0(0)::空语句(清屏)
    --instruct_13();   --  13(D):重新显示场景 
    instruct_32(174,400);   --  2(2):得到物品[银两][400]
    instruct_0();   --  0(0)::空语句(清屏)   
    instruct_32(234,1);   --  2(2):得到物品[介绍信][1]
    instruct_0();   --  0(0)::空语句(清屏)   
    instruct_32(182,1);   --  2(2):得到物品[罗盘][1]
    instruct_0();   --  0(0)::空语句(清屏)   
    --instruct_14();   --  14(E):场景变黑
    instruct_3(-2,4,1,0,695,0,0,8250,8250,8250,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_3(-2,3,1,0,694,0,0,5098,5098,5098,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,61,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [61]
    instruct_3(-2,62,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [62]
    instruct_39(19);   --  39(27):打开场景重阳宫
    instruct_39(101);   --  39(27):打开场景黎山洞
    instruct_39(36);   --  39(27):打开场景青城派
    instruct_39(28);   --  39(27):打开场景少林寺
    instruct_39(93);   --  39(27):打开场景少室山下
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
end

OEVENTLUA[707]=function() 
   instruct_1(2879,210,0);
   local lhq=0;
   if JY.Scene[1]["进入条件"]==0 then
        for i=1,200 do
	        if JY.Base["物品" .. i]==112 then
		      lhq=1
			  break;
			end
		end
		if lhq==0 then 
		   instruct_32(112,1) 
		   SetD(28,11,2,0)
		end
	end
end

OEVENTLUA[712]=function() 
    instruct_1(2884,210,0);   --  1(1):[???]说: 少林铜人巷，每个人只有一*次挑战机会，你想挑战吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(2,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
       
    else
		instruct_1(2881,210,0);   --  1(1):[???]说: 好，施主里边请！
		instruct_0();   --  0(0)::空语句(清屏)
		instruct_19(41,14);   --  19(13):主角移动至29-E
		instruct_0();   --  0(0)::空语句(清屏)
            if instruct_6(217,0,7,1) ==true then    --  6(6):战斗[217]否则跳转到:Label3
                instruct_19(41,7);   --  19(13):主角移动至29-7
                instruct_0();   --  0(0)::空语句(清屏)
                instruct_13();   --  13(D):重新显示场景
                instruct_0();   --  0(0)::空语句(清屏)
            else
			    instruct_19(42,17);   --  19(13):主角移动至2A-11
				instruct_0();   --  0(0)::空语句(清屏)
				instruct_13();   --  13(D):重新显示场景
				instruct_3(-2,-2,1,0,709,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号					
            end    
    end
end

OEVENTLUA[714]=function() 
    instruct_3(-2,-2,1,0,0,0,0,2952,2952,2952,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
	if GetS(10,0,16,0)==1 then
       instruct_2(85,1);   --  2(2):得到物品[易筋经][1]
	else
	
	end
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,25,1,0,713,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [25]
    instruct_19(42,17);   --  19(13):主角移动至2A-11
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
end

OEVENTLUA[882]=function() 
    instruct_0();
end

OEVENTLUA[1082]=function() 
    mm4R();
 
    say(CC.EVB205,JY.Person[92]["头像代号"],0,"???") 

    if instruct_9(57,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
         instruct_3(-2,-2,0,0,0,0,0,0,0,0,-2,-2,-2);
		 say(CC.EVB206,JY.Person[92]["头像代号"],0,"???") 
		return;
    end    --:Label0

    if instruct_20(20,0) ==false then    --  20(14):队伍是否满？是则跳转到:Label3
        instruct_14();   --  14(E):场景变黑
        instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_10(92);   --  10(A):加入人物[李沅芷]
        do return; end
    end    --:Label3

    --instruct_1(12,92,0);   --  1(1):[???]说: 你的队伍已满，我就直接去*小村吧。
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(70,1,1,0,199,0,0,7266,7266,7266,-2,-2,-2);   --  3(3):修改事件定义:场景[小村]:场景事件编号 [1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
end
  
OEVENTLUA[2001]=function() 
    say(CC.s49)
    if WarMain(237) then
	
	else
	    instruct_15()
		
	end
	instruct_3(13,101,0,0,0,0,0,0,0,0,0,-2,-2)
    instruct_3(13,102,0,0,0,0,0,0,0,0,0,-2,-2)
end

OEVENTLUA[2002]=function() 
  instruct_3(80,100,0,0,0,0,2005,0,0,0,0,-2,-2)
end

OEVENTLUA[2003]=function() 
    local itemG={
         [0]=20,50,150,20,50,100,150,120,300,10,30, --10
		 80,40,100,200,150,200,300,50,100,150,  --20
		 200,40,80,120,180,300,300,10,20,40, --30
		 60,60,70,70,100,900,1000,300,400,600, --40
		 500,300,900,700,600,500,400,300,1000,800, --50
		 500,500,400,400,2000,2000,2000,1200,800,750, --60
		 650,550,400,800,800,700,600,700,800,700, --70
		 800,700,800,900,700,700,900,1100,800,900, --80
		 900,900,1200,1200,1200,1200,1100,900,700,700, --90
		 800,600,1100,700,700,800,700,700,600,600, --100
		 700,600,600,500,500,400,300,400,400,300, --110
		 400,100,1200,1200,1000,1000,800,1000,700,600, --120
		 600,600,700,600,500,500,500,500,500,400, --130
		 400,400,300,200,1000,1000,800,700,700,700, --140
		 600,500,400,0,0,0,0,0,0,0, --150
		 0,0,0,0,0,0,0,400,300,400, --160
         500,400,300,400,200,150,1000,800,750,750, --170
		 700,650,600,0,600,500,400,400,450,450, --180
		 350,0,450,500,300,200,600,400,500,300, --190
		 450,450,550,0,0,0,0,0,0,0, --200
		 0,0,0,0,0,0,0,0,10,20, --210
		 0,0,0,0,0,0,0,0,0,1000, --220
		 1000,0,0,0,0,0,0,0,0,700, --230
		 0,0,0,0,800,900 --236
		 }

  while true do
	say(CC.EVB127,223,0,CC.EVB128)
	local item=MenuDSJ();
	if item>-1 then 
		if DrawStrBoxYesNo(-1,-1,CC.EVB129..JY.Thing[item]["名称"]..CC.EVB130,C_WHITE,30) then
		    if item<36 then
		       Cls();
		       DrawStrBoxWaitKey(CC.EVB131,C_WHITE,30)
			   local items=0;
			    for i=1,200 do
			        if JY.Base["物品"..i]==item then 
					   items=JY.Base["物品数量"..i] 
					   break;
					end
				end
			    local T={};
				for a=1,1000 do
					 local b=""..a
					 T[b]=a
				end
				local r=GetPinyin1(32,CC.ScreenH-CC.Fontbig*6)
			    if T[r]~=nil and T[r]<=items then
				   instruct_32(item,-T[r]) 
		           instruct_2(174,itemG[item]*T[r])
                else
                   DrawStrBoxWaitKey(CC.EVB132,C_WHITE,30)
 				end   
		    else
			    if JY.Thing[item]["使用人"]==-1 then
				    if item~=40 then
		                instruct_32(item,-1) 
		                instruct_2(174,itemG[item]-math.random(30)) 
			        else
					    say(CC.EVB150,223,0,CC.EVB128)
						if instruct_16(54) then
						   say(CC.EVB151,54,5)
						   say(CC.EVB152,223,0,CC.EVB128)
						   instruct_32(item,-1) 
		                   instruct_2(174,itemG[item]-math.random(30)) 
			            end
				    end
				else
				   DrawStrBoxWaitKey(CC.EVB149,C_WHITE,30)
			    end
			end		   		   
		end
	end
	Cls();
	if DrawStrBoxYesNo(-1,-1,CC.EVB133,C_WHITE,30) then
		
    else
       break;
    end	   
  end
end

OEVENTLUA[2004]=function()
    say(CC.EVB134,223,0,CC.EVB128)
	if instruct_31(1000) then
        local r=JYMsgBox(CC.EVB135,CC.EVB136,CC.EVB137,3,223);
	    Cls();
		if r==1 then
	       instruct_2(210,30) 
		   instruct_32(174,-1000)
		elseif r==2 then
		   instruct_2(209,50) 
		   instruct_32(174,-1000)
		else
		   say(CC.EVB138,0,5)
		end
    else
	     say(CC.EVB139,0,5)
	end
end

OEVENTLUA[2005]=function()     
    instruct_3(80,100,0,0,0,0,0,0,0,0,0,-2,-2) 
	if JY.Thing[202][WZ7]>1 then
	   SetS(80,25,25,3,101)
	   instruct_3(80,101,1,0,2006,0,0,3437*2,3421*2,3414*2,10,-2,-2)
    end
end

OEVENTLUA[2006]=function() 
    PlayMIDI(31) 	
    say(CC.EVB157,1000,0,CC.EVB164)
	say(CC.EVB158,1000,0,CC.EVB164)
	if DrawStrBoxYesNo(-1,-1,CC.EVB165,C_GOLD,30) then
	   say(CC.EVB160,1000,0,CC.EVB164)
	   say(CC.EVB161,1000,0,CC.EVB164)
	   say(CC.EVB162,1000,0,CC.EVB164)
	   say(CC.EVB163,1000,0,CC.EVB164)
	   PlayMIDI(100) 
	   PlayWavAtk(43)
	    if WarMain(238) then
	      say(CC.EVB196,1000,0,CC.EVB164)
		  
		  JY.Person[0]["武学常识"]=100
		  AddPersonAttrib(0,"攻击力",30); 
		  AddPersonAttrib(0,"防御力",30); 
		  AddPersonAttrib(0,"轻功",30); 
		  QZXS(JY.Person[0]["姓名"]..CC.EVB197)
		  SetS(10,0,21,0,1)
		else
		  say(CC.EVB198,1000,0,CC.EVB164)
		  
		  AddPersonAttrib(0,"武学常识",50); 
		  QZXS(CC.EVB199)
		end
	else
	   say(CC.EVB159,1000,0,CC.EVB164)
	end
	instruct_3(80,101,0,0,0,0,0,0,0,0,0,-2,-2)
end	

PNLBD={};

PNLBD[0]=function() 
  JY.Person[1]["生命"]=750
  JY.Person[1]["生命最大值"]=750
  JY.Person[1]["内力"]=2500
  JY.Person[1]["内力最大值"]=2500
  JY.Person[1]["攻击力"]=130
  JY.Person[1]["防御力"]=130
  JY.Person[1]["轻功"]=180
  JY.Person[1]["受伤程度"]=0
  JY.Person[1]["中毒程度"]=0
  JY.Person[1]["武功1"]=67
  JY.Person[1]["武功等级1"]=999
end

PNLBD[16]=function() 
  JY.Person[37]["生命"]=850
  JY.Person[37]["生命最大值"]=850
  JY.Person[37]["内力"]=5000
  JY.Person[37]["内力最大值"]=5000
  JY.Person[37]["攻击力"]=120
  JY.Person[37]["防御力"]=170
  JY.Person[37]["轻功"]=120
  JY.Person[37]["受伤程度"]=0
  JY.Person[37]["中毒程度"]=0
  JY.Person[37]["武功等级1"]=999
  JY.Person[37]["武功等级2"]=999
  JY.Person[37]["武功2"]=63
end

PNLBD[34]=function() 
  JY.Person[36]["生命"]=650
  JY.Person[36]["生命最大值"]=650
  JY.Person[36]["内力"]=3000
  JY.Person[36]["内力最大值"]=3000
  JY.Person[36]["攻击力"]=180
  JY.Person[36]["防御力"]=130
  JY.Person[36]["轻功"]=220
  JY.Person[36]["受伤程度"]=0
  JY.Person[36]["中毒程度"]=0
  JY.Person[36]["武功等级1"]=999
end

PNLBD[75]=function() 
  JY.Person[58]["生命"]=850
  JY.Person[58]["生命最大值"]=850
  JY.Person[58]["内力"]=5500
  JY.Person[58]["内力最大值"]=5500
  JY.Person[58]["攻击力"]=230
  JY.Person[58]["防御力"]=200
  JY.Person[58]["轻功"]=180
  JY.Person[58]["受伤程度"]=0
  JY.Person[58]["中毒程度"]=0
  JY.Person[58]["武功等级1"]=999
  JY.Person[58]["武功等级2"]=999
  JY.Person[58]["武功等级3"]=999
  
  JY.Person[59]["生命"]=750
  JY.Person[59]["生命最大值"]=750
  JY.Person[59]["内力"]=3500
  JY.Person[59]["内力最大值"]=3500
  JY.Person[59]["攻击力"]=190
  JY.Person[59]["防御力"]=170
  JY.Person[59]["轻功"]=220
  JY.Person[59]["受伤程度"]=0
  JY.Person[59]["中毒程度"]=0
  JY.Person[59]["武功等级1"]=999
  JY.Person[59]["武功2"]=107
  JY.Person[59]["武功等级2"]=999
end

PNLBD[138]=function() 
  JY.Person[75]["生命"]=650
  JY.Person[75]["生命最大值"]=650
  JY.Person[75]["内力"]=3000
  JY.Person[75]["内力最大值"]=3000
  JY.Person[75]["攻击力"]=140
  JY.Person[75]["防御力"]=120
  JY.Person[75]["轻功"]=130
  JY.Person[75]["受伤程度"]=0
  JY.Person[75]["中毒程度"]=0
  JY.Person[75]["武功等级1"]=999
end

PNLBD[165]=function() 
  JY.Person[54]["生命"]=750
  JY.Person[54]["生命最大值"]=750
  JY.Person[54]["内力"]=3500
  JY.Person[54]["内力最大值"]=3500
  JY.Person[54]["攻击力"]=180
  JY.Person[54]["防御力"]=180
  JY.Person[54]["轻功"]=180
  JY.Person[54]["受伤程度"]=0
  JY.Person[54]["中毒程度"]=0
  JY.Person[54]["武功等级1"]=999
  JY.Person[54]["武功等级2"]=999
end

PNLBD[170]=function() 
  JY.Person[38]["生命"]=950
  JY.Person[38]["生命最大值"]=950
  JY.Person[38]["内力"]=5000
  JY.Person[38]["内力最大值"]=5000
  JY.Person[38]["攻击力"]=200
  JY.Person[38]["防御力"]=200
  JY.Person[38]["轻功"]=160
  JY.Person[38]["受伤程度"]=0
  JY.Person[38]["中毒程度"]=0
  JY.Person[38]["武功等级1"]=999
  JY.Person[38]["武功等级2"]=999
end

PNLBD[197]=function()
  JY.Person[48]["生命"]=850
  JY.Person[48]["生命最大值"]=850
  JY.Person[48]["内力"]=3000
  JY.Person[48]["内力最大值"]=3000
  JY.Person[48]["攻击力"]=150
  JY.Person[48]["防御力"]=130
  JY.Person[48]["轻功"]=100
  JY.Person[48]["受伤程度"]=0
  JY.Person[48]["中毒程度"]=0
  JY.Person[48]["武功等级1"]=999
  JY.Person[48]["武功等级2"]=999
  JY.Person[48]["武功2"]=108
end

PNLBD[198]=function()
  JY.Person[51]["生命"]=750
  JY.Person[51]["生命最大值"]=750
  JY.Person[51]["内力"]=3000
  JY.Person[51]["内力最大值"]=3000
  JY.Person[51]["攻击力"]=180
  JY.Person[51]["防御力"]=160
  JY.Person[51]["轻功"]=120
  JY.Person[51]["受伤程度"]=0
  JY.Person[51]["中毒程度"]=0
  JY.Person[51]["武功等级1"]=999
end

function mm4R()
	local r;
	if JY.Thing[202][WZ7]==1 then
	   r=math.random(2)
	else
	   r=math.random(4)
	end
	local bdnl={"姓名", "头像代号", "生命最大值", "内力最大值",
					   "内力性质", "攻击力", "轻功","防御力",
					   "拳掌功夫", "御剑能力", "耍刀技巧", "特殊兵器",
					   "资质","武功1" }
	local mm4={};
	mm4[1]={"周芷若",301,350,600,0,60,50,50,30,30,0,0,71,41};
	mm4[2]={"赵敏",302,270,500,1,70,40,50,0,40,0,0,78,37};
	mm4[3]={"郭襄",303,200,500,2,40,40,40,20,20,20,20,73,12};
	mm4[4]={"陆无双",304,400,700,0,70,40,60,0,0,40,0,64,54};

	for i=1,14 do
		JY.Person[92][bdnl[i]]=mm4[r][i]
	end

	JY.Person[92]["等级"]=10

	for i=1,5 do
		JY.Person[92]["出招动画帧数"..i]=0
		JY.Person[92]["出招动画延迟"..i]=0
		JY.Person[92]["武功音效延迟"..i]=0      
	end			  

	local avi={ {14,6,7},{8,3,4},{0,0,0},{7,4,5}, }

	JY.Person[92]["出招动画帧数1"]=avi[r][1]
	JY.Person[92]["出招动画延迟1"]=avi[r][3]
	JY.Person[92]["武功音效延迟1"]=avi[r][2]

	if r==3 then
	   local s={ {0,0,0},{9,2,3},{8,3,4},{8,3,4},{9,5,6}, }
	   for i=1,5 do
			JY.Person[92]["出招动画帧数"..i]=s[i][1]
			JY.Person[92]["出招动画延迟"..i]=s[i][3]
			JY.Person[92]["武功音效延迟"..i]=s[i][2]  
	   end
	end 
end	

function CLJDH() 
           
end

function ZBXS() 
           
end

function DHZFXS(s) 
    for i=1,20 do
		  NewDrawString(-1,-1,s,C_GOLD,20+i)
		  ShowScreen();
			if i==20 then
			   lib.Delay(20);
			else
			   lib.Delay(1);
			end						
	end	
end	

function STARTDH() 
         
end

function JYZTB() 
	
	local mode=0;
	if JY.Thing[202][WZ7]==1 then
	   mode="易"
	elseif JY.Thing[202][WZ7]==2 then
	   mode="普"
	else
	   mode="难"
	end
	
	local t=math.modf(((lib.GetTime()-JY.LOADTIME)/60000)+GetS(14,2,1,4))
	local t1,t2=0,0;
	while t>=60 do
	   t=t-60
	   t1=t1+1
	end
	t2=t
	DrawBox(10,10,205,70,M_Yellow);	
	
	DrawString(15,15,string.format(CC.s54,JY.Person[0]["品德"],JY.GOLD),C_GOLD,20)
	if JY.WGLVXS==1 then
	   
    else
	   DrawString(15,40,string.format(CC.s55,t1,t2),C_GOLD,20)	
	end
end

function WSHOW()
     ShowScreen();
	 WaitKey();
end

function JLSD(s1,s2,dw) 
    local s=math.random(100)
	if inteam(dw) then
		if s>s1 and s<s2 then
		   return true;
		else
		   return false;
		end
    else
	    if s>s1-5 and s<s2+5 then
		   return true;
		else
		   return false;
		end
	end
end

function CurIDTXDH(id,DH1,DH2,str)
        local x0,y0=WAR.Person[id]["坐标X"],WAR.Person[id]["坐标Y"];
		local hb=GetS(JY.SubScene,x0,y0,4)
		if CONFIG.Zoom==1 then
			hb=hb*2;
		end	
		local MAX=1;
		if DH1>DH2 then MAX=-1 end			
		local ssid=lib.SaveSur(0,0,CC.ScreenW,CC.ScreenH);
		for ii=DH1,DH2,MAX do	
				lib.PicLoadCache(3,ii*2,CC.ScreenW/2,CC.ScreenH/2-hb,2,192)													
				if str~=nil then
				   NewDrawString(-1,-1,str,C_GOLD,30)
				end
				ShowScreen();
				lib.Delay(10);
				lib.LoadSur(ssid,0,0);
		end
		lib.FreeSur(ssid);
		Cls();
end


function CXDYWPSX()
    JY.Thing[235]["仅修炼人物"]=-1
	JY.Thing[235]["需资质"]=-30
	JY.Thing[118]["需御剑能力"]=0
	JY.Thing[118]["需资质"]=80
	JY.Thing[118]["需内力"]=2000
	JY.Thing[118]["加拳掌功夫"]=1
	JY.Thing[118]["加御剑能力"]=1
	JY.Thing[118]["加耍刀技巧"]=1
	JY.Thing[118]["加特殊兵器"]=1
	JY.Thing[114]["需资质"]=0
	JY.Thing[114]["需御剑能力"]=0
	JY.Thing[114]["仅修炼人物"]=35
	JY.Thing[86]["需拳掌功夫"]=120
	JY.Thing[113]["需内力"]=6000
	JY.Thing[77]["需内力性质"]=2
	JY.Thing[71]["需内力性质"]=2
	JY.Thing[101]["加御剑能力"]=1
	JY.Thing[123]["加拳掌功夫"]=1
	JY.Thing[90]["加攻击力"]=2
	JY.Thing[220]["仅修炼人物"]=-1
	JY.Thing[221]["仅修炼人物"]=-1
	JY.Thing[139]["物品说明"]=CC.WARS128
	
	local DA=0;
	for DA=135,143 do
	JY.Thing[DA]["加防御力"]=1
	end
	local TS=0;
	for TS=167,181 do
	if TS~=174 then JY.Thing[TS]["加轻功"]=1 end
	end
	
	JY.Thing[220]["需要物品数量4"]=25
	JY.Thing[221]["需要物品数量4"]=25
	
	JY.Thing[89]["名称"]=CC.QSQJ
	JY.Thing[178]["名称"]=CC.DJDP
	JY.Thing[25]["加内力最大值"]=300
	
	JY.Wugong[109]["攻击力10"]=1600
	JY.Wugong[110]["攻击力10"]=1500
	JY.Wugong[111]["攻击力10"]=1500
	JY.Wugong[112]["攻击力10"]=1400
	
	 JY.Person[4]["武功1"]=67
	 JY.Person[4]["武功等级1"]=50
     JY.Person[9]["武功2"]=7
     JY.Person[9]["武功等级2"]=900
	 JY.Person[9]["医疗能力"]=60
     JY.Person[9]["解毒能力"]=60
	 JY.Person[50]["武功等级1"]=999	
     JY.Person[64]["携带物品数量2"]=0
	 JY.Person[516]["武功1"]=112
	 JY.Person[516]["武功等级1"]=999	 
	 JY.Person[541]["武功等级1"]=0
	 JY.Person[541]["武功1"]=0	  
	 JY.Person[91]["性别"]=1
	 JY.Person[92]["性别"]=1
	 JY.Person[129]["武功2"]=17
	 JY.Person[129]["武功等级2"]=999
	 JY.Person[17]["携带物品数量1"]=1
	 JY.Person[29]["携带物品数量1"]=1
	 JY.Person[60]["武功2"]=104
	 JY.Person[60]["攻击力"]=220
	 JY.Person[60]["防御力"]=180
	 JY.Person[60]["轻功"]=160
	 JY.Person[65]["武功2"]=100
	 JY.Person[84]["拳掌功夫"]=20
	 JY.Person[84]["特殊兵器"]=60
	 
	 
	JY.Shop[4]["物品价格5"]=8000
	JY.Shop[0]["物品价格5"]=6000
	
	for i=2,6 do
	       JY.Base["队伍"..i]=-1
	end
    JY.Base["队伍1"]=0
	for i=1,200 do
	       JY.Base["物品"..i]=-1
		   JY.Base["物品数量"..i]=0
	end
	for i=0,236 do
	     JY.Thing[i][WZ5]=Rnd(10)+1
		 JY.Thing[i][WZ6]=Rnd(10)+1
		 JY.Thing[i][WZ7]=Rnd(10)+1
	end
	for i=0,113 do
	    for ii=1,5 do
		      JY.Wugong[i][WZ..ii]=Rnd(20000)+10000
		end
	end
end

function MenuDSJ() 
    local menu={ {"全部物品",nil,0},
                 {"剧情物品",nil,0},
                 {"神兵宝甲",nil,1},
                 {"武功秘笈",nil,1},
                 {"灵丹妙药",nil,1},
                 {"伤人暗器",nil,1}, };

    local r=ShowMenu(menu,CC.TeamNum,0,CC.MainSubMenuX,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

	if r>0 then
        local thing={};
        local thingnum={};

		for i = 0,CC.MyThingNum-1 do
			thing[i]=-1;
			thingnum[i]=0;
		end

        local num=0
		for i = 0,CC.MyThingNum-1 do
		    local id=JY.Base["物品" .. i+1];
			if id>=0 then
				if r==1 then
					thing[i]=id
					thingnum[i]=JY.Base["物品数量" ..i+1];
				else
					if JY.Thing[id]["类型"]==r-2 then             --对应于类型0-4
 					    thing[num]=id;
					    thingnum[num]=JY.Base["物品数量" ..i+1];
						num=num+1;
					end
				end
			end
		end
		local r=SelectThing(thing,thingnum);
		if r>=0 then
		   return r;		
        end		   
    end
	return -1;
end

SN={};
	for a=1,100000 do
	    local b=""..a
	    SN[b]=a
	end


function say(s,pid,flag,name)          --个人新对话
--新对话方式
--加入控制字符
--暂停，任意键后继续，ｐ
--控制颜色 Ｒ=redＧ=goldＢ=blackＷ=whiteＯ=orange
--控制字符显示速度０－９
--控制字体ＡＳＤＦ
--控制换行Ｈ分页Ｐ
--Ｎ代表自己ｎ代表主角
    local picw=130;       --最大头像图片宽高
	local pich=130;
	local talkxnum=18;         --对话一行字数
	local talkynum=3;          --对话行数
	local dx=2;
	local dy=2;
    local boxpicw=picw+10;
	local boxpich=pich+10;
	local boxtalkw=talkxnum*CC.DefaultFont+10;
	local boxtalkh=boxpich-27;
	pid=pid or 0
	if flag==nil then
		if pid==0 then
			flag=1
		else
			flag=0
		end
	end
	name=name or JY.Person[pid]["姓名"]
    local talkBorder=(pich-talkynum*CC.DefaultFont)/(talkynum+1);

	--显示头像和对话的坐标
    local xy={ [0]={headx=dx,heady=dy,
	                talkx=dx+boxpicw+2,talky=dy+27,
					namex=dx+boxpicw+2,namey=dy,
					showhead=1},--左上
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=CC.ScreenH-dy-boxpich,
				    talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky= CC.ScreenH-dy-boxpich+27,
					namex=CC.ScreenW-1-dx-boxpicw-96,namey=CC.ScreenH-dy-boxpich,
					showhead=1},--右下
                   {headx=dx,heady=dy,
				   talkx=dx+boxpicw-43,talky=dy+27,
					namex=dx+boxpicw+2,namey=dy,
				   showhead=0},--上中
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=CC.ScreenH-dy-boxpich,
				   talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky= CC.ScreenH-dy-boxpich+27,
					namex=CC.ScreenW-1-dx-boxpicw-96,namey=CC.ScreenH-dy-boxpich,
					showhead=0},
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=dy,
				    talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky=dy+27,
					namex=CC.ScreenW-1-dx-boxpicw-96,namey=dy,
					showhead=1},--右上
                   {headx=dx,heady=CC.ScreenH-dy-boxpich,
				   talkx=dx+boxpicw+2,talky=CC.ScreenH-dy-boxpich+27,
					namex=dx+boxpicw+2,namey=CC.ScreenH-dy-boxpich,
				   showhead=1}, --左下
			}

    if flag<0 or flag>5 then
        flag=0;
    end
	
	local headid=pid--JY.Person[pid]["头像代号"]
	if pid==0 then
	    if GetS(4,5,5,5)<8 then 
		   headid=280+GetS(4,5,5,5) 
		else
		   headid=287+GetS(4,5,5,4) 
		end
	end
	
    if xy[flag].showhead==0 then
        headid=-1;
    end


    if CONFIG.KeyRepeat==0 then
	     lib.EnableKeyRepeat(0,CONFIG.KeyRepeatInterval);
	end
    lib.GetKey();
	
	local function readstr(str)
		local T1={"０","１","２","３","４","５","６","７","８","９"}
		local T2={{"Ｒ",C_RED},{"Ｇ",C_GOLD},{"Ｂ",C_BLACK},{"Ｗ",C_WHITE},{"Ｏ",C_ORANGE}}
		local T3={{"Ｈ",CC.FontNameSong},{"Ｓ",CC.FontNameHei},{"Ｆ",CC.FontName}}
		--美观起见，针对不同字体同一行显示，需要微调ｙ坐标，以及字号
		--以默认的字体为标准，启体需下移，细黑需上移
		for i=0,9 do
			if T1[i+1]==str then return 1,i*50 end
		end
		for i=1,5 do
			if T2[i][1]==str then return 2,T2[i][2] end
		end
		for i=1,3 do
			if T3[i][1]==str then return 3,T3[i][2] end
		end
		return 0
	end
	
	local function mydelay(t)
		if t<=0 then return end
		lib.ShowSurface(0)
		lib.Delay(t)
	end
	
	local page,cy,cx=0,0,0
	local color,t,font=C_WHITE,0,CC.FontName
	while string.len(s)>1 do
		if page==0 then				--新的一页，清屏，显示头像
			Cls()
            if headid>=0 then
                DrawBox(xy[flag].headx, xy[flag].heady, xy[flag].headx + boxpicw, xy[flag].heady + boxpich,C_WHITE);
				DrawBox(xy[flag].namex,xy[flag].namey,xy[flag].namex+96,xy[flag].namey+24,C_WHITE)
				MyDrawString(xy[flag].namex,xy[flag].namex+96,xy[flag].namey+1,name,C_ORANGE,21)
				local w,h=lib.PicGetXY(1,headid*2);
                local x=(picw-w)/2;
				local y=(pich-h)/2;
				lib.PicLoadCache(1,headid*2,xy[flag].headx+5+x,xy[flag].heady+5+y,1);
            end
            DrawBox(xy[flag].talkx, xy[flag].talky, xy[flag].talkx +boxtalkw, xy[flag].talky + boxtalkh,C_WHITE);			
			page=1
		end
		local str
		str=string.sub(s,1,1)
		if str=='*' then
			str='Ｈ'
			s=string.sub(s,2,-1)
		else
			str=string.sub(s,1,2)
			s=string.sub(s,3,-1)
		end
		--开始控制逻辑
		if str=="Ｈ" then
			cx=0
			cy=cy+1
			if cy==3 then
				cy=0
				page=0
			end
		elseif str=="Ｐ" then
			cx=0
			cy=0
			page=0
		elseif str=="ｐ" then
			ShowScreen();
			WaitKey();	
			lib.Delay(100)	
		elseif str=="Ｎ" then
			s=JY.Person[pid]["姓名"]..s
		elseif str=="ｎ" then
			s=JY.Person[0]["姓名"]..s
		else 
			local kz1,kz2=readstr(str)
			if kz1==1 then
				t=kz2
			elseif kz1==2 then
				color=kz2
			elseif kz1==3 then
				font=kz2
			else
				lib.DrawStr(xy[flag].talkx+CC.DefaultFont*cx+5,
							xy[flag].talky+(CC.DefaultFont+talkBorder)*cy+talkBorder-8,
							str,color,CC.DefaultFont,font,0,0)
				mydelay(t)
				cx=cx+1
				if cx==talkxnum then
					cx=0
					cy=cy+1
					if cy==talkynum then
						cy=0
						page=0
					end
				end
			end
		end
		--如果换页，则显示，等待按键
		if page==0 or string.len(s)<2 then
			ShowScreen();
			WaitKey();
			lib.Delay(100)
		end
	end


    if CONFIG.KeyRepeat==0 then
	     lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay,CONFIG.KeyRepeatInterval);
	end

	Cls();
end

function TalkEx_bak(s,headid,flag)          --复杂版本对话
	local pid=0
	local name=''
	for i=0,600 do
		if JY.Person[i]==nil then
			pid=0
			break;
		elseif JY.Person[i]["头像代号"]==headid then
			pid=i
			name=JY.Person[i]["姓名"]
			break;
		end
	end
	say(s,headid,flag,name)
end

function GenTalkString(str,n)              --产生对话显示需要的字符串，即每隔n个中文字符加一个星号
    local tmpstr="";
    for s in string.gmatch(str .. "*","(.-)%*") do           --去掉对话中的所有*. 字符串尾部加一个星号，避免无法匹配
        tmpstr=tmpstr .. s;
    end

    local newstr="";
    while #tmpstr>0 do
		local w=0;
		while w<#tmpstr do
		    local v=string.byte(tmpstr,w+1);          --当前字符的值
			if v>=128 then
			    w=w+2;
			else
			    w=w+1;
			end
			if w >= 2*n-1 then     --为了避免跨段中文字符
			    break;
			end
		end

        if w<#tmpstr then
		    if w==2*n-1 and string.byte(tmpstr,w+1)<128 then
				newstr=newstr .. string.sub(tmpstr,1,w+1) .. "*";
				tmpstr=string.sub(tmpstr,w+2,-1);
			else
				newstr=newstr .. string.sub(tmpstr,1,w)  .. "*";
				tmpstr=string.sub(tmpstr,w+1,-1);
			end
		else
		    newstr=newstr .. tmpstr;
			break;
		end
	end
    return newstr;
end

function Talk(s,personid)            --最简单版本对话
    local flag;
    if personid==0 then
        flag=1;
	else
	    flag=0;
	end
	TalkEx(s,JY.Person[personid]["头像代号"],flag);	
end

function TalkEx(s,headid,flag)          --复杂版本对话
    local picw=130;       --最大头像图片宽高
	local pich=130;
	local talkxnum=18;         --对话一行字数
	local talkynum=3;          --对话行数
	local dx=2;
	local dy=2;
    local boxpicw=picw+10;
	local boxpich=pich+10;
	local boxtalkw=12*CC.DefaultFont+10;
	local boxtalkh=boxpich;

    local talkBorder=(pich-talkynum*CC.DefaultFont)/(talkynum+1);

	--显示头像和对话的坐标
    local xy={ [0]={headx=dx,heady=dy,
	                talkx=dx+boxpicw+2,talky=dy,
					showhead=1},
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=CC.ScreenH-dy-boxpich,
				    talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky= CC.ScreenH-dy-boxpich,
					showhead=1},
                   {headx=dx,heady=dy,
				   talkx=dx+boxpicw+2,talky=dy,
				   showhead=0},
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=CC.ScreenH-dy-boxpich,
				   talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky= CC.ScreenH-dy-boxpich,
					showhead=1},
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=dy,
				    talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky=dy,showhead=1},
                   {headx=dx,heady=CC.ScreenH-dy-boxpich,talkx=dx+boxpicw+2,talky=CC.ScreenH-dy-boxpich,showhead=1}, }

    if flag<0 or flag>5 then
        flag=0;
    end

    if xy[flag].showhead==0 then
        headid=-1;
    end

	if string.find(s,"*") ==nil then
	    s=GenTalkString(s,12);
	end

    if CONFIG.KeyRepeat==0 then
	     lib.EnableKeyRepeat(0,CONFIG.KeyRepeatInterval);
	end
    lib.GetKey();

    local startp=1
    local endp;
    local dy=0;
    while true do
        if dy==0 then
		    Cls();
            if headid>=0 then
			    if headid>243 and headid<249 then headid=0 end
                if headid==0 then 				   
						if GetS(4,5,5,5)<8 then 
						   headid=280+GetS(4,5,5,5) 
						else
						   headid=287+GetS(4,5,5,4) 
						end
				end				
				DrawBox(xy[flag].headx, xy[flag].heady, xy[flag].headx + boxpicw, xy[flag].heady + boxpich,C_WHITE);
				local w,h=lib.PicGetXY(1,headid*2);
                local x=(picw-w)/2;
				local y=(pich-h)/2;
				lib.PicLoadCache(1,headid*2,xy[flag].headx+5+x,xy[flag].heady+5+y,1);
                
				if headid>0 and headid<190 then
				   DrawString(xy[flag].headx+5+x,xy[flag].heady+5+y+110,JY.Person[headid]["姓名"],C_GOLD,20)
				end  

		   end
            DrawBox(xy[flag].talkx, xy[flag].talky, xy[flag].talkx +boxtalkw, xy[flag].talky + boxtalkh,C_WHITE);
        end
        endp=string.find(s,"*",startp);
        if endp==nil then
            DrawString(xy[flag].talkx + 5, xy[flag].talky + 5+talkBorder + dy * (CC.DefaultFont+talkBorder),string.sub(s,startp),C_WHITE,CC.DefaultFont);
            ShowScreen();
            WaitKey();
            break;
        else
            DrawString(xy[flag].talkx + 5, xy[flag].talky + 5+talkBorder + dy * (CC.DefaultFont+talkBorder),string.sub(s,startp,endp-1),C_WHITE,CC.DefaultFont);
        end
        dy=dy+1;
        startp=endp+1;
        if dy>=talkynum then
            ShowScreen();
            WaitKey();
            dy=0;
        end
    end

    if CONFIG.KeyRepeat==0 then
	     lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay,CONFIG.KeyRepeatInterval);
	end

	Cls();	
end

function MyDrawString(x1,x2,y,str,color,size) 
	local len=math.modf(string.len(str)*size/4)
	local x=math.modf((x1+x2)/2)-len
    DrawString(x,y,str,color,size);
end

function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitIndex,nSplitArray
end

TFNLJS={};

TFNLJS["胡斐"]="Ｇ【天赋：魂系一刀】ＨＷ胡家刀招式发动率大幅提升，增加三招胡刀秘传技ＰＧ【称号：雪山飞狐】ＨＷ集气速度增加十点"

TFNLJS["程灵素"]="Ｇ【称号：毒手药仙】ＨＷ用毒上限五百，攻击时敌全体中毒二十点"

TFNLJS["田归农"]="Ｇ【称号：天龙掌门】ＨＷ亲手杀掉苗人凤，攻，防，轻各增长二十点，雷震剑法换为苗剑一级"

TFNLJS["阎基"]="Ｇ【称号：雁过拨毛】ＨＷ击退敌人获得银两"

TFNLJS["狄云"]="Ｇ【天赋：赤心连城】ＨＷ攻击效果受主角品德影响，越高加成越多ＰＧ【称号：真名神照】ＨＷ神照功满血复活，复活后立即行动"

TFNLJS["花铁干"]="Ｇ【称号：中平神枪】ＨＷ中平枪法攻击额外追加杀集气能力"       
 
TFNLJS["萧峰"]="Ｇ【天赋：奋英雄怒】ＨＷ暴击机率百分之百；二连击机率百分之六十ＰＧ【称号：狂龙天征】ＨＷ降龙十八掌极意发动率百分之百"                        

TFNLJS["虚竹"]="Ｇ【天赋：福缘深厚】ＨＷ攻击后百分之五十机率从集气槽五分之一处开始集气ＰＧ【称号：逍遥掌门】ＨＷ使用天山六阳掌一定机率打出生死符，大幅杀集气"                        

TFNLJS["段誉"]="Ｇ【天赋：磊落仁心】ＨＷ无视资质对内力上限的影响ＰＧ【称号：六脉真传】ＨＷ六脉神剑大招发动率百分之六十"                  

TFNLJS["慕容复"]="Ｇ【天赋：离合参商】ＨＷ斗转发动机率大幅提升ＰＧ【称号：姑苏慕容】ＨＷ斗转星移耗内力值减少"

TFNLJS["王语嫣"]="Ｇ【天赋：博闻强记】ＨＷ无视任何限制条件修炼任何秘籍ＰＧ【称号：琅嬛仙子】ＨＷ提升队伍武常及队伍特效发动机率"     

TFNLJS["鸠摩智"]="Ｇ【称号：大轮明王】ＨＷ使用火焰刀攻击时使对手附加受伤三十点"                                

TFNLJS["游坦之"]="Ｇ【天赋：心无所住】ＨＷ能使用任意内功攻击ＰＧ【称号：冰毒怪客】ＨＷ所有攻击带毒兩百四十点"  

TFNLJS["阿紫"]="Ｇ【称号：铁丑之主】ＨＷ与游坦之同在战场时，游坦之攻击必暴击"                          

TFNLJS["岳老三"]="Ｇ【称号：凶神恶煞】ＨＷ暴击时伤害效果两倍"

TFNLJS["薛慕华"]="Ｇ【称号：阎王敌】ＨＷ医疗上限五百点　复活同伴一次"
 
TFNLJS["郭靖"]="Ｇ【天赋：大器晚成】ＨＷ最后五级成长时，每级能力加成点数增加五点ＰＧ【称号：侠之大者】ＨＷ降龙十八掌极意发动率百分之三十"  

TFNLJS["黄蓉"]="Ｇ【天赋：兰心慧质】ＨＷ修炼秘籍成功时兵器值成长两倍ＰＧ【称号：奇术无双】ＨＷ战前可进行布阵"
                 
TFNLJS["周伯通"]="Ｇ【天赋：童真永留】ＨＷ左右互搏必发动ＰＧ【称号：顽童武痴】ＨＷ每行动一次攻击效果提升百分之十"

TFNLJS["黄药师"]="Ｇ【称号：桃花岛主】ＨＷ攻击时敌全体内力减少一千，如内力不足时，内力变为零，再减生命一百"

TFNLJS["欧阳峰"]="Ｇ【天赋：倒行逆施】ＨＷ被攻击必定进入走火入魔状态ＰＧ【称号：西毒】ＨＷ攻击时无视对方抗毒能力追加三十点中毒"

TFNLJS["洪七公"]="Ｇ【称号：北丐】ＨＷ降龙十八掌极意发动率百分之五十"

TFNLJS["梅超风"]="Ｇ【称号：铁尸魔煞】ＨＷ九阴白骨爪威力两倍"

TFNLJS["苏荃"]="Ｇ【天赋：媚眼如丝】ＨＷ敌全体攻击效果降百分之十"

TFNLJS["阿珂"]="Ｇ【天赋：倾国倾城】ＨＷ敌全体防御效果降百分之十"

TFNLJS["令狐冲"]="Ｇ【天赋：灵奇洒脱】ＨＷ自带能力限界突破，战斗中移动力提升三格ＰＧ【称号：九剑传人】ＨＷ进入战斗立即行动"

TFNLJS["东方不败"]="Ｇ【称号：唯我不败】ＨＷ二连击机率百分之百；三连击机率百分之六十"

TFNLJS["任盈盈"]="Ｇ【天赋：琴铮盈盈】ＨＷ使用扶瑶琴攻击时机率发动七弦无琴剑气：敌全体减生命一百点ＰＧ【称号：日月圣姑】ＨＷ与令狐冲在战场时使用扶瑶琴攻击机率发动笑傲江湖：两人体力受伤全回复"

TFNLJS["蓝凤凰"]="Ｇ【称号：五毒教主】ＨＷ攻击威力提升百分之十；用毒上限四百点"

TFNLJS["林平之"]="Ｇ【称号：辟邪剑客】ＨＷ不受自宫的惩罚影响；学习葵花神功后领悟葵花移行；葵花神功可攻击"

TFNLJS["岳灵姗"]="Ｇ【称号：慧中灵剑】ＨＷ每修习一种剑法并且等级达到极之后，自身攻击伤害效果提升百分之五"

TFNLJS["田伯光"]="Ｇ【称号：万里独行】ＨＷ集气速度提升，战场上已方人员越少提升越多"

TFNLJS["平一指"]="Ｇ【称号：杀人名医】ＨＷ医疗上限五百点　战斗中集气速度随杀敌数上升"

TFNLJS["陈家洛"]="Ｇ【称号：天池红花】ＨＷ升级时兵器值高成长"

TFNLJS["霍青桐"]="Ｇ【天赋：巾帼之才】ＨＷ我方全体防御效果上升百分之十ＰＧ【称号：翠羽黄衫】ＨＷ使用三分剑术攻击杀敌体力十五点"

TFNLJS["张召重"]="Ｇ【天赋：勇猛精进】ＨＷ我方全体攻击效果上升百分之十ＰＧ【称号：火手判官】ＨＷ攻击时使对手受伤程度翻倍"

TFNLJS["杨过"]="Ｇ【天赋：逆流勇进】ＨＷ生命百分之五十以下暴击率两倍；百分之二十五以下暴击率三倍ＰＧ【称号：西狂】ＨＷ攻击时追加西狂之怒啸，敌全员集气减一百"

TFNLJS["小龙女"]="Ｇ【天赋：冷剑冰霜】ＨＷ左右发动机率上升ＰＧ【称号：联心素女】ＨＷ以玉女素心剑攻击必定连击"

TFNLJS["程英"]="Ｇ【天赋：外和内刚】ＨＷ生命百分之五十以下伤害上升百分之二十ＰＧ【称号：青萧落瑛】ＨＷ使用玉萧剑法攻击杀敌内力三百点"

TFNLJS["金轮法王"]="Ｇ【称号：元蒙帝师】ＨＷ任何攻击大幅追加杀集气能力"

TFNLJS["霍都"]="Ｇ【称号：吾乃蛮夷】ＨＷ任何攻击追加杀集气能力"

TFNLJS["石破天"]="Ｇ【天赋：质朴刚健】ＨＷ个人特效发动率增加十点ＰＧ【称号：白首太玄】ＨＷ太玄神功提升特效发动机率效果为两倍"

TFNLJS["贝海石"]="Ｇ【称号：老谋深算】ＨＷ每次受到攻击自动回血五十点，医疗上限四百点"

TFNLJS["张无忌"]="Ｇ【天赋：谁与争峰】ＨＷ内功加力及护体发动机率百分之百ＰＧ【称号：九阳明尊】ＨＷ发动乾坤大挪移时反弹伤害百分之八十；或受到攻击以九阳神功反震攻击者百分之二十伤害"

TFNLJS["宋青书"]="Ｇ【天赋：我为伊狂】ＨＷ战场上我方女性角色越多其攻击效果越高Ｐ"

TFNLJS["小昭"]="Ｇ【称号：波斯圣女】ＨＷ敌全体移动减三格"

TFNLJS["朱九真"]="Ｇ【称号：灵獒毒娇】ＨＷ在战场上低机率发现食材"

TFNLJS["王难姑"]="Ｇ【称号：毒手姑婆】ＨＷ用毒上限四百点"

TFNLJS["胡青牛"]="Ｇ【称号：蝶谷医仙】ＨＷ医疗上限五百点　药品效果上升　可向队友用药"

TFNLJS["袁承志"]="Ｇ【天赋：志垂日月】ＨＷ自动恢复内伤ＰＧ【称号：气侠风雷】ＨＷ暴击率提升百分之三十"

TFNLJS["温青青"]="Ｇ【称号：青青子衿】ＨＷ使用雷震剑法攻击随机一至三倍威力"

TFNLJS["何铁手"]="Ｇ【称号：铁袖拂风】ＨＷ攻击威力提升百分之十；用毒上限四百点"

TFNLJS["萧中慧"]="Ｇ【称号：鸳鸯刀客】ＨＷ使用夫妻刀法攻击必暴击"

TFNLJS["祖千秋"]="Ｇ【称号：酒神】ＨＷ被攻击时机率发动酒神秘踪步，闪躲攻击"

TFNLJS["人厨子"]="Ｇ【称号：食神】ＨＷ攻击不减体力"
