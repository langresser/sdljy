
function IncludeFile()              --��������ģ��
    dofile(CONFIG.ScriptPath .. "CY_CCTable.lua")
	dofile(CONFIG.ScriptPath .. "CY_Fight.lua")	
    dofile(CONFIG.ScriptPath .. "readkdef.hsk")			
	dofile(CONFIG.ScriptPath .. "SAI.lua")
	
end

function SetGlobal()   --������Ϸ�ڲ�ʹ�õ�ȫ�̱���   
   JY={};

   JY.Status=0--GAME_INIT;  --��Ϸ��ǰ״̬
   --JY.IN=GAME_INIT
   --����R������
   JY.Base={};           --��������
   JY.PersonNum=0;      --�������
   JY.Person={};        --��������
   JY.ThingNum=0        --��Ʒ����
   JY.Thing={};         --��Ʒ����
   JY.SceneNum=0        --��Ʒ����
   JY.Scene={};         --��Ʒ����
   JY.WugongNum=0        --��Ʒ����
   JY.Wugong={};         --��Ʒ����
   JY.ShopNum=0        --�̵�����
   JY.Shop={};         --�̵�����
         
   JY.Data_Base=nil;     --ʵ�ʱ���R*����
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

   JY.MyCurrentPic=0;       --���ǵ�ǰ��·��ͼ����ͼ�ļ���ƫ��
   JY.MyPic=0;              --���ǵ�ǰ��ͼ
   JY.MyTick=0;             --����û����·�ĳ���֡��
   JY.MyTick2=0;            --��ʾ�¼������Ľ���
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
  
   JY.EnterSceneXY=nil;     --������볡�������꣬��ֵ���Խ��룬Ϊnil�����¼��㡣

   JY.oldMMapX=-1;          --�ϴ���ʾ����ͼ�����ꡣ�����ж��Ƿ���Ҫȫ���ػ���Ļ
   JY.oldMMapY=-1;
   JY.oldMMapPic=-1;        --�ϴ���ʾ����ͼ������ͼ

   JY.SubScene=-1;          --��ǰ�ӳ������
   JY.SubSceneX=0;          --�ӳ�����ʾλ��ƫ�ƣ������ƶ�ָ��ʹ��
   JY.SubSceneY=0;

   JY.Darkness=0;             --=0 ��Ļ������ʾ��=1 ����ʾ����Ļȫ��

   JY.CurrentD=-1;          --��ǰ����D*�ı��
   JY.OldDPass=-1;          --�ϴδ���·���¼���D*���, �����δ���
   JY.CurrentEventType=-1   --��ǰ�����¼��ķ�ʽ 1 �ո� 2 ��Ʒ 3 ·��

   JY.oldSMapX=-1;          --�ϴ���ʾ������ͼ�����ꡣ�����ж��Ƿ���Ҫȫ���ػ���Ļ
   JY.oldSMapY=-1;
   JY.oldSMapXoff=-1;       --�ϴγ���ƫ��
   JY.oldSMapYoff=-1;
   JY.oldSMapPic=-1;        --�ϴ���ʾ������ͼ������ͼ

   JY.D_Valid=nil           --��¼��ǰ������Ч��D�ı�ţ�����ٶȣ�����ÿ����ʾ�������ˡ���Ϊnil�����¼���
   JY_D_Valld_Num=0;        --��ǰ������Ч��D����

   JY.D_PicChange={}        --��¼�¼������ı䣬�Լ���Clip
   JY.NumD_PicChange=0;     --�¼������ı�ĸ���

   JY.CurrentThing=-1;      --��ǰѡ����Ʒ�������¼�ʹ��

   JY.MmapMusic=-1;         --�л����ͼ���֣���������ͼʱ��������ã��򲥷Ŵ�����

   JY.CurrentMIDI=-1;       --��ǰ���ŵ�����id�������ڹر�����ʱ��������id��
   JY.EnableMusic=1;        --�Ƿ񲥷����� 1 ���ţ�0 ������
   JY.EnableSound=1;        --�Ƿ񲥷���Ч 1 ���ţ�0 ������
   JY.TF=0;

   JY.ThingUseFunction={};          --��Ʒʹ��ʱ���ú�����SetModify����ʹ�ã����������͵���Ʒ
   JY.SceneNewEventFunction={};     --���ó����¼�������SetModify����ʹ�ã�����ʹ���³����¼������ĺ���
   
   
   WAR={};     --ս��ʹ�õ�ȫ�̱�����������ռ��λ�ã���Ϊ������治������ȫ�ֱ����ˡ�����������WarSetGlobal������
   AutoMoveTab={[0]=0}
   Bright={}
   CC.Light=200
   CC.Sight=120
   --setBright(light,sight) 
   --WAR.LT=light
   --WAR.ST=sight
   
end

function JY_Main()        --���������
	os.remove("debug.txt");        --�����ǰ��debug���
    xpcall(JY_Main_sub,myErrFun);     --������ô���
end

function myErrFun(err)      --��������ӡ������Ϣ
    lib.Debug(err);                 --���������Ϣ
    lib.Debug(debug.traceback());   --������ö�ջ��Ϣ
end

function JY_Main_sub()        --��������Ϸ���������   
    IncludeFile();         --��������ģ��
    SetGlobalConst();    --����ȫ�̱���CC, ����ʹ�õĳ���
    SetGlobal();         --����ȫ�̱���JY
    
    GenTalkIdx();        --���ɶԻ�idx

    SetModify();         --���öԺ������޸ģ������µ���Ʒ���¼��ȵ�

    --��ֹ����ȫ�̱���
    setmetatable(_G,{ __newindex =function (_,n)
                       error("attempt read write to undeclared variable " .. n,2);
                       end,
                       __index =function (_,n)
                       error("attempt read read to undeclared variable " .. n,2);
                       end,
                     }  );
    lib.Debug("JY_Main start.");

	math.randomseed(os.time());          --��ʼ�������������

	lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay,CONFIG.KeyRePeatInterval);   --���ü����ظ���

    JY.Status=GAME_START;

    lib.PicInit(CC.PaletteFile);       --����ԭ����256ɫ��ɫ��

    --lib.PlayMPEG(CONFIG.DataPath .. "start.mpg",VK_ESCAPE);
 
	
	Cls();

    PlayMIDI(30);
	lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);	
	

	local menu={  {"���¿�ʼ",nil,1},
	              {"�������",nil,1},
	              {"�뿪��Ϸ",nil,1}  };
	local menux=(CC.ScreenW-4*CC.StartMenuFontSize-2*CC.MenuBorderPixel)/2
    
	DrawString(650,580,CC.EVB107,C_WHITE,20)
    --ShowScreen();
    	
	local menuReturn=ShowMenu(menu,3,0,menux,CC.StartMenuY+30,0,0,0,0,35,C_STARTMENU, C_GOLD)

    if menuReturn == 1 then        --���¿�ʼ��Ϸ
		ClsN();	
		PlayMIDI(31);
		
		ShowScreen();
		STARTDH()
		JY.Status=GAME_START2
        --lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK)
		SBLNewGame(); 		--��������Ϸ����		

        JY.SubScene=CC.NewGameSceneID;         --����Ϸֱ�ӽ��볡��
        --JY.Scene[JY.SubScene]["����"]=JY.Person[0]["����"] .. "��";
        JY.Base["��X1"]=CC.NewGameSceneX;
        JY.Base["��Y1"]=CC.NewGameSceneY;
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
		

	elseif menuReturn == 2 then         --����ɵĽ���
		Cls();
    	local loadMenu={ {"����һ",nil,1},
	                     {"���ȶ�",nil,1},
	                     {"������",nil,1} };

	    local menux=(CC.ScreenW-3*CC.StartMenuFontSize-2*CC.MenuBorderPixel)/2

    	local r=ShowMenu(loadMenu,3,0,menux,CC.StartMenuY+30,0,0,0,0,35,C_STARTMENU, C_GOLD)
		Cls();
		DrawString(menux,CC.StartMenuY+60,"���Ժ�...",C_GOLD,35)--CC.StartMenuFontSize);
		ShowScreen();
        SBLDATAL(r);
		Cls();
		if JY.Base["����"]~=-1 then
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["����"]
			
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

function CleanMemory()            --����lua�ڴ�
    if CONFIG.CleanMemory==1 then
		 collectgarbage("collect");
		 --lib.Debug(string.format("Lua memory=%d",collectgarbage("count")));
    end
end

function SBLNewGame()     --ѡ������Ϸ���������ǳ�ʼ����
    SBLDATAL(0); --  ��������Ϸ����
   
	CXDYWPSX()
	
    ClsN();
	
	lib.FillColor(0,0,CC.ScreenW,CC.ScreenH,C_BLACK);
	DrawStrBox(-1,-1,"��֮����������",C_GOLD,50)
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
	    JY.Person[0]["�������ֵ"]=50
		JY.Person[0]["�������ֵ"]=100;
        JY.Person[0]["������"]=30
        JY.Person[0]["������"]=30
        JY.Person[0]["�Ṧ"]=30
        JY.Person[0]["ҽ������"]=30
        JY.Person[0]["�ö�����"]=30
        JY.Person[0]["�ⶾ����"]=30
        JY.Person[0]["��������"]=30
        JY.Person[0]["ȭ�ƹ���"]=30
        JY.Person[0]["��������"]=30
        JY.Person[0]["ˣ������"]=30
        JY.Person[0]["�������"]=30
        JY.Person[0]["��������"]=30
		ClsN();
		local nl=JYMsgBox(CC.EVB122,CC.EVB123,CC.EVB126,3,280);
        if nl==1 then
		   JY.Person[0]["��������"]=0
		elseif nl==2 then
		   JY.Person[0]["��������"]=1
		else
		   JY.Person[0]["��������"]=2
		end
		local T={};
				for a=1,1000 do
					 local b=""..a
					 T[b]=a
				end
	    DrawStrBoxWaitKey(CC.EVB124,C_WHITE,30)
		JY.Person[0]["����"]=-1;
		while JY.Person[0]["����"]==-1 do
            lib.BeginTextInput();
			local r=GetPinyin1(32,CC.ScreenH-CC.Fontbig*6)
            lib.EndTextInput();
			if T[r]~=nil and T[r]>-1 and T[r]<101 then
				JY.Person[0]["����"]=T[r]
		    else
			    DrawStrBoxWaitKey(CC.EVB125,C_WHITE,30)		
			end	
        end			      
		break;
	end
   
    if JY.Person[0][CC.s23]==JY.LEQ and Tp==1 then 
        JY.Person[0]["��������"]=8;
	    JY.Person[0]["��������"]=2
        JY.Person[0]["�������ֵ"]=300;
        JY.Person[0]["������"]=40;
        JY.Person[0]["������"]=40;
        JY.Person[0]["�Ṧ"]=40;
        JY.Person[0]["ҽ������"]=40;
        JY.Person[0]["�ö�����"]=40;
        JY.Person[0]["�ⶾ����"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["ȭ�ƹ���"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["ˣ������"]=40;
        JY.Person[0]["�������"]=40;
        JY.Person[0]["��������"]=40;        
        JY.Person[0]["�������ֵ"]=100;
	    JY.Person[0]["����"]=100;
    end

    if JY.Person[0][CC.s23]==JY.SQ and Tp==1 then 
        JY.Person[0]["��������"]=4;
	    JY.Person[0]["��������"]=2
        JY.Person[0]["�������ֵ"]=100;
        JY.Person[0]["������"]=40;
        JY.Person[0]["������"]=40;
        JY.Person[0]["�Ṧ"]=40;
        JY.Person[0]["ҽ������"]=40;
        JY.Person[0]["�ö�����"]=40;
        JY.Person[0]["�ⶾ����"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["ȭ�ƹ���"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["ˣ������"]=40;
        JY.Person[0]["�������"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["���һ���"]=1;
        JY.Person[0]["�������ֵ"]=50;
	    JY.Person[0]["����"]=50;
    end
	  
	if JY.Person[0][CC.s23]==JY.XYK and Tp==1 then 
        JY.Person[0]["��������"]=6;
	    JY.Person[0]["��������"]=2
        JY.Person[0]["�������ֵ"]=200;
        JY.Person[0]["������"]=40;
        JY.Person[0]["������"]=40;
        JY.Person[0]["�Ṧ"]=40;
        JY.Person[0]["ҽ������"]=40;
        JY.Person[0]["�ö�����"]=40;
        JY.Person[0]["�ⶾ����"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["ȭ�ƹ���"]=40;
        JY.Person[0]["��������"]=40;
        JY.Person[0]["ˣ������"]=40;
        JY.Person[0]["�������"]=40;
        JY.Person[0]["��������"]=40;        
        JY.Person[0]["�������ֵ"]=75;
	    JY.Person[0]["����"]=80;
		JY.Person[0]["���һ���"]=1;
    end

        JY.Person[0]["����"]=JY.Person[0]["�������ֵ"];
        JY.Person[0]["����"]=JY.Person[0]["�������ֵ"];
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
	
	SetS(13,18,28,3,101) --�����¼�
    SetS(13,18,29,3,102)
    instruct_3(13,101,0,0,0,0,2001,0,0,0,0,-2,-2)
    instruct_3(13,102,0,0,0,0,2001,0,0,0,0,-2,-2)
	
	SetS(102,20,25,2,0) --����ͼ
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
			   JY.Person[0]["ҽ������"]=200
			   JY.Person[0]["�ö�����"]=200
			   JY.Person[0]["�ⶾ����"]=200
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

function Game_Cycle()       --��Ϸ��ѭ��
    lib.Debug("Start game cycle");
local function getmaindelay()
	local speed=JY.Person[0]['�Ṧ'];
	if JY.Person[0]['����']>0 then
		speed=speed+JY.Thing[JY.Person[0]['����']]['���Ṧ']
	end
	if JY.Person[0]['����']>0 then
		speed=speed+JY.Thing[JY.Person[0]['����']]['���Ṧ']
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

	    JY.MyTick=JY.MyTick+1;    --20�������޻����������Ǳ�Ϊվ��״̬
	    JY.MyTick2=JY.MyTick2+1;    --20�������޻����������Ǳ�Ϊվ��״̬

		if JY.MyTick==20 then
            JY.MyCurrentPic=0;
			JY.MyTick=0;
		end

        if JY.MyTick2==1000 then
            JY.MYtick2=0;
        end

        if JY.Status==GAME_FIRSTMMAP then  --�״���ʾ�����������µ�����������ͼ��������ʾ��Ȼ��ת��������ʾ
			CleanMemory();
            lib.ShowSlow(50,1)
            JY.MmapMusic=16;
            JY.Status=GAME_MMAP;

            Init_MMap();

            lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],GetMyPic());
			lib.ShowSlow(50,0);
        elseif JY.Status==GAME_MMAP then
            Game_MMap();
 		elseif JY.Status==GAME_SMAP then
            Game_SMap()
		end

		collectgarbage("step",0);

		local tend=lib.GetTime();
		local FrameTime=getmaindelay()--CC.Frame+15-math.modf(JY.Person[0]['�Ṧ']/12)
		--if tend-tstart<FrameTime then
            --lib.Delay(FrameTime-(tend-tstart));
	    --end
		lib.Delay(JY.XZSPD);
	end
end

function Init_MMap()   --��ʼ������ͼ����
	lib.PicInit();
	lib.LoadMMap(CC.MMapFile[1],CC.MMapFile[2],CC.MMapFile[3],
			CC.MMapFile[4],CC.MMapFile[5],CC.MWidth,CC.MHeight,JY.Base["��X"],JY.Base["��Y"]);

	lib.PicLoadFile(CC.MMAPPicFile[1],CC.MMAPPicFile[2],0);
	lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	--lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],100,200);
	if CC.LoadThingPic==1 then
	    lib.PicLoadFile(CC.ThingPicFile[1],CC.ThingPicFile[2],2);
	end

	JY.EnterSceneXY=nil;         --��Ϊ�գ�ǿ���������ɳ���������ݡ���ֹ���¼������˳�����ڡ�
	JY.oldMMapX=-1;
	JY.oldMMapY=-1;
	JY.MAPKJ=0

    PlayMIDI(JY.MmapMusic);	    
	AutoMoveTab={[0]=0}
end


function Game_MMap()      --����ͼ
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
			JY.oldMMapX=-1;         --ǿ���ػ�
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
    local x,y;              --���շ����Ҫ���������
	local function CanMove(nd,nnd)
		local nx,ny=JY.Base["��X"]+CC.DirectX[nd+1],JY.Base["��Y"]+CC.DirectY[nd+1]
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
    if direct ~= -1 then   --�����˹���
		if not CanMove(direct) then     --û�н��������Ե���
			if JY.Person[500]['����']==0 then
				--direct=direct1
			elseif JY.Person[500]['����']==1 then
				direct1,direct2=direct2,direct1
				change=true
			end
			direct=direct1
			if CanMove(direct) and CanMove(direct,direct3) then
				if change then
					JY.Person[500]['����']=1
				else
					JY.Person[500]['����']=0
				end
			else
				direct=direct2
				if CanMove(direct) and CanMove(direct,direct3) then
				if change then
					JY.Person[500]['����']=0
				else
					JY.Person[500]['����']=1
				end
				else
					direct=direct3
				end
			end
		end
	end
	]]--
	if direct ~= -1 then
        AddMyCurrentPic();         --����������ͼ��ţ�������·Ч��
		x=JY.Base["��X"]+CC.DirectX[direct+1];
		y=JY.Base["��Y"]+CC.DirectY[direct+1];
		JY.Base["�˷���"]=direct;
    else
        x=JY.Base["��X"];
        y=JY.Base["��Y"];
    end
	if direct~=-1 then
		JY.SubScene=CanEnterScene(x,y);   --�ж��Ƿ�����ӳ���
	end
	if CC.hx~=nil or (lib.GetMMap(x,y,3)==0 and lib.GetMMap(x,y,4)==0) then
		JY.Base["��X"]=x;
		JY.Base["��Y"]=y;
	end
		
    JY.Base["��X"]=limitX(JY.Base["��X"],10,CC.MWidth-10);           --�������겻�ܳ�����Χ
    JY.Base["��Y"]=limitX(JY.Base["��Y"],10,CC.MHeight-10);

    if CC.MMapBoat[lib.GetMMap(JY.Base["��X"],JY.Base["��Y"],0)]==1 then
	    JY.Base["�˴�"]=1;
	else
	    JY.Base["�˴�"]=0;
	end

	local pic=GetMyPic();

    if CONFIG.FastShowScreen==1 then  --���ÿ�����ʾ����������λ�ò��䣬����ʾ�ü�����
        if JY.oldMMapX==JY.Base["��X"] and JY.oldMMapY==JY.Base["��Y"] then
			if JY.oldMMapPic>=0 and JY.oldMMapPic ~= pic then        --������ͼ�б仯����ˢ����ʾ��
				local rr=ClipRect(Cal_PicClip(0,0,JY.oldMMapPic,0,0,0,pic,0));
				if rr~=nil then
					lib.SetClip(rr.x1,rr.y1,rr.x2,rr.y2);
					lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],pic);             --��ʾ����ͼ
				end
			end
		else
			lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);
			lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],pic);             --��ʾ����ͼ
		end
	else  --ȫ����ʾ
		lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],pic);             --��ʾ����ͼ
	end

	if CC.ShowXY==1 then
		DrawString(10,CC.ScreenH-20,string.format("���ͼ %d %d",JY.Base["��X"],JY.Base["��Y"]) ,C_GOLD,16);
		DrawString(CC.ScreenW-150,8,os.date("%c"),C_GOLD,16);
	end
	if JY.JB==1 then JYZTB() end
	--DrawMMapMini()
	--DrawString(55,575,CC.EVB119,C_GOLD,25)
	ShowScreen(CONFIG.FastShowScreen);
	lib.SetClip(0,0,0,0);

	JY.oldMMapX=JY.Base["��X"];
	JY.oldMMapY=JY.Base["��Y"];
	JY.oldMMapPic=pic;

    if JY.SubScene >= 0 then          --�����ӳ���
        CleanMemory();
		lib.UnloadMMap();
        lib.PicInit();
        --lib.ShowSlow(0,1)

		JY.Status=GAME_SMAP;
        JY.MmapMusic=-1;

        JY.MyPic=GetMyPic();
        JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"]
        JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"]

        Init_SMap(1);
    end

end

--showname  =1 ��ʾ������ 0 ����ʾ
function Init_SMap(showname)   --��ʼ����������
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
	   JY.Scene[70]["��������"]=33 
    else
       JY.Scene[70]["��������"]=28
	end	
	PlayMIDI(JY.Scene[JY.SubScene]["��������"]);

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
		DrawStrBox(-1,10,JY.Scene[JY.SubScene]["����"],C_WHITE,CC.DefaultFont);
		DrawString(100,575,CC.EVB118,C_GOLD,25)
		ShowScreen();
		WaitKey();
		Cls();
		ShowScreen();
    end

	AutoMoveTab={[0]=0}
end

--������ͼ�ı��γɵ�Clip�ü�
--(dx1,dy1) ����ͼ�ͻ�ͼ���ĵ������ƫ�ơ��ڳ����У��ӽǲ�ͬ�����Ƕ�ʱ�õ�
--pic1 �ɵ���ͼ���
--id1 ��ͼ�ļ����ر��
--(dx2,dy2) ����ͼ�ͻ�ͼ���ĵ��ƫ��
--pic2 �ɵ���ͼ���
--id2 ��ͼ�ļ����ر��
--���أ��ü����� {x1,y1,x2,y2}
function Cal_PicClip(dx1,dy1,pic1,id1,dx2,dy2,pic2,id2)   --������ͼ�ı��γɵ�Clip�ü�

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

function MergeRect(r1,r2)     --�ϲ�����
	local res={};
	res.x1=math.min(r1.x1, r2.x1);
	res.y1=math.min(r1.y1, r2.y1);
	res.x2=math.max(r1.x2, r2.x2);
	res.y2=math.max(r1.y2, r2.y2);
	return res;
end

----�Ծ��ν�����Ļ����
--���ؼ��ú�ľ��Σ����������Ļ�����ؿ�
function ClipRect(r)    --�Ծ��ν�����Ļ����
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

function GetMyPic()      --�������ǵ�ǰ��ͼ
    local n;
	if JY.Status==GAME_MMAP and JY.Base["�˴�"]==1 then
		if JY.MyCurrentPic >=4 then
			JY.MyCurrentPic=0
		end
	else
		if JY.MyCurrentPic >6 then
			JY.MyCurrentPic=1
		end
	end

	if JY.Base["�˴�"]==0 then
        n=CC.MyStartPic+JY.Base["�˷���"]*7+JY.MyCurrentPic;
	else
	    n=CC.BoatStartPic+JY.Base["�˷���"]*4+JY.MyCurrentPic;
	end
	return n;
end

--���ӵ�ǰ������·����֡, ����ͼ�ͳ�����ͼ��ʹ��
function AddMyCurrentPic()        ---���ӵ�ǰ������·����֡,
    JY.MyCurrentPic=JY.MyCurrentPic+1;
end

--�����Ƿ�ɽ�
--id ��������
--x,y ��ǰ����ͼ����
--���أ�����id��-1��ʾû�г����ɽ�
function CanEnterScene(x,y)         --�����Ƿ�ɽ�
    if JY.EnterSceneXY==nil then    --���Ϊ�գ������²������ݡ�
	    Cal_EnterSceneXY();
	end

    local id=JY.EnterSceneXY[y*CC.MWidth+x];
    if id~=nil then
        local e=JY.Scene[id]["��������"];
		if e==0 then        --�ɽ�
			return id;
		elseif e==1 then    --���ɽ�
			return -1
		elseif e==2 then    --���Ṧ���߽�
			for i=1,CC.TeamNum do
				local pid=JY.Base["����" .. i];
				if pid>=0 then
					if JY.Person[pid]["�Ṧ"]>=70 then
						return id;
					end
				end
			end
		end
	end
    return -1;
end

function Cal_EnterSceneXY()   --������Щ������Խ��볡��
    JY.EnterSceneXY={};
    for id = 0,JY.SceneNum-1 do
		local scene=JY.Scene[id];
        if scene["�⾰���X1"]>0 and scene["�⾰���Y1"] then
            JY.EnterSceneXY[scene["�⾰���Y1"]*CC.MWidth+scene["�⾰���X1"]]=id;
		end
        if scene["�⾰���X2"]>0 and scene["�⾰���Y2"] then
            JY.EnterSceneXY[scene["�⾰���Y2"]*CC.MWidth+scene["�⾰���X2"]]=id;
		end
    end
end

--���˵�
function MMenu()      --���˵�
    Cls();   
    local menu={      {"ҽ��",Menu_Doctor,1},
	                  {"�ⶾ",Menu_DecPoison,1},
	                  {"��Ʒ",Menu_Thing,1},
	                  {"״̬",Menu_Status,1},
	                  {"���",Menu_PersonExit,1},
	                  {"ϵͳ",Menu_System,1},      };
    if JY.Status==GAME_SMAP then  --�ӳ������������˵����ɼ�
        --menu[5][3]=0;
        --menu[6][3]=0;
    end
    ShowMenu(menu,6,0,CC.MainMenuX,CC.MainMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE)
end

function SelectThing(thing,thingnum)    --��ʾ��Ʒ�˵�

    local xnum=CC.MenuThingXnum;
    local ynum=CC.MenuThingYnum;

	local w=CC.ThingPicWidth*xnum+(xnum-1)*CC.ThingGapIn+2*CC.ThingGapOut;  --������
	local h=CC.ThingPicHeight*ynum+(ynum-1)*CC.ThingGapIn+2*CC.ThingGapOut; --��Ʒ���߶�

	local dx=(CC.ScreenW-w)/2;
	local dy=(CC.ScreenH-h-2*(CC.ThingFontSize+2*CC.MenuBorderPixel+5))/2-50;


    local y1_1,y1_2,y2_1,y2_2,y3_1,y3_2;                  --���ƣ�˵����ͼƬ��Y����

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
                local id=y*xnum+x+xnum*cur_line         --��ǰ��ѡ����Ʒ
				local boxcolor;
                if x==cur_x and y==cur_y then
				    boxcolor=C_WHITE;
                    if thing[id]>=0 then
                        cur_thing=thing[id];
                        local str=JY.Thing[thing[id]]["����"];
                        if JY.Thing[thing[id]]["����"]==1 or JY.Thing[thing[id]]["����"]==2 then
                            if JY.Thing[thing[id]]["ʹ����"] >=0 then
                                str=str .. "(" .. JY.Person[JY.Thing[thing[id]]["ʹ����"]]["����"] .. ")";
                            end
                        end
                        str=string.format("%s X %d",str,thingnum[id]);
						local str2=JY.Thing[thing[id]]["��Ʒ˵��"];
						if thing[id]==182 then
							str2=str2..string.format('(��%3d,%3d)',JY.Base['��X'],JY.Base['��Y'])
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
						if myThing['�����书']>0 then
							local kfname='ϰ��:'..JY.Wugong[myThing['�����书']]['����']
							DrawStrBox(mx,my,kfname,C_GOLD,myfont)
							mx=mx+myfont*string.len(kfname)/2+12
						end
						if myThing['����']>0 then
						drawitem('������','����')
						drawitem('���������ֵ','������ֵ')
						drawitem('���ж��ⶾ','�ж�')
						drawitem('������','����')
						if myThing['�ı���������']==2 then
							drawitem('������·������һ')
						end
						drawitem('������','����')
						drawitem('���������ֵ','������ֵ')
						drawitem('�ӹ�����','����')
						drawitem('���Ṧ','�Ṧ')
						drawitem('�ӷ�����','����')
						drawitem('��ҽ������','ҽ��')
						drawitem('���ö�����','�ö�')
						drawitem('�ӽⶾ����','�ⶾ')
						drawitem('�ӿ�������','����')
						drawitem('��ȭ�ƹ���','ȭ��')
						drawitem('����������','����')
						drawitem('��ˣ������','ˣ��')
						drawitem('���������','����')
						drawitem('�Ӱ�������','����')
						drawitem('����ѧ��ʶ','�䳣')
						drawitem('��Ʒ��','Ʒ��')
						drawitem('�ӹ�������','����',{[0]='��','��'})
						drawitem('�ӹ�������','����')
						if mx~=dx or my~=y3_2+2 then
							DrawStrBox(dx,y3_2+2,' Ч��:',C_RED,myfont)
						end
						end
						if myThing['����']==1 or myThing['����']==2 then
						if mx~=dx then
							mx=dx+4*myfont
							my=my+myfont+10
						end
						myflag=1
						local my2=my
						if myThing['����������']>-1 then
							--drawitem('����������','����',{[myThing['����������']]=JY.Person[myThing['����������']]['����']})
							drawitem('����:'..JY.Person[myThing['����������']]['����'])
						end
						drawitem('����������','����',{[0]='��','��','����'})
						drawitem('������','����')
						drawitem('�蹥����','����')
						drawitem('���Ṧ','�Ṧ')
						drawitem('���ö�����','�ö�')
						drawitem('��ҽ������','ҽ��')
						drawitem('��ⶾ����','�ⶾ')
						drawitem('��ȭ�ƹ���','ȭ��')
						drawitem('����������','����')
						drawitem('��ˣ������','ˣ��')
						drawitem('���������','����')
						drawitem('�谵������','����')
						drawitem('������','����')
						drawitem('�辭��','��������')
						if mx~=dx or my~=my2 then
							DrawStrBox(dx,my2,' ����:',C_RED,myfont)
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

--�µ�ϵͳ�Ӳ˵������ӿ������ֺ���Ч
function Menu_System()

	local menu={
	             {"��ȡ����",Menu_ReadRecord,1},
                 {"�������",Menu_SaveRecord,1},--2
				 {"�ر�����",Menu_SetMusic,1},
				 {"�ر���Ч",Menu_SetSound,1},--4
				 {"ȫ���л�",Menu_FullScreen,1},                    
				 {"��������",Menu_DDTH,1},--6
				 {"��Ʒ����",Menu_WPZL,1},
				 {"��Ӫ����",nil,1},--8
				 {"������",nil,1},
				 {"������Ϣ",Menu_JYZTB,1},--10
				 {"ͷ��ѡ��",Menu_HEADXZ,1},
				 {"�ҵĴ���",Menu_MYDIY,1},
				 {"�뿪��Ϸ",Menu_Exit,1},};--13

				 
    if JY.EnableMusic==0 then
	    menu[3][1]="������";
	end

	if JY.EnableSound==0 then
	    menu[4][1]="����Ч";
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
    elseif r<0 then   --Ҫ�˳�ȫ���˵���
        return 1;
 	end
end

function Menu_MYDIY()
    Cls();
    local MS=JYMsgBox("RUNDIY","ȷ��Ҫ����DIY�ļ���",{"ȷ��","����"},2,280);
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
	   DrawStrBox(-1,-1,"�رռ�����Ϣ��ʾ",C_GOLD,30);
	   ShowScreen()
	   WaitKey();
	else
	   JY.JB=1
	   Cls();
	   DrawStrBox(-1,-1,"�򿪼�����Ϣ��ʾ",C_GOLD,30);
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
               if JY.Base["��Ʒ"..i]>-1 then 
                  for ii=i+1,200 do
                      if JY.Base["��Ʒ"..ii]>-1 then 
                         if JY.Base["��Ʒ"..i]>JY.Base["��Ʒ"..ii] then
                            JY.Base["��Ʒ"..i],JY.Base["��Ʒ"..ii]=JY.Base["��Ʒ"..ii],JY.Base["��Ʒ"..i]
                            JY.Base["��Ʒ����"..i],JY.Base["��Ʒ����"..ii]=JY.Base["��Ʒ����"..ii],JY.Base["��Ʒ����"..i]
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
		   JY.Base["��X1"]=8
		   JY.Base["��Y1"]=28
		   JY.Base["��X"]=358
		   JY.Base["��Y"]=235
		end
end

function Menu_MCCS()
        Cls()
		local md=JYMsgBox(CC.s59,CC.s60,{CC.s61,CC.s62},2,119);
		if md==1 then			
			local r=SelectSceneMenu(24,24)
			if r>0 and JY.Scene[r-1]["��������"]==0 and JY.SubScene~=25 and r~=84 and r~=83 and r~=81 and r~=82 then
				JY.SubScene=r-1;
				--lib.ShowSlow(0,1);
				local ss=JY.SubScene
                           
				while JY.Scene[ss]["�⾰���X1"]==0 and JY.Scene[ss]["�⾰���Y1"]==0 do
					ss=JY.Scene[ss]["��ת����"]
				end
				JY.Base["��X"]=JY.Scene[ss]["�⾰���X1"]
				JY.Base["��Y"]=JY.Scene[ss]["�⾰���Y1"]
				if JY.Scene[JY.SubScene]["�⾰���X1"]==0 and JY.Scene[JY.SubScene]["�⾰���Y1"]==0 then
					JY.Base["��X1"]=JY.Scene[JY.SubScene]["��ת��X2"];         --�ⲿ���������������ڲ��������ء�
					JY.Base["��Y1"]=JY.Scene[JY.SubScene]["��ת��Y2"];
				else
					JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"];            --�³������⾰���Ϊ0����ʾ����һ���ڲ�����
					JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"];
				end
			Init_SMap(1);
                        else
                        say(CC.s63,119,5,CC.s64)    				
			end
        else
            lib.BeginTextInput();
            local r=GetPinyin1(32,CC.ScreenH-CC.Fontbig*6)
            lib.EndTextInput();
			  for i=0,105 do
				   if r==""..i then
				      if JY.Scene[i]["��������"]==0 and JY.SubScene~=25 and i~=82 and i~=83 and i~=81 and i~=84 then
					     JY.SubScene=i
						 --lib.ShowSlow(50,1);
							local ss=JY.SubScene
									   
							while JY.Scene[ss]["�⾰���X1"]==0 and JY.Scene[ss]["�⾰���Y1"]==0 do
								ss=JY.Scene[ss]["��ת����"]
							end
							JY.Base["��X"]=JY.Scene[ss]["�⾰���X1"]
							JY.Base["��Y"]=JY.Scene[ss]["�⾰���Y1"]
							if JY.Scene[JY.SubScene]["�⾰���X1"]==0 and JY.Scene[JY.SubScene]["�⾰���Y1"]==0 then
								JY.Base["��X1"]=JY.Scene[JY.SubScene]["��ת��X2"];         --�ⲿ���������������ڲ��������ء�
								JY.Base["��Y1"]=JY.Scene[JY.SubScene]["��ת��Y2"];
							else
								JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"];            --�³������⾰���Ϊ0����ʾ����һ���ڲ�����
								JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"];
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

--�뿪�˵�
function Menu_Exit()      --�뿪�˵�
    Cls();
    if DrawStrBoxYesNo(-1,-1,"�Ƿ����Ҫ�뿪��Ϸ��",C_WHITE,CC.DefaultFont) == true then
        JY.Status =GAME_END;
    end
    return 1;
end

function Menu_SaveRecord()         --������Ȳ˵�
	local menu={ {"����һ",nil,1},
                 {"���ȶ�",nil,1},
                 {"������",nil,1},  };
    local r=ShowMenu(menu,3,0,CC.MainSubMenuX2,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
    if r>0 then
		if JY.Status==GAME_SMAP then 			--���沿�ֺͳ�����ͼ�浵�����Ϣ
			JY.Base["����"]=JY.SubScene
			
		else
			JY.Base["����"]=-1
			
		end
        DrawStrBox(CC.MainSubMenuX2,CC.MainSubMenuY,"���Ժ�......",C_WHITE,CC.DefaultFont);
        ShowScreen();
        SBLDATAS(r);
        Cls(CC.MainSubMenuX2,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
	end
    return 0;
end

function Menu_ReadRecord()        --��ȡ���Ȳ˵�
	local menu={ {"����һ",nil,1},
                 {"���ȶ�",nil,1},
                 {"������",nil,1},  };
    local r=ShowMenu(menu,3,0,CC.MainSubMenuX2,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r == 0 then
        return 0;
    elseif r>0 then
        DrawStrBox(CC.MainSubMenuX2,CC.MainSubMenuY,"���Ժ�......",C_WHITE,CC.DefaultFont);
        ShowScreen();
        SBLDATAL(r);
		if JY.Base["����"]~=-1 then 
			if JY.SubScene < 0 then          --���ڴ��ͼ
				CleanMemory();
				lib.UnloadMMap();
			end
			lib.PicInit();
			lib.ShowSlow(50,1)
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["����"]
			
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

--״̬�Ӳ˵�
function Menu_Status()           --״̬�Ӳ˵�
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"Ҫ����˭��״̬",C_WHITE,CC.DefaultFont);
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

--���Exit
function Menu_PersonExit()        --���Exit
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"Ҫ��˭���",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;

	local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
    if r==1 then
        DrawStrBoxWaitKey("��Ǹ��û������Ϸ���в���ȥ",C_WHITE,CC.DefaultFont,1);
    elseif JY.SubScene==82 then
	    --
	elseif r>0 and JY.SubScene==55 and JY.Base["����" .. r]==35 then
	    --
	elseif r>1 then
        local personid=JY.Base["����" .. r];
        for i,v in ipairs(CC.PersonExit) do         --������б��е�����Ӻ���
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

--����ѡ������˵�
function SelectTeamMenu(x,y)          --����ѡ������˵�
   
	local menu={};
	for i=1,CC.TeamNum do
		menu[i]={"",nil,0};
		local id=JY.Base["����" .. i]
		if id>=0 then
			if JY.Person[id]["����"]>0 then
				menu[i][1]=JY.Person[id]["����"];
				menu[i][3]=1;
			end
		end
	end
    return ShowMenu(menu,CC.TeamNum,0,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
end

function GetTeamNum()            --�õ����Ѹ���
    local r=CC.TeamNum;
	for i=1,CC.TeamNum do
	    if JY.Base["����" .. i]<0 then
		    r=i-1;
		    break;
		end
    end
	return r;
end

---��ʾ����״̬
-- ���Ҽ���ҳ�����¼�������
function ShowPersonStatus(teamid)---��ʾ����״̬	
	local page=1;
	local pagenum=2;
	local teamnum=GetTeamNum();

	while true do
	    Cls();
        local id=JY.Base["����" .. teamid];
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
			if TFNLJS[JY.Person[id]["����"]]~=nil then
			    say(TFNLJS[JY.Person[id]["����"]],id,5)	 
		    end
		elseif CC.Debug==nil then
			
		--[[elseif keypress==108 then	--L LVUPFY
			local lv=JY.Person[id]["�ȼ�"];
		  while lv<30 do
			AddPersonAttrib(id,"����",CC.Exp[lv]-JY.Person[id]["����"]);
			if War_AddPersonLVUP(id) then
			   
			end
		    lv=JY.Person[id]["�ȼ�"];
			if lv==30 then
				DrawStrBox(-1,-1,string.format("%s ������",JY.Person[id]["����"]),C_WHITE,CC.DefaultFont);
				ShowScreen();
				WaitKey();
			end
		  end		  
		  JY.Person[id]["��������"]=30000
		  War_PersonTrainBook(id) 		  
		   
		elseif keypress==99 then	--C
			--AddPersonAttrib(id,'����',1)
			local lv=JY.Person[id]["�ȼ�"];
			AddPersonAttrib(id,"����",CC.Exp[lv]-JY.Person[id]["����"]);
			if War_AddPersonLVUP(id) then
			   
			end
		elseif keypress==102 then	--F
			--AddPersonAttrib(id,'����',-1)
		]]	
        end
		teamid=limitX(teamid,1,teamnum);
		page=limitX(page,1,pagenum);
	end
end

--id ������
--page ��ʾҳ����Ŀǰ����ҳ
function ShowPersonStatus_sub(id,page)    --��ʾ����״̬ҳ��
   
    local size=CC.DefaultFont;    --�����С
    local p=JY.Person[id];
    local p0=JY.Person[0];
    local width=18*size+15;             --18�������ַ���
	local h=size+CC.PersonStateRowPixel;
	local height=13*h+10;                --12�������ַ���
	local dx=(CC.ScreenW-width)/2;
	local dy=(CC.ScreenH-height)/2;

	local i=1;
    local x1,y1,x2;

    DrawBox(dx,dy,dx+width,dy+height,C_WHITE);

    x1=dx+5;
	y1=dy+5;
	x2=4*size;
	local headw,headh=lib.PicGetXY(1,p["ͷ�����"]*2);		
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
	    hid=p["ͷ�����"]
        --lib.PicLoadCache(1,p["ͷ�����"]*2,x1+headx,y1+heady,1);
	end
	lib.PicLoadCache(1,hid*2,x1+headx,y1+heady,1);
	
	
	i=4;
    DrawString(x1,y1+h*i,p[CC.s23],C_WHITE,size);
    DrawString(x1+10*size/2,y1+h*i,string.format("%3d",p["�ȼ�"]),C_GOLD,size);
    DrawString(x1+13*size/2,y1+h*i,"��",C_ORANGE,size);
    i=i+1
         DrawString(x1,y1+h*i,CC.s24,C_GOLD,size);  --�츳
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
         if JY.Person[49]["�书1"]==8 and id==49 then 
		    DrawString(x1+size*3,y1+h*i,RWWH['49'],C_GOLD,size);
		 end		 
		 for w=1,10 do
		     if JY.Person[38]["�书"..w]<=0 then break end
		     if JY.Person[38]["�书"..w]==102 and id==38 then
			    DrawString(x1+size*3,y1+h*i,RWWH['38'],C_GOLD,size);
                break;				
			 end
	     end
		 --end
        
	local function DrawAttrib(str,color1,color2,v)    --�����ڲ�����
        v=v or 0;
        DrawString(x1,y1+h*i,str,color1,size);
        DrawString(x1+x2,y1+h*i,string.format("%5d",p[str]+v),color2,size);
        i=i+1;
    end

if page==1 then
    local color;              --��ʾ���������ֵ���������˺��ж���ʾ��ͬ��ɫ
    if p["���˳̶�"]<33 then
        color =RGB(236,200,40);
    elseif p["���˳̶�"]<66 then
        color=RGB(244,128,32);
    else
        color=RGB(232,32,44);
    end
	i=i+1;
    DrawString(x1,y1+h*i,"����",C_ORANGE,size);
    DrawString(x1+2*size,y1+h*i,string.format("%5d",p["����"]),color,size);
    DrawString(x1+9*size/2,y1+h*i,"/",C_GOLD,size);

    if p["�ж��̶�"]==0 then
        color =RGB(252,148,16);
    elseif p["�ж��̶�"]<50 then
        color=RGB(120,208,88);
    else
        color=RGB(56,136,36);
    end
    DrawString(x1+5*size,y1+h*i,string.format("%5s",p["�������ֵ"]),color,size);

    i=i+1;              --��ʾ���������ֵ����������������ʾ��ͬ��ɫ
    if p["��������"]==0 then
        color=RGB(208,152,208);
    elseif p["��������"]==1 then
        color=RGB(236,200,40);
    else
        color=RGB(236,236,236);
    end
	if GetS(4,5,5,5)==5 and id==0 then
	   color=RGB(216, 20, 24) 
	end
    DrawString(x1,y1+h*i,"����",C_ORANGE,size);
    DrawString(x1+2*size,y1+h*i,string.format("%5d/%5d",p["����"],p["�������ֵ"]),color,size);

    i=i+1;
    --DrawAttrib("����",C_ORANGE,C_GOLD)
    --DrawAttrib("����",C_ORANGE,C_GOLD)
	DrawString(x1,y1+h*i,"����",C_ORANGE,size)
	DrawString(x1+size*2+8,y1+h*i,p["����"],C_GOLD,size)
	DrawString(x1+size*4+16,y1+h*i,"����",C_ORANGE,size)
	DrawString(x1+size*6+32,y1+h*i,p["��������"],C_GOLD,size)
	i=i+1;
	DrawString(x1,y1+h*i,"ʵս",C_ORANGE,size)  --JPS
	for j=1,51 do
	      if id==TeamP[j] then
		     local num,cl=GetS(5,j,6,5)-2,C_GOLD;
			 if num>499 then 
			    num="��" 
				cl=C_RED
			 end
	         DrawString(x1+size*2+8,y1+h*i,num,cl,size)
		     break
		  end
	end
	DrawString(x1+size*4+16,y1+h*i,"����",C_ORANGE,size)
	local hb;
	if p["���һ���"]==1 then
	   hb="��"
	else
	   hb="��"
	end
	DrawString(x1+size*6+24,y1+h*i,hb,C_GOLD,size)	
	i=i+1
    DrawString(x1,y1+h*i,"����",C_ORANGE,size);
	local kk;
	if p["�ȼ�"] >=30 then
	   kk='   =';
	else
	   kk=2*(p["����"]-CC.Exp[p["�ȼ�"]-1])
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
	if p["�ȼ�"] >=CC.Level then
	    tmp="=";
	else
        tmp=2*(CC.Exp[p["�ȼ�"]]-CC.Exp[p["�ȼ�"]-1]);
	end
    --DrawString(x1,y1+h*i,"����",C_ORANGE,size);
    DrawString(x1+size*4+16,y1+h*i,'/'..tmp,C_GOLD,size);

    local tmp1,tmp2,tmp3=0,0,0;
    if p["����"]>-1 then
        tmp1=tmp1+JY.Thing[p["����"]]["�ӹ�����"];
        tmp2=tmp2+JY.Thing[p["����"]]["�ӷ�����"];
        tmp3=tmp3+JY.Thing[p["����"]]["���Ṧ"];
	end
    if p["����"]>-1 then
        tmp1=tmp1+JY.Thing[p["����"]]["�ӹ�����"];
        tmp2=tmp2+JY.Thing[p["����"]]["�ӷ�����"];
        tmp3=tmp3+JY.Thing[p["����"]]["���Ṧ"];
	end

    i=i+1; --NZT
    --DrawString(x1,y1+h*i,"���Ҽ���ҳ�����¼��鿴��������",C_RED,size);
    
    DrawString(x1,y1+h*i,"�ж�",C_ORANGE,size);
	DrawString(x1+size*2+10,y1+h*i,p["�ж��̶�"],C_BLACK,size);
	DrawString(x1+size*4+25,y1+h*i,"����",C_ORANGE,size);
	DrawString(x1+size*6+35,y1+h*i,p["���˳̶�"],C_RED,size);
	DrawString(x1+size*8+50,y1+h*i,"��Ѩ",C_ORANGE,size);
      if JY.Status==GAME_WMAP and WAR.FXDS[id]~=nil then     	  
	DrawString(x1+size*10+60,y1+h*i,WAR.FXDS[id],C_GOLD,size);
	  else	
	DrawString(x1+size*10+60,y1+h*i,0,C_GOLD,size);
	  end
	DrawString(x1+size*12+75,y1+h*i,"��Ѫ",C_ORANGE,size);
	  if JY.Status==GAME_WMAP and WAR.LXZT[id]~=nil then  
	DrawString(x1+size*14+85,y1+h*i,WAR.LXZT[id],C_RED,size);
	  else
	DrawString(x1+size*14+85,y1+h*i,0,C_RED,size);
	  end
		
    i=0;
	x1=dx+width/2-24;
    DrawAttrib("������",C_WHITE,C_GOLD);
    DrawString(x1+210,y1,"�� "..tmp1,C_GOLD,size);    
    DrawAttrib("������",C_WHITE,C_GOLD);
    DrawString(x1+210,y1+h,"�� "..tmp2,C_GOLD,size);  
    DrawAttrib("�Ṧ",C_WHITE,C_GOLD);
	if tmp3>-1 then
    DrawString(x1+210,y1+h*2,"�� "..tmp3,C_GOLD,size); 
    else
    tmp3=-tmp3
    DrawString(x1+210,y1+h*2,"�� "..tmp3,C_GOLD,size);
	end
    DrawAttrib("ҽ������",C_WHITE,C_GOLD);
    DrawAttrib("�ö�����",C_WHITE,C_GOLD);
    DrawAttrib("�ⶾ����",C_WHITE,C_GOLD);


    DrawAttrib("ȭ�ƹ���",C_WHITE,C_GOLD);
    DrawAttrib("��������",C_WHITE,C_GOLD);
    DrawAttrib("ˣ������",C_WHITE,C_GOLD);
    DrawAttrib("�������",C_WHITE,C_GOLD);
    DrawAttrib("��������",C_WHITE,C_GOLD);
    DrawAttrib("����",C_WHITE,C_GOLD);

elseif page==2 then
	i=i+1;
    DrawString(x1,y1+h*i,"����:",C_ORANGE,size);
	if p["����"]>-1 then
        DrawString(x1+size*3,y1+h*i,JY.Thing[p["����"]]["����"],C_GOLD,size);
    end
	i=i+1;
    DrawString(x1,y1+h*i,"����:",C_ORANGE,size);
	if p["����"]>-1 then
        DrawString(x1+size*3,y1+h*i,JY.Thing[p["����"]]["����"],C_GOLD,size);
    end
    i=i+1;
    DrawString(x1,y1+h*i,"������Ʒ",C_ORANGE,size);
	local thingid=p["������Ʒ"];
	if thingid>0 then
	    i=i+1;
        DrawString(x1+size,y1+h*i,JY.Thing[thingid]["����"],C_GOLD,size);
		i=i+1;
        local n=TrainNeedExp(id);
		if n <math.huge then
            DrawString(x1+size,y1+h*i,string.format("%5d/%5d",p["��������"],n),C_GOLD,size);
		else
            DrawString(x1+size,y1+h*i,string.format("%5d/===",p["��������"]),C_GOLD,size);
		end
	else
	    i=i+2;
	end

    i=i+1;
    DrawString(x1,y1+h*i,"���Ҽ���ҳ ���¼����� �ո��������˵",C_RED,size);

    i=0;
	x1=dx+width/2;
    DrawString(x1,y1+h*i,"���Ṧ��",C_ORANGE,size);
	local T={"һ","��","��","��","��","��","��","��","��","ʮ","��"}
	if JY.Person[0]["�书1"]>108 and JY.Person[0]["�书�ȼ�1"]<900 then JY.Person[0]["�书�ȼ�1"]=900 end
	for j=1,10 do
        i=i+1
		local wugong=p["�书" .. j];
		if wugong > 0 then
    		local level=math.modf(p["�书�ȼ�" .. j] / 100)+1;
			if p["�书�ȼ�" .. j]==999 then level=11 end
            DrawString(x1+size,y1+h*i,string.format("%s",JY.Wugong[wugong]["����"]),C_GOLD,size);
			if p["�书�ȼ�" .. j]>900 then
				lib.SetClip(x1+size,y1+h*1,x1+size+string.len(JY.Wugong[wugong]["����"])*size*(p["�书�ȼ�" .. j]-900)/200,y1+h*i+h)
				DrawString(x1+size,y1+h*i,string.format("%s",JY.Wugong[wugong]["����"]),C_ORANGE,size);
				lib.SetClip(0,0,0,0)
			end
            DrawString(x1+size*7,y1+h*i,T[level],C_WHITE,size);
		end
	end
	i=11
	DrawString(x1+size,y1+h*i,"ŭ��",C_ORANGE,size);
	if JY.Status==GAME_WMAP and WAR.LQZ[id]~=nil then
	   DrawString(x1+size*3+10,y1+h*i,WAR.LQZ[id],C_GOLD,size);
	else
	   DrawString(x1+size*3+10,y1+h*i,0,C_GOLD,size);
	end
	DrawString(x1+size*5+10,y1+h*i,"����",C_ORANGE,size);
	DrawString(x1+size*7+20,y1+h*i,0,C_GOLD,size);

end

end


--�������������ɹ���Ҫ�ĵ���
--id ����id
function TrainNeedExp(id)         --��������������Ʒ�ɹ���Ҫ�ĵ���
    local thingid=JY.Person[id]["������Ʒ"];
	local r =0;
	if thingid >= 0 then
        if JY.Thing[thingid]["�����书"] >=0 then
            local level=0;          --�˴���level��ʵ��level-1������û���书�r������һ����һ���ġ�
			for i =1,10 do               -- ���ҵ�ǰ�Ѿ������书�ȼ�
			    if JY.Person[id]["�书" .. i]==JY.Thing[thingid]["�����书"] then
                    level=math.modf(JY.Person[id]["�书�ȼ�" .. i] /100);
					break;
                end
            end
			if level <9 then
                r=(150-JY.Person[id]["����"])*JY.Thing[thingid]["�辭��"]*(level+1)/50;
			else
                r=math.huge;
				return r
			end
		else
            r=(150-JY.Person[id]["����"])*JY.Thing[thingid]["�辭��"]*2/50;
		end
	end
    return math.modf(r);
end

--ҽ�Ʋ˵�
function Menu_Doctor()       --ҽ�Ʋ˵�
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"˭Ҫʹ��ҽ��",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    DrawStrBox(CC.MainSubMenuX,nexty,"ҽ������",C_ORANGE,CC.DefaultFont);

	local menu1={};
	for i=1,CC.TeamNum do
        menu1[i]={"",nil,0};
		local id=JY.Base["����" .. i]
        if id >=0 then
            if JY.Person[id]["ҽ������"]>=20 then
                 menu1[i][1]=string.format("%-10s%4d",JY.Person[id]["����"],JY.Person[id]["ҽ������"]);
                 menu1[i][3]=1;
            end
        end
	end

    local id1,id2;
	nexty=nexty+CC.SingleLineHeight;
    local r=ShowMenu(menu1,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r >0 then
	    id1=JY.Base["����" .. r];
        Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"Ҫҽ��˭",C_WHITE,CC.DefaultFont);
        nexty=CC.MainSubMenuY+CC.SingleLineHeight;

		local menu2={};
		for i=1,CC.TeamNum do
			menu2[i]={"",nil,0};
			local id=JY.Base["����" .. i]
			if id>=0 then
				 menu2[i][1]=string.format("%-10s%4d/%4d",JY.Person[id]["����"],JY.Person[id]["����"],JY.Person[id]["�������ֵ"]);
				 menu2[i][3]=1;
			end
		end

		local r2=ShowMenu(menu2,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);

		if r2 >0 then
	        id2=JY.Base["����" .. r2];
            local num=ExecDoctor(id1,id2);
			if num>0 then
                AddPersonAttrib(id1,"����",-2);
			end
            DrawStrBoxWaitKey(string.format("%s �������� %d",JY.Person[id2]["����"],num),C_ORANGE,CC.DefaultFont);
		end
	end

	Cls();

    return 0;
end

--ִ��ҽ��
--id1 ҽ��id2, ����id2�������ӵ���
function ExecDoctor(id1,id2)      --ִ��ҽ��
	if JY.Person[id1]["����"]<50 then
        return 0;
	end

	local add=JY.Person[id1]["ҽ������"];
    local value=JY.Person[id2]["���˳̶�"];
    if value > add+20 then
        return 0;
	end
	
	if id1==28 and JY.Status==GAME_WMAP then
	   add=math.modf(JY.Person[id1]["ҽ������"]*(1+WAR.PYZ/10));
    end
		
	if JY.Status==GAME_WMAP then
		for i,v in pairs(CC.AddDoc) do
			if v[1]==id1 then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["������"]==v[2] and  WAR.Person[wid]["����"]==false then
						add=add+v[3];
					end
				end
			end
		end
	end
	
	add=add-add*value/200;
 	add=math.modf(add)+Rnd(5);

    AddPersonAttrib(id2,"���˳̶�",-math.modf(add/10));
    return AddPersonAttrib(id2,"����",add)
end


--�ⶾ
function Menu_DecPoison()         --�ⶾ
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"˭Ҫ���˽ⶾ",C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    DrawStrBox(CC.MainSubMenuX,nexty,"�ⶾ����",C_ORANGE,CC.DefaultFont);

	local menu1={};
	for i=1,CC.TeamNum do
        menu1[i]={"",nil,0};
		local id=JY.Base["����" .. i]
        if id>=0 then
            if JY.Person[id]["�ⶾ����"]>=20 then
                 menu1[i][1]=string.format("%-10s%4d",JY.Person[id]["����"],JY.Person[id]["�ⶾ����"]);
                 menu1[i][3]=1;
            end
        end
	end

    local id1,id2;
 	nexty=nexty+CC.SingleLineHeight;
    local r=ShowMenu(menu1,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r >0 then
	    id1=JY.Base["����" .. r];
         Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"��˭�ⶾ",C_WHITE,CC.DefaultFont);
		nexty=CC.MainSubMenuY+CC.SingleLineHeight;

        DrawStrBox(CC.MainSubMenuX,nexty,"�ж��̶�",C_WHITE,CC.DefaultFont);
	    nexty=nexty+CC.SingleLineHeight;

		local menu2={};
		for i=1,CC.TeamNum do
			menu2[i]={"",nil,0};
			local id=JY.Base["����" .. i]
			if id>=0 then
				 menu2[i][1]=string.format("%-10s%5d",JY.Person[id]["����"],JY.Person[id]["�ж��̶�"]);
				 menu2[i][3]=1;
			end
		end

		local r2=ShowMenu(menu2,CC.TeamNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
		if r2 >0 then
	        id2=JY.Base["����" .. r2];
            local num=ExecDecPoison(id1,id2);
            DrawStrBoxWaitKey(string.format("%s �ж��̶ȼ��� %d",JY.Person[id2]["����"],num),C_ORANGE,CC.DefaultFont);
		end
	end
    Cls();
    return 0;
end

--�ⶾ
--id1 �ⶾid2, ����id2�ж����ٵ���
function ExecDecPoison(id1,id2)     --ִ�нⶾ
    local add=JY.Person[id1]["�ⶾ����"];
    local value=JY.Person[id2]["�ж��̶�"];

    if value > add+20 then
        return 0;
	end

 	add=limitX(math.modf(add/3)+Rnd(10)-Rnd(10),0,value);
    return -AddPersonAttrib(id2,"�ж��̶�",-add);
end

--��Ʒ�˵�
function Menu_Thing()       --��Ʒ�˵�
                            --���书����

	 

    local menu={ {"ȫ����Ʒ",nil,1},
                 {"������Ʒ",nil,1},
                 {"�������",nil,1},
                 {"�书����",nil,1},
                 {"�鵤��ҩ",nil,1},
                 {"���˰���",nil,1}, };

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
		    local id=JY.Base["��Ʒ" .. i+1];
			
			if id>=0 then
				if r==1 then
					thing[i]=id
					thingnum[i]=JY.Base["��Ʒ����" ..i+1];
				else
					if JY.Thing[id]["����"]==r-2 then             --��Ӧ������0-4
 					    thing[num]=id;
					    thingnum[num]=JY.Base["��Ʒ����" ..i+1];
						num=num+1;
					end
				end
			end
		end

        local r=SelectThing(thing,thingnum);
		if r>236 then OVERZB() end
        if r>=0 then
            UseThing(r);           --ʹ����Ʒ
			return 1;             --�˳����˵�
		end
	end
	return 0;
end

--��������������
function Game_SMap()         --��������������
	
	DrawSMap(CONFIG.FastShowScreen);
	--DrawSMapMini()
	if CC.ShowXY==1 then
		DrawString(10,CC.ScreenH-20,string.format("%s %d %d",JY.Scene[JY.SubScene]["����"],JY.Base["��X1"],JY.Base["��Y1"]) ,C_GOLD,16);
		--DrawString(CC.ScreenW-9*CC.DefaultFont,10,os.date("%Y��%m��%d�� %H:%M:%S"),RGB(216, 20, 24) ,16);
		DrawString(CC.ScreenW-150,8,os.date("%c"),C_GOLD,16);
	end
	
	if JY.JB==1 then JYZTB() end
	if JY.WGLVXS==1 then
	   --DrawString(10,CC.ScreenH-25,JY.SubScene.." "..JY.Scene[JY.SubScene]["����"] ,C_GOLD,20);
	end
	
	ShowScreen(CONFIG.FastShowScreen);

	lib.SetClip(0,0,0,0);

    local d_pass=GetS(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],3);   --��ǰ·���¼�
    if d_pass>=0 then
        if d_pass ~=JY.OldDPass then     --�����ظ�����
            EventExecute(d_pass,3);       --·�������¼�
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

    local isout=0;                --�Ƿ���������
    if (JY.Scene[JY.SubScene]["����X1"] ==JY.Base["��X1"] and JY.Scene[JY.SubScene]["����Y1"] ==JY.Base["��Y1"]) or
       (JY.Scene[JY.SubScene]["����X2"] ==JY.Base["��X1"] and JY.Scene[JY.SubScene]["����Y2"] ==JY.Base["��Y1"]) or
       (JY.Scene[JY.SubScene]["����X3"] ==JY.Base["��X1"] and JY.Scene[JY.SubScene]["����Y3"] ==JY.Base["��Y1"]) then
       isout=1;
    end

    if isout==1 then    --��ȥ����������ͼ
        JY.Status=GAME_MMAP;

		lib.PicInit();
		CleanMemory();
        --lib.ShowSlow(50,1)

        if JY.MmapMusic<0 then
		   if CONFIG.MP3==1 then
		      JY.MmapMusic=39+math.random(5)--JY.Scene[JY.SubScene]["��������"];
		   else
              JY.MmapMusic=25
		   end
        end

		Init_MMap();



        JY.SubScene=-1;
		JY.oldSMapX=-1;
		JY.oldSMapY=-1;

        lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],GetMyPic());
        --lib.ShowSlow(50,0)
        lib.GetKey();
        return;
    end

    --�Ƿ���ת����������
    if JY.Scene[JY.SubScene]["��ת����"] >=0 then
        if JY.Base["��X1"]==JY.Scene[JY.SubScene]["��ת��X1"] and JY.Base["��Y1"]==JY.Scene[JY.SubScene]["��ת��Y1"] then
			local OldScene=JY.SubScene;
            JY.SubScene=JY.Scene[JY.SubScene]["��ת����"];
            lib.ShowSlow(50,1);
--[[
            if JY.Scene[JY.SubScene]["�⾰���X1"]==0 and JY.Scene[JY.SubScene]["�⾰���Y1"]==0 then
                JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"];            --�³������⾰���Ϊ0����ʾ����һ���ڲ�����
                JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"];
            else
                JY.Base["��X1"]=JY.Scene[JY.SubScene]["��ת��X2"];         --�ⲿ���������������ڲ��������ء�
                JY.Base["��Y1"]=JY.Scene[JY.SubScene]["��ת��Y2"];
            end
]]--
            if JY.Scene[OldScene]["�⾰���X1"]~=0 then
				JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"];            --�³������⾰���Ϊ0����ʾ����һ���ڲ�����
                JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"];
            else
                JY.Base["��X1"]=JY.Scene[JY.SubScene]["��ת��X2"];         --�ⲿ���������������ڲ��������ء�
                JY.Base["��Y1"]=JY.Scene[JY.SubScene]["��ת��Y2"];
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
				if JY.Base["��X1"]+mx+i >63 or JY.Base["��Y1"]+my+i>63 then
					break
				end
				if math.abs(GetS(JY.SubScene,JY.Base["��X1"]+mx+i,JY.Base["��Y1"]+my+i,4)-CC.YScale*i*2)<8 then
					mx=mx+i
					my=my+i
					break
				end
			end
			if math.abs(mx)+math.abs(my)==1 then
                local d_num=GetS(JY.SubScene,JY.Base["��X1"]+mx,JY.Base["��Y1"]+my,3);
                if d_num>=0 then
                    EventExecute(d_num,1);       --�ո񴥷��¼�
					JY.oldSMapX=-1;
					JY.oldSMapY=-1;
					JY.D_Valid=nil;
                end
			end
			walkto(mx,my)
		elseif keypress==VK_SPACE or keypress==VK_RETURN  then
            if JY.Base["�˷���"]>=0 then        --��ǰ������һ��λ��				
                local d_num=GetS(JY.SubScene,JY.Base["��X1"]+CC.DirectX[JY.Base["�˷���"]+1],JY.Base["��Y1"]+CC.DirectY[JY.Base["�˷���"]+1],3);
                if d_num>=0 then
                    EventExecute(d_num,1);       --�ո񴥷��¼�
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
        x=JY.Base["��X1"]+CC.DirectX[direct+1];
        y=JY.Base["��Y1"]+CC.DirectY[direct+1];
        JY.Base["�˷���"]=direct;
    else
        x=JY.Base["��X1"];
        y=JY.Base["��Y1"];
    end

    JY.MyPic=GetMyPic();

    DtoSMap();

    if direct~=-1 and (CC.cq~=nil or SceneCanPass(x,y)==true) then          --�µ���������߹�ȥ
        JY.Base["��X1"]=x;
        JY.Base["��Y1"]=y;
    end

    JY.Base["��X1"]=limitX(JY.Base["��X1"],1,CC.SWidth-2);
    JY.Base["��Y1"]=limitX(JY.Base["��Y1"],1,CC.SHeight-2);

end

--��������(x,y)�Ƿ����ͨ��
--����true,���ԣ�false����
function SceneCanPass(x,y)  --��������(x,y)�Ƿ����ͨ��
    local ispass=true;        --�Ƿ����ͨ��
	if x>63 or x<0 or y>63 or x<0 then ispass=false end
    if GetS(JY.SubScene,x,y,1)>0 then     --������1����Ʒ������ͨ��
        ispass=false;
    end

    local d_data=GetS(JY.SubScene,x,y,3);     --�¼���4
    if d_data>=0 then
        if GetD(JY.SubScene,d_data,0)~=0 then  --d*����Ϊ����ͨ��
            ispass=false;
        end
    end

    if CC.SceneWater[GetS(JY.SubScene,x,y,0)] ~= nil then   --ˮ�棬���ɽ���
        ispass=false;
    end
	
	local hb1,hb2
	hb1=GetS(JY.SubScene,JY.Base['��X1'],JY.Base['��Y1'],4)
	hb2=GetS(JY.SubScene,x,y,4)
	if math.abs(hb1-hb2)>14 then
		ispass=false
	end
    return ispass;
end

function Cal_D_Valid()     --����200��D����Ч��D
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

function DtoSMap()          ---D*�е��¼�������Ч����
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
				if not (p3>=CC.SceneFlagPic[1]*2 and p3<=CC.SceneFlagPic[2]*2 and CC.ShowFlag==0) then --�Ƿ���ʾ����
					if p3<=p1 then     --������ֹͣ
						if JY.MyTick2 %100 > delay then
							p3=p3+2;
						end
					else
						if JY.MyTick2 % 4 ==0 then      --4�����Ķ�������һ��
							p3=p3+2;
						end
					end
					if p3>p2 then
						 p3=p1;
					end
				end
				if old_p3 ~=p3 then    --�����ı��ˣ�����һ��
                    local x=GetD(sceneid,i,9);
                    local y=GetD(sceneid,i,10);
					local dy=GetS(sceneid,x,y,4);       --����
					JY.D_PicChange[JY.NumD_PicChange]={x=x, y=y, dy=dy, p1=old_p3/2, p2=p3/2}
					JY.NumD_PicChange=JY.NumD_PicChange+1;
					SetD(sceneid,i,7,p3);
				end
			end
		end
    end
end

--fastdraw = 0 or nil ȫ���ػ档�����¼���
--           1 ��������� ������ʾ����ѭ��
function DrawSMap(fastdraw)         --�泡����ͼ
    if fastdraw==nil then
	    fastdraw=0;
	end
	local x0=JY.SubSceneX+JY.Base["��X1"]---1;    --��ͼ���ĵ�
	local y0=JY.SubSceneY+JY.Base["��Y1"]---1;
	local x=x0-JY.Base["��X1"]--limitX(x0,CC.SceneXMin,CC.SceneXMax)-JY.Base["��X1"];
	local y=y0-JY.Base["��Y1"]--limitX(y0,CC.SceneYMin,CC.SceneYMax)-JY.Base["��Y1"];
--x,y=0,0
--y=GetS(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],4)
    if fastdraw==0 then
		lib.DrawSMap(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],x,y,JY.MyPic);
    else
		if JY.oldSMapX>=0 and JY.oldSMapY>=0 and
		   JY.oldSMapX+JY.oldSMapXoff==JY.Base["��X1"]+x and         --��ͼ���ĵ㲻�䣬����·Ҳ�����òü���ʽ��ͼ
		   JY.oldSMapY+JY.oldSMapYoff==JY.Base["��Y1"]+y then

			local num_clip=0;
			local clip={};

			for i=0,JY.NumD_PicChange-1 do   --����D*����ͼ�ı�ľ���
			    local dx=JY.D_PicChange[i].x-JY.Base["��X1"]-x;
				local dy=JY.D_PicChange[i].y-JY.Base["��Y1"]-y;
				clip[num_clip]=Cal_PicClip(dx,dy,JY.D_PicChange[i].p1,0,
										   dx,dy,JY.D_PicChange[i].p2,0 );
				clip[num_clip].y1=clip[num_clip].y1-JY.D_PicChange[i].dy
				clip[num_clip].y2=clip[num_clip].y2-JY.D_PicChange[i].dy
				num_clip=num_clip+1;
			end

			if JY.oldSMapPic>=0 then  --�������Ǿ���
			    if not ( JY.oldSMapX==JY.Base["��X1"] and    --�����б仯
				         JY.oldSMapY==JY.Base["��Y1"] and
						 JY.oldSMapPic==JY.MyPic ) then
					local dy1=GetS(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],4);   --����
					local dy2=GetS(JY.SubScene,JY.oldSMapX,JY.oldSMapY,4);
					local dy=math.max(dy1,dy2);
					clip[num_clip]=Cal_PicClip(-JY.oldSMapXoff,-JY.oldSMapYoff,JY.oldSMapPic,0,
												-x,-y,JY.MyPic,0)
					clip[num_clip].y1=clip[num_clip].y1- dy;
					clip[num_clip].y2=clip[num_clip].y2- dy;
					num_clip=num_clip+1;
				end
			end

			local area=0;          --����������������
			for i=0,num_clip-1 do
				clip[i]=ClipRect(clip[i]);    --������Ļ����
				if clip[i]~=nil then
					area=area+(clip[i].x2-clip[i].x1)*(clip[i].y2-clip[i].y1)
				end
			end

			if area <CC.ScreenW*CC.ScreenH/2 and num_clip<15 then        --����㹻С��������Ŀ�٣����������Ρ�
				for i=0,num_clip-1 do
					if clip[i]~=nil then
						lib.SetClip(clip[i].x1,clip[i].y1,clip[i].x2,clip[i].y2);
						lib.DrawSMap(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],x,y,JY.MyPic);
					end
				end
			else    --���̫��ֱ���ػ�
				lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);   --����redraw=0����������ü������Ժ����ShowSurface
				lib.DrawSMap(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],x,y,JY.MyPic);
			end
		else
			lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);
			lib.DrawSMap(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],x,y,JY.MyPic);
		end
    end
	--lib.PicLoadCache(0,CC.ScreenW/2,CC.ScreenH/2-GetS(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],4),JY.MyPic)
	--[[if CC.forg==true then
		local dx,dy=x-y,x+y
		dx=-dx*18-320
		dy=-dy*9-240
		lib.LoadPicture(".\\pic\\forg.png",dx,dy)
	end]]--
	JY.oldSMapX=JY.Base["��X1"];
	JY.oldSMapY=JY.Base["��Y1"];
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


-- ��ȡ��Ϸ����
-- id=0 �½��ȣ�=1/2/3 ����
--
--�������Ȱ����ݶ���Byte�����С�Ȼ���������Ӧ��ķ������ڷ��ʱ�ʱֱ�Ӵ�������ʡ�
--����ǰ��ʵ����ȣ����ļ��ж�ȡ�ͱ��浽�ļ���ʱ�������ӿ졣�����ڴ�ռ������
function SBLDATAL(id)       -- ��ȡ��Ϸ����
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
	
    --��ȡR*.idx�ļ�
    local data=Byte.create(6*4);
    Byte.loadfile(data,CC.R_IDXFilename[id],0,6*4);

	local idx={};
	idx[0]=0;
	for i =1,6 do
	    idx[i]=Byte.get32(data,4*(i-1));
	end

    --��ȡR*.grp�ļ�
    JY.Data_Base=Byte.create(idx[1]-idx[0]);              --��������
    Byte.loadfile(JY.Data_Base,CC.R_GRPFilename[id],idx[0],idx[1]-idx[0]);

    --���÷��ʻ������ݵķ����������Ϳ����÷��ʱ�ķ�ʽ�����ˡ������ðѶ���������ת��Ϊ����Լ����ʱ��Ϳռ�
	local meta_t={
	    __index=function(t,k)
	        return GetDataFromStruct(JY.Data_Base,0,CC.Base_S,k);
		end,

		__newindex=function(t,k,v)
	        SetDataFromStruct(JY.Data_Base,0,CC.Base_S,k,v);
	 	end
	}
    setmetatable(JY.Base,meta_t);


    JY.PersonNum=math.floor((idx[2]-idx[1])/CC.PersonSize);   --����

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

    JY.ThingNum=math.floor((idx[3]-idx[2])/CC.ThingSize);     --��Ʒ
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

    JY.SceneNum=math.floor((idx[4]-idx[3])/CC.SceneSize);     --����
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

    JY.WugongNum=math.floor((idx[5]-idx[4])/CC.WugongSize);     --�书
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

    JY.ShopNum=math.floor((idx[6]-idx[5])/CC.ShopSize);     --С���̵�
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

-- д��Ϸ����
-- id=0 �½��ȣ�=1/2/3 ����
function SBLDATAS(id)         -- д��Ϸ����
    --��ȡR*.idx�ļ�
    local t1=lib.GetTime();
	JY.SAVETIME=lib.GetTime();
	JY.GTIME=math.modf((JY.SAVETIME-JY.LOADTIME)/60000)
	--JY.Person[10]["����"]=JY.Person[10]["����"]+JY.GTIME
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

    --дR*.grp�ļ�
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
-----------------------------------ͨ�ú���-------------------------------------------

function filelength(filename)         --�õ��ļ�����
    local inp=io.open(filename,"rb");
    local l= inp:seek("end");
	inp:close();
    return l;
end

--��S������, (x,y) ���꣬level �� 0-5
function GetS(id,x,y,level)       --��S������
	if x>63 or y>63 then lib.Debug(string.format('error:%d,%d',x,y)) end
    return lib.GetS(id,x,y,level);
end

--дS��
function SetS(id,x,y,level,v)       --дS��
    lib.SetS(id,x,y,level,v);
end

--��D*
--sceneid ������ţ�
--id D*���
--Ҫ���ڼ�������, 0-10
function GetD(Sceneid,id,i)          --��D*
    return lib.GetD(Sceneid,id,i);
end

--дD��
function SetD(Sceneid,id,i,v)         --дD��
    lib.SetD(Sceneid,id,i,v);
end

--�����ݵĽṹ�з�������
--data ����������
--offset data�е�ƫ��
--t_struct ���ݵĽṹ����jyconst���кܶඨ��
--key  ���ʵ�key
function GetDataFromStruct(data,offset,t_struct,key)  --�����ݵĽṹ�з������ݣ�����ȡ����
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

function SetDataFromStruct(data,offset,t_struct,key,v)  --�����ݵĽṹ�з������ݣ���������
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

--����t_struct ����Ľṹ�����ݴ�data�����ƴ��ж�����t��
function LoadData(t,t_struct,data)        --data�����ƴ��ж�����t��
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

--����t_struct ����Ľṹ������д��data Byte�����С�
function SaveData(t,t_struct,data)      --����д��data Byte�����С�
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

function limitX(x,minv,maxv)       --����x�ķ�Χ
    if x<minv then
	    x=minv;
	elseif x>maxv then
	    x=maxv;
	end
	return x
end

function RGB(r,g,b)          --������ɫRGB
   return r*65536+g*256+b;
end

function GetRGB(color)      --������ɫ��RGB����
    color=color%(65536*256);
    local r=math.floor(color/65536);
    color=color%65536;
    local g=math.floor(color/256);
    local b=color%256;
    return r,g,b
end

--�ȴ���������
function WaitKey(flag)       --�ȴ���������
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

--���� [0 , i-1] �����������
function Rnd(i)           --�����
	if i==nil or i==0 then return 0 end
    local r=math.random(i);
    return r-1;
end

--�����������ԣ���������ֵ���ƣ���Ӧ�����ֵ���ơ���Сֵ������Ϊ0
--id ����id
--str�����ַ���
--value Ҫ���ӵ�ֵ��������ʾ����
--����1,ʵ�����ӵ�ֵ
--����2���ַ�����xxx ����/���� xxxx��������ʾҩƷЧ��
function AddPersonAttrib(id,str,value)            --������������
    local oldvalue=JY.Person[id][str];
    local attribmax=math.huge;
    if str=="����" then
        attribmax=JY.Person[id]["�������ֵ"] ;
    elseif str=="����" then
        attribmax=JY.Person[id]["�������ֵ"] ;
    else
        if CC.PersonAttribMax[str] ~= nil then
            attribmax=CC.PersonAttribMax[str];			
        end
			   
		if str=='�������ֵ' then
		    local nlmax=math.modf((JY.Person[id]['����']-1)/15)
			attribmax=9500-nlmax*750;
			--attribmax=attribmax+100*math.modf(50-JY.Person[id]['����']*0.5)
                       if T1LEQ(id) or id==53 then
                          attribmax=10000
                       end 
					   for i=1,10 do
					       if JY.Person[id]["�书"..i]==85 or JY.Person[id]["�书"..i]==88 then
						      attribmax=attribmax+750
						   end
					   end
					   if id==58 then
					      attribmax=attribmax-JY.Person[300]["����"]*100
						  if attribmax<500 then attribmax=500 end
					   end
					   if attribmax>10000 then attribmax=10000 end
		end
		if str=="�ö�����" and id==2 then
		   attribmax=500
		end
		if str=="�ö�����" and (id==25 or id==83 or id==17) then
		    attribmax=400
		end		
		if str=="ҽ������" and (id==16 or id==28 or id==45) then
		   attribmax=500
		end
		if str=="ҽ������" and id==85 then  attribmax=400 end
        if (str=="ҽ������" or str=="�ö�����" or str=="�ⶾ����") and (id==0 and GetS(4,5,5,5)==7) then attribmax=400 end
   end
    local newvalue=limitX(oldvalue+value,0,attribmax);
    JY.Person[id][str]=newvalue;
    local add=newvalue-oldvalue;

    local showstr="";
    if add>0 then
        showstr=string.format("%s ���� %d",str,add);
    elseif add<0 then
        showstr=string.format("%s ���� %d",str,-add);
    end
    return add,showstr;
end

--����midi
function PlayMIDI(id)             --����midiMV
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

--������Чatk***
function PlayWavAtk(id)             --������Чatk***
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

--������Чe**
function PlayWavE(id)              --������Чe**
    if JY.EnableSound==0 then
        return ;
    end
    if id>=0 then
        lib.PlayWAV(string.format(CC.EFile,id));
    end
end

function ShowScreen(flag)              --ˢ����Ļ��ʾ
--flag =0 or nil ȫ��ˢ����Ļ
--      1 ��������εĿ���ˢ��
    if JY.Darkness==0 then
	    if flag==nil then
		    flag=0;
		end
	    lib.ShowSurface(flag);
    end
end

--ͨ�ò˵�����
-- menuItem ��ÿ���һ���ӱ�����Ϊһ���˵���Ķ���
--          �˵����Ϊ  {   ItemName,     �˵��������ַ���
--                          ItemFunction, �˵����ú��������û����Ϊnil
--                          Visible       �Ƿ�ɼ�  0 ���ɼ� 1 �ɼ�, 2 �ɼ�����Ϊ��ǰѡ���ֻ����һ��Ϊ2��
--                                        ������ֻȡ��һ��Ϊ2�ģ�û�����һ���˵���Ϊ��ǰѡ���
--                                        ��ֻ��ʾ���ֲ˵�������´�ֵ��Ч��
--                                        ��ֵĿǰֻ�����Ƿ�˵�ȱʡ��ʾ������
--                       }
--          �˵����ú���˵����         itemfunction(newmenu,id)
--
--       ����ֵ
--              0 �������أ������˵�ѭ�� 1 ���ú���Ҫ���˳��˵��������в˵�ѭ��
--
-- numItem      �ܲ˵������
-- numShow      ��ʾ�˵���Ŀ������ܲ˵���ܶ࣬һ����ʾ���£�����Զ����ֵ
--                =0��ʾ��ʾȫ���˵���

-- (x1,y1),(x2,y2)  �˵���������ϽǺ����½����꣬���x2,y2=0,������ַ������Ⱥ���ʾ�˵����Զ�����x2,y2
-- isBox        �Ƿ���Ʊ߿�0 �����ƣ�1 ���ơ������ƣ�����(x1,y1,x2,y2)�ľ��λ��ư�ɫ���򣬲�ʹ�����ڱ����䰵
-- isEsc        Esc���Ƿ������� 0 �������ã�1������
-- Size         �˵��������С
-- color        �����˵�����ɫ����ΪRGB
-- selectColor  ѡ�в˵�����ɫ,
--;
-- ����ֵ  0 Esc����
--         >0 ѡ�еĲ˵���(1��ʾ��һ��)
--         <0 ѡ�еĲ˵�����ú���Ҫ���˳����˵�����������˳����˵�

function ShowMenu(menuItem,numItem,numShow,x1,y1,x2,y2,isBox,isEsc,size,color,selectColor)     --ͨ�ò˵�����
    local w=0;
    local h=0;   --�߿�Ŀ��
    local i=0;
    local num=0;     --ʵ�ʵ���ʾ�˵���
    local newNumItem=0;  --�ܹ���ʾ���ܲ˵�����

    lib.GetKey();

    local newMenu={};   -- �����µ����飬�Ա�����������ʾ�Ĳ˵���

    --�����ܹ���ʾ���ܲ˵�����
    for i=1,numItem do
        if menuItem[i][3]>0 then
            newNumItem=newNumItem+1;
            newMenu[newNumItem]={menuItem[i][1],menuItem[i][2],menuItem[i][3],i};   --���������[4],�����ԭ����Ķ�Ӧ
        end
    end
if newNumItem==0 then
	return 0
end

    --����ʵ����ʾ�Ĳ˵�����
    if numShow==0 or numShow > newNumItem then
        num=newNumItem;
    else
        num=numShow;
    end

    --����߿�ʵ�ʿ��
    local maxlength=0;
    if x2==0 and y2==0 then
        for i=1,newNumItem do
            if string.len(newMenu[i][1])>maxlength then
                maxlength=string.len(newMenu[i][1]);
            end
        end
        w=size*maxlength/2+2*CC.MenuBorderPixel;        --���հ�����ּ����ȣ�һ����4������
        h=(size+CC.RowPixel)*num+CC.MenuBorderPixel;            --��֮����4�����أ���������4������
    else
        w=x2-x1;
        h=y2-y1;
    end

    local start=1;             --��ʾ�ĵ�һ��

	local current =1;          --��ǰѡ����
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
  	        local drawColor=color;           --���ò�ͬ�Ļ�����ɫ
	        if i==current then
	            drawColor=selectColor;
				lib.Background(x1+CC.MenuBorderPixel,y1+CC.MenuBorderPixel+(i-start)*(size+CC.RowPixel),
							  x1-CC.MenuBorderPixel+w,y1+CC.MenuBorderPixel+(i-start)*(size+CC.RowPixel)+size,128,color)
	        end
			DrawString(x1+CC.MenuBorderPixel,y1+CC.MenuBorderPixel+(i-start)*(size+CC.RowPixel),
			           newMenu[i][1],drawColor,size);

	    end
		if numItem==12 and menuItem[12][1]=="�Զ�" then
		   DrawString(100,575,CC.EVB117,C_GOLD,25) 
	    end
		ShowScreen();
		keyPress=WaitKey(1);
		lib.Delay(100);
		if keyPress==VK_ESCAPE then                  --Esc �˳�
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
		        local r=newMenu[current][2](newMenu,current);               --���ò˵�����
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
		        local r=newMenu[current][2](newMenu,current);               --���ò˵�����
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
	    elseif numItem==12 and menuItem[12][1]=="�Զ�" then
		    if keyPress==97 then --����
			    if menuItem[2][3]==1 then
				   local r=War_FightMenu();
				    if r==1 then
				       returnValue=-2
			           break;
					end
				end				
			end
			if keyPress==100 then --����
			   if menuItem[8][3]==1 then
			      local r=War_DefupMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
			if keyPress==112 then  --����
			   if menuItem[7][3]==1 then
			      local r=War_ActupMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
			if keyPress==105 then  --��Ʒ
			   if menuItem[6][3]==1 then
			      local r=War_ThingMenu();
				  if r==1 then
				       returnValue=-2
			           break;
					end
				end
			end
			if keyPress==114 then  --��Ϣ
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

--������ʾ�˵���������ShowMenuһ��
function ShowMenu2(menuItem,numItem,numShow,x1,y1,x2,y2,isBox,isEsc,size,color,selectColor)     --ͨ�ò˵�����
    local w=0;
    local h=0;   --�߿�Ŀ��
    local i=0;
    local num=0;     --ʵ�ʵ���ʾ�˵���
    local newNumItem=0;  --�ܹ���ʾ���ܲ˵�����

    lib.GetKey();

    local newMenu={};   -- �����µ����飬�Ա�����������ʾ�Ĳ˵���

    --�����ܹ���ʾ���ܲ˵�����
    for i=1,numItem do
        if menuItem[i][3]>0 then
            newNumItem=newNumItem+1;
            newMenu[newNumItem]={menuItem[i][1],menuItem[i][2],menuItem[i][3],i};   --���������[4],�����ԭ����Ķ�Ӧ
        end
    end

    --����ʵ����ʾ�Ĳ˵�����
    if numShow==0 or numShow > newNumItem then
        num=newNumItem;
    else
        num=numShow;
    end

    --����߿�ʵ�ʿ��
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

    local start=1;             --��ʾ�ĵ�һ��

    local current =1;          --��ǰѡ����
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
  	        local drawColor=color;           --���ò�ͬ�Ļ�����ɫ
	        if i==current then
	            drawColor=selectColor;
	        end
			DrawString(x1+CC.MenuBorderPixel+(i-start)*(size*maxlength/2+CC.RowPixel),
			           y1+CC.MenuBorderPixel,newMenu[i][1],drawColor,size);
	    end
	    ShowScreen();
		keyPress=WaitKey(1);
		lib.Delay(100);

		if keyPress==VK_ESCAPE then                  --Esc �˳�
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
		        local r=newMenu[current][2](newMenu,current);               --���ò˵�����
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
		        local r=newMenu[current][2](newMenu,current);               --���ò˵�����
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
--------------------------------------��Ʒʹ��---------------------------------------
--��Ʒʹ��ģ��
--��ǰ��Ʒid
--����1 ʹ������Ʒ�� 0 û��ʹ����Ʒ��������ĳЩԭ����ʹ��

function UseThing(id)             --��Ʒʹ��
    --���ú���
	if JY.ThingUseFunction[id]==nil then
	    return DefaultUseThing(id);
	else
        return JY.ThingUseFunction[id](id);
    end
end

--ȱʡ��Ʒʹ�ú�����ʵ��ԭʼ��ϷЧ��
--id ��Ʒid
function DefaultUseThing(id)                --ȱʡ��Ʒʹ�ú���
    if JY.Thing[id]["����"]==0 then
        return UseThing_Type0(id);
    elseif JY.Thing[id]["����"]==1 then
        return UseThing_Type1(id);
    elseif JY.Thing[id]["����"]==2 then
        return UseThing_Type2(id);
    elseif JY.Thing[id]["����"]==3 then
        return UseThing_Type3(id);
    elseif JY.Thing[id]["����"]==4 then
        return UseThing_Type4(id);
    end
end

--������Ʒ�������¼�
function UseThing_Type0(id)              --������Ʒʹ��
    if JY.SubScene>=0 then
		local x=JY.Base["��X1"]+CC.DirectX[JY.Base["�˷���"]+1];
		local y=JY.Base["��Y1"]+CC.DirectY[JY.Base["�˷���"]+1];
        local d_num=GetS(JY.SubScene,x,y,3)
        if d_num>=0 then
            JY.CurrentThing=id;
            EventExecute(d_num,2);       --��Ʒ�����¼�
            JY.CurrentThing=-1;
			return 1;
		else
		    return 0;
        end
    end
end

--װ����Ʒ
function UseThing_Type1(id)            --װ����Ʒʹ��
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("˭Ҫ�䱸%s?",JY.Thing[id]["����"]),C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
    local pp1,pp2=0,0;

    if r>0 then
        local personid=JY.Base["����" ..r]
        if CanUseThing(id,personid) or T2SQ(personid) then
            if JY.Thing[id]["װ������"]==0 then
                if JY.Thing[id]["ʹ����"]>=0 then
                   if JY.Person[JY.Thing[id]["ʹ����"]]["����"]==JY.SQ then
                      JY.Thing[id]["�ӹ�����"]=JY.Thing[id]["�ӹ�����"]/2
                      JY.Thing[id]["�ӷ�����"]=JY.Thing[id]["�ӷ�����"]/2
                      JY.Thing[id]["���Ṧ"]=JY.Thing[id]["���Ṧ"]/2
                   end
                   JY.Person[JY.Thing[id]["ʹ����"]]["����"]=-1;                
                end
                if JY.Person[personid]["����"]>=0 then
                   if T2SQ(personid) then
           JY.Thing[JY.Person[personid]["����"]]["�ӹ�����"]=JY.Thing[JY.Person[personid]["����"]]["�ӹ�����"]/2
           JY.Thing[JY.Person[personid]["����"]]["�ӷ�����"]=JY.Thing[JY.Person[personid]["����"]]["�ӷ�����"]/2
           JY.Thing[JY.Person[personid]["����"]]["���Ṧ"]=JY.Thing[JY.Person[personid]["����"]]["���Ṧ"]/2
                   end
                   JY.Thing[JY.Person[personid]["����"]]["ʹ����"]=-1    
                end
                JY.Person[personid]["����"]=id;
                if T2SQ(personid) then
                   JY.Thing[id]["�ӹ�����"]=JY.Thing[id]["�ӹ�����"]*2
                   JY.Thing[id]["�ӷ�����"]=JY.Thing[id]["�ӷ�����"]*2
                   JY.Thing[id]["���Ṧ"]=JY.Thing[id]["���Ṧ"]*2
                   end        
            elseif JY.Thing[id]["װ������"]==1 then
                if JY.Thing[id]["ʹ����"]>=0 then
                    if JY.Person[JY.Thing[id]["ʹ����"]]["����"]==JY.SQ then
                      JY.Thing[id]["�ӹ�����"]=JY.Thing[id]["�ӹ�����"]/2
                      JY.Thing[id]["�ӷ�����"]=JY.Thing[id]["�ӷ�����"]/2
                      JY.Thing[id]["���Ṧ"]=JY.Thing[id]["���Ṧ"]/2
                   end
                    JY.Person[JY.Thing[id]["ʹ����"]]["����"]=-1;                   
                end
                if JY.Person[personid]["����"]>=0 then
                   if T2SQ(personid) then
           JY.Thing[JY.Person[personid]["����"]]["�ӹ�����"]=JY.Thing[JY.Person[personid]["����"]]["�ӹ�����"]/2
           JY.Thing[JY.Person[personid]["����"]]["�ӷ�����"]=JY.Thing[JY.Person[personid]["����"]]["�ӷ�����"]/2
           JY.Thing[JY.Person[personid]["����"]]["���Ṧ"]=JY.Thing[JY.Person[personid]["����"]]["���Ṧ"]/2
                   end
                    JY.Thing[JY.Person[personid]["����"]]["ʹ����"]=-1
                end
                JY.Person[personid]["����"]=id;
                 if T2SQ(personid) then
                   JY.Thing[id]["�ӹ�����"]=JY.Thing[id]["�ӹ�����"]*2
                   JY.Thing[id]["�ӷ�����"]=JY.Thing[id]["�ӷ�����"]*2
                   JY.Thing[id]["���Ṧ"]=JY.Thing[id]["���Ṧ"]*2
                 end        
            end
            JY.Thing[id]["ʹ����"]=personid    
        else
            DrawStrBoxWaitKey("���˲��ʺ��䱸����Ʒ",C_WHITE,CC.DefaultFont);
			return 0;
        end
    end
--    Cls();
--    ShowScreen();
           
	return 1;
end

--�ж�һ�����Ƿ����װ��������һ����Ʒ
--���� true����������false����
function CanUseThing(id,personid)           --�ж�һ�����Ƿ����װ��������һ����Ʒ
    local str="";
  if personid==76 and id>63 then
        return true;
    elseif (id==220 or id==221) and personid==0 then
	    return true;
    --elseif (id==97 or id==115) and personid==9 then
	     --return true;	
    elseif (id>186 and id<194) and personid==44 then
         return true
    elseif id==114 and personid==0 and GetS(4,5,5,5)==2 and JY.Person[0]["��������"]>99 then
         return true
    elseif id==86 and personid==0 and GetS(4,5,5,5)==1 and JY.Person[0]["ȭ�ƹ���"]>119 then
	     return true
	else
    
    if JY.Thing[id]["����������"] >=0 then
        if JY.Thing[id]["����������"] ~= personid  then
            return false;
        end
    end

    if JY.Thing[id]["����������"] ~=2 and JY.Person[personid]["��������"] ~=2 then
        if JY.Thing[id]["����������"] ~= JY.Person[personid]["��������"] then
            return false;
        end
    end
   
    if JY.Thing[id]["������"] > JY.Person[personid]["�������ֵ"] then
        return false;
    end
    if JY.Thing[id]["�蹥����"] > JY.Person[personid]["������"] then
        return false;
    end
    if JY.Thing[id]["���Ṧ"] > JY.Person[personid]["�Ṧ"] then
        return false;
    end
    if JY.Thing[id]["���ö�����"] > JY.Person[personid]["�ö�����"] then
        return false;
    end
    if JY.Thing[id]["��ҽ������"] > JY.Person[personid]["ҽ������"] then
        return false;
    end
    if JY.Thing[id]["��ⶾ����"] > JY.Person[personid]["�ⶾ����"] then
        return false;
    end
    if JY.Thing[id]["��ȭ�ƹ���"] > JY.Person[personid]["ȭ�ƹ���"] then
        return false;
    end
    if JY.Thing[id]["����������"] > JY.Person[personid]["��������"] then
        return false;
    end
    if JY.Thing[id]["��ˣ������"] > JY.Person[personid]["ˣ������"] then
        return false;
    end
    if JY.Thing[id]["���������"] > JY.Person[personid]["�������"] then
        return false;
    end
    if JY.Thing[id]["�谵������"] > JY.Person[personid]["��������"] then
        return false;
    end
    if JY.Thing[id]["������"] >= 0 then
        if JY.Thing[id]["������"] > JY.Person[personid]["����"] then
            return false;
        end
    else
        if -JY.Thing[id]["������"] < JY.Person[personid]["����"] then
            return false;
        end
    end   
    if JY.Person[personid]["����"]==CC.s10 then
        return false;
    end
	if id==118 then
	   local R=JY.Person[personid];
	   local wp=R["ȭ�ƹ���"]+R["��������"]+R["ˣ������"]+R["�������"];
	    if wp<120 then 
	      return false;
		end
	end
  end
    
    return true
  
end

--�ؼ���Ʒ
function UseThing_Type2(id) --�ؼ���Ʒʹ��
    
    if JY.Thing[id]["ʹ����"]>=0 then
        if DrawStrBoxYesNo(-1,-1,CC.EVB140,C_WHITE,CC.DefaultFont)==false then
            Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
            ShowScreen();
            return 0;
        end
    end

    Cls();
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format(CC.EVB141,JY.Thing[id]["����"]),C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    local r=SelectTeamMenu(CC.MainSubMenuX,nexty);

    if r>0 then
        local personid=JY.Base["����" ..r]
		local yes,full;
        if JY.Thing[id]["�����书"]>=0 then
            yes=0;
			full=1;
            for i = 1,10 do
                if JY.Person[personid]["�书"..i]==JY.Thing[id]["�����书"] then
                    yes=1;             --�书�Ѿ�����
                    break;
                end
				if JY.Person[personid]["�书"..i]==0 then
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

       if CC.Shemale[id]==1 then                --��а�Ϳ���
            if T1LEQ(personid) or T2SQ(personid) or T3XYK(personid) then
               say(CC.EVB143)
               say(CC.EVB144)
               say(CC.EVB145)
               say(CC.EVB146)
            else
		    if JY.Person[personid]["�Ա�"]==0 and CanUseThing(id,personid) then
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
						DrawString(offset,0,JY.Person[personid]["����"]..'������...����Ѫ��  ̫������',C_WHITE,CC.Fontsmall);
						ShowScreen();
						lib.Delay(15);
					end]]
					Cls();
					lib.ShowSlow(100,0);
					JY.Person[personid]["�Ա�"]=2;
					local add,str=AddPersonAttrib(personid,"������",-15);           --���ӹ�����
					DrawStrBoxWaitKey(JY.Person[personid]["����"] .. str,C_ORANGE,CC.DefaultFont);
					add,str=AddPersonAttrib(personid,"������",-25);           --���ӹ�����
					DrawStrBoxWaitKey(JY.Person[personid]["����"] .. str,C_ORANGE,CC.DefaultFont);
				end
			elseif JY.Person[personid]["�Ա�"]==1 then
				DrawStrBoxWaitKey(CC.EVB148,C_WHITE,CC.DefaultFont);
				return 0;
			end
             end
        end


        if yes==1 or CanUseThing(id,personid) or (CanUseThing(id,personid) and yes==2)  then
            if JY.Thing[id]["ʹ����"]==personid then
                return 0;
            end

            if JY.Person[personid]["������Ʒ"]>=0 then
                JY.Thing[JY.Person[personid]["������Ʒ"]]["ʹ����"]=-1;
            end

            if JY.Thing[id]["ʹ����"]>=0 then
                JY.Person[JY.Thing[id]["ʹ����"]]["������Ʒ"]=-1;
                --JY.Person[JY.Thing[id]["ʹ����"]]["��������"]=0;
                JY.Person[JY.Thing[id]["ʹ����"]]["��Ʒ��������"]=0;
            end

            JY.Thing[id]["ʹ����"]=personid
            JY.Person[personid]["������Ʒ"]=id;
            --JY.Person[personid]["��������"]=0;
            JY.Person[personid]["��Ʒ��������"]=0;
        else
            DrawStrBoxWaitKey("���˲��ʺ���������Ʒ",C_WHITE,CC.DefaultFont);
			return 0;
        end
    end

	return 1;
end

--ҩƷ��Ʒ
function UseThing_Type3(id)        --ҩƷ��Ʒʹ��
    local usepersonid=-1;
    if JY.Status==GAME_MMAP or JY.Status==GAME_SMAP then
        Cls(CC.MainSubMenuX,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("˭Ҫʹ��%s?",JY.Thing[id]["����"]),C_WHITE,CC.DefaultFont);
	    local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
        local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
        if r>0 then
            usepersonid=JY.Base["����" ..r]
        end
    elseif JY.Status==GAME_WMAP then           ---ս������ʹ��ҩƷ
        if WAR.Person[WAR.CurID]["������"]==16 then
		    War_CalMoveStep(WAR.CurID,8,1);
			local x,y=War_SelectMove()
			if x~=nil then
				local emeny=GetWarMap(x,y,2);
				if emeny>=0 then
					if WAR.Person[WAR.CurID]["�ҷ�"] == WAR.Person[emeny]["�ҷ�"] then       --���ǵ���
						usepersonid=WAR.Person[emeny]["������"] 
					end
				end
			end
			if usepersonid==-1 then return 0 end--usepersonid=16 end
		else		
		    usepersonid=WAR.Person[WAR.CurID]["������"];
	    end
    end

    if usepersonid>=0 then
        if UseThingEffect(id,usepersonid)==1 then       --ʹ����Ч��
            instruct_32(id,-1);            --��Ʒ��������
            WaitKey();
        else
            return 0;
        end
    end

 --   Cls();
 --   ShowScreen();
	return 1;
end

--ҩƷʹ��ʵ��Ч��XWXG
--id ��Ʒid��
--personid ʹ����id
--����ֵ��0 ʹ��û��Ч������Ʒ����Ӧ�ò��䡣1 ʹ����Ч������ʹ�ú���Ʒ����Ӧ��-1
function UseThingEffect(id,personid)          --ҩƷʹ��ʵ��Ч��
    local str={};
    str[0]=string.format("ʹ�� %s",JY.Thing[id]["����"]);
    local strnum=1;
    local addvalue;

    if JY.Thing[id]["������"] >0 then
        local add=JY.Thing[id]["������"]-math.modf(JY.Thing[id]["������"]*JY.Person[personid]["���˳̶�"]/200)+Rnd(5);
        if JY.Status==GAME_WMAP then
		   if inteam(personid) and inteam(16) then
		      for w=0,WAR.PersonNum-1 do
			        if WAR.Person[w]["������"]==16 then
					   if WAR.Person[w]["����"]==false and WAR.Person[w]["�ҷ�"] then
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
           AddPersonAttrib(personid,"���˳̶�",-math.modf(add/10));
		else
           AddPersonAttrib(personid,"���˳̶�",-math.modf(add/4));
		end	
           addvalue,str[strnum]=AddPersonAttrib(personid,"����",add);	
		   if not inteam(personid) then
		      str[strnum]=string.format("���� ���� %s",add*2)
		   end
			  
        if addvalue ~=0 then
            strnum=strnum+1
        end
    end

    local function ThingAddAttrib(s)     ---����ֲ������������ҩ����������
        if JY.Thing[id]["��" .. s] ~=0 then
            addvalue,str[strnum]=AddPersonAttrib(personid,s,JY.Thing[id]["��" .. s]);
            if addvalue ~=0 then
                strnum=strnum+1
            end
        end
    end

    ThingAddAttrib("�������ֵ");

    if JY.Thing[id]["���ж��ⶾ"] <0 then
        addvalue,str[strnum]=AddPersonAttrib(personid,"�ж��̶�",math.modf(JY.Thing[id]["���ж��ⶾ"]/2));
        if addvalue ~=0 then
            strnum=strnum+1
        end
    end

    ThingAddAttrib("����");

    if JY.Thing[id]["�ı���������"] ==2 then
        str[strnum]="������·��Ϊ������һ"
        strnum=strnum+1
    end

    ThingAddAttrib("����");
    ThingAddAttrib("�������ֵ");
    ThingAddAttrib("������");
    ThingAddAttrib("������");
    ThingAddAttrib("�Ṧ");
    ThingAddAttrib("ҽ������");
    ThingAddAttrib("�ö�����");
    ThingAddAttrib("�ⶾ����");
    ThingAddAttrib("��������");
    ThingAddAttrib("ȭ�ƹ���");
    ThingAddAttrib("��������");
    ThingAddAttrib("ˣ������");
    ThingAddAttrib("�������");
    ThingAddAttrib("��������");
    ThingAddAttrib("��ѧ��ʶ");
    ThingAddAttrib("��������");

    if strnum>1 then
        local maxlength=0      --�����ַ�����󳤶�
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

--������Ʒ
function UseThing_Type4(id)             --������Ʒʹ��
    if JY.Status==GAME_WMAP then
         return War_UseAnqi(id);
    end
	return 0;
end

--------------------------------------------------------------------------------
--------------------------------------�¼�����-----------------------------------

--�¼����������
--id��d*�еı��
--flag 1 �ո񴥷���2����Ʒ������3��·������
function EventExecute(id,flag)               --�¼����������
    JY.CurrentD=id;
    if JY.SceneNewEventFunction[JY.SubScene]==nil then         --û�ж����µ��¼������������þɵ�
        oldEventExecute(flag)
	else
        JY.SceneNewEventFunction[JY.SubScene](flag)         --�����µ��¼�������
    end
    JY.CurrentD=-1;
	JY.Darkness=0;
end

--����ԭ�е�ָ��λ�õĺ���
--�ɵĺ������ָ�ʽΪ  oldevent_xxx();  xxxΪ�¼����
function oldEventExecute(flag)            --����ԭ�е�ָ��λ�õĺ���

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

function oldCallEvent(eventnum)     --ִ�оɵ��¼�����
	local eventfilename=string.format("oldevent_%d.lua",eventnum);
	lib.Debug(eventfilename);
	dofile(CONFIG.OldEventPath .. eventfilename);
end

--�ı���ͼ���꣬�ӳ�����ȥ���ƶ�����Ӧ����
function ChangeMMap(x,y,direct)          --�ı���ͼ����
	JY.Base["��X"]=x;
	JY.Base["��Y"]=y;
	JY.Base["�˷���"]=direct;
end

--�ı䵱ǰ����
function ChangeSMap(sceneid,x,y,direct)       --�ı䵱ǰ����
    JY.SubScene=sceneid;
	JY.Base["��X1"]=x;
	JY.Base["��Y1"]=y;
	JY.Base["�˷���"]=direct;
end

--���(x1,y1)-(x2,y2)�����ڵ����ֵȡ�
--���û�в����������������Ļ����
--ע��ú�������ֱ��ˢ����ʾ��Ļ
function Cls(x1,y1,x2,y2)                    --�����Ļ
    if x1==nil then        --��һ������Ϊnil,��ʾû�в�������ȱʡ
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
        lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],GetMyPic());             --��ʾ����ͼ
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

function ClsN(x1,y1,x2,y2)                    --�����Ļ
    if x1==nil then        --��һ������Ϊnil,��ʾû�в�������ȱʡ
	    x1=0;
		y1=0;
		x2=0;
		y2=0;
	end

	lib.SetClip(x1,y1,x2,y2);
	lib.FillColor(0,0,0,0,0);
	lib.SetClip(0,0,0,0);
end

--����ָ�ռλ����
function instruct_test(s)
    DrawStrBoxWaitKey(s,C_ORANGE,24);
end

--����
function instruct_0()         --����
    Cls();
end

--�Ի�
--talkid: Ϊ���֣���Ϊ�Ի���ţ�Ϊ�ַ�������Ϊ�Ի�����
--headid: ͷ��id
--flag :�Ի���λ�ã�0 ��Ļ�Ϸ���ʾ, ���ͷ���ұ߶Ի�
--            1 ��Ļ�·���ʾ, ��߶Ի����ұ�ͷ��
--            2 ��Ļ�Ϸ���ʾ, ��߿գ��ұ߶Ի�
--            3 ��Ļ�·���ʾ, ��߶Ի����ұ߿�
--            4 ��Ļ�Ϸ���ʾ, ��߶Ի����ұ�ͷ��
--            5 ��Ļ�·���ʾ, ���ͷ���ұ߶Ի�

function instruct_1(talkid,headid,flag)        --�Ի�
    local s=ReadTalk(talkid);
	if s==nil then        --�Ի�id������
	    return ;
	end
    TalkEx(s,headid,flag);
end

--����oldtalk.grp�ļ���idx�����ļ�����������Ի�ʹ��     --syp
function GenTalkIdx()         --���ɶԻ������ļ�
end

--��old_talk.lua�ж�ȡ���Ϊtalkid���ַ�����
--��Ҫ��ʱ���ȡ�����Խ�Լ�ڴ�ռ�ã������ٰ������ļ������ڴ������ˡ�
function ReadTalk(talkid)            --���ļ���ȡһ���Ի�
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

function instruct_11_new()              --�Ƿ�ס��
    Cls();
    return DrawStrBoxYesNo(-1,-1,"�Ƿ�(Y/N)?",C_ORANGE,CC.DefaultFont);
end

function instruct_45_new(id,value)        --�����Ṧ
    local add,str=AddPersonAttrib(id,"�Ṧ",value);
end


function instruct_46_new(id,value)            --��������
    local add,str=AddPersonAttrib(id,"�������ֵ",value);
    AddPersonAttrib(id,"����",0);
end


function instruct_47_new(id,value)
    local add,str=AddPersonAttrib(id,"������",value);           --���ӹ�����
end


function instruct_48_new(id,value)         --��������
    local add,str=AddPersonAttrib(id,"�������ֵ",value);
    AddPersonAttrib(id,"����",0);
end

--�õ���Ʒ
function instruct_2(thingid,num)            --�õ���Ʒ
    if JY.Thing[thingid]==nil then   --�޴���Ʒid
        return ;
	end

    instruct_32(thingid,num);    --������Ʒ
	if num>0 then
       DrawStrBoxWaitKey(string.format("�õ���Ʒ:%s %d",JY.Thing[thingid]["����"],num),C_ORANGE,CC.DefaultFont);
    else
	   DrawStrBoxWaitKey(string.format("ʧȥ��Ʒ:%s %d",JY.Thing[thingid]["����"],-num),C_ORANGE,CC.DefaultFont);
	end
	instruct_2_sub();         --�Ƿ�ɵ�������
end

--����>200�Լ�14�����õ�������
function instruct_2_sub()               --����>200�Լ�14�����õ�������

    if JY.Person[0]["����"] < 200 then
        return ;
    end

    if instruct_18(189) ==true then            --���������� 189 ������id
        return;
    end

    local booknum=0;
    for i=1,CC.BookNum do
        if instruct_18(CC.BookStart+i-1)==true then
            booknum=booknum+1;
        end
    end

    if booknum==CC.BookNum then        --�������Ǿ������ϵ��������¼�
        instruct_3(70,11,-1,1,932,-1,-1,7968,7968,7968,-2,-2,-2);
    end
end

--�޸�D*
-- sceneid ����id, -2��ʾ��ǰ����
-- id  D*��id�� -2��ʾ��ǰid
-- v0 - v10 D*������ -2��ʾ�˲�������
function instruct_3(sceneid,id,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10)     --�޸�D*
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
	    if v9>0 and v10 >0 then   --Ϊ�˺Ͳ������ݣ��޸ĵ����겻��Ϊ0
            SetS(sceneid,GetD(sceneid,id,9),GetD(sceneid,id,10),3,-1);   --���xy�����ƶ��ˣ���ôS����Ӧ����Ҫ�޸ġ�
            SetD(sceneid,id,9,v9)
            SetD(sceneid,id,10,v10)
            SetS(sceneid,GetD(sceneid,id,9),GetD(sceneid,id,10),3,id);
		end
	end
end

--�Ƿ�ʹ����Ʒ����
function instruct_4(thingid)         --�Ƿ�ʹ����Ʒ����
    if JY.CurrentThing==thingid then
        return true;
    else
        return false;
    end
end


function instruct_5()         --ѡ��ս��
    return DrawStrBoxYesNo(-1,-1,"�Ƿ���֮����(Y/N)?",C_ORANGE,CC.DefaultFont);
end


function instruct_6(warid,tmp,tmp,flag)      --ս��
    return WarMain(warid,flag);
end


function instruct_7()                 --�Ѿ�����Ϊreturn��
    instruct_test("ָ��7����")
end


function instruct_8(musicid)            --�ı�����ͼ����
    JY.MmapMusic=musicid;
end


function instruct_9()                --�Ƿ�Ҫ��������
    Cls();
    return DrawStrBoxYesNo(-1,-1,"�Ƿ�Ҫ�����(Y/N)?",C_ORANGE,CC.DefaultFont);
end


function instruct_10(personid)            --�����Ա
    if JY.Person[personid]==nil then
        lib.Debug("instruct_10 error: person id not exist");
		return ;
    end
    local add=0;
    for i =2, CC.TeamNum do             --��һ��λ�������ǣ��ӵڶ�����ʼ
        if JY.Base["����"..i]<0 then
            JY.Base["����"..i]=personid;
            add=1;
            break;
        end
    end
    if add==0 then
        lib.Debug("instruct_10 error: �����������");
        return ;
    end

    for i =1,4 do                --������Ʒ�鹫
        local id =JY.Person[personid]["Я����Ʒ" .. i];
        local n=JY.Person[personid]["Я����Ʒ����" .. i];
		if n==0 then n=0 end
        if id>=0 and n>0 then
            instruct_2(id,n);
            JY.Person[personid]["Я����Ʒ" .. i]=-1;
            JY.Person[personid]["Я����Ʒ����" .. i]=0;
        end
    end
	--[[
	local pid=personid
	local leveladd=JY.Person[pid]["�ȼ�"]-1
	local function cleveradd()
		local ca
		if JY.Person[pid]["����"]>100 then JY.Person[pid]["����"]=100 end
		ca=JY.Person[pid]["����"]+(110-JY.Person[pid]["����"])/2
		ca=ca/15
		return ca
	end
	
	
	local function mymodf(x)
		local x1=math.modf(x)
		if math.random(1)<x-x1 then return x1+1
		else return x1 end
	end
	local tmp
	tmp=(JY.Person[pid]["��������"]+1)*leveladd*3+50
    if JY.Person[pid]["�������ֵ"]<tmp and JY.Person[pid]["�������ֵ"]>tmp/4 then
		JY.Person[pid]["�������ֵ"]=tmp
		JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"];
	end
	tmp=math.modf(leveladd*((10-JY.Person[pid]["��������"])*5+150/cleveradd()))+50
    if JY.Person[pid]["�������ֵ"]<tmp and JY.Person[pid]["�������ֵ"]>tmp/4 then
		JY.Person[pid]["�������ֵ"]=tmp
		JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"];
	end
	tmp=mymodf(cleveradd()*leveladd)+30
    if JY.Person[pid]["������"]<tmp and JY.Person[pid]["������"]>tmp/4 then
		JY.Person[pid]["������"]=tmp
	end
	tmp=mymodf(cleveradd()*leveladd)+30
    if JY.Person[pid]["������"]<tmp and JY.Person[pid]["������"]>tmp/4 then
		JY.Person[pid]["������"]=tmp
	end
	tmp=mymodf(cleveradd()*leveladd/2)+30
    if JY.Person[pid]["�Ṧ"]<tmp and JY.Person[pid]["�Ṧ"]>tmp/4 then
		JY.Person[pid]["�Ṧ"]=tmp
	end
	
	]]--
end


function instruct_11()              --�Ƿ�ס��
    Cls();
    return DrawStrBoxYesNo(-1,-1,"�Ƿ�ס��(Y/N)?",C_ORANGE,CC.DefaultFont);
end


function instruct_12(flag)             --ס�ޣ��ظ�����
    for i=1,CC.TeamNum do
        local id=JY.Base["����" .. i];
        if id>=0 then
			--if flag~=nil then
				JY.Person[id]["���˳̶�"]=0;
				JY.Person[id]["�ж��̶�"]=0;
			--end
            if JY.Person[id]["���˳̶�"]<33 and JY.Person[id]["�ж��̶�"]<=0 then
                JY.Person[id]["���˳̶�"]=0;
                AddPersonAttrib(id,"����",math.huge);     --��һ���ܴ��ֵ���Զ�����Ϊ���ֵ
                AddPersonAttrib(id,"����",math.huge);
                AddPersonAttrib(id,"����",math.huge);
            end
        end
    end
end


function instruct_13()            --��������
    Cls();
    JY.Darkness=0;
    lib.ShowSlow(50,0)
	lib.GetKey();
end


function instruct_14()             --�������
    lib.ShowSlow(50,1);
    JY.Darkness=1;
end

function instruct_15()          --game over
    JY.Status=GAME_DEAD;
    Cls();
    DrawString(CC.GameOverX,CC.GameOverY,JY.Person[0]["����"],RGB(0,0,0),CC.DefaultFont);

	local x=CC.ScreenW-9*CC.DefaultFont;
    DrawString(x,10,os.date("%Y-%m-%d %H:%M"),RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+CC.DefaultFont+CC.RowPixel,"�ڵ����ĳ��",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*2,"�����˿ڵ�ʧ����",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*3,"�ֶ���һ�ʡ�����",RGB(216, 20, 24) ,CC.DefaultFont);

    local loadMenu={ {"�������һ",nil,1},
                     {"������ȶ�",nil,1},
                     {"���������",nil,1},
                     {"�ؼ�˯��ȥ",nil,1} };
    local y=CC.ScreenH-4*(CC.DefaultFont+CC.RowPixel)-10;
    local r=ShowMenu(loadMenu,4,0,x,y,0,0,0,0,CC.DefaultFont,C_ORANGE, C_WHITE)

    if r<4 then
        SBLDATAL(r);
		--JY.OldDPass=-1;
        --JY.Status=GAME_FIRSTMMAP;
		if JY.Base["����"]~=-1 then
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["����"]
			
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

function instruct_16(personid)      --�������Ƿ���ĳ��
    local r=false;
	--[[if JY.Status==GAME_WMAP then
		if WAR.tmp[1000+personid]~=nil then
			return false;
		end
	end]]
    for i = 1, CC.TeamNum do
        if personid==JY.Base["����" .. i] then
            r=true;
            break;
        end
    end;
    return r;
end


function instruct_17(sceneid,level,x,y,v)     --�޸ĳ���ͼ��
    if sceneid==-2 then
        sceneid=JY.SubScene;
    end
    SetS(sceneid,x,y,level,v);
end


function instruct_18(thingid)           --�Ƿ���ĳ����Ʒ
    for i = 1,CC.MyThingNum do
        if JY.Base["��Ʒ" .. i]==thingid then
            return true;
        end
    end
    return false;
end


function instruct_19(x,y)             --�ı�����λ��
    JY.Base["��X1"]=x;
    JY.Base["��Y1"]=y;
	JY.SubSceneX=0;
	JY.SubSceneY=0;
end


function instruct_20()                 --�ж϶����Ƿ���
    if JY.Base["����" .. CC.TeamNum ] >=0 then
        return true;
    end
    return false;
end


function instruct_21(personid)               --���
    if JY.Person[personid]==nil then
        lib.Debug("instruct_21 error: personid not exist");
        return ;
    end
    local j=0;
    for i = 1, CC.TeamNum do
        if personid==JY.Base["����" .. i] then
            j=i;
            break;
        end
    end;
    if j==0 then
       return;
    end

    for  i=j+1,CC.TeamNum do
        JY.Base["����" .. i-1]=JY.Base["����" .. i];
    end
    JY.Base["����" .. CC.TeamNum]=-1;

    if JY.Person[personid]["����"]>=0 then
        JY.Thing[JY.Person[personid]["����"]]["ʹ����"]=-1;
        JY.Person[personid]["����"]=-1
    end
    if JY.Person[personid]["����"]>=0 then
        JY.Thing[JY.Person[personid]["����"]]["ʹ����"]=-1;
        JY.Person[personid]["����"]=-1;
    end

    if JY.Person[personid]["������Ʒ"]>=0 then
        JY.Thing[JY.Person[personid]["������Ʒ"]]["ʹ����"]=-1;
        JY.Person[personid]["������Ʒ"]=-1;
    end

    --JY.Person[personid]["��������"]=0;
    JY.Person[personid]["��Ʒ��������"]=0;
end


function instruct_22()            --������Ϊ0
    for i = 1, CC.TeamNum do
        if JY.Base["����" .. i] >=0 then
            JY.Person[JY.Base["����" .. i]]["����"]=0;
        end
    end
end


function instruct_23(personid,value)           --�����ö�
    JY.Person[personid]["�ö�����"]=value;
    AddPersonAttrib(personid,"�ö�����",0)
end

--��ָ��
function instruct_24()
    instruct_test("ָ��24����")
end

--�����ƶ�
--Ϊ�򻯣�ʵ�����ǳ����ƶ�(x2-x1)��(y2-y1)����y��x����ˣ�x1,y1����Ϊ0
function instruct_25(x1,y1,x2,y2)             --�����ƶ�
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


function instruct_26(sceneid,id,v1,v2,v3)           --����D*���
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

--��ʾ���� id=-1 ����λ�ö���
function instruct_27(id,startpic,endpic)           --��ʾ����
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

--�ж�Ʒ��
function instruct_28(personid,vmin,vmax)          --�ж�Ʒ��
    local v=JY.Person[personid]["Ʒ��"];
    if v >=vmin and v<=vmax then
        return true;
    else
        return false;
    end
end

--�жϹ�����
function instruct_29(personid,vmin,vmax)           --�жϹ�����
    local v=JY.Person[personid]["������"];
    if v >=vmin and v<=vmax then
        return true;
    else
        return false
    end
end

--�����߶�
--Ϊ�򻯣��߶�ʹ�����ֵ(x2-x1)(y2-y1),���x1,y1����Ϊ0������һ��ҪΪ��ǰ���ꡣ
function instruct_30(x1,y1,x2,y2)                --�����߶�
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
    x=JY.Base["��X1"]+CC.DirectX[direct+1];
    y=JY.Base["��Y1"]+CC.DirectY[direct+1];
    JY.Base["�˷���"]=direct;
    JY.MyPic=GetMyPic();
    DtoSMap();

    if  SceneCanPass(x,y)==true then
        JY.Base["��X1"]=x;
        JY.Base["��Y1"]=y;
    end
    JY.Base["��X1"]=limitX(JY.Base["��X1"],1,CC.SWidth-2);
    JY.Base["��Y1"]=limitX(JY.Base["��Y1"],1,CC.SHeight-2);

    DrawSMap();
--    Cls();
    ShowScreen();
	return 1
end
--�����߶�sub
function instruct_30_sub(direct)            --�����߶�sub
    local x,y;
    local d_pass=GetS(JY.SubScene,JY.Base["��X1"],JY.Base["��Y1"],3);   --��ǰ·���¼�
    if d_pass>=0 then
        if d_pass ~=JY.OldDPass then     --�����ظ�����
            EventExecute(d_pass,3);       --·�������¼�
            JY.OldDPass=d_pass;
		    JY.oldSMapX=-1;
	        JY.oldSMapY=-1;
			JY.D_Valid=nil;
        end
    else
        JY.OldDPass=-1;
    end

    local isout=0;                --�Ƿ���������
    if (JY.Scene[JY.SubScene]["����X1"] ==JY.Base["��X1"] and JY.Scene[JY.SubScene]["����Y1"] ==JY.Base["��Y1"]) or
       (JY.Scene[JY.SubScene]["����X2"] ==JY.Base["��X1"] and JY.Scene[JY.SubScene]["����Y2"] ==JY.Base["��Y1"]) or
       (JY.Scene[JY.SubScene]["����X3"] ==JY.Base["��X1"] and JY.Scene[JY.SubScene]["����Y3"] ==JY.Base["��Y1"]) then
       isout=1;
    end

    if isout==1 then    --��ȥ����������ͼ
        JY.Status=GAME_MMAP;

		lib.PicInit();
		CleanMemory();
        lib.ShowSlow(50,1)

        if JY.MmapMusic<0 then
            JY.MmapMusic=JY.Scene[JY.SubScene]["��������"];
        end

		Init_MMap();



        JY.SubScene=-1;
		JY.oldSMapX=-1;
		JY.oldSMapY=-1;

        lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],GetMyPic());
        lib.ShowSlow(50,0)
        lib.GetKey();
        return;
    end

    --�Ƿ���ת����������
    if JY.Scene[JY.SubScene]["��ת����"] >=0 then
        if JY.Base["��X1"]==JY.Scene[JY.SubScene]["��ת��X1"] and JY.Base["��Y1"]==JY.Scene[JY.SubScene]["��ת��Y1"] then
            JY.SubScene=JY.Scene[JY.SubScene]["��ת����"];
            lib.ShowSlow(50,1);

            if JY.Scene[JY.SubScene]["�⾰���X1"]==0 and JY.Scene[JY.SubScene]["�⾰���Y1"]==0 then
                JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"];            --�³������⾰���Ϊ0����ʾ����һ���ڲ�����
                JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"];
            else
                JY.Base["��X1"]=JY.Scene[JY.SubScene]["��ת��X2"];         --�ⲿ���������������ڲ��������ء�
                JY.Base["��Y1"]=JY.Scene[JY.SubScene]["��ת��Y2"];
            end

			Init_SMap(1);

            return;
        end
    end
    AddMyCurrentPic();
    x=JY.Base["��X1"]+CC.DirectX[direct+1];
    y=JY.Base["��Y1"]+CC.DirectY[direct+1];
    JY.Base["�˷���"]=direct;
    JY.MyPic=GetMyPic();
    DtoSMap();

    if  SceneCanPass(x,y)==true then
        JY.Base["��X1"]=x;
        JY.Base["��Y1"]=y;
    end
    JY.Base["��X1"]=limitX(JY.Base["��X1"],1,CC.SWidth-2);
    JY.Base["��Y1"]=limitX(JY.Base["��Y1"],1,CC.SHeight-2);

    DrawSMap();
--    Cls();
    ShowScreen();
	return 1
end

--�ж��Ƿ�Ǯ
function instruct_31(num)             --�ж��Ƿ�Ǯ
    local r=false;
    for i =1,CC.MyThingNum do
        if JY.Base["��Ʒ" .. i]==CC.MoneyID then
            if JY.Base["��Ʒ����" .. i]>=num then
                r=true;
            end
            break;
        end
    end
    return r;
end

--������Ʒ
--num ��Ʒ������������Ϊ������Ʒ
function instruct_32(thingid,num)           --������Ʒ
    local p=1;
    for i=1,CC.MyThingNum do
        if JY.Base["��Ʒ" .. i]==thingid then
            JY.Base["��Ʒ����" .. i]=JY.Base["��Ʒ����" .. i]+num
            p=i;
            break;
        elseif JY.Base["��Ʒ" .. i]==-1 then
            JY.Base["��Ʒ" .. i]=thingid;
            JY.Base["��Ʒ����" .. i]=num;
            p=i;
            break;
        end
    end
	
	if thingid==174 then JY.GOLD=JY.GOLD+num end
	if thingid==155 and num==1 then instruct_32(219,-1) end	   

    if JY.Base["��Ʒ����" .. p] <=0 then
        for i=p+1,CC.MyThingNum do
            JY.Base["��Ʒ" .. i-1]=JY.Base["��Ʒ" .. i];
            JY.Base["��Ʒ����" .. i-1]=JY.Base["��Ʒ����" .. i];
        end
        JY.Base["��Ʒ" .. CC.MyThingNum]=-1;
        JY.Base["��Ʒ����" .. CC.MyThingNum]=0;
    end
end

--ѧ���书
function instruct_33(personid,wugongid,flag)           --ѧ���书
    local add=0;
    for i=1,10 do
        if JY.Person[personid]["�书" .. i]==0 then
            JY.Person[personid]["�书" .. i]=wugongid;
            JY.Person[personid]["�书�ȼ�" .. i]=0;
            add=1
            break;
        end
    end

    if add==0 then      --���书�������������һ���书
        JY.Person[personid]["�书10" ]=wugongid;
        JY.Person[personid]["�书�ȼ�10"]=0;
    end

    if flag==0 then
        DrawStrBoxWaitKey(string.format("%s ѧ���书 %s",JY.Person[personid]["����"],JY.Wugong[wugongid]["����"]),C_ORANGE,CC.DefaultFont);
    end
end

--��������
function instruct_34(id,value)              --��������
    local add,str=AddPersonAttrib(id,"����",value);
    DrawStrBoxWaitKey(JY.Person[id]["����"] .. str,C_ORANGE,CC.DefaultFont);
end

--�����书
function instruct_35(personid,id,wugongid,wugonglevel)         --�����书
    if id>=0 then
        JY.Person[personid]["�书" .. id+1]=wugongid;
        JY.Person[personid]["�书�ȼ�" .. id+1]=wugonglevel;
    else
        local flag=0;
        for i =1,10 do
            if JY.Person[personid]["�书" .. i]==0 then
                flag=1;
                JY.Person[personid]["�书" .. i]=wugongid;
                JY.Person[personid]["�书�ȼ�" .. i]=wugonglevel;
                return;
            end
        end
        if flag==0 then
            JY.Person[personid]["�书" .. 1]=wugongid;
            JY.Person[personid]["�书�ȼ�" .. 1]=wugonglevel;
        end
    end
end

--�ж������Ա�
function instruct_36(sex)               --�ж������Ա�
    if JY.Person[0]["�Ա�"]==sex then
        return true;
    else
        return false;
    end
end


function instruct_37(v)              --����Ʒ��
    AddPersonAttrib(0,"Ʒ��",v);
end

--�޸ĳ���ĳ����ͼ
function instruct_38(sceneid,level,oldpic,newpic)         --�޸ĳ���ĳ����ͼ
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


function instruct_39(sceneid)             --�򿪳���
    JY.Scene[sceneid]["��������"]=0;
end


function instruct_40(v)                --�ı����Ƿ���
    JY.Base["�˷���"]=v;
    JY.MyPic=GetMyPic();
end


function instruct_41(personid,thingid,num)        --������Ա������Ʒ
    local k=0;
    for i =1, 4 do        --������Ʒ
        if JY.Person[personid]["Я����Ʒ" .. i]==thingid then
            JY.Person[personid]["Я����Ʒ����" .. i]=JY.Person[personid]["Я����Ʒ����" .. i]+num;
            k=i;
            break
        end
    end

    --��Ʒ���ٵ�0���������Ʒ��ǰ�ƶ�
    --[[if k>0 and JY.Person[personid]["Я����Ʒ����" .. k] <=0 then
        for i=k+1,4 do
            JY.Person[personid]["Я����Ʒ" .. i-1]=JY.Person[personid]["Я����Ʒ" .. i];
            JY.Person[personid]["Я����Ʒ����" .. i-1]=JY.Person[personid]["Я����Ʒ����" .. i];
        end
        JY.Person[personid]["Я����Ʒ" .. 4]=-1;
        JY.Person[personid]["Я����Ʒ����" .. 4]=0;
    end]]
    
	if k>0 and JY.Person[personid]["Я����Ʒ����" .. k] <=0 then
	   JY.Person[personid]["Я����Ʒ" .. k]=-1
	end

    if k==0 then    --û����Ʒ��ע��˴������ǳ���4����Ʒ�������������������޷����롣
        for i =1, 4 do        --������Ʒ
            if JY.Person[personid]["Я����Ʒ" .. i]==-1 then
                JY.Person[personid]["Я����Ʒ" .. i]=thingid;
                JY.Person[personid]["Я����Ʒ����" .. i]=num;
                break
            end
        end
    end
end


function instruct_42()          --�������Ƿ���Ů��
    local r=false;
    for i =1,CC.TeamNum do
        if JY.Base["����" .. i] >=0 then
            if JY.Person[JY.Base["����" .. i]]["�Ա�"]==1 then
                r=true;
            end
        end
    end
    return r;
end


function instruct_43(thingid)        --�Ƿ���ĳ����Ʒ
    return instruct_18(thingid);
end


function instruct_44(id1,startpic1,endpic1,id2,startpic2,endpic2)     --ͬʱ��ʾ��������
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


function instruct_45(id,value)        --�����Ṧ
    local add,str=AddPersonAttrib(id,"�Ṧ",value);
    DrawStrBoxWaitKey(JY.Person[id]["����"] .. str,C_ORANGE,CC.DefaultFont);
end


function instruct_46(id,value)            --��������
    local add,str=AddPersonAttrib(id,"�������ֵ",value);
    AddPersonAttrib(id,"����",0);
    DrawStrBoxWaitKey(JY.Person[id]["����"] .. str,C_ORANGE,CC.DefaultFont);
end


function instruct_47(id,value)
    local add,str=AddPersonAttrib(id,"������",value);           --���ӹ�����
    DrawStrBoxWaitKey(JY.Person[id]["����"] .. str,C_ORANGE,CC.DefaultFont);
end


function instruct_48(id,value)         --��������
    local add,str=AddPersonAttrib(id,"�������ֵ",value);
    AddPersonAttrib(id,"����",0);
    if instruct_16(id)==true then             --�ҷ���Ա����ʾ����
        DrawStrBoxWaitKey(JY.Person[id]["����"] .. str,C_ORANGE,CC.DefaultFont);
    end
end


function instruct_49(personid,value)       --������������
    JY.Person[personid]["��������"]=value;
end

--�ж��Ƿ���5����Ʒ
function instruct_50(id1,id2,id3,id4,id5)       --�ж��Ƿ���5����Ʒ
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


function instruct_51()     --����������
    instruct_1(2547+Rnd(18),114,0);
end


function instruct_52()       --��Ʒ��
    DrawStrBoxWaitKey(string.format("�����ڵ�Ʒ��ָ��Ϊ: %d",JY.Person[0]["Ʒ��"]),C_ORANGE,CC.DefaultFont);
end


function instruct_53()        --������
    DrawStrBoxWaitKey(string.format("�����ڵ�����ָ��Ϊ: %d",JY.Person[0]["����"]),C_ORANGE,CC.DefaultFont);
end


function instruct_54()        --������������
    for i = 0, JY.SceneNum-1 do
        JY.Scene[i]["��������"]=0;
    end
    JY.Scene[2]["��������"]=2;    --�ƺ���
    JY.Scene[38]["��������"]=2;   --Ħ����
    JY.Scene[75]["��������"]=1;   --�һ���
    JY.Scene[80]["��������"]=1;   --����ȵ�
end


function instruct_55(id,num)      --�ж�D*��ŵĴ����¼�
    if GetD(JY.SubScene,id,2)==num then
        return true;
    else
        return false;
    end
end


function instruct_56(v)             --��������
    JY.Person[0]["����"]=JY.Person[0]["����"]+v;
    instruct_2_sub();     --�Ƿ��������������
end

--�߲��Թ�����
function instruct_57()       --�߲��Թ�����
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

--���������
function instruct_58()           --���������
    local group=5           --���������
    local num1 = 6          --ÿ���м���ս��
    local num2 = 3          --ѡ���ս����
    local startwar=102      --��ʼս�����
    local flag={};

    for i = 0,group-1 do
        for j=0,num1-1 do
            flag[j]=0;
        end

        for j = 1,num2 do
            local r;
            while true do          --ѡ��һ��ս��
                r=Rnd(num1);
                if flag[r]==0 then
                    flag[r]=1;
                    break;
                end
            end
            local warnum =r+i*num1;      --������ս�����
            WarLoad(warnum + startwar);
            instruct_1(2854+warnum, JY.Person[WAR.Data["����1"]]["ͷ�����"], 0);
            instruct_0();
            if WarMain(warnum + startwar, 0) ==true  then     --Ӯ
                instruct_0();
                instruct_13();
                TalkEx("������λǰ���ϴͽ̣�", 0, 1)
                instruct_0();
            else
                instruct_15();
                return;
            end
        end

        if i < group - 1 then
            TalkEx("��������ս������*������Ϣ��ս��", 70, 0);
            instruct_0();
            instruct_14();
            lib.Delay(300);
            if JY.Person[0]["���˳̶�"] < 50 and JY.Person[0]["�ж��̶�"] <= 0 then
               JY.Person[0]["���˳̶�"] = 0
               AddPersonAttrib(0,"����",math.huge);
               AddPersonAttrib(0,"����",math.huge);
               AddPersonAttrib(0,"����",math.huge);
            end
            instruct_13();
            TalkEx("���Ѿ���Ϣ���ˣ�*��˭Ҫ���ϣ�",0,1);
            instruct_0();
        end
    end

    TalkEx("��������˭��**��������*��������***û��������",0,1);
    instruct_0();
    TalkEx("�����û����Ҫ��������λ*������ս���������书����*��һ֮������������֮λ��*������λ������ã�***������������*������������*������������*�ã���ϲ����������������*֮λ����������ã������*���������ȡ�Ҳ���㱣�ܣ�",70,0);
    instruct_0();
    TalkEx("��ϲ������",12,0);
    instruct_0();
    TalkEx("С�ֵܣ���ϲ�㣡",64,4);
    instruct_0();
    TalkEx("�ã���������ִ�ᵽ����*Բ��������ϣ�������λ��*��ͬ�����ٵ��һ�ɽһ�Σ�",19,0);
    instruct_0();
    instruct_14();
    for i = 24,72 do
        instruct_3(-2, i, 0, 0, -1, -1, -1, -1, -1, -1, -2, -2, -2)
    end
    instruct_0();
    instruct_13();
    TalkEx("����ǧ����࣬����춴��*Ⱥ�ۣ��õ�����������֮λ*�����ȣ�*���ǡ�ʥ�á������أ�*Ϊʲ��û�˸����ң��ѵ���*�Ҷ���֪����*�������е����ˣ�", 0, 1)
    instruct_0();
    instruct_2(143, 1)           --�õ�����

end

--ȫ���Ա���
function instruct_59()           --ȫ���Ա���
    for i=CC.TeamNum,2,-1 do
	    if JY.Base["����" .. i]>=0 then
            instruct_21(JY.Base["����" .. i]);
	    end
    end

    for i,v in ipairs(CC.AllPersonExit) do
        instruct_3(v[1],v[2],0,0,-1,-1,-1,-1,-1,-1,0,-2,-2);
    end
end

--�ж�D*ͼƬ
function instruct_60(sceneid,id,num)          --�ж�D*ͼƬ
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

--�ж��Ƿ����14����
function instruct_61()               --�ж��Ƿ����14����
    for i=11,24 do
        if GetD(JY.SubScene,i,5) ~= 4664 then
            return false;
        end
    end
    return true;
end

--����ʱ�ջ�����������
function instruct_62(id1,startnum1,endnum1,id2,startnum2,endnum2)      --����ʱ�ջ�����������
      JY.MyPic=-1;
      instruct_44(id1,startnum1,endnum1,id2,startnum2,endnum2);

      --�˴�Ӧ�ò��������Ƭβ������������ʱ��ͼƬ����

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

--�����Ա�
function instruct_63(personid,sex)          --�����Ա�
    JY.Person[personid]["�Ա�"]=sex
end

--С��������
function instruct_64()                 --С��������
    local headid=223;           --С��ͷ��

    local ts=0;
    local id=-1;
    for i=0,JY.ShopNum-1 do                --�ҵ���ǰ�̵�id
        if CC.ShopScene[i].sceneid==JY.SubScene then
            id=i;
            break;
        end
    end
    if id<0 then
        return ;
    end

    TalkEx("��λС�磬������ʲ����Ҫ*�ģ�С�����Ķ�����Ǯ��*�Թ�����",headid,0);

    local menu={};
    for i=1,5 do
        menu[i]={};
        local thingid=JY.Shop[id]["��Ʒ" ..i];
        menu[i][1]=string.format("%-12s %5d",JY.Thing[thingid]["����"],JY.Shop[id]["��Ʒ�۸�" ..i]);
        menu[i][2]=nil;
        if JY.Shop[id]["��Ʒ����" ..i] >0 then
            menu[i][3]=1;
        else
            menu[i][3]=0;
        end			  
    end
	for i=1,200 do 
			if JY.Base["��Ʒ"..i]>143 and JY.Base["��Ʒ"..i]<158 then
				ts=ts+1
			end
	end		   
	if ts<6 and id==0 then menu[5][3]=0 end
	if ts<8 and id==4 then menu[5][3]=0 end

    local x1=(CC.ScreenW-9*CC.DefaultFont-2*CC.MenuBorderPixel)/2;
    local y1=(CC.ScreenH-5*CC.DefaultFont-4*CC.RowPixel-2*CC.MenuBorderPixel)/2;

    local r=ShowMenu(menu,5,0,x1,y1,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

	
	
		
    if r>0 then
	    
		
        if instruct_31(JY.Shop[id]["��Ʒ�۸�" ..r])==false then
            TalkEx("�ǳ���Ǹ��*�����ϵ�Ǯ�ƺ�������",headid,0);
        else
            JY.Shop[id]["��Ʒ����" ..r]=JY.Shop[id]["��Ʒ����" ..r]-1;
            instruct_32(CC.MoneyID,-JY.Shop[id]["��Ʒ�۸�" ..r]);
            instruct_32(JY.Shop[id]["��Ʒ" ..r],1);
            TalkEx("��ү����С��Ķ�����*��֤������ڣ�",headid,0);
        end
    end
		
    for i,v in ipairs(CC.ShopScene[id].d_leave) do
        instruct_3(-2,v,0,-2,-1,-1,939,-1,-1,-1,-2,-2,-2);      --�����뿪����ʱ����С���뿪�¼���
    end
end

--С��ȥ������ջ
function instruct_65()           --С��ȥ������ջ
    local id=-1;
    for i=0,JY.ShopNum-1 do                --�ҵ���ǰ�̵�id
        if CC.ShopScene[i].sceneid==JY.SubScene then
            id=i;
            break;
        end
    end
    if id<0 then
        return ;
    end

    ---�����ǰ�̵�����С��D��
    instruct_3(-2,CC.ShopScene[id].d_shop,0,-2,-1,-1,-1,-1,-1,-1,-2,-2,-2);
    for i,v in ipairs(CC.ShopScene[id].d_leave) do
        instruct_3(-2,v,0,-2,-1,-1,-1,-1,-1,-1,-2,-2,-2);
    end

    local newid=id+1;              --��ʱ��˳��ȡ�������
    if newid>=5 then
        newid=0;
    end

    --�����µ�С���̵�λ��
    instruct_3(CC.ShopScene[newid].sceneid,CC.ShopScene[newid].d_shop,1,-2,938,-1,-1,8256,8256,8256,-2,-2,-2);
end

--��������
function instruct_66(id)       --��������
    PlayMIDI(id);
end

--������Ч
function instruct_67(id)      --������Ч
     PlayWavAtk(id);
end



function Shurufa(x,y)
	local pinyin=""				--���ڱ���ƴ���ַ���
	local word=""				--���ڱ�����������ı�
	while true do
		local tmp;
		lib.BeginTextInput();
		pinyin,tmp=GetPinyin(x,y,word)
		lib.EndTextInput();
		if tmp~=nil then word=tmp end
			if pinyin=="finish" then break;
			elseif pinyin~=-1 and pinyin~="" then
				return pinyin;
            end
	end
return ""
end

function SeleteHanzi(x,y,word,pinyin)--ѡ��
	local T1=
{
de=
{
"��","��","��","��","��","�"
},
di=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�","ݶ","��","��","ۡ","��","��","��","ڮ","��","��","��","��","ص","��","�","��","��","��","��"
},
yi=
{
"һ","��","��","��","��","��","��","��","��","ҽ","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","Ҽ","�","��","߮","ҿ","�","��","��","��","�","ڱ","��","��","ܲ","��","�","Ҿ","��","��","��","��","��","��","��","��","��","߽","��","��","��","��","��","��","��","޲","��","��","��","�","��","�","��","��","�","٫","��","��","��","��","��"
},
guo=
{
"��","��","��","��","��","��","��","��","�","��","�","��","��","��","�","��","��","��","��"
},
zai=
{
"��","��","��","��","��","��","��","��","��","��"
},
ren=
{
"��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","��"
},
le=
{
"��","��","��","��","߷","��","��","��"
},
liao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","ޤ","�","��","��","��"
},
you=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ݬ","��","��","��","��","��","ݵ","ݯ","��","�","��","��","�","��","��","��","��","٧"
},
zhong=
{
"��","��","��","��","��","��","��","��","��","��","��","ڣ","��","��","��","��","�"
},
shi=
{
"��","��","ʱ","ʵ","��","ʮ","ʹ","��","ʩ","ʽ","��","��","ʶ","ʦ","ʷ","ʾ","ʯ","ʳ","ʼ","ʿ","ʧ","��","��","ʲ","��","��","ʫ","��","ֳ","��","ʻ","��","��","ʪ","ʴ","ʨ","��","ʰ","ʬ","��","��","��","ʸ","��","��","��","��","��","��","ʺ","��","��","ʭ","��","ݪ","��","��","��","��","��","�","��","��","��","߱","��","��","��"
},
nian=
{
"��","��","��","ճ","��","إ","��","��","��","��","��","��","��","��","�"
},
he=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ڭ","�","��","��","��","��","��","��","��"
},
hu=
{
"��","��","��","��","��","��","��","��","��","Ϸ","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","��","��","��","��","��","�","��","��","��","��","�","��","��","��","�","�","��","��","��"
},
huo=
{
"��","��","��","��","��","��","��","��","��","��","��","��","޽","��","�","��","��","��","�","��","߫"
},
da=
{
"��","��","��","��","��","��","�","��","�","��","��","��","��","��","��","��","��","�"
},
dai=
{
"��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","߰","ܤ","�","��","߾","��","��"
},
ye=
{
"ҵ","Ҳ","ҹ","Ҷ","Ұ","Һ","ұ","ҳ","ү","Ү","а","��","Ҭ","��","��","Ҵ","ק","ҷ","��","��","Ҹ","ҭ","��","��","��","��"
},
bu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","߲","�","��","��","��","��"
},
wei=
{
"Ϊ","λ","ί","δ","ά","��","Χ","Υ","��","ΰ","Σ","ζ","΢","��","Ψ","ν","α","ο","β","κ","Τ","θ","η","�","ι","Ρ","ή","ε","γ","Ϋ","ξ","μ","Ω","ޱ","έ","�","��","�","��","��","��","Φ","��","��","�","��","��","��","��","�","�","��","�","��","��","��","��","�","��","��","��","�"
},
fa=
{
"��","��","��","��","��","��","��","��","��","��"
},
hui=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ڶ","ޥ","��","��","��","��","�","��","��","�","�","�","�","�","��","��","��","��"
},
kuai=
{
"��","��","��","��","��","��","��","�","ۦ","��","��"
},
gong=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��"
},
jing=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","ݼ","��","��","�","��","��","��","��","��","�","��","��","��","�"
},
shang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�"
},
yao=
{
"Ҫ","Լ","ҩ","��","��","ҡ","ҫ","��","ң","Ҧ","Ҥ","��","ҧ","Ң","Կ","ҥ","��","ز","��","ߺ","ű","��","��","��","Ҩ","�","��","��","س","��","��","��","�","��","��","��"
},
ge=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","ت","��","��","��","�","ܪ","��","�"
},
chan=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","��","��","��","��","��","�","��","��","��","��","��","��"
},
zhe=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ߡ","��"
},
chu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","ۻ","��","��","��","��","ء","��","��","��"
},
xing=
{
"��","ʡ","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","�","ߩ","��","��"
},
hang=
{
"��","��","��","��","��","��","��","��","�","��"
},
heng=
{
"��","��","��","��","��","��","��","��","޿"
},
zuo=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
sheng=
{
"��","ʡ","��","��","ʤ","ʢ","��","ʥ","ʣ","��","��","��","��","��","��","��","��"
},
jia=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","Ю","��","٤","��","�","��","�","��","��","��","��","��","�","��","��","��","ۣ","��","��","��","��","��","��","�"
},
jie=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ڵ","��","�","�","�","��","�","��","��","ڦ","��","��","��","�","��","��"
},
cheng=
{
"��","��","��","��","��","ʢ","��","��","��","��","��","��","��","��","��","��","�","ة","��","��","��","��","��","��","��","��","��","��"
},
dao=
{
"��","��","��","��","��","��","��","��","��","��","��","߶","��","��","�","��","��","��"
},
ri=
{
"��"
},
min=
{
"��","��","��","��","��","��","�","��","��","��","��","��","��","�","��","��"
},
lai=
{
"��","��","��","��","��","��","�","��","��","�","��","�"
},
wo=
{
"��","��","��","��","��","��","��","��","��","�","��","�","��","ݫ","��","�","��"
},
dui=
{
"��","��","��","��","��","��","�","�"
},
jin=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","ݣ","��","��","�","��","��","��","��"
},
duo=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��"
},
quan=
{
"ȫ","Ȩ","ȯ","Ȫ","Ȧ","ȭ","Ȱ","Ȯ","��","Ȭ","ڹ","��","ȩ","��","ȧ","�","��","��","�","��","�"
},
jian=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ǳ","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","�","��","��","��","�","�","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�"
},
ta=
{
"��","��","��","��","��","̤","��","�","�","��","̡","�","̢","̣","��","��","��","��","��","��"
},
kai=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��"
},
men=
{
"��","��","��","��","��","�","��"
},
chang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","��","��","��","�","�","��"
},
zhan=
{
"չ","ս","ռ","վ","ո","ճ","տ","մ","հ","��","ղ","ն","յ","շ","��","ձ","ջ","պ","�","��","��"
},
li=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","޼","�","��","��","��","��","�","��","��","��","��","ݰ","�","��","�","��","��","��","ٳ","��","��","��","۪","ٵ","��","�","��","�","�","��","�","��","��","��","��","��","ت","��","��","߿","��","��","��","��","��","��","�","�","��","��","��"
},
xin=
{
"��","��","��","Ѱ","��","��","н","ܰ","��","о","п","��","�","��","�","ض","��"
},
fang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
zhu=
{
"��","��","ס","ע","��","��","��","��","��","פ","��","��","ף","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","��","��","٪","��","��","��","��","��","��","��","ۥ","��","��","��","��","��","��"
},
qi=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ؽ","��","��","��","��","�","��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","�","��","��","��","�","�","��","ٹ","��","��","��","��","��","��","��","��","��","��","ޭ","�","��","��","��","��","��","��","ݽ","��","��","��","�","ܻ","��","��"
},
zi=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","֨","��","�","��","��","��","��","�","��","��","��","��","�","��","��","��","��","��","��","��","��","��"
},
xue=
{
"ѧ","Ѫ","ѩ","��","Ѧ","Ѩ","ѥ","��","��","��","��","�"
},
bao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��"
},
zhi=
{
"��","֮","��","��","ְ","ֻ","־","��","ָ","֯","֧","ֵ","֪","ʶ","ֱ","��","ִ","��","ֹ","ֲ","ֽ","��","ֳ","��","ּ","ַ","��","��","֦","֥","֬","��","֭","֫","ֿ","��","��","��","��","��","��","ֶ","��","��","��","֨","ֺ","��","֩","ۤ","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","ش","��","��","��","��","��","��","��","��","��","��","��"
},
zheng=
{
"��","��","֤","��","��","��","֣","��","֢","��","��","��","�","��","��","֡","�","��","ں","��","��","��"
},
ji=
{
"��","��","��","��","��","��","��","ϵ","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ؽ","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","��","�","��","��","�","��","��","��","�","ߴ","��","��","ڵ","�","��","�","��","��","��","��","��","��","��","��","��","ܸ","��","��","��","�","٥","��","��","��","��","��","��","��","��","�","��","�","��","��","��","�","آ","��","ު","��","��"
},
yong=
{
"��","��","ӵ","��","ӿ","Ӿ","ӹ","ٸ","ӻ","Ӷ","ӽ","Ӻ","�","��","ӷ","��","Ӽ","��","�","��","Ӹ","��","ܭ","��","�"
},
tong=
{
"ͬ","ͨ","ͳ","ͯ","ʹ","ͭ","Ͱ","ͩ","Ͳ","ͮ","��","١","��","ͱ","ͪ","��","ͫ","��","�","��","��","��","��","��"
},
yu=
{
"��","��","��","��","Ԥ","��","��","��","��","��","��","��","��","��","ԣ","��","��","��","��","��","��","��","��","��","ԥ","��","Ԣ","��","��","��","ԡ","��","��","��","ε","��","��","��","ξ","��","��","��","��","��","Ԧ","�","خ","ع","��","��","��","��","��","��","��","��","�","��","��","�","��","��","��","��","��","��","��","��","��","��","ٶ","��","��","�","��","��","�","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��"
},
gao=
{
"��","��","��","��","��","��","��","��","��","�","�","۬","غ","ھ","޻","��","��","��","��"
},
zhang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","�","�","�","۵","��"
},
xian=
{
"��","��","��","��","��","��","��","��","��","��","ϴ","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","ϳ","��","��","��","��","��","��","�","��","�","޺","��","��","�","ݲ","��","��","��","��","��"
},
ben=
{
"��","��","��","��","��","��","�","��","��"
},
yue=
{
"��","˵","Լ","Խ","��","Ծ","��","��","��","��","Ի","Կ","��","��","��","�","��","�"
},
ding=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��","�","��","��","��","��","��"
},
hua=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�"
},
dong=
{
"��","��","��","��","��","��","��","��","��","��","�","�","��","��","��","��","�","�","��"
},
pin=
{
"Ʒ","ƶ","Ƹ","Ƶ","ƴ","ƻ","��","�","�","��","�","��"
},
chong=
{
"��","��","��","��","ӿ","��","��","��","��","�","��","��","�","��"
},
guan=
{
"��","��","��","��","��","��","��","��","��","��","ݸ","��","��","��","��","��","��","��","��","��"
},
fen=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��"
},
wai=
{
"��","��"
},
qu=
{
"��","ȥ","ȡ","��","��","��","��","Ȥ","��","��","��","��","Ȣ","��","��","��","�","ȣ","��","��","��","�","��","��","��","ڰ","۾","ޡ","޾","�","��","�","�","��","�","��"
},
ou=
{
"��","ŷ","ż","Ź","Ż","ź","ک","Ÿ","�","Ž","��","��"
},
neng=
{
"��"
},
she=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","ߡ","�","��"
},
hou=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","ܩ"
},
jiu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","��","��","��","��"
},
deng=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�"
},
ti=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","��","�","��"
},
xia=
{
"��","��","Ͽ","��","Ͻ","ϼ","Ϻ","��","��","��","Ͼ","��","Ϲ","ϻ","�","��","��","��","��","��","��","��","��"
},
wan=
{
"��","��","��","��","��","��","��","��","��","��","��","ݸ","��","��","��","��","��","��","��","��","��","�","��","��","��","�","��","��","ܹ"
},
mo=
{
"��","��","û","ģ","ĩ","ð","Ī","Ħ","ī","Ĭ","ĥ","��","Į","��","Ĥ","ħ","ĭ","İ","Ĩ","į","Ģ","ġ","��","��","��","��","��","��","��","��","��","��","��","�","��","��"
},
yuan=
{
"Ԫ","Ա","Ժ","ԭ","Դ","Զ","Ը","԰","Ԯ","Բ","Ե","Ԭ","Թ","Ԩ","Է","ԩ","��","Գ","ԫ","��","ܫ","��","ԧ","ԯ","�","�","��","�","ܾ","��","��","�","��","��","��"
},
qian=
{
"ǰ","ǧ","Ǯ","ǩ","Ǳ","Ǩ","Ƿ","��","ǣ","ǳ","ǲ","ǫ","Ǭ","Ǧ","Ǹ","ǭ","Ǵ","Ƕ","ٻ","ǯ","��","�","ǵ","ǥ","�","��","��","��","Ǥ","ܷ","��","��","ݡ","Ǫ","��","�","��","��","�","�","��","�","�","��","�","��"
},
mian=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
nong=
{
"ũ","Ũ","Ū","ŧ","ٯ","��"
},
shuo=
{
"˵","��","˶","˸","˷","��","��","��","��","��"
},
shui=
{
"˵","ˮ","˰","˭","˯"
},
yun=
{
"Ա","��","��","��","��","��","��","��","��","��","��","��","ܿ","��","�","��","��","�","�","۩","�","��","�","��","��"
},
er=
{
"��","��","��","��","��","��","��","��","��","��","��","٦","�","��"
},
wu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","أ","��","��","�","��","��","�","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��"
},
dian=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","�","��","��","��","��","��","��","��","��"
},
wen=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��"
},
ke=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","��","��","�","�","��","��","�","�","��","�","�","��","��","�"
},
zong=
{
"��","��","��","��","��","��","��","��","��","��","��"
},
xmjc=
{"��","��","��","��","��","��","ˮ"},
gai=
{
"��","��","��","��","��","��","ؤ","��","��","��","��","�"
},
san=
{
"��","ɢ","ɡ","��","��","��","�"
},
hao=
{
"��","��","��","��","��","��","��","�","�","��","��","��","�","��","�","�","��","�","��","޶","��"
},
si=
{
"˾","��","˼","˹","ʳ","˽","��","��","˿","��","��","��","��","˺","��","��","��","��","��","��","˻","��","ٹ","��","��","��","��","��","�","��","��","�","��","��","��"
},
cong=
{
"��","��","��","��","��","��","��","��","��","��","�"
},
ping=
{
"ƽ","��","ƾ","ƿ","��","��","Ƽ","ƻ","ƹ","ƺ","��","�","ٷ","��"
},
dang=
{
"��","��","��","��","��","�","�","��","��","��","��"
},
tian=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��"
},
nei=
{
"��","��","��","��"
},
xiao=
{
"С","Ч","��","��","У","��","Ц","Ф","��","Т","��","��","��","��","Х","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��"
},
mu=
{
"Ŀ","ģ","ľ","Ķ","Ļ","ĸ","��","��","ķ","Ĺ","Ľ","Ĳ","ĵ","ļ","��","��","ĺ","Ĵ","��","��","��","��","�","��"
},
hai=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��"
},
suo=
{
"��","��","��","��","ɯ","��","��","��","��","��","�","��","��","��","��","��","��"
},
ru=
{
"��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","�","޸","��","�","��"
},
liang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","ݹ","�","��","ܮ"
},
du=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","�","��","��","ܶ","��"
},
bei=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
huan=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","�","��","ۼ","ۨ","��","�","��","��","��","��","��","��","��","ߧ"
},
dou=
{
"��","��","��","��","��","��","��","��","�","�","��","��","��"
},
shu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ˡ","��","��","��","��","��","��","ٿ","��","�","�","��","��","��","��","�","�","��","ح"
},
ming=
{
"��","��","��","��","��","��","ڤ","��","��","��","�","��","��"
},
zhao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","צ","گ","��","��","��"
},
zhuo=
{
"��","��","��","��","׿","׽","��","��","��","��","׾","��","��","��","��","�","��","پ","ߪ","�","��","��","�","��"
},
ci=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
jiang=
{
"��","ǿ","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","��","��","��"
},
qiang=
{
"��","ǿ","��","ǽ","ǹ","ǻ","��","Ǻ","Ǽ","Ǿ","��","��","��","��","��","��","�","��","��","�","��"
},
zeng=
{
"��","��","��","��","��","�","�","��","��"
},
xiang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","ܼ","��","��","��","�"
},
ying=
{
"Ӧ","Ӫ","Ӱ","Ӣ","ӭ","ӳ","Ӳ","ӯ","Ӯ","ӱ","Ӥ","ӥ","ӫ","Ө","ӣ","��","Ӭ","��","ݺ","�","��","ӧ","�","�","�","��","ө","��","��","��","۫","��","��","�","��","�","��","��","��"
},
mei=
{
"��","û","ÿ","ú","÷","ý","ö","��","ü","��","ù","��","��","��","õ","ø","þ","��","��","ݮ","��","�","��","��","��","�","�","��"
},
gui=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","Ȳ","��","��","�","��","��","��","��","�","��","��","��","��","�","��"
},
xie=
{
"Щ","��","Э","д","Ѫ","Ҷ","л","е","Ь","в","б","Я","и","��","ж","г","й","з","а","Ъ","к","м","Ю","��","�","Ы","ߢ","��","��","Ш","�","��","��","�","��","��","ޯ","�","��","��","�","��"
},
biao=
{
"��","��","��","��","��","��","��","�","��","�","��","�","�","��","��","�"
},
xi=
{
"ϵ","��","ϯ","Ϣ","ϣ","ϰ","��","ϲ","ϸ","��","Ϸ","ϴ","Ϥ","��","Ϫ","ϧ","ϡ","Ϯ","Ϧ","��","��","��","��","ϩ","��","ϱ","��","ϥ","϶","Ϭ","��","��","��","Ϩ","��","��","��","��","��","��","ϫ","��","��","ϳ","��","��","�","��","��","�","ۭ","��","�","��","��","�","��","ϭ","��","��","��","��","��","�","��","��","�","��","��","��","��","�","�","��","��","ݾ","��"
},
ban=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�"
},
jiao=
{
"��","��","��","У","��","��","��","��","��","��","��","��","��","��","��","��","��","ٮ","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","�","��","��","��","��","��","��","��","��","ܴ","��","�"
},
tiao=
{
"��","��","��","��","��","��","��","�","��","٬","��","��","��","��","��","��"
},
zui=
{
"��","��","��","��","��","��","ީ"
},
te=
{
"��","��","߯","�","�"
},
shou=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��"
},
bing=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
an=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","��"
},
kou=
{
"��","��","��","ߵ","��","ޢ","��","��","��"
},
diao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��"
},
zu=
{
"��","��","��","��","��","��","��","��","��","��","��"
},
lu=
{
"·","��","��","��","��","½","¼","��","��","¶","³","¬","¯","��","��","��","��","¹","»","¸","«","®","µ","��","��","��","´","��","­","¿","��","±","º","��","�","�","²","�","��","��","��","��","¾","��","°","��","��","��","��","ޤ","ߣ","�","��","�","��","��","��","��","��","��","��","��"
},
guang=
{
"��","��","��","��","��","��","��"
},
bi=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","ذ","��","��","��","��","��","��","��","��","��","��","��","��","ݩ","޵","�","��","��","��","�","��","��","�","�","��","��","��","��","��","�","��","��","��","��","��","��"
},
tou=
{
"Ͷ","ͷ","͸","͵","��","��"
},
jue=
{
"��","��","��","��","��","��","��","��","�","��","��","��","��","��","ާ","��","��","��","��","��","��","�","��","��","��","��","��","��","��","��","��"
},
nan=
{
"��","��","��","�","�","��","��","��","��","��"
},
na=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��"
},
ling=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�","��","��","��","۹","��","��"
},
qing=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
shan=
{
"ɽ","��","��","��","��","��","��","��","��","ɼ","ɺ","��","ɾ","��","��","��","۷","դ","ɿ","�","��","��","��","��","ڨ","��","ɻ","��","��","��","��","��","�","��","��","��"
},
che=
{
"��","��","��","��","��","��","��","��","�"
},
ju=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","��","�","��","��","�","��","��","�","��","ڪ","��","�","��","��","��","��","��"
},
ran=
{
"Ȼ","Ⱦ","ȼ","Ƚ","��","��","��"
},
yin=
{
"��","��","��","ӡ","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","۴","��","�","�","ط","��","�","�","��","�","��","�","��","��","��","ܧ"
},
ba=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","��","��","��","��"
},
chi=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","߳","�","��","��","ܯ","��","��","��","�","��","��","��","�","��","��","��","��","��","�","�","�","��","��"
},
dan=
{
"��","��","ʯ","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�","��","��","��","��","��"
},
cun=
{
"��","��","��","��","��","��"
},
qiu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","��","��","��","��","ٴ","��","��","��","��"
},
fu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ܽ","��","��","��","��","�","�","��","߻","�","��","��","��","��","��","��","��","��","��","��","�","�","��","��","��","��","��","��","��","��","��","��","ۮ","ݳ","�","��","��","��","��","��"
},
yan=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","Ǧ","��","��","��","��","��","��","��","��","��","��","��","��","ٲ","��","��","��","��","��","��","��","��","��","۳","��","��","��","��","��","��","��","��","۱","��","��","ܾ","��","��","��","��","��","��","��","�","��"
},
jun=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
yo=
{
"��","Ӵ","�"
},
gan=
{
"��","��","��","��","��","��","��","��","Ǭ","��","��","��","��","��","�","��","��","ߦ","��","�","��","��","�","��","��"
},
tuan=
{
"��","��","�","��","��"
},
zao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
lian=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","��","��","��","��","�","��","�","��"
},
zhuan=
{
"ר","ת","��","׬","ש","׫","׭","��","��","��","�"
},
shao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","ۿ","��","��","�","��","��"
},
fei=
{
"��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","�","��","��","��","��","�","��","�","��","��","��"
},
shen=
{
"��","��","��","��","ʲ","��","��","��","��","��","��","��","��","��","ݷ","��","��","��","��","��","��","�","��","��","ڷ","��","��","��"
},
geng=
{
"��","��","��","��","��","��","��","��","��","��","�","��"
},
kan=
{
"��","��","��","��","��","��","٩","Ƕ","��","�","��","��","�","ݨ"
},
tai=
{
"̨","̫","̬","̩","̧","̥","̭","��","̦","޷","��","��","ۢ","��","߾","̪","��","��"
},
yang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","��","��","��"
},
lao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��"
},
liu=
{
"��","��","��","��","½","��","��","��","��","µ","�","��","��","��","��","��","��","�","��","�","��","��","�"
},
hen=
{
"��","��","��","��"
},
gei=
{
"��"
},
chuang=
{
"��","��","��","��","��","��","��"
},
lun=
{
"��","��","��","��","��","��","��","��"
},
bie=
{
"��","��","��","��","��"
},
bian=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","��","��","��","�","��","��","��","��","��","��"
},
feng=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ٺ","��","ۺ","�","��","��"
},
pi=
{
"��","��","Ƥ","��","��","ơ","ƥ","��","ƣ","Ƨ","��","��","Ƣ","Ʃ","��","��","ƨ","��","��","��","Ʀ","�","��","ا","��","��","��","��","�","��","��","��","ۯ","��","�","��","�","��","ܱ","�","��","��","��","��","��","ߨ","�","��"
},
cha=
{
"��","��","��","��","��","��","ɲ","��","�","��","��","��","��","��","�","�","��","��","��","�","��","��","��","��","�"
},
zha=
{
"��","��","ը","թ","��","բ","��","��","զ","է","ե","�","��","դ","գ","��","��","��","�","ա","��","߸","��","��","��","��","��"
},
lin=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","�","��"
},
zhuai=
{
"ת","ק","ҷ"
},
huai=
{
"��","��","��","��","��","��","��"
},
zhun=
{
"׼","��","׻","��","�"
},
xu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","ڼ","��","ޣ","��","�","��","��","��","�","��"
},
chuan=
{
"��","��","��","��","��","��","��","�","��","��","�","��","��"
},
gou=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","ڸ","�","�","��","��","��","��","��"
},
bai=
{
"��","��","��","��","��","��","��","��","��","��","��"
},
cai=
{
"��","��","��","��","��","��","��","��","��","��","��"
},
can=
{
"��","��","��","��","��","��","�","��","��","��","��","��"
},
cen=
{
"��","�","�"
},
zhen=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","�","��","��","��","�","��","�","�"
},
tui=
{
"��","��","��","��","��","��","߯","��"
},
sai=
{
"˼","��","��","��","��","��"
},
zou=
{
"��","��","��","��","��","��","��","۸","��"
},
zhuang=
{
"װ","״","ׯ","׳","ײ","ױ","��","׮","��","��"
},
ze=
{
"��","��","��","��","��","զ","��","��","��","��","��","��","�","��","��"
},
zhou=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�","��","��","��","��","��","��","ݧ"
},
que=
{
"ȷ","ȴ","ȱ","ȸ","ȵ","��","ȳ","ȶ","Ȳ","��","�"
},
mao=
{
"ó","ë","ì","ð","ò","ï","é","ñ","è","��","ê","�","��","��","î","í","�","�","�","�","��","�","��","��","�"
},
fan=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ެ","��","�","�","��","��","��"
},
xuan=
{
"ѡ","��","ȯ","��","��","��","��","��","Ѥ","��","�","��","��","Ѣ","��","ѣ","��","��","��","�","��","��","��","��","��","��","��"
},
ya=
{
"��","ѹ","��","��","Ѻ","ƥ","Ѽ","ѽ","��","��","ѿ","��","��","ѻ","�","��","Ѿ","��","��","��","�","��","��","��","��","��","��","�","�"
},
me=
{
"ô","��"
},
ma=
{
"ô","��","��","Ħ","��","��","��","��","��","��","Ĩ","��","��","�","��","�","��"
},
wang=
{
"��","��","��","��","��","��","��","��","â","��","��","�","��","��","��","��"
},
ce=
{
"��","��","��","��","��","��"
},
nu=
{
"Ů","Ŭ","ŭ","ū","��","��","��","��","��","��","�"
},
tan=
{
"̸","̽","̹","̯","��","̿","̳","̲","̰","̾","̷","̶","̼","̺","̱","̴","̵","̻","̮","��","�","۰","�","��","��","��"
},
kuang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","ڿ","ڲ","��"
},
se=
{
"ɫ","��","ɪ","ɬ","��","�","�"
},
shai=
{
"ɫ","ɸ","ɹ"
},
tsmz=
{"�е���ѩ","SYP","ˮ������","�����"},
lie=
{
"��","��","��","��","��","��","��","��","�","��","��","��","��"
},
gang=
{
"��","��","��","��","��","��","��","��","��","��","�","�","��"
},
kuan=
{
"��","��","��"
},
la=
{
"��","��","��","��","��","��","��","��","��","��","�","��","��","��"
},
gu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","ڬ","�","��","��","�","��","��","��","�","��","��","��","��"
},
gen=
{
"��","��","ب","��","��","ݢ"
},
tu=
{
"��","ͻ","ͼ",";","ͽ","Ϳ","��","��","��","ͺ","͹","ݱ","��","��","ܢ","��"
},
qun=
{
"Ⱥ","ȹ","��"
},
su=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","�","��","�","��"
},
lei=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","ڳ","��"
},
xun=
{
"Ѷ","ѵ","Ѹ","Ѱ","ѯ","ѭ","Ѯ","Ѳ","Ѵ","ѫ","ѷ","Ѭ","��","��","ѳ","ѱ","��","��","޹","��","�","�","�","��","��","ۨ","��","��","�","ަ","��","�"
},
zhua=
{
"ץ","��"
},
re=
{
"��","��","��"
},
mi=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","�","��","��","��","��","��","��","��","��","��","��","��","��"
},
pei=
{
"��","��","��","��","��","��","��","��","��","�","��","��","��","��","��"
},
kao=
{
"��","��","��","��","��","��","��","��"
},
duan=
{
"��","��","��","��","��","��","��","�","��"
},
luo=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","�","��","��","�","��","��"
},
e=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","ج","�","��","��","��","�","��","��","��","ݭ","��","�","�","��","��","��","��"
},
shuang=
{
"˫","ˬ","˪","��","��"
},
rang=
{
"��","��","��","��","ȿ","�","��"
},
qie=
{
"��","��","��","��","��","��","��","٤","�","�","��","ۧ","��","�"
},
pian=
{
"��","Ƭ","ƪ","ƫ","ƭ","��","��","��","��","��","��","��","��"
},
kong=
{
"��","��","��","��","��","��","��"
},
ni=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","٣","��","��","��","�","�"
},
ceng=
{
"��","��","��"
},
huang=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","��","��","��","��","�","�"
},
suan=
{
"��","��","��","�"
},
po=
{
"��","��","��","��","��","��","��","��","��","��","��","۶","��","��","��","��","��","��","�","��","��","�"
},
tie=
{
"��","��","��","��","��"
},
man=
{
"��","��","��","��","��","��","��","��","��","�","á","��","��","��","��","�","ܬ","��"
},
ai=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��"
},
rong=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
chen=
{
"��","��","��","��","��","�","��","��","��","��","��","��","��","�","��","��","��","��","�","��","��","��"
},
pai=
{
"��","��","��","��","��","��","��","ٽ","��","��"
},
cu=
{
"��","��","��","��","��","��","�","��","��","��","��","��"
},
kun=
{
"��","��","��","��","��","�","��","��","��","�","��"
},
chao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
sui=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��","�","��","��","��","ݴ"
},
chun=
{
"��","��","��","��","��","��","��","��","ݻ","��"
},
kuo=
{
"��","��","��","��","��","��","��"
},
hong=
{
"��","��","��","��","��","��","��","��","��","��","��","ޮ","��","ڧ","ݦ","��","ް"
},
mai=
{
"��","��","��","��","��","��","��","ݤ","۽"
},
xiu=
{
"��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","��"
},
qin=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","��","��","��"
},
cuo=
{
"��","��","��","��","��","��","��","�","��","��","��","��","��","��","��"
},
long=
{
"��","¡","Ū","¢","��","£","��","¤","��","��","��","��","��","��","��","��","��","�"
},
dun=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��"
},
kang=
{
"��","��","��","��","��","��","��","��","��","��"
},
pu=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","�","��","��","��","��","��","�","��","��"
},
reng=
{
"��","��"
},
bo=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","�","��","��"
},
lan=
{
"��","��","��","��","��","�","��","��","��","��","��","��","��","�","�","��","��","��","�","��","��","��"
},
piao=
{
"Ʊ","��","Ư","Ʈ","��","ư","��","��","��","�","��","��","ݳ","�"
},
sun=
{
"��","��","��","ݥ","�","��","��","�"
},
ning=
{
"��","��","��","š","Ţ","��","��","��","��","��","�"
},
ku=
{
"��","��","��","��","��","��","��","��","ܥ","�","��","�"
},
nao=
{
"Ŭ","��","��","��","��","�","��","ث","��","��","��","��","�","��"
},
tao=
{
"��","��","��","��","��","��","��","��","��","��","�","߶","��","�","��","��","��","ػ"
},
song=
{
"��","��","��","��","��","��","��","��","��","��","�","��","ڡ","��","�","ݿ"
},
mou=
{
"ĳ","ı","Ĳ","��","��","��","��","��","��","ٰ"
},
pa=
{
"��","��","��","��","��","ſ","��","ž","��","��","��","��","��"
},
lue=
{
"��","��","�"
},
hei=
{
"��","��"
},
chai=
{
"��","��","��","��","��","٭","�","��"
},
a=
{
"��","��","��","��","��","߹","�"
},
ting=
{
"��","ͥ","ͣ","��","͢","ͦ","ͤ","ͧ","��","͡","��","��","��","�","��","��","��","��"
},
sha=
{
"ɳ","��","ɱ","ɴ","ɰ","ɶ","ɯ","ɲ","ɼ","ɵ","ɷ","��","��","��","��","��","��","�","��","�"
},
tuo=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","٢","��","��","��","��","��","ر","��","��","��","��","��"
},
pan=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��"
},
gua=
{
"��","��","��","��","��","��","��","��","��","��","ڴ","�","��"
},
lou=
{
"¥","¶","©","ª","¦","§","¨","�","��","��","��","��","��","��","��","��"
},
han=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","��","��","�","��","��","��","��","��","��"
},
cao=
{
"��","��","��","��","��","��","��","�","��"
},
cang=
{
"��","��","��","��","��"
},
zang=
{
"��","��","��","��","�","��","��"
},
shun=
{
"˳","˲","˴","˱"
},
ka=
{
"��","��","��","��","��","��","��"
},
qia=
{
"��","ǡ","Ǣ","٤","��","��","��","��"
},
qiao=
{
"��","��","��","��","��","��","��","��","ȸ","��","��","��","��","��","��","��","��","��","��","�","��","��","�","ڽ","��","�","��","��","��","��"
},
fou=
{
"��","�"
},
bang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","��"
},
ao=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","�","��","��","��","��","��","��","��"
},
zhai=
{
"ծ","��","լ","կ","��","ժ","խ","ի","��","��","��","�"
},
zhui=
{
"׷","׹","׺","׵","׶","׸","�","��","��"
},
chou=
{
"��","��","��","��","��","��","��","��","��","��","��","��","�","ٱ","�","��","��"
},
zen=
{
"��","��"
},
kui=
{
"��","��","��","��","��","��","��","��","��","��","��","�","ظ","��","�","��","��","��","�","��","��","��","��","��","��","�","�","��"
},
ha=
{
"��","Ϻ","��","��"
},
za=
{
"��","��","��","��","զ","��","��"
},
luan=
{
"��","��","��","��","�","��","��","��","��","��","�"
},
xiong=
{
"��","��","��","��","��","��","��","ܺ"
},
ne=
{
"��","��","��","ګ"
},
zan=
{
"��","��","��","��","��","��","��","�","��","��","��"
},
rui=
{
"��","��","�","��","��","ި","�","��"
},
tang=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","��","��","��","��","��","�","��","�","�"
},
run=
{
"��","��"
},
kua=
{
"��","��","��","��","��","٨"
},
wa=
{
"��","��","��","��","��","��","��","��","��","�","��"
},
meng=
{
"��","��","��","��","��","��","å","��","��","��","��","��","��","�","�","��","��","��","ޫ","��"
},
bin=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��"
},
leng=
{
"��","�","��","��","ܨ"
},
peng=
{
"��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","��","�","ܡ"
},
niu=
{
"ţ","Ŧ","Ť","ť","��","�","��","��"
},
rou=
{
"��","��","��","��","��","��"
},
ruo=
{
"��","��","ټ"
},
sen=
{
"ɭ"
},
sa=
{
"��","��","��","�","ئ","��","��","��"
},
juan=
{
"��","��","��","��","��","��","��","��","��","�","��","۲","��","��","��","��"
},
pao=
{
"��","��","��","��","��","��","��","��","��","��","��","��"
},
ruan=
{
"��","��","��"
},
lang=
{
"��","��","��","��","��","��","��","��","��","�","ݹ","�","��","��"
},
zun=
{
"��","��","��","��","ߤ"
},
ken=
{
"��","��","��","��","��"
},
hun=
{
"��","��","��","��","��","��","��","ڻ","��","��"
},
en=
{
"��","��","��","��"
},
qiong=
{
"��","��","�","��","��","��","��","��","��"
},
rao=
{
"��","��","��","�","��","��"
},
mang=
{
"æ","ä","ã","â","å","ç","��","��","��","��"
},
nuo=
{
"ŵ","Ų","��","Ŵ","ų","��","��","��","�"
},
teng=
{
"��","��","��","��","��"
},
nin=
{
"��"
},
miao=
{
"��","��","��","��","��","��","��","��","�","��","�","��","��","��","��","��"
},
mie=
{
"��","��","��","ؿ","��","�"
},
niang=
{
"��"
},
nai=
{
"��","��","��","��","ؾ","��","��","��","ܵ"
},
sang=
{
"ɣ","ɥ","ɤ","��","�","��"
},
ca=
{
"��","��","��","��"
},
sao=
{
"ɨ","ɧ","ɩ","��","��","ɦ","��","��","ܣ","��","��"
},
zuan=
{
"��","׬","��","߬","��","��"
},
shua=
{
"ˢ","ˣ","�"
},
gun=
{
"��","��","��","��","��","��","�"
},
guai=
{
"��","��","��"
},
pang=
{
"��","��","��","��","��","��","�","��","��","��","��"
},
nuan=
{
"ů"
},
shuai=
{
"˥","˧","ˤ","˦","�"
},
cui=
{
"˥","��","��","��","��","��","��","��","�","��","�","��","��","��","�","��"
},
niao=
{
"��","��","��","��","��","��","��"
},
die=
{
"��","��","��","��","��","��","��","�","��","�","��","ܦ","�","��","��","��","��"
},
pen=
{
"��","��","��"
},
chui=
{
"��","��","��","��","׵","��","�","��","�"
},
ang=
{
"��","��","��"
},
keng=
{
"��","�","��"
},
tun=
{
"��","��","��","��","��","��","�","��","��"
},
diu=
{
"��","��"
},
weng=
{
"��","��","��","��","޳"
},
sou=
{
"��","��","��","��","�","��","��","޴","�","��","��","��","��","�"
},
ga=
{
"��","��","��","��","��","�","��","��","��"
},
lia=
{
"��"
},
nen=
{
"��","�"
},
nang=
{
"��","��","��","��","߭"
},
nie=
{
"��","��","��","��","��","��","��","��","�","��","��","�","ؿ","��"
},
beng=
{
"��","��","��","��","��","��","��","��","�"
},
cou=
{
"��","�","��","�"
},
pou=
{
"��","��","��"
},
seng=
{
"ɮ"
},
nue=
{
"Ű"
},
cuan=
{
"��","��","��","��","ߥ","��","��","��"
},
chuo=
{
"�","��","��","�","��","��"
},
chuai=
{
"��","��","�","��","��","��"
},
jiong=
{
"��","��","��","��","��"
},
shuan=
{
"˨","˩","��","��"
},
zei=
{
"��"
},
pie=
{
"Ƴ","Ʋ","��","�","د"
},
miu=
{
"��"
},
o=
{
"Ŷ","��","�"
},
dia=
{
"��"
},
nou=
{
"��"
},
ei=
{
"��"
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
	if T2==nil then 			--��������ƴ����ƥ����
		Cls()
		DrawStrBox(x,y,"���޴��֣�����������",C_GOLD,24) 
		lib.ShowSurface(0)
		lib.Delay(2000)
		return ""
	end
	local page=0				--ѡ��ҳ�棬��ʼ��Ȼ�ǵ�һҳ��
	local str=""				--���ڱ����ѡ�ַ�
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

function GetPinyin(x,y,word)--����ƴ��
	local str=""
	while true do
		ShowPinyin(x,y,word,str)
	    local keypress=WaitKey();
        lib.Delay(100);
    	if keypress==VK_RETURN and str=="" then
			return "finish";
		elseif keypress==VK_SPACE or keypress==VK_RETURN then
			return str;
		elseif keypress==VK_ESCAPE then
			return -1;
		elseif keypress ~= -1 and keypress < 99999 then
		    str = lib.GetTextInput();
		end
	end
end

function GetPinyin1(x,y)--����ƴ��
	local str=""
	while true do
		ShowPinyin1(x,y,str)
	    local keypress=WaitKey();
        lib.Delay(100);
    	if keypress==VK_RETURN and str=="" then
			return "finish";
		elseif keypress==VK_SPACE or keypress==VK_RETURN then
			return str;
		elseif keypress==VK_ESCAPE then
			return -1;
		elseif keypress ~= -1 and keypress < 99999 then
		    str = lib.GetTextInput();
		end
	end
end

function ShowPinyin(x,y,str1,str2,str3)
	Cls()
	local size=24
	DrawBox(x,y+size,CC.ScreenW-x,y+5*size,C_ORANGE)
	if str3==nil then						--����ƴ��״̬
		DrawStrBox(x,y-size/2,"������(ƴ)",C_WHITE,size)
	else									--ѡ��״̬
		DrawStrBox(x,y-size/2,"��ѡ��",C_WHITE,size)
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
	if str3==nil then						--����ƴ��״̬
		DrawStrBox(x,y-size/2,"������(ƴ)",C_WHITE,size)
	else									--ѡ��״̬
		DrawStrBox(x,y-size/2,"��ѡ��",C_WHITE,size)
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
	local warname={	'ɱ���˷�','���ֻ���','ɱ�ֻ�','�����˷�','������','ǧ�����Q','��������','Ѫ������','���̷ֶ�','ս����',
								'�ɍ����','ս��ɽ','ս���','߱ɱ�ɍ�','��˹��ʹ','����ʥ��','ɱ����','�����','��ӹҽ','�֍���',
								'�����콣','����Χ��','����ָ��','�����Է�','������','��̩ɽ','������','����ɽ','��Ī��','����ɽ',
								'�콵����','�콵����','�콵Ī��','�콵��','ɱ��ƽ֮','�����','�Ī��','���','�ٶ���ɽ','�ٶ�����',
								'�ٶ�����','�ٶ�Ī��','�仨��ˮ','��������','��ͺ����','���ڰ���','�����ӹ�','������','����ƽ֮','�������',
								'����׺�','ƽ֮����','ս��Ī��','���ﲮ��','��������','��������','Ц������','���붫��','��������','������',
								'սѩɽ��','֩�붴һ','֩�붴��','֩�붴��','֩�붴��','֩�붴��','�����m','ս����ͯ','ɱһ��','սŷ����',
								'���ư���','ս��ǧ��','��ս����','ս����','ս����','ս����','��ս����','��ŷ����','�������','��������',
								'������','����Ⱥս','�ƴ���','ؤ�����','ؤ������','Ľ�ݼ��','ɱ������','�Ȱ���','ս��̹֮','������̶',
								'��������','ɳĮ����','��������','�����Ǿ�','��������','�������','���嶾��','��ΤС��','�������','��������',
								'ս�Ħ��','սԬ��־','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��',
								'��ᶷ��','��ᶷ�','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷŷ','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��',
								'��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','��ᶷ��','�ձ�����','�ձ�����',
								'�ձ�����','�ձ�ս��','ս���л�','ʮ�����','ʮ������','ս����ͯ','ս̨��','ս�����','�컨��һ','�컨���',
								'�컨����','�����ͩ','����̩��','ս������','ս�¼���','ս�쳤��','��ս����','��ս��ɽ','��ս���','��������',
								'�������','���','�����','��ɽ','�����','������','ս��','ս�κ�ҩ','������','ս÷����',
								'�Ƚ�����','��������','�����ɽ�','���ɽ���','��������','��������','��������','�ض�����','�����ֵ�','��������',
								'��ľ����','һս����','��ս����','��ս����','��ս����','��ս����','��ս����','��������','ɱŷ����','����',
								'����','ũ��','����','������','�������','�������','�������','�����һ','ս��ؤ','�����߹�',
								'������','�Ĵ����','����ׯһ','����ׯ��','����ׯ��','����ׯ��','����ׯ��','��������','������Ľ','ս��Ľ',
								'ս��Ľ�','ս����','ս����ˮ','����ƽ֮','�������','���ɲ���','�ҹ�����','�Ȼ�ɽ��','������','����Ԫ��',
								'��������','ս������','ľ����һ','ľ�����','ľ������','ͭ����һ','ͭ�����','ͭ������','����ӯӯ','�������',
								'ȫ������','���ǽ���','�����','��������','�����','սĪ����','��������','�Թ�','AI����'}
	
	
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
		menu[i]={bh..JY.Scene[i-1]["����"],nil,1};
		num=num+1		
	end
    return ShowMenu(menu,num,15,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function SelectFaceMenu(x,y)
	local menu={};
	local num=0
	
	for i=1,588 do 
		local r=JY.Person[i]["ͷ�����"]
		if r>num then num=r end
		if menu[r]==nil then
			menu[r]={JY.Person[i]["����"],nil,1};
		end
	end
	
	for i=1,num do
		if menu[i]==nil then menu[i]={'UNKNOW',nil,0} end
	end
	
    return ShowMenu(menu,num,15,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function migong(x,y)
	local mg={}
	--���0,��ͨ  1,ͨ
	--�Ѿ�����,��Ҫ����,��û����
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
	JY.Base['��X1']=cx
	JY.Base['��Y1']=cy
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

function Show_Position() --���̺�������ʾ����ͼ����λ��
    if JY.Status ~=GAME_MMAP then
        return 0;
    end
    DrawStrBoxWaitKey(string.format("��ǰλ��(%d,%d)",JY.Base["��X"],JY.Base["��Y"]),C_ORANGE,CC.DefaultFont);
	return 1;
end

function noad()
	return;
end

function walkto(xx,yy,x,y,flag)
	local x,y
	AutoMoveTab={[0]=0}
	if JY.Status==GAME_SMAP  then
		x=x or JY.Base['��X1']
		y=y or JY.Base['��Y1']
	elseif JY.Status==GAME_MMAP then
		x=x or JY.Base['��X']
		y=y or JY.Base['��Y']
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
    local movetable={};  --   ��¼ÿ���ƶ�
    for i=movenum,1,-1 do    --��Ŀ��λ�÷����ҵ���ʼλ�ã���Ϊ�ƶ��Ĵ���
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
		--JY.Base["��X1"]=movetable[i].x
		--JY.Base["��Y1"]=movetable[i].y
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
				if math.abs(GetS(JY.SubScene,JY.Base["��X1"]+mx+i,JY.Base["��Y1"]+my+i,4)-CC.YScale*i*2)<8 then
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
        AddMyCurrentPic();         --����������ͼ��ţ�������·Ч��
		x=JY.Base["��X"]+CC.DirectX[direct+1];
		y=JY.Base["��Y"]+CC.DirectY[direct+1];
		JY.Base["�˷���"]=direct;
    else
        x=JY.Base["��X"];
        y=JY.Base["��Y"];
    end
	if direct~=-1 then
		JY.SubScene=CanEnterScene(x,y);   --�ж��Ƿ�����ӳ���
	end
	if CC.hx~=nil or (lib.GetMMap(x,y,3)==0 and lib.GetMMap(x,y,4)==0) then
		JY.Base["��X"]=x;
		JY.Base["��Y"]=y;
	end
		
    JY.Base["��X"]=limitX(JY.Base["��X"],10,CC.MWidth-10);           --�������겻�ܳ�����Χ
    JY.Base["��Y"]=limitX(JY.Base["��Y"],10,CC.MHeight-10);

    if CC.MMapBoat[lib.GetMMap(JY.Base["��X"],JY.Base["��Y"],0)]==1 then
	    JY.Base["�˴�"]=1;
	else
	    JY.Base["�˴�"]=0;
	end

	local pic=GetMyPic();
	lib.DrawMMap(JY.Base["��X"],JY.Base["��Y"],pic);             --��ʾ����ͼ
--    Cls();
    ShowScreen();
	JY.oldMMapX=JY.Base["��X"];
	JY.oldMMapY=JY.Base["��Y"];
	JY.oldMMapPic=pic;

    if JY.SubScene >= 0 then          --�����ӳ���
        CleanMemory();
		lib.UnloadMMap();
        lib.PicInit();
        lib.ShowSlow(50,1)

		JY.Status=GAME_SMAP;
        JY.MmapMusic=-1;

        JY.MyPic=GetMyPic();
        JY.Base["��X1"]=JY.Scene[JY.SubScene]["���X"]
        JY.Base["��Y1"]=JY.Scene[JY.SubScene]["���Y"]

        Init_SMap(1);
		return
	else
		return 1
    end
end

function hhinstruct_15()          --game over
    JY.Status=GAME_DEAD;
    Cls();
    DrawString(CC.GameOverX,CC.GameOverY,JY.Person[0]["����"],RGB(0,0,0),CC.DefaultFont);

	local x=CC.ScreenW-9*CC.DefaultFont;
    DrawString(x,10,os.date("%Y-%m-%d %H:%M"),RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+CC.DefaultFont+CC.RowPixel,"�ڵ����ĳ��",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*2,"�����˿ڵ�ʧ����",RGB(216, 20, 24) ,CC.DefaultFont);
    DrawString(x,10+(CC.DefaultFont+CC.RowPixel)*3,"�ֶ���һ�ʡ�����",RGB(216, 20, 24) ,CC.DefaultFont);

    local loadMenu={ {"�������һ",nil,1},
                     {"������ȶ�",nil,1},
                     {"���������",nil,1},
                     {"�ؼ�˯��ȥ",nil,1} };
    local y=CC.ScreenH-4*(CC.DefaultFont+CC.RowPixel)-10;
    local r=ShowMenu(loadMenu,4,0,x,y,0,0,0,0,CC.DefaultFont,C_ORANGE, C_WHITE)

    if r<4 then
		CleanMemory();
        SBLDATAL(r);
		if JY.Base["����"]~=-1 then 
			if JY.SubScene < 0 then          --���ڴ��ͼ
				CleanMemory();
				lib.UnloadMMap();
			end
			lib.PicInit();
			lib.ShowSlow(50,1)
			JY.Status=GAME_SMAP
			JY.SubScene=JY.Base["����"]
			--JY.Base["��X1"]=JY.Person[99]["�书3"]
			--JY.Base["��Y1"]=JY.Person[99]["�书4"]
			--JY.Base["��X"]=JY.Person[99]["�书5"]
			--JY.Base["��Y"]=JY.Person[99]["�书6"]
			--JY.Base["�˷���"]=JY.Person[99]["�书7"]
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
			local x=xx+JY.Base["��X"];
			local y=yy+JY.Base["��Y"];
			dx=CC.ScreenW-len*4+(xx-yy)*4;
			dy=len*2+(xx+yy)*2;
			if x==JY.Base["��X"] and y==JY.Base["��Y"] then
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
			local x=xx+JY.Base["��X"];
			local y=yy+JY.Base["��Y"];
			dx=CC.ScreenW-len*4+(xx-yy)*4;
			dy=len*2+(xx+yy)*2;
			if x>=0 and y>=0 and x<=479 and y<=479 then
				local sid=CanEnterScene(x,y);
				if sid>=0 and Sce[sid]==nil then
					Sce[sid]=true;
					local str=JY.Scene[sid]["����"];
					lib.FillColor(dx,dy,dx+3,dy+3,C_ORANGE);
					lib.Background(dx-string.len(str)*4,dy+4,dx+string.len(str)*4,dy+20,128);
					DrawString(dx-string.len(str)*4,dy+4,str,C_WHITE,16);
				end
			end
		end
	end
elseif CC.MapKind==1 then
	for x=JY.Base["��X"]-len,JY.Base["��X"]+len do
		for y=JY.Base["��Y"]-len,JY.Base["��Y"]+len do
			local dx,dy;
			local xx=x-JY.Base["��X"];
			local yy=y-JY.Base["��Y"];
			dx=CC.ScreenW-len*8+(xx-yy)*4;
			dy=len*4+(xx+yy)*2;
			if x==JY.Base["��X"] and y==JY.Base["��Y"] then
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
	for x=JY.Base["��X"]-len,JY.Base["��X"]+len do
		for y=JY.Base["��Y"]-len,JY.Base["��Y"]+len do
			local dx,dy;
			local xx=x-JY.Base["��X"];
			local yy=y-JY.Base["��Y"];
			dx=CC.ScreenW-len*8+(xx-yy)*4;
			dy=len*4+(xx+yy)*2;
			if x>=0 and y>=0 and x<=479 and y<=479 then
				local sid=CanEnterScene(x,y);
				if sid>=0 and Sce[sid]==nil then
					Sce[sid]=true;
					local str=JY.Scene[sid]["����"];
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
			local x=xx+JY.Base["��X1"];
			local y=yy+JY.Base["��Y1"];
			dx=CC.ScreenW-len*4+(xx-yy)*4;
			dy=len*2+(xx+yy)*2;
			if x==JY.Base["��X1"] and y==JY.Base["��Y1"] then
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
	for x=JY.Base["��X1"]-len,JY.Base["��X1"]+len do
		for y=JY.Base["��Y1"]-len,JY.Base["��Y1"]+len do
			local dx,dy;
			local xx=x-JY.Base["��X1"];
			local yy=y-JY.Base["��Y1"];
			dx=CC.ScreenW-len*8+(xx-yy)*4;
			dy=len*4+(xx+yy)*2;
			if x==JY.Base["��X1"] and y==JY.Base["��Y1"] then
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
	rx1=JY.Base["��X1"];
	ry1=JY.Base["��Y1"];
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


function DrawStrBox(x,y,str,color,size)         --��ʾ������ַ���
--��ʾ������ַ���
--(x,y) ���꣬�����Ϊ-1,������Ļ�м���ʾ	
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
	--���㳤��,�ֺ�ʹ��Ĭ���ֺţ�CC.Fontbig
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
	--���ò˵�Ҳ���õ��İ�
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
    lib.Background(x1,y1+s,x1+s,y2-s,128);    --��Ӱ���Ľǿճ�,���岿��
    lib.Background(x1+s,y1,x2-s,y2,128);
    lib.Background(x2-s,y1+s,x2,y2-s,128);
    lib.Background(tx1,y1-fontsize/2+s,tx2,y1,128);    --��Ӱ���Ľǿճ�,���ⲿ��
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

function DrawStrBox2(x,y,str,color,size,bjcolor)         --��ʾ������ַ���
	
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

function DrawBox(x1,y1,x2,y2,color)         --����һ���������İ�ɫ����
 --����һ���������İ�ɫ�����Ľǰ���
    local s=4;
    --lib.Background(x1,y1+s,x1+s,y2-s,128);    --��Ӱ���Ľǿճ�
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

function DrawBox_1(x1,y1,x2,y2,color)       --�����Ľǰ����ķ���
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

function DrawBox2(x1,y1,x2,y2,color,bjcolor)         --����һ���������İ�ɫ����
    local s=4;
	bjcolor=bjcolor or 0;
	if bjcolor>=0 then
		lib.Background(x1,y1+s,x1+s,y2-s,128,bjcolor);    --��Ӱ���Ľǿճ�
		lib.Background(x1+s,y1,x2-s,y2,128,bjcolor);
		lib.Background(x2-s,y1+s,x2,y2-s,128,bjcolor);
	end
	if color>=0 then
		local r,g,b=GetRGB(color);
		DrawBox_2(x1+1,y1,x2,y2,RGB(math.modf(r/2),math.modf(g/2),math.modf(b/2)));
		DrawBox_2(x1,y1,x2-1,y2-1,color);
	end
end

function DrawBox_2(x1,y1,x2,y2,color)       --�����Ľǰ����ķ���
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

function DrawString(x,y,str,color,size)         --��ʾ��Ӱ�ַ���
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

function DrawStrBoxYesNo(x,y,str,color,size)        --��ʾ�ַ�����ѯ��Y/N
--��ʾ��ѯ��Y/N��������Y���򷵻�true, N�򷵻�false
--(x,y) ���꣬�����Ϊ-1,������Ļ�м���ʾ
--��Ϊ�ò˵�ѯ���Ƿ�    
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
    local menu={{"ȷ��/��",nil,1},
	            {"ȡ��/��",nil,2}};

	local r=ShowMenu(menu,2,0,x+w-4*size-2*CC.MenuBorderPixel,y+h+CC.MenuBorderPixel,0,0,1,0,CC.DefaultFont,C_ORANGE, C_WHITE)

    if r==1 then
	    return true;
	else
	    return false;
	end

end

function DrawStrBoxWaitKey(s,color,size)          --��ʾ�ַ������ȴ�����
    lib.GetKey();
    Cls();
    DrawStrBox(-1,-1,s,color,size);
    ShowScreen();
    WaitKey();
end


function FINALWORK()  
    for i=311,319 do  --����ͼ
	     JY.Person[i]["ͷ�����"]=214
    end

    JY.MY=JY.Person[0]
	
	for i=1,200 do
		 if JY.Base["��Ʒ" .. i]==174 then
			JY.GOLD=JY.Base["��Ʒ����" .. i]
			break
		 end
	end
end

function FINALWORK2()
    JY.Thing[74]["������"]=2000
	JY.Thing[6]["������"]=2000
	JY.Thing[96]["���Ṧ"]=1
	JY.Thing[100]["���Ṧ"]=1
	JY.Thing[134]["���Ṧ"]=1
	JY.Thing[121]["���Ṧ"]=1
	JY.Thing[65]["������"]=50
	JY.Thing[88]["����"]=CC.s67
	JY.Thing[235]["������"]=-50
	JY.Thing[81]["������"]=70
	JY.Person[36]["Я����Ʒ1"]=78
	JY.Person[47]["Я����Ʒ1"]=8
	JY.Person[49]["Я����Ʒ1"]=75
	JY.Person[49]["Я����Ʒ2"]=200
	JY.Person[27]["���һ���"]=0
	JY.Person[111]["ͷ�����"]=111
	if JY.Person[44]["�书10"]==-1 then JY.Person[44]["�书10"]=0 end
	JY.Shop[1]["��Ʒ�۸�5"]=1000
	JY.Shop[2]["��Ʒ�۸�5"]=600
	JY.Shop[3]["��Ʒ�۸�5"]=800
	JY.Shop[0]["��Ʒ�۸�5"]=4000
	
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
			    if JY.Person[p]["�������ֵ"]<JY.Thing[202][WZ7]*50+50 then
				   JY.Person[p]["�������ֵ"]=JY.Thing[202][WZ7]*50+50
				   JY.Person[p]["����"]=JY.Person[p]["�������ֵ"]
				end
				if JY.Person[p]["�������ֵ"]<JY.Thing[202][WZ7]*300 then
				   JY.Person[p]["�������ֵ"]=JY.Thing[202][WZ7]*300
				   JY.Person[p]["����"]=JY.Person[p]["�������ֵ"]
				end
		    end
	end			

	SetS(70,32,7,1,0)
	SetS(70,33,7,1,0)
	SetS(70,29,7,1,0)
	
	SetS(28,37,11,1,1)  --����ľ-ͭ����
	SetS(28,45,9,1,1)
	
	SetD(12,22,2,0)
	
	if GetS(10,0,17,0)~=1 then
	   SetD(83,48,4,0)
	end

    if GetS(4,5,5,5)==3 then --����.����
       JY.Thing[138]["����������"]=2
	   JY.Thing[138]["����"]=CC.s50
	   JY.Wugong[64]["����"]=CC.s51
	    for i=1,10 do 
			JY.Wugong[64]["�ƶ���Χ"..i]=4
			JY.Wugong[64]["ɱ�˷�Χ"..i]=0
	    end
		JY.Wugong[64]["������Χ"]=3
	end
	
	JY.Scene[54]["��������"]=31
	JY.Scene[75]["��������"]=25
	JY.Scene[70]["��������"]=28
	JY.Scene[104]["��������"]=32
	
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
			  JY.Person[warzs[z][1]]["���ж���֡��"..i]=0
			  JY.Person[warzs[z][1]]["���ж����ӳ�"..i]=0
			  JY.Person[warzs[z][1]]["�书��Ч�ӳ�"..i]=0
		  end
	end
	for z=1,44 do
	     JY.Person[warzs[z][1]]["���ж���֡��1"]=warzs[z][2]
		 JY.Person[warzs[z][1]]["�书��Ч�ӳ�1"]=warzs[z][3]
		 JY.Person[warzs[z][1]]["���ж����ӳ�1"]=warzs[z][4]
	end		 
	
	local wart={56,73,74,75,77,80,83,90,91,
	                   52,66,72,78,79,82,84,85,87,88,92,129,
	                   140,161,261,   --24
                       97,94,95,96,39,40,41,42,98,99,100,110,111,
                       103,104,112,113,114,117,118,122,121,128
                       	}--47				   
					   
	for i=1,5 do
	      for z=1,47 do
			  JY.Person[wart[z]]["���ж���֡��"..i]=0
			  JY.Person[wart[z]]["���ж����ӳ�"..i]=0
			  JY.Person[wart[z]]["�书��Ч�ӳ�"..i]=0
		  end
	end
	
	JY.Person[128]["���ж���֡��1"]=11
	JY.Person[128]["���ж����ӳ�1"]=5
    JY.Person[128]["�书��Ч�ӳ�1"]=4
	
	JY.Person[121]["���ж���֡��1"]=13
	JY.Person[121]["���ж����ӳ�1"]=7
    JY.Person[121]["�书��Ч�ӳ�1"]=6
	
	JY.Person[122]["���ж���֡��1"]=11
	JY.Person[122]["���ж����ӳ�1"]=6
    JY.Person[122]["�书��Ч�ӳ�1"]=5
	
	JY.Person[118]["���ж���֡��1"]=13
	JY.Person[118]["���ж����ӳ�1"]=9
    JY.Person[118]["�书��Ч�ӳ�1"]=8
	
	JY.Person[117]["���ж���֡��1"]=10
	JY.Person[117]["���ж����ӳ�1"]=6
    JY.Person[117]["�书��Ч�ӳ�1"]=5
	
	JY.Person[114]["���ж���֡��1"]=13
	JY.Person[114]["���ж����ӳ�1"]=6
    JY.Person[114]["�书��Ч�ӳ�1"]=5
	
	JY.Person[113]["���ж���֡��1"]=11
	JY.Person[113]["���ж����ӳ�1"]=5
    JY.Person[113]["�书��Ч�ӳ�1"]=4
	
	JY.Person[112]["���ж���֡��1"]=11
	JY.Person[112]["���ж����ӳ�1"]=5
    JY.Person[112]["�书��Ч�ӳ�1"]=4
	
	JY.Person[104]["���ж���֡��1"]=11
	JY.Person[104]["���ж����ӳ�1"]=5
    JY.Person[104]["�书��Ч�ӳ�1"]=4
	
	JY.Person[103]["���ж���֡��1"]=10
	JY.Person[103]["���ж����ӳ�1"]=2
    JY.Person[103]["�书��Ч�ӳ�1"]=1
	
	JY.Person[111]["���ж���֡��1"]=10
	JY.Person[111]["���ж����ӳ�1"]=4
    JY.Person[111]["�书��Ч�ӳ�1"]=3
	
	JY.Person[110]["���ж���֡��1"]=10
	JY.Person[110]["���ж����ӳ�1"]=4
    JY.Person[110]["�书��Ч�ӳ�1"]=3
	
	JY.Person[100]["���ж���֡��1"]=11
	JY.Person[100]["���ж����ӳ�1"]=5
    JY.Person[100]["�书��Ч�ӳ�1"]=4
	
	JY.Person[99]["���ж���֡��1"]=10
	JY.Person[99]["���ж����ӳ�1"]=2
    JY.Person[99]["�书��Ч�ӳ�1"]=1
	
	JY.Person[98]["���ж���֡��1"]=16
	JY.Person[98]["���ж����ӳ�1"]=9
    JY.Person[98]["�书��Ч�ӳ�1"]=8
	
	JY.Person[42]["���ж���֡��1"]=12
	JY.Person[42]["���ж����ӳ�1"]=6
    JY.Person[42]["�书��Ч�ӳ�1"]=5
	
	JY.Person[41]["���ж���֡��1"]=12
	JY.Person[41]["���ж����ӳ�1"]=6
    JY.Person[41]["�书��Ч�ӳ�1"]=5
	
	JY.Person[40]["���ж���֡��1"]=8
	JY.Person[40]["���ж����ӳ�1"]=2
    JY.Person[40]["�书��Ч�ӳ�1"]=1
	
	JY.Person[39]["���ж���֡��1"]=9
	JY.Person[39]["���ж����ӳ�1"]=7
    JY.Person[39]["�书��Ч�ӳ�1"]=6
	
	JY.Person[96]["���ж���֡��1"]=8
	JY.Person[96]["���ж����ӳ�1"]=2
    JY.Person[96]["�书��Ч�ӳ�1"]=1
	
	JY.Person[95]["���ж���֡��1"]=9
	JY.Person[95]["���ж����ӳ�1"]=5
    JY.Person[95]["�书��Ч�ӳ�1"]=4
	
	JY.Person[94]["���ж���֡��1"]=10
	JY.Person[94]["���ж����ӳ�1"]=2
    JY.Person[94]["�书��Ч�ӳ�1"]=1
	
	JY.Person[97]["���ж���֡��1"]=10
	JY.Person[97]["���ж����ӳ�1"]=2
    JY.Person[97]["�书��Ч�ӳ�1"]=1
	
	JY.Person[261]["���ж���֡��1"]=11
	JY.Person[261]["���ж����ӳ�1"]=5
    JY.Person[261]["�书��Ч�ӳ�1"]=4
	
	JY.Person[161]["���ж���֡��1"]=9
	JY.Person[161]["���ж����ӳ�1"]=5
    JY.Person[161]["�书��Ч�ӳ�1"]=4
	
	JY.Person[140]["���ж���֡��1"]=16
	JY.Person[140]["���ж����ӳ�1"]=7
    JY.Person[140]["�书��Ч�ӳ�1"]=6
	
	JY.Person[129]["���ж���֡��1"]=9
	JY.Person[129]["���ж����ӳ�1"]=4
    JY.Person[129]["�书��Ч�ӳ�1"]=3
	
	JY.Person[92]["���ж���֡��1"]=9
	JY.Person[92]["���ж����ӳ�1"]=2
    JY.Person[92]["�书��Ч�ӳ�1"]=1
	
	JY.Person[88]["���ж���֡��1"]=11
	JY.Person[88]["���ж����ӳ�1"]=2
    JY.Person[88]["�书��Ч�ӳ�1"]=1
	
	JY.Person[87]["���ж���֡��1"]=8
	JY.Person[87]["���ж����ӳ�1"]=5
    JY.Person[87]["�书��Ч�ӳ�1"]=4
	
	JY.Person[85]["���ж���֡��1"]=13
	JY.Person[85]["���ж����ӳ�1"]=5
    JY.Person[85]["�书��Ч�ӳ�1"]=4
	
	JY.Person[84]["���ж���֡��1"]=9
	JY.Person[84]["���ж����ӳ�1"]=5
    JY.Person[84]["�书��Ч�ӳ�1"]=4
	
	JY.Person[82]["���ж���֡��1"]=11
	JY.Person[82]["���ж����ӳ�1"]=5
    JY.Person[82]["�书��Ч�ӳ�1"]=4
	
	JY.Person[79]["���ж���֡��1"]=12
	JY.Person[79]["���ж����ӳ�1"]=9
    JY.Person[79]["�书��Ч�ӳ�1"]=8
	
	JY.Person[78]["���ж���֡��1"]=13
	JY.Person[78]["���ж����ӳ�1"]=8
    JY.Person[78]["�书��Ч�ӳ�1"]=7
	
	JY.Person[72]["���ж���֡��1"]=9
	JY.Person[72]["���ж����ӳ�1"]=5
    JY.Person[72]["�书��Ч�ӳ�1"]=4
	
	JY.Person[66]["���ж���֡��1"]=10
	JY.Person[66]["���ж����ӳ�1"]=5
    JY.Person[66]["�书��Ч�ӳ�1"]=4
	
	JY.Person[52]["���ж���֡��1"]=6
	JY.Person[52]["���ж����ӳ�1"]=3
    JY.Person[52]["�书��Ч�ӳ�1"]=2
	
	JY.Person[56]["���ж���֡��1"]=10
	JY.Person[56]["���ж����ӳ�1"]=5
    JY.Person[56]["�书��Ч�ӳ�1"]=3
	
    JY.Person[73]["���ж���֡��1"]=13
	JY.Person[73]["���ж����ӳ�1"]=7
    JY.Person[73]["�书��Ч�ӳ�1"]=5
	
    JY.Person[74]["���ж���֡��1"]=9
	JY.Person[74]["���ж����ӳ�1"]=4
    JY.Person[74]["�书��Ч�ӳ�1"]=2
	
	JY.Person[75]["���ж���֡��1"]=10
	JY.Person[75]["���ж����ӳ�1"]=3
    JY.Person[75]["�书��Ч�ӳ�1"]=1
	
	JY.Person[77]["���ж���֡��1"]=8
	JY.Person[77]["���ж����ӳ�1"]=7
    JY.Person[77]["�书��Ч�ӳ�1"]=6
	
	JY.Person[80]["���ж���֡��1"]=11
	JY.Person[80]["���ж����ӳ�1"]=5
    JY.Person[80]["�书��Ч�ӳ�1"]=3
	
	JY.Person[83]["���ж���֡��1"]=7
	JY.Person[83]["���ж����ӳ�1"]=5
    JY.Person[83]["�书��Ч�ӳ�1"]=4
	
	JY.Person[90]["���ж���֡��1"]=9
	JY.Person[90]["���ж����ӳ�1"]=6
    JY.Person[90]["�书��Ч�ӳ�1"]=5
	
	JY.Person[91]["���ж���֡��1"]=9
	JY.Person[91]["���ж����ӳ�1"]=2
    JY.Person[91]["�书��Ч�ӳ�1"]=1
	
end


function QZXS(s) 
     DrawStrBoxWaitKey(s,C_GOLD,30)
end

function PersonKF(p,kf) 
    for i=1,10 do
	     if JY.Person[p]["�书"..i]==kf then
		     return true;			 
		 end
    end
	return false;
end


function T1LEQ(id) 
    if id==0 and JY.Person[id]["����"]==JY.LEQ and GetS(4,5,5,4)==1 and GetS(4,5,5,5)==8 then
       return true
	else
	   return false
	end
end

function T2SQ(id)  
    if id==0 and JY.Person[id]["����"]==JY.SQ and GetS(4,5,5,4)==2 and GetS(4,5,5,5)==8 then
       return true
	else
	   return false
	end
end

function T3XYK(id) 
    if id==0 and JY.Person[id]["����"]==JY.XYK and GetS(4,5,5,4)==3 and GetS(4,5,5,5)==8 then
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
			if JY.Status==GAME_SMAP then 			--���沿�ֺͳ�����ͼ�浵�����Ϣ
				JY.Base["����"]=JY.SubScene			
			else
				JY.Base["����"]=-1			
			end
			SBLDATAS(MS);
			DrawStrBoxWaitKey(CC.EVB113,C_WHITE,30)
		end
    elseif k==108 then
	    Cls();		
	    local MS=JYMsgBox(CC.EVB114,CC.EVB115,KJDYLOAD,4,280);
        if MS<4 then		   		
		    SBLDATAL(MS);
		    if JY.Base["����"]~=-1 then 
				if JY.SubScene < 0 then          
					CleanMemory();
					lib.UnloadMMap();
				end
				lib.PicInit();
				lib.ShowSlow(50,1)
				JY.Status=GAME_SMAP
				JY.SubScene=JY.Base["����"]
				
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
			    local wpz={JY.Person[0]["ȭ�ƹ���"],JY.Person[0]["��������"],
                       JY.Person[0]["ˣ������"],JY.Person[0]["�������"] }
				local maxwp,maxnum=0;

				for i=1,4 do
					if wpz[i]>maxwp then 
						maxwp=wpz[i] 
						maxnum=i
					end
				end

				local swg={109,110,111,112};
                say(CC.EVB168)
				say("����"..JY.Wugong[swg[maxnum]]["����"].."�ȣ�"..CC.EVB220)
                if DrawStrBoxYesNo(-1,-1,CC.EVB221,C_WHITE,30) then
				   JY.Person[0]["�书1"]=swg[maxnum]
				   JY.Person[0]["�书�ȼ�1"]=900
				   QZXS(CC.EVB167..JY.Wugong[swg[maxnum]]["����"].."��")
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
		
        if JY.SubScene==65 and (GetD(70,7,5)~=0 or GetD(70,8,5)~=0) then --�������
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
						   JY.Person[0]["��ѧ��ʶ"]=100
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
        if JY.SubScene==25 and GetS(10,0,8,0)~=1 and GetD(25,74,5)==2610 then --ʮ���
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
     if instruct_16(4,2,0) ==false then 	 --  16(10):�����Ƿ���[�ֻ�]������ת��:Label0        
		do return; end
        instruct_0();   --  0(0)::�����(����)
    end    --:Label0


    if instruct_16(72,2,0) ==false then    --  16(10):�����Ƿ���[���ũ]������ת��:Label1
        instruct_0();   --  0(0)::�����(����)
        do return; end
    end    --:Label1

    instruct_14();   --  14(E):�������
    instruct_37(-3);   --  37(25):���ӵ���-3
    instruct_3(3,9,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:����[�м��ջ]:�����¼���� [9]
    instruct_3(3,12,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:����[�м��ջ]:�����¼���� [12]
    instruct_3(3,11,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:����[�м��ջ]:�����¼���� [11]
    instruct_3(3,10,1,0,640,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:����[�м��ջ]:�����¼���� [10]
    instruct_3(-2,1,0,0,0,0,0,7994,7994,7994,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [1]
    instruct_0();   --  0(0)::�����(����)
    instruct_13();   --  13(D):������ʾ����
    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
    instruct_1(171,72,1);   --  1(1):[���ũ]˵: һ�а��ƻ�����
    instruct_0();   --  0(0)::�����(����)
    instruct_1(172,4,1);   --  1(1):[�ֻ�]˵: ���ͷ��İɣ��ٺ�
    instruct_0();   --  0(0)::�����(����)
    instruct_30(41,31,35,31);   --  30(1E):�����߶�41-31--35-31
    instruct_1(173,72,1);   --  1(1):[���ũ]˵: ���֣���������
    instruct_0();   --  0(0)::�����(����)
    instruct_1(50,3,0);   --  1(1):[���˷�]˵: ����ģ����㻹����������*��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(51,72,1);   --  1(1):[���ũ]˵: ���֣��α���ô��Ļ�����*���������ֵܵĺ�����
    instruct_0();   --  0(0)::�����(����)
    instruct_1(52,3,0);   --  1(1):[���˷�]˵: ����**�������𣿡���
    instruct_0();   --  0(0)::�����(����)
    instruct_1(174,72,1);   --  1(1):[���ũ]˵: ��������ֻ���ô��������*������
    instruct_0();   --  0(0)::�����(����)
    instruct_1(175,4,1);   --  1(1):[�ֻ�]˵: �š�����
    instruct_0();   --  0(0)::�����(����)
    instruct_1(176,3,0);   --  1(1):[���˷�]˵: ������
    instruct_0();   --  0(0)::�����(����)
    instruct_14();   --  14(E):�������
    instruct_3(-2,1,0,0,0,0,0,5212,5212,5212,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [1]
    instruct_0();   --  0(0)::�����(����)
    instruct_13();   --  13(D):������ʾ����
    instruct_1(177,72,1);   --  1(1):[���ũ]˵: �������ҿ����Ǽ���������*����ҩ�ǴӶ���ҩ����Ū��*�Ķϳ��ݷ�ĩ��ҩЧҲ�湻*�ݣ�������˫����Ϲ���ҿ�*"��������޵���"�Ľ����*���˷����Ҫ�������ˣ�*С�ֵܣ������ϣ�
    instruct_0();   --  0(0)::�����(����)
    instruct_1(178,1,0);   --  1(1):[���]˵: �����Ī�ţ��������㡣
    instruct_0();   --  0(0)::�����(����)

    if instruct_6(0,4,0,0) ==false then    --  6(6):ս��[0]������ת��:Label2
        instruct_0();   --  0(0)::�����(����)
        instruct_15(0);   --  15(F):ս��ʧ�ܣ�����
        do return; end
    end    --:Label2

    instruct_3(-2,1,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [1]
    instruct_0();   --  0(0)::�����(����)
    instruct_13();   --  13(D):������ʾ����
    instruct_2(144,1);   --  2(2):�õ���Ʒ[�ɺ��⴫][1]
    instruct_0();   --  0(0)::�����(����)
    instruct_2(117,1);   --  2(2):�õ���Ʒ[��ҽ���][1]
    instruct_0();   --  0(0)::�����(����)

    if instruct_31(10000,0,7) ==true then    --  31(1F):�ж������Ƿ�10000������ת��:Label3
        instruct_2(225,1);   --  2(2):�õ���Ʒ[�����ر�ͼ][1]
        instruct_0();   --  0(0)::�����(����)
        instruct_39(5);   --  39(27):�򿪳���ɽ��
        do return; end
    end    --:Label3


    if instruct_31(5000,0,8) ==true then    --  31(1F):�ж������Ƿ�5000������ת��:Label4
        instruct_2(226,1);   --  2(2):�õ���Ʒ[�����ر�ͼ][1]
        instruct_0();   --  0(0)::�����(����)
        instruct_39(84);   --  39(27):�򿪳���ɽ��
        do return; end
        instruct_0();   --  0(0)::�����(����)
    end    --:Label4

    instruct_2(227,1);   --  2(2):�õ���Ʒ[�����ر�ͼ][1]
    instruct_0();   --  0(0)::�����(����)
    instruct_39(85);   --  39(27):�򿪳���ɽ��
end

OEVENTLUA[50]=function() 
    if GetS(4,5,5,5)==6 then return end

    if instruct_28(0,5,999,6,0) ==false then    --  28(1C):�ж�AAAƷ��2-999������ת��:Label0
        instruct_1(235,0,1);   --  1(1):[AAA]˵: ���������Ѿ�û��Ǯ�ˡ���
        do return; end
        instruct_0();   --  0(0)::�����(����)
    end    --:Label0

    instruct_1(234,0,1);   --  1(1):[AAA]˵: ����������һЩ���Ǯ����*���������ˣ����ǲ�������*һ�㻨����
    instruct_0();   --  0(0)::�����(����)

    if instruct_11(0,8) ==true then    --  11(B):�Ƿ�ס�޷�����ת��:Label1
        instruct_0();   --  0(0)::�����(����)
        instruct_2(174,100);   --  2(2):�õ���Ʒ[����][30]
        instruct_0();   --  0(0)::�����(����)
        instruct_37(-5);   --  37(25):���ӵ���-2
        do return; end
    end    --:Label1

end

OEVENTLUA[51]=function() 

    if instruct_4(174,0,21) ==true then    --  4(4):�Ƿ�ʹ����Ʒ[����]��������ת��:Label0

        if instruct_31(100,6,0) ==false then    --  31(1F):�ж������Ƿ�100������ת��:Label1
            instruct_1(237,0,1);   --  1(1):[AAA]˵: �����ϵ�����Ҳ�����ˡ���
            instruct_0();   --  0(0)::�����(����)
            do return; end
        end    --:Label1

        instruct_1(236,0,1);   --  1(1):[AAA]˵: ����̫����Ҳûɶ�ã��ó�*100����������ҵ�ɡ�
        instruct_0();   --  0(0)::�����(����)
        instruct_32(174,-100);   --  32(20):��Ʒ[����]+[-100]
		if JY.Person[0]["Ʒ��"]<65 then
           instruct_37(1);   --  37(25):���ӵ���1
		end
        do return; end
    end    --:Label0

    instruct_0();   --  0(0)::�����(����)
end
      

OEVENTLUA[56]=function() 
    instruct_3(-2,-2,1,0,0,0,0,2608,2608,2608,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
    instruct_0();   --  0(0)::�����(����)
	if GetS(4,5,5,5)==3 then say(CC.s52) end
	instruct_0();   --  0(0)::�����(����)   
    instruct_2(138,1);   --  2(2):�õ���Ʒ[���鵶��][1]
    instruct_0();   --  0(0)::�����(����)   
end

OEVENTLUA[198]=function() 
    --instruct_1(3997,0,0);   --  1(1):[AAA]˵: �������Ȼ�С�壬����*Ҫʱ������ȥ�����æ��
    say(string.sub(JY.Person[92][CC.s23],1,2)..CC.EVB210,0,5)
	instruct_0();   --  0(0)::�����(����)
    instruct_21(92);   --  21(15):[������]���
    instruct_3(70,1,1,0,199,0,0,7266,7266,7266,-2,-2,-2);   --  3(3):�޸��¼�����:����[С��]:�����¼���� [1]
end

OEVENTLUA[199]=function() 
    --instruct_1(390,92,0);   --  1(1):[???]˵: ����Ҫ�Ұ�æ�ĵط���
    instruct_0();   --  0(0)::�����(����)
	say(CC.EVB211,JY.Person[92]["ͷ�����"],0,JY.Person[92][CC.s23])

    if instruct_9(0,29) ==true then    --  9(9):�Ƿ�Ҫ�����?������ת��:Label0

        if instruct_20(20,0) ==false then    --  20(14):�����Ƿ�����������ת��:Label1
            instruct_10(92);   --  10(A):��������[������]
            instruct_14();   --  14(E):�������
            instruct_3(-2,-2,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
            instruct_0();   --  0(0)::�����(����)
            instruct_13();   --  13(D):������ʾ����
            do return; end
        end    --:Label1

        instruct_1(391,92,0);   --  1(1):[???]˵: ��Ķ������������޷����롣
        instruct_0();   --  0(0)::�����(����)
        do return; end
    end    --:Label0
end

OEVENTLUA[267]=function()    
    instruct_1(793,0,1);   --  1(1):[AAA]˵: ���ҵģ�Ǭ����Ų�ơ�����
    instruct_0();   --  0(0)::�����(����)
    instruct_57();   --  57(39):�߲��Թ�����
    instruct_3(-2,3,0,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [3]
    instruct_3(-2,4,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [4]
    instruct_3(-2,2,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [2]
    instruct_0();   --  0(0)::�����(����)
    instruct_3(11,100,0,0,0,0,0,0,0,0,-2,-2,-2);	
end

OEVENTLUA[292]=function() 
    instruct_1(793,0,1);   --  1(1):[AAA]˵: ���ҵģ�Ǭ����Ų�ơ�����
    instruct_0();   --  0(0)::�����(����)
    instruct_57();   --  57(39):�߲��Թ�����
    instruct_3(-2,3,0,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [3]
    instruct_3(-2,4,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [4]
    instruct_3(-2,2,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [2]
    instruct_3(9,1,1,0,293,0,0,5296,5296,5296,-2,-2,-2);   --  3(3):�޸��¼�����:����[�ɍ���]:�����¼���� [1]
    instruct_0();   --  0(0)::�����(����)
    instruct_1(963,0,1);   --  1(1):[AAA]˵: ��֪�����������ȥ�ˣ�Ӧ*����˲�Զ�ɣ��Һú�����*��
    instruct_0();   --  0(0)::�����(����)
	instruct_3(11,100,0,0,0,0,0,0,0,0,-2,-2,-2);
end

OEVENTLUA[315]=function() 
    if instruct_16(9,2,0) ==false then    --  16(10):�����Ƿ���[���޼�]������ת��:Label0
        do return; end
        instruct_0();   --  0(0)::�����(����)
    end    --:Label0

    instruct_37(1);   --  37(25):���ӵ���1
    instruct_1(1111,9,1);   --  1(1):[���޼�]˵: ̫ʦ����̫ʦ����*�޼ɻ��������ˡ�
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1112,5,0);   --  1(1):[������]˵: �޼ɣ�������㡣�ú��ӣ�*��û��������ɽ�������ˡ�*�ǵ���ҽ�ɽ���ҽ�õ���
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1113,9,1);   --  1(1):[���޼�]˵: ���ǵġ���������һ������*�������������ˡ�������*�����㡣����*������ϰ�˾����񹦣�*�Ž������ϵĺ�����ȥ��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1114,5,0);   --  1(1):[������]˵: �ܺã��ܺã�����Ϊ���ˡ�*�������Ѿ��������̵Ľ���*���ǵ�ҪԼ�����ڣ�����Ϊ*��������*�ǵó�������֮�ģ�*�����ұ����ˡ�
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1115,9,1);   --  1(1):[���޼�]˵: ̫ʦ���̻壬�޼ɽ�������*��������
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1124,5,0);   --  1(1):[������]˵: ���ǵ����Ҵ��������һ��*�书�����ʹ�����ɡ�
    instruct_0();   --  0(0)::�����(����)
    instruct_2(169,1);   --  2(2):�õ���Ʒ[����������][1]
    instruct_0();   --  0(0)::�����(����)
	say(CC.EVB91,5)
	instruct_14() 
	instruct_13() 
    local tjq=0;
    for a=1,10 do
         if JY.Person[9]["�书"..a]==16 then 
		    tjq=1 
			break;
	     end
    end
	if tjq==0 then JY.Person[9]["�书2"]=16 end	
	JY.Person[9]["�书�ȼ�2"]=50
	for a=1,10 do
	     if JY.Person[9]["�书"..a]==0 then
		    JY.Person[9]["�书"..a]=46
			JY.Person[9]["�书�ȼ�"..a]=50
			break;
	     end
	end
    instruct_1(1125,9,0);   --  1(1):[���޼�]˵: ��л̫ʦ��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1116,5,0);   --  1(1):[������]˵: �ǺǺǣ���ɽ�к��ˣ���ɽ*�к��ˡ���
    instruct_0();   --  0(0)::�����(����)
    instruct_3(-2,5,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [5]
    instruct_3(-2,10,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [10]
    instruct_3(-2,9,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [9]
    instruct_3(-2,8,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [8]
    instruct_3(-2,7,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [7]
    instruct_3(-2,6,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [6]
    instruct_0();   --  0(0)::�����(����)
end

OEVENTLUA[331]=function() 
    instruct_1(1231,201,0);   --  1(1):[???]˵: �����������������������*����������Ƶ�343�󷨡�*���ǽ������ܽ�ͷ�����ף�*��¬�����δ������鷨����*���ĺ��ˡ�
    instruct_0();   --  0(0)::�����(����)
    say(CC.s47,201,5,"��¬")
end

OEVENTLUA[353]=function() 
    instruct_3(-2,-2,1,0,361,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
    instruct_1(1323,0,1);   --  1(1):[AAA]˵: ����������������֮��*��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1324,239,0);   --  1(1):[???]˵: ������ô������������Ҳһ*��ɱô������ѽ������ѽ��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1325,245,1);   --  1(1):[???]˵: �ߣ���˵��Щ�˲�����ɱ��*����������ɱ������Σ���*����Ϊ�˰��ɶ�ү�������*������СѾͷ�ٸ������£�*�Ҿ����������һ����
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1326,239,0);   --  1(1):[???]˵: ��ɱ�������ף���������Ҫ*�Ķ�������Զ�ò����ˡ�
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1327,0,1);   --  1(1):[AAA]˵: ʲô������
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1328,239,0);   --  1(1):[???]˵: �㲻������ʮ��������
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1329,0,1);   --  1(1):[AAA]˵: �񰡣�Ϊʲôÿ���˶�֪��*��Ҫ��ʮ�����顭��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1330,239,0);   --  1(1):[???]˵: ����һ������Ѫ������ֻ��*��֪�������
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1331,0,1);   --  1(1):[AAA]˵: ����Ҫ��ô����
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1332,239,0);   --  1(1):[???]˵: ��Ҫ�����ҽ����ﱨ��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1333,0,1);   --  1(1):[AAA]˵: ������ȥɱ���ӻ���
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1334,239,0);   --  1(1):[???]˵: �ߣ��ɶ����Ǽ����ˣ�����*�������ɰ취�Ը���������*��������˵��У��м�����*��ɽ���������ͽ�ܣ��ߺ�*������Ұ�����ɱ�ˣ�����*Ѫ����һ���������ˡ�
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1335,0,1);   --  1(1):[AAA]˵: ����Ϊ�����飬�ã��Ҵ�Ӧ*�㣬��ҲҪ˵���㻰������*���ڣ�
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1336,239,0);   --  1(1):[???]˵: ������Ȼ����˵�������и�*ͽ�ܽ�Ԭ��־���ո�ȥ����*�����ɽ̣������ȥ������*��
    instruct_0();   --  0(0)::�����(����)
    instruct_1(1337,244,1);   --  1(1):[???]˵: ��Ԭ���ӣ��㲻Ҫ���ң���*Ȼ����Ҳ�������ѣ�������*�ڡ�����
    instruct_0();   --  0(0)::�����(����)   
    instruct_3(96,0,0,0,0,0,354,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:����[���ɽ�]:�����¼���� [0]
    instruct_17(95,0,12,48,986);   --  17(11):�޸ĳ�����ͼ:����[�󹦷�]��0����C-30
    instruct_3(95,10,1,0,343,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:����[�󹦷�]:�����¼���� [10]
    instruct_37(-1);   --  37(25):���ӵ���-1
end

OEVENTLUA[360]=function() 
    instruct_3(-2,-2,1,0,0,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
    instruct_0();   --  0(0)::�����(����)
    instruct_2(156,1);   --  2(2):�õ���Ʒ[��Ѫ��][1]
    instruct_0();   --  0(0)::�����(����)
	say(CC.EVB170)
    instruct_14()  
    instruct_13()  
	instruct_3(-2,4,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [4]
    instruct_3(-2,14,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [14]
    instruct_3(-2,15,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [15]
    instruct_3(-2,9,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [9]
    instruct_3(-2,8,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [8]
    instruct_3(-2,7,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [7]
    instruct_3(-2,6,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [6]
    instruct_3(-2,5,0,0,0,0,0,0,0,0,-2,-2,-2); 
end

OEVENTLUA[621]=function() 
    --instruct_1(2678,0,1);   --  1(1):[AAA]˵: ��Щͼ�����ƺ�������ĳ��*�书����
    instruct_0();   --  0(0)::�����(����)
    instruct_3(-2,-2,-2,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
end

OEVENTLUA[690]=function() 
    local r=JYMsgBox(CC.EVB153,CC.EVB154,CC.EVB155,3,261);
    if r==2 then	   
		instruct_14();   --  14(E):�������
		instruct_12();   --  12(C):ס����Ϣ
		instruct_13();   --  13(D):������ʾ����
		instruct_1(2830,261,0);   --  1(1):[???]˵: ���ӣ����Ϻã�*������Ϣ�ĺ���*�Ͽ쿪ʼ�µ��ó̰ɣ�
		instruct_0();   --  0(0)::�����(����)
	elseif r==1 then
	                JY.Person[445]["�ȼ�"]=JY.Person[0]["�ȼ�"]*30
					JY.Person[446]["�ȼ�"]=JY.Person[445]["�ȼ�"]					                                                                    
					JY.Person[445]["ͷ�����"]=math.random(190)
					JY.Person[446]["ͷ�����"]=math.random(190)
					JY.Person[445]["�������ֵ"]=50
					JY.Person[446]["�������ֵ"]=50
					JY.Person[445]["����"]=JY.Person[445]["�������ֵ"]
					JY.Person[446]["����"]=JY.Person[446]["�������ֵ"]
					
					instruct_6(226,8,0,1) 
					
					JY.Person[445]["�ȼ�"]=10
					JY.Person[446]["�ȼ�"]=10
					                                                                    
					JY.Person[445]["ͷ�����"]=208
					JY.Person[446]["ͷ�����"]=208
	end				
end

OEVENTLUA[691]=function() 
    instruct_66(42);   --  66(42):��������2
    instruct_3(-2,0,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [0]
    instruct_19(16,31);   --  19(13):�����ƶ���10-1F
    instruct_40(2);   --  40(28):�ı�����վ������2
    instruct_0();   --  0(0)::�����(����)
    instruct_30(16,31,9,31);   --  30(1E):�����߶�16-31--9-31 
    instruct_0();   --  0(0)::�����(����)
    instruct_14();   --  14(E):�������
    instruct_3(-2,62,0,0,0,0,0,8250,8250,8250,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [62]
    instruct_3(-2,4,0,0,0,0,0,0,0,0,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [4]   
    --instruct_13();   --  13(D):������ʾ����	
    instruct_0();   --  0(0)::�����(����)
    --instruct_14();   --  14(E):�������
    instruct_3(-2,2,1,0,690,0,0,6086,6086,6086,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [2]
    instruct_0();   --  0(0)::�����(����)
    --instruct_13();   --  13(D):������ʾ���� 
    instruct_32(174,400);   --  2(2):�õ���Ʒ[����][400]
    instruct_0();   --  0(0)::�����(����)   
    instruct_32(234,1);   --  2(2):�õ���Ʒ[������][1]
    instruct_0();   --  0(0)::�����(����)   
    instruct_32(182,1);   --  2(2):�õ���Ʒ[����][1]
    instruct_0();   --  0(0)::�����(����)   
    --instruct_14();   --  14(E):�������
    instruct_3(-2,4,1,0,695,0,0,8250,8250,8250,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [4]
    instruct_3(-2,3,1,0,694,0,0,5098,5098,5098,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [3]
    instruct_3(-2,61,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [61]
    instruct_3(-2,62,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [62]
    instruct_39(19);   --  39(27):�򿪳���������
    instruct_39(101);   --  39(27):�򿪳�����ɽ��
    instruct_39(36);   --  39(27):�򿪳��������
    instruct_39(28);   --  39(27):�򿪳���������
    instruct_39(93);   --  39(27):�򿪳�������ɽ��
    instruct_0();   --  0(0)::�����(����)
    instruct_13();   --  13(D):������ʾ����
end

OEVENTLUA[707]=function() 
   instruct_1(2879,210,0);
   local lhq=0;
   if JY.Scene[1]["��������"]==0 then
        for i=1,200 do
	        if JY.Base["��Ʒ" .. i]==112 then
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
    instruct_1(2884,210,0);   --  1(1):[???]˵: ����ͭ���ÿ����ֻ��һ*����ս���ᣬ������ս��
    instruct_0();   --  0(0)::�����(����)

    if instruct_5(2,0) ==false then    --  5(5):�Ƿ�ѡ��ս����������ת��:Label0
       
    else
		instruct_1(2881,210,0);   --  1(1):[???]˵: �ã�ʩ������룡
		instruct_0();   --  0(0)::�����(����)
		instruct_19(41,14);   --  19(13):�����ƶ���29-E
		instruct_0();   --  0(0)::�����(����)
            if instruct_6(217,0,7,1) ==true then    --  6(6):ս��[217]������ת��:Label3
                instruct_19(41,7);   --  19(13):�����ƶ���29-7
                instruct_0();   --  0(0)::�����(����)
                instruct_13();   --  13(D):������ʾ����
                instruct_0();   --  0(0)::�����(����)
            else
			    instruct_19(42,17);   --  19(13):�����ƶ���2A-11
				instruct_0();   --  0(0)::�����(����)
				instruct_13();   --  13(D):������ʾ����
				instruct_3(-2,-2,1,0,709,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����					
            end    
    end
end

OEVENTLUA[714]=function() 
    instruct_3(-2,-2,1,0,0,0,0,2952,2952,2952,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
    instruct_0();   --  0(0)::�����(����)
	if GetS(10,0,16,0)==1 then
       instruct_2(85,1);   --  2(2):�õ���Ʒ[�׽][1]
	else
	
	end
    instruct_0();   --  0(0)::�����(����)
    instruct_14();   --  14(E):�������
    instruct_3(-2,25,1,0,713,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):�޸��¼�����:��ǰ����:�����¼���� [25]
    instruct_19(42,17);   --  19(13):�����ƶ���2A-11
    instruct_0();   --  0(0)::�����(����)
    instruct_13();   --  13(D):������ʾ����
end

OEVENTLUA[882]=function() 
    instruct_0();
end

OEVENTLUA[1082]=function() 
    mm4R();
 
    say(CC.EVB205,JY.Person[92]["ͷ�����"],0,"???") 

    if instruct_9(57,0) ==false then    --  9(9):�Ƿ�Ҫ�����?������ת��:Label0
         instruct_3(-2,-2,0,0,0,0,0,0,0,0,-2,-2,-2);
		 say(CC.EVB206,JY.Person[92]["ͷ�����"],0,"???") 
		return;
    end    --:Label0

    if instruct_20(20,0) ==false then    --  20(14):�����Ƿ�����������ת��:Label3
        instruct_14();   --  14(E):�������
        instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
        instruct_0();   --  0(0)::�����(����)
        instruct_13();   --  13(D):������ʾ����
        instruct_10(92);   --  10(A):��������[������]
        do return; end
    end    --:Label3

    --instruct_1(12,92,0);   --  1(1):[???]˵: ��Ķ����������Ҿ�ֱ��ȥ*С��ɡ�
    instruct_0();   --  0(0)::�����(����)
    instruct_14();   --  14(E):�������
    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):�޸��¼�����:��ǰ����:��ǰ�����¼����
    instruct_3(70,1,1,0,199,0,0,7266,7266,7266,-2,-2,-2);   --  3(3):�޸��¼�����:����[С��]:�����¼���� [1]
    instruct_0();   --  0(0)::�����(����)
    instruct_13();   --  13(D):������ʾ����
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
		if DrawStrBoxYesNo(-1,-1,CC.EVB129..JY.Thing[item]["����"]..CC.EVB130,C_WHITE,30) then
		    if item<36 then
		       Cls();
		       DrawStrBoxWaitKey(CC.EVB131,C_WHITE,30)
			   local items=0;
			    for i=1,200 do
			        if JY.Base["��Ʒ"..i]==item then 
					   items=JY.Base["��Ʒ����"..i] 
					   break;
					end
				end
			    local T={};
				for a=1,1000 do
					 local b=""..a
					 T[b]=a
                 end

                 lib.BeginTextInput();
				local r=GetPinyin1(32,CC.ScreenH-CC.Fontbig*6)
                lib.EndTextInput();
			    if T[r]~=nil and T[r]<=items then
				   instruct_32(item,-T[r]) 
		           instruct_2(174,itemG[item]*T[r])
                else
                   DrawStrBoxWaitKey(CC.EVB132,C_WHITE,30)
 				end   
		    else
			    if JY.Thing[item]["ʹ����"]==-1 then
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
		  
		  JY.Person[0]["��ѧ��ʶ"]=100
		  AddPersonAttrib(0,"������",30); 
		  AddPersonAttrib(0,"������",30); 
		  AddPersonAttrib(0,"�Ṧ",30); 
		  QZXS(JY.Person[0]["����"]..CC.EVB197)
		  SetS(10,0,21,0,1)
		else
		  say(CC.EVB198,1000,0,CC.EVB164)
		  
		  AddPersonAttrib(0,"��ѧ��ʶ",50); 
		  QZXS(CC.EVB199)
		end
	else
	   say(CC.EVB159,1000,0,CC.EVB164)
	end
	instruct_3(80,101,0,0,0,0,0,0,0,0,0,-2,-2)
end	

PNLBD={};

PNLBD[0]=function() 
  JY.Person[1]["����"]=750
  JY.Person[1]["�������ֵ"]=750
  JY.Person[1]["����"]=2500
  JY.Person[1]["�������ֵ"]=2500
  JY.Person[1]["������"]=130
  JY.Person[1]["������"]=130
  JY.Person[1]["�Ṧ"]=180
  JY.Person[1]["���˳̶�"]=0
  JY.Person[1]["�ж��̶�"]=0
  JY.Person[1]["�书1"]=67
  JY.Person[1]["�书�ȼ�1"]=999
end

PNLBD[16]=function() 
  JY.Person[37]["����"]=850
  JY.Person[37]["�������ֵ"]=850
  JY.Person[37]["����"]=5000
  JY.Person[37]["�������ֵ"]=5000
  JY.Person[37]["������"]=120
  JY.Person[37]["������"]=170
  JY.Person[37]["�Ṧ"]=120
  JY.Person[37]["���˳̶�"]=0
  JY.Person[37]["�ж��̶�"]=0
  JY.Person[37]["�书�ȼ�1"]=999
  JY.Person[37]["�书�ȼ�2"]=999
  JY.Person[37]["�书2"]=63
end

PNLBD[34]=function() 
  JY.Person[36]["����"]=650
  JY.Person[36]["�������ֵ"]=650
  JY.Person[36]["����"]=3000
  JY.Person[36]["�������ֵ"]=3000
  JY.Person[36]["������"]=180
  JY.Person[36]["������"]=130
  JY.Person[36]["�Ṧ"]=220
  JY.Person[36]["���˳̶�"]=0
  JY.Person[36]["�ж��̶�"]=0
  JY.Person[36]["�书�ȼ�1"]=999
end

PNLBD[75]=function() 
  JY.Person[58]["����"]=850
  JY.Person[58]["�������ֵ"]=850
  JY.Person[58]["����"]=5500
  JY.Person[58]["�������ֵ"]=5500
  JY.Person[58]["������"]=230
  JY.Person[58]["������"]=200
  JY.Person[58]["�Ṧ"]=180
  JY.Person[58]["���˳̶�"]=0
  JY.Person[58]["�ж��̶�"]=0
  JY.Person[58]["�书�ȼ�1"]=999
  JY.Person[58]["�书�ȼ�2"]=999
  JY.Person[58]["�书�ȼ�3"]=999
  
  JY.Person[59]["����"]=750
  JY.Person[59]["�������ֵ"]=750
  JY.Person[59]["����"]=3500
  JY.Person[59]["�������ֵ"]=3500
  JY.Person[59]["������"]=190
  JY.Person[59]["������"]=170
  JY.Person[59]["�Ṧ"]=220
  JY.Person[59]["���˳̶�"]=0
  JY.Person[59]["�ж��̶�"]=0
  JY.Person[59]["�书�ȼ�1"]=999
  JY.Person[59]["�书2"]=107
  JY.Person[59]["�书�ȼ�2"]=999
end

PNLBD[138]=function() 
  JY.Person[75]["����"]=650
  JY.Person[75]["�������ֵ"]=650
  JY.Person[75]["����"]=3000
  JY.Person[75]["�������ֵ"]=3000
  JY.Person[75]["������"]=140
  JY.Person[75]["������"]=120
  JY.Person[75]["�Ṧ"]=130
  JY.Person[75]["���˳̶�"]=0
  JY.Person[75]["�ж��̶�"]=0
  JY.Person[75]["�书�ȼ�1"]=999
end

PNLBD[165]=function() 
  JY.Person[54]["����"]=750
  JY.Person[54]["�������ֵ"]=750
  JY.Person[54]["����"]=3500
  JY.Person[54]["�������ֵ"]=3500
  JY.Person[54]["������"]=180
  JY.Person[54]["������"]=180
  JY.Person[54]["�Ṧ"]=180
  JY.Person[54]["���˳̶�"]=0
  JY.Person[54]["�ж��̶�"]=0
  JY.Person[54]["�书�ȼ�1"]=999
  JY.Person[54]["�书�ȼ�2"]=999
end

PNLBD[170]=function() 
  JY.Person[38]["����"]=950
  JY.Person[38]["�������ֵ"]=950
  JY.Person[38]["����"]=5000
  JY.Person[38]["�������ֵ"]=5000
  JY.Person[38]["������"]=200
  JY.Person[38]["������"]=200
  JY.Person[38]["�Ṧ"]=160
  JY.Person[38]["���˳̶�"]=0
  JY.Person[38]["�ж��̶�"]=0
  JY.Person[38]["�书�ȼ�1"]=999
  JY.Person[38]["�书�ȼ�2"]=999
end

PNLBD[197]=function()
  JY.Person[48]["����"]=850
  JY.Person[48]["�������ֵ"]=850
  JY.Person[48]["����"]=3000
  JY.Person[48]["�������ֵ"]=3000
  JY.Person[48]["������"]=150
  JY.Person[48]["������"]=130
  JY.Person[48]["�Ṧ"]=100
  JY.Person[48]["���˳̶�"]=0
  JY.Person[48]["�ж��̶�"]=0
  JY.Person[48]["�书�ȼ�1"]=999
  JY.Person[48]["�书�ȼ�2"]=999
  JY.Person[48]["�书2"]=108
end

PNLBD[198]=function()
  JY.Person[51]["����"]=750
  JY.Person[51]["�������ֵ"]=750
  JY.Person[51]["����"]=3000
  JY.Person[51]["�������ֵ"]=3000
  JY.Person[51]["������"]=180
  JY.Person[51]["������"]=160
  JY.Person[51]["�Ṧ"]=120
  JY.Person[51]["���˳̶�"]=0
  JY.Person[51]["�ж��̶�"]=0
  JY.Person[51]["�书�ȼ�1"]=999
end

function mm4R()
	local r;
	if JY.Thing[202][WZ7]==1 then
	   r=math.random(2)
	else
	   r=math.random(4)
	end
	local bdnl={"����", "ͷ�����", "�������ֵ", "�������ֵ",
					   "��������", "������", "�Ṧ","������",
					   "ȭ�ƹ���", "��������", "ˣ������", "�������",
					   "����","�书1" }
	local mm4={};
	mm4[1]={"������",301,350,600,0,60,50,50,30,30,0,0,71,41};
	mm4[2]={"����",302,270,500,1,70,40,50,0,40,0,0,78,37};
	mm4[3]={"����",303,200,500,2,40,40,40,20,20,20,20,73,12};
	mm4[4]={"½��˫",304,400,700,0,70,40,60,0,0,40,0,64,54};

	for i=1,14 do
		JY.Person[92][bdnl[i]]=mm4[r][i]
	end

	JY.Person[92]["�ȼ�"]=10

	for i=1,5 do
		JY.Person[92]["���ж���֡��"..i]=0
		JY.Person[92]["���ж����ӳ�"..i]=0
		JY.Person[92]["�书��Ч�ӳ�"..i]=0      
	end			  

	local avi={ {14,6,7},{8,3,4},{0,0,0},{7,4,5}, }

	JY.Person[92]["���ж���֡��1"]=avi[r][1]
	JY.Person[92]["���ж����ӳ�1"]=avi[r][3]
	JY.Person[92]["�书��Ч�ӳ�1"]=avi[r][2]

	if r==3 then
	   local s={ {0,0,0},{9,2,3},{8,3,4},{8,3,4},{9,5,6}, }
	   for i=1,5 do
			JY.Person[92]["���ж���֡��"..i]=s[i][1]
			JY.Person[92]["���ж����ӳ�"..i]=s[i][3]
			JY.Person[92]["�书��Ч�ӳ�"..i]=s[i][2]  
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
	   mode="��"
	elseif JY.Thing[202][WZ7]==2 then
	   mode="��"
	else
	   mode="��"
	end
	
	local t=math.modf(((lib.GetTime()-JY.LOADTIME)/60000)+GetS(14,2,1,4))
	local t1,t2=0,0;
	while t>=60 do
	   t=t-60
	   t1=t1+1
	end
	t2=t
	DrawBox(10,10,205,70,M_Yellow);	
	
	DrawString(15,15,string.format(CC.s54,JY.Person[0]["Ʒ��"],JY.GOLD),C_GOLD,20)
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
        local x0,y0=WAR.Person[id]["����X"],WAR.Person[id]["����Y"];
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
    JY.Thing[235]["����������"]=-1
	JY.Thing[235]["������"]=-30
	JY.Thing[118]["����������"]=0
	JY.Thing[118]["������"]=80
	JY.Thing[118]["������"]=2000
	JY.Thing[118]["��ȭ�ƹ���"]=1
	JY.Thing[118]["����������"]=1
	JY.Thing[118]["��ˣ������"]=1
	JY.Thing[118]["���������"]=1
	JY.Thing[114]["������"]=0
	JY.Thing[114]["����������"]=0
	JY.Thing[114]["����������"]=35
	JY.Thing[86]["��ȭ�ƹ���"]=120
	JY.Thing[113]["������"]=6000
	JY.Thing[77]["����������"]=2
	JY.Thing[71]["����������"]=2
	JY.Thing[101]["����������"]=1
	JY.Thing[123]["��ȭ�ƹ���"]=1
	JY.Thing[90]["�ӹ�����"]=2
	JY.Thing[220]["����������"]=-1
	JY.Thing[221]["����������"]=-1
	JY.Thing[139]["��Ʒ˵��"]=CC.WARS128
	
	local DA=0;
	for DA=135,143 do
	JY.Thing[DA]["�ӷ�����"]=1
	end
	local TS=0;
	for TS=167,181 do
	if TS~=174 then JY.Thing[TS]["���Ṧ"]=1 end
	end
	
	JY.Thing[220]["��Ҫ��Ʒ����4"]=25
	JY.Thing[221]["��Ҫ��Ʒ����4"]=25
	
	JY.Thing[89]["����"]=CC.QSQJ
	JY.Thing[178]["����"]=CC.DJDP
	JY.Thing[25]["���������ֵ"]=300
	
	JY.Wugong[109]["������10"]=1600
	JY.Wugong[110]["������10"]=1500
	JY.Wugong[111]["������10"]=1500
	JY.Wugong[112]["������10"]=1400
	
	 JY.Person[4]["�书1"]=67
	 JY.Person[4]["�书�ȼ�1"]=50
     JY.Person[9]["�书2"]=7
     JY.Person[9]["�书�ȼ�2"]=900
	 JY.Person[9]["ҽ������"]=60
     JY.Person[9]["�ⶾ����"]=60
	 JY.Person[50]["�书�ȼ�1"]=999	
     JY.Person[64]["Я����Ʒ����2"]=0
	 JY.Person[516]["�书1"]=112
	 JY.Person[516]["�书�ȼ�1"]=999	 
	 JY.Person[541]["�书�ȼ�1"]=0
	 JY.Person[541]["�书1"]=0	  
	 JY.Person[91]["�Ա�"]=1
	 JY.Person[92]["�Ա�"]=1
	 JY.Person[129]["�书2"]=17
	 JY.Person[129]["�书�ȼ�2"]=999
	 JY.Person[17]["Я����Ʒ����1"]=1
	 JY.Person[29]["Я����Ʒ����1"]=1
	 JY.Person[60]["�书2"]=104
	 JY.Person[60]["������"]=220
	 JY.Person[60]["������"]=180
	 JY.Person[60]["�Ṧ"]=160
	 JY.Person[65]["�书2"]=100
	 JY.Person[84]["ȭ�ƹ���"]=20
	 JY.Person[84]["�������"]=60
	 
	 
	JY.Shop[4]["��Ʒ�۸�5"]=8000
	JY.Shop[0]["��Ʒ�۸�5"]=6000
	
	for i=2,6 do
	       JY.Base["����"..i]=-1
	end
    JY.Base["����1"]=0
	for i=1,200 do
	       JY.Base["��Ʒ"..i]=-1
		   JY.Base["��Ʒ����"..i]=0
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
    local menu={ {"ȫ����Ʒ",nil,0},
                 {"������Ʒ",nil,0},
                 {"�������",nil,1},
                 {"�书����",nil,1},
                 {"�鵤��ҩ",nil,1},
                 {"���˰���",nil,1}, };

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
		    local id=JY.Base["��Ʒ" .. i+1];
			if id>=0 then
				if r==1 then
					thing[i]=id
					thingnum[i]=JY.Base["��Ʒ����" ..i+1];
				else
					if JY.Thing[id]["����"]==r-2 then             --��Ӧ������0-4
 					    thing[num]=id;
					    thingnum[num]=JY.Base["��Ʒ����" ..i+1];
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


function say(s,pid,flag,name)          --�����¶Ի�
--�¶Ի���ʽ
--��������ַ�
--��ͣ����������������
--������ɫ ��=red��=gold��=black��=white��=orange
--�����ַ���ʾ�ٶȣ�����
--����������ӣģ�
--���ƻ��Уȷ�ҳ��
--�δ����Լ����������
    local picw=130;       --���ͷ��ͼƬ���
	local pich=130;
	local talkxnum=18;         --�Ի�һ������
	local talkynum=3;          --�Ի�����
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
	name=name or JY.Person[pid]["����"]
    local talkBorder=(pich-talkynum*CC.DefaultFont)/(talkynum+1);

	--��ʾͷ��ͶԻ�������
    local xy={ [0]={headx=dx,heady=dy,
	                talkx=dx+boxpicw+2,talky=dy+27,
					namex=dx+boxpicw+2,namey=dy,
					showhead=1},--����
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=CC.ScreenH-dy-boxpich,
				    talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky= CC.ScreenH-dy-boxpich+27,
					namex=CC.ScreenW-1-dx-boxpicw-96,namey=CC.ScreenH-dy-boxpich,
					showhead=1},--����
                   {headx=dx,heady=dy,
				   talkx=dx+boxpicw-43,talky=dy+27,
					namex=dx+boxpicw+2,namey=dy,
				   showhead=0},--����
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=CC.ScreenH-dy-boxpich,
				   talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky= CC.ScreenH-dy-boxpich+27,
					namex=CC.ScreenW-1-dx-boxpicw-96,namey=CC.ScreenH-dy-boxpich,
					showhead=0},
                   {headx=CC.ScreenW-1-dx-boxpicw,heady=dy,
				    talkx=CC.ScreenW-1-dx-boxpicw-boxtalkw-2,talky=dy+27,
					namex=CC.ScreenW-1-dx-boxpicw-96,namey=dy,
					showhead=1},--����
                   {headx=dx,heady=CC.ScreenH-dy-boxpich,
				   talkx=dx+boxpicw+2,talky=CC.ScreenH-dy-boxpich+27,
					namex=dx+boxpicw+2,namey=CC.ScreenH-dy-boxpich,
				   showhead=1}, --����
			}

    if flag<0 or flag>5 then
        flag=0;
    end
	
	local headid=pid--JY.Person[pid]["ͷ�����"]
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
		local T1={"��","��","��","��","��","��","��","��","��","��"}
		local T2={{"��",C_RED},{"��",C_GOLD},{"��",C_BLACK},{"��",C_WHITE},{"��",C_ORANGE}}
		local T3={{"��",CC.FontNameSong},{"��",CC.FontNameHei},{"��",CC.FontName}}
		--�����������Բ�ͬ����ͬһ����ʾ����Ҫ΢�������꣬�Լ��ֺ�
		--��Ĭ�ϵ�����Ϊ��׼�����������ƣ�ϸ��������
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
		if page==0 then				--�µ�һҳ����������ʾͷ��
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
			str='��'
			s=string.sub(s,2,-1)
		else
			str=string.sub(s,1,2)
			s=string.sub(s,3,-1)
		end
		--��ʼ�����߼�
		if str=="��" then
			cx=0
			cy=cy+1
			if cy==3 then
				cy=0
				page=0
			end
		elseif str=="��" then
			cx=0
			cy=0
			page=0
		elseif str=="��" then
			ShowScreen();
			WaitKey();	
			lib.Delay(100)	
		elseif str=="��" then
			s=JY.Person[pid]["����"]..s
		elseif str=="��" then
			s=JY.Person[0]["����"]..s
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
		--�����ҳ������ʾ���ȴ�����
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

function TalkEx_bak(s,headid,flag)          --���Ӱ汾�Ի�
	local pid=0
	local name=''
	for i=0,600 do
		if JY.Person[i]==nil then
			pid=0
			break;
		elseif JY.Person[i]["ͷ�����"]==headid then
			pid=i
			name=JY.Person[i]["����"]
			break;
		end
	end
	say(s,headid,flag,name)
end

function GenTalkString(str,n)              --�����Ի���ʾ��Ҫ���ַ�������ÿ��n�������ַ���һ���Ǻ�
    local tmpstr="";
    for s in string.gmatch(str .. "*","(.-)%*") do           --ȥ���Ի��е�����*. �ַ���β����һ���Ǻţ������޷�ƥ��
        tmpstr=tmpstr .. s;
    end

    local newstr="";
    while #tmpstr>0 do
		local w=0;
		while w<#tmpstr do
		    local v=string.byte(tmpstr,w+1);          --��ǰ�ַ���ֵ
			if v>=128 then
			    w=w+2;
			else
			    w=w+1;
			end
			if w >= 2*n-1 then     --Ϊ�˱����������ַ�
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

function Talk(s,personid)            --��򵥰汾�Ի�
    local flag;
    if personid==0 then
        flag=1;
	else
	    flag=0;
	end
	TalkEx(s,JY.Person[personid]["ͷ�����"],flag);	
end

function TalkEx(s,headid,flag)          --���Ӱ汾�Ի�
    local picw=130;       --���ͷ��ͼƬ���
	local pich=130;
	local talkxnum=18;         --�Ի�һ������
	local talkynum=3;          --�Ի�����
	local dx=2;
	local dy=2;
    local boxpicw=picw+10;
	local boxpich=pich+10;
	local boxtalkw=12*CC.DefaultFont+10;
	local boxtalkh=boxpich;

    local talkBorder=(pich-talkynum*CC.DefaultFont)/(talkynum+1);

	--��ʾͷ��ͶԻ�������
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
				   DrawString(xy[flag].headx+5+x,xy[flag].heady+5+y+110,JY.Person[headid]["����"],C_GOLD,20)
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

TFNLJS["���"]="�ǡ��츳����ϵһ�����ȣ׺��ҵ���ʽ�����ʴ���������������к����ش����Уǡ��ƺţ�ѩɽ�ɺ����ȣ׼����ٶ�����ʮ��"

TFNLJS["������"]="�ǡ��ƺţ�����ҩ�ɡ��ȣ��ö�������٣�����ʱ��ȫ���ж���ʮ��"

TFNLJS["���ũ"]="�ǡ��ƺţ��������š��ȣ�����ɱ�����˷�����������������ʮ�㣬���𽣷���Ϊ�罣һ��"

TFNLJS["�ֻ�"]="�ǡ��ƺţ������ë���ȣ׻��˵��˻������"

TFNLJS["����"]="�ǡ��츳���������ǡ��ȣ׹���Ч��������Ʒ��Ӱ�죬Խ�߼ӳ�Խ��Уǡ��ƺţ��������ա��ȣ����չ���Ѫ�������������ж�"

TFNLJS["������"]="�ǡ��ƺţ���ƽ��ǹ���ȣ���ƽǹ����������׷��ɱ��������"       
 
TFNLJS["����"]="�ǡ��츳����Ӣ��ŭ���ȣױ������ʰٷ�֮�٣����������ʰٷ�֮��ʮ�Уǡ��ƺţ������������ȣ׽���ʮ���Ƽ��ⷢ���ʰٷ�֮��"                        

TFNLJS["����"]="�ǡ��츳����Ե��񡿣ȣ׹�����ٷ�֮��ʮ���ʴӼ��������֮һ����ʼ�����Уǡ��ƺţ���ң���š��ȣ�ʹ����ɽ������һ�����ʴ�������������ɱ����"                        

TFNLJS["����"]="�ǡ��츳���������ġ��ȣ��������ʶ��������޵�Ӱ��Уǡ��ƺţ������洫���ȣ������񽣴��з����ʰٷ�֮��ʮ"                  

TFNLJS["Ľ�ݸ�"]="�ǡ��츳����ϲ��̡��ȣ׶�ת�������ʴ�������Уǡ��ƺţ�����Ľ�ݡ��ȣ׶�ת���ƺ�����ֵ����"

TFNLJS["������"]="�ǡ��츳������ǿ�ǡ��ȣ������κ��������������κ��ؼ��Уǡ��ƺţ��ŋ����ӡ��ȣ����������䳣��������Ч��������"     

TFNLJS["�Ħ��"]="�ǡ��ƺţ������������ȣ�ʹ�û��浶����ʱʹ���ָ���������ʮ��"                                

TFNLJS["��̹֮"]="�ǡ��츳��������ס���ȣ���ʹ�������ڹ������Уǡ��ƺţ������ֿ͡��ȣ����й��������ɰ���ʮ��"  

TFNLJS["����"]="�ǡ��ƺţ�����֮�����ȣ�����̹֮ͬ��ս��ʱ����̹֮�����ر���"                          

TFNLJS["������"]="�ǡ��ƺţ������ɷ���ȣױ���ʱ�˺�Ч������"

TFNLJS["ѦĽ��"]="�ǡ��ƺţ������С��ȣ�ҽ��������ٵ㡡����ͬ��һ��"
 
TFNLJS["����"]="�ǡ��츳��������ɡ��ȣ�����弶�ɳ�ʱ��ÿ�������ӳɵ����������Уǡ��ƺţ���֮���ߡ��ȣ׽���ʮ���Ƽ��ⷢ���ʰٷ�֮��ʮ"  

TFNLJS["����"]="�ǡ��츳�����Ļ��ʡ��ȣ������ؼ��ɹ�ʱ����ֵ�ɳ������Уǡ��ƺţ�������˫���ȣ�սǰ�ɽ��в���"
                 
TFNLJS["�ܲ�ͨ"]="�ǡ��츳��ͯ���������ȣ����һ����ط����Уǡ��ƺţ���ͯ��ա��ȣ�ÿ�ж�һ�ι���Ч�������ٷ�֮ʮ"

TFNLJS["��ҩʦ"]="�ǡ��ƺţ��һ��������ȣ׹���ʱ��ȫ����������һǧ������������ʱ��������Ϊ�㣬�ټ�����һ��"

TFNLJS["ŷ����"]="�ǡ��츳��������ʩ���ȣױ������ض������߻���ħ״̬�Уǡ��ƺţ��������ȣ׹���ʱ���ӶԷ���������׷����ʮ���ж�"

TFNLJS["���߹�"]="�ǡ��ƺţ���ؤ���ȣ׽���ʮ���Ƽ��ⷢ���ʰٷ�֮��ʮ"

TFNLJS["÷����"]="�ǡ��ƺţ���ʬħɷ���ȣ׾����׹�צ��������"

TFNLJS["����"]="�ǡ��츳��������˿���ȣ׵�ȫ�幥��Ч�����ٷ�֮ʮ"

TFNLJS["����"]="�ǡ��츳�������ǡ��ȣ׵�ȫ�����Ч�����ٷ�֮ʮ"

TFNLJS["�����"]="�ǡ��츳���������ѡ��ȣ��Դ������޽�ͻ�ƣ�ս�����ƶ�����������Уǡ��ƺţ��Ž����ˡ��ȣ׽���ս�������ж�"

TFNLJS["��������"]="�ǡ��ƺţ�Ψ�Ҳ��ܡ��ȣ׶��������ʰٷ�֮�٣����������ʰٷ�֮��ʮ"

TFNLJS["��ӯӯ"]="�ǡ��츳�����ӯӯ���ȣ�ʹ�÷����ٹ���ʱ���ʷ����������ٽ�������ȫ�������һ�ٵ�Уǡ��ƺţ�����ʥ�á��ȣ����������ս��ʱʹ�÷����ٹ������ʷ���Ц��������������������ȫ�ظ�"

TFNLJS["�����"]="�ǡ��ƺţ��嶾�������ȣ׹������������ٷ�֮ʮ���ö������İٵ�"

TFNLJS["��ƽ֮"]="�ǡ��ƺţ���а���͡��ȣײ����Թ��ĳͷ�Ӱ�죻ѧϰ�����񹦺�����������У������񹦿ɹ���"

TFNLJS["�����"]="�ǡ��ƺţ������齣���ȣ�ÿ��ϰһ�ֽ������ҵȼ��ﵽ��֮���������˺�Ч�������ٷ�֮��"

TFNLJS["�ﲮ��"]="�ǡ��ƺţ�������С��ȣ׼����ٶ�������ս�����ѷ���ԱԽ������Խ��"

TFNLJS["ƽһָ"]="�ǡ��ƺţ�ɱ����ҽ���ȣ�ҽ��������ٵ㡡ս���м����ٶ���ɱ��������"

TFNLJS["�¼���"]="�ǡ��ƺţ���غ컨���ȣ�����ʱ����ֵ�߳ɳ�"

TFNLJS["����ͩ"]="�ǡ��츳������֮�š��ȣ��ҷ�ȫ�����Ч�������ٷ�֮ʮ�Уǡ��ƺţ�����������ȣ�ʹ�����ֽ�������ɱ������ʮ���"

TFNLJS["������"]="�ǡ��츳�����;������ȣ��ҷ�ȫ�幥��Ч�������ٷ�֮ʮ�Уǡ��ƺţ������й١��ȣ׹���ʱʹ�������˳̶ȷ���"

TFNLJS["���"]="�ǡ��츳�������½����ȣ������ٷ�֮��ʮ���±������������ٷ�֮��ʮ�����±����������Уǡ��ƺţ����񡿣ȣ׹���ʱ׷������֮ŭХ����ȫԱ������һ��"

TFNLJS["С��Ů"]="�ǡ��츳���佣��˪���ȣ����ҷ������������Уǡ��ƺţ�������Ů���ȣ�����Ů���Ľ������ض�����"

TFNLJS["��Ӣ"]="�ǡ��츳������ڸա��ȣ������ٷ�֮��ʮ�����˺������ٷ�֮��ʮ�Уǡ��ƺţ������������ȣ�ʹ��������������ɱ���������ٵ�"

TFNLJS["���ַ���"]="�ǡ��ƺţ�Ԫ�ɵ�ʦ���ȣ��κι������׷��ɱ��������"

TFNLJS["����"]="�ǡ��ƺţ��������ġ��ȣ��κι���׷��ɱ��������"

TFNLJS["ʯ����"]="�ǡ��츳�����Ӹս����ȣ׸�����Ч����������ʮ��Уǡ��ƺţ�����̫�����ȣ�̫����������Ч��������Ч��Ϊ����"

TFNLJS["����ʯ"]="�ǡ��ƺţ���ı���㡿�ȣ�ÿ���ܵ������Զ���Ѫ��ʮ�㣬ҽ�������İٵ�"

TFNLJS["���޼�"]="�ǡ��츳��˭�����塿�ȣ��ڹ����������巢�����ʰٷ�֮�٣Уǡ��ƺţ��������𡿣ȣ׷���Ǭ����Ų��ʱ�����˺��ٷ�֮��ʮ�����ܵ������Ծ����񹦷��𹥻��߰ٷ�֮��ʮ�˺�"

TFNLJS["������"]="�ǡ��츳����Ϊ���񡿣ȣ�ս�����ҷ�Ů�Խ�ɫԽ���乥��Ч��Խ�ߣ�"

TFNLJS["С��"]="�ǡ��ƺţ���˹ʥŮ���ȣ׵�ȫ���ƶ�������"

TFNLJS["�����"]="�ǡ��ƺţ����ᶾ�����ȣ���ս���ϵͻ��ʷ���ʳ��"

TFNLJS["���ѹ�"]="�ǡ��ƺţ����ֹ��š��ȣ��ö������İٵ�"

TFNLJS["����ţ"]="�ǡ��ƺţ�����ҽ�ɡ��ȣ�ҽ��������ٵ㡡ҩƷЧ�����������������ҩ"

TFNLJS["Ԭ��־"]="�ǡ��츳��־�����¡��ȣ��Զ��ָ����ˣУǡ��ƺţ��������ס��ȣױ����������ٷ�֮��ʮ"

TFNLJS["������"]="�ǡ��ƺţ��������ơ��ȣ�ʹ�����𽣷��������һ����������"

TFNLJS["������"]="�ǡ��ƺţ�������硿�ȣ׹������������ٷ�֮ʮ���ö������İٵ�"

TFNLJS["���л�"]="�ǡ��ƺţ�ԧ�쵶�͡��ȣ�ʹ�÷��޵��������ر���"

TFNLJS["��ǧ��"]="�ǡ��ƺţ����񡿣ȣױ�����ʱ���ʷ����������ٲ������㹥��"

TFNLJS["�˳���"]="�ǡ��ƺţ�ʳ�񡿣ȣ׹�����������"
