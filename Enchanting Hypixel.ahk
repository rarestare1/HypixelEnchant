#InstallMouseHook
SetDefaultMouseSpeed, 0

x1:=0
x2:=0
y1:=0
y2:=0

var:=0x
tol1=1
ax1:=800
ay1:=350
ax2:=1131
ay2:=570

dx:=35

bxArray := [0,0,0,0,0]
bxArray[1]:=893
bxArray[2]:=bxArray[1]+dx
bxArray[3]:=bxArray[2]+dx
bxArray[4]:=bxArray[3]+dx
bxArray[5]:=bxArray[4]+dx
byArray := [433, 468]
colorArray := ["0x36365F","0x7B4335","0x2C7354","0x367D7D","0x785F4A","0x645482","0x36594D","0x5F5440","0x365478","0x693B54"]
greyArray := ["0x5F5F5F","0x6E6E6E","0x5F5F5F","0x5F5F5F","0x5F5F5F","0x5F5F5F","0x656565","0x5F5F5F","0x5F5F5F","0x5F5F5F"]  
n:= 0
sp:=" "

f1::
Loop{
	for j, by in byArray
		for i, bx in bxArray
		{
			ErrorLevel:=1						;set errorlevel to 1 as default
			PixelGetColor, color, bx, by		;get color
			if(color!=colorArray[i+(j-1)*5] and color!=greyArray[i+(j-1)*5]){ 	
			MouseMove bx,by
			Click, bx,by
			MouseMove bx,by-200			;get away to not change colors
	
			;FileAppend, % i sp j sp color sp colorArray[i+(j-1)*5] sp greyArray[i+(j-1)*5]  ,Test.txt
			;FileAppend, `n, Test.txt
				
			}

		}
	ImageSearch,,, ax1, ay1, ax2, ay2, 16.bmp
	if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
	if (ErrorLevel<1){
	Send {Esc}
	Sleep 1000
    Click, 897, 462
	Break
	}
}
return

f3::
Loop{
	ErrorLevel:=1
	PixelSearch, OX, OY, ax1, ay1, ax2, ay2, 0x1C6445, tol1, Fast
	if (ErrorLevel<1){
	ErrorLevel:=1
	MouseMove OX,OY
	Click, OX,OY
	MouseMove OX,OY-200
	Random, rand, 100, 200
	Sleep rand
}
	ImageSearch,,, ax1, ay1, ax2, ay2, 21.bmp
	if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
	if (ErrorLevel<1){
	Send {Esc}
	Sleep 1000
    Click, 888, 451
	Sleep 1800
	Click, Right
	Sleep 1900
	Click, 895, 470
	Sleep 1700
	Click, 1045, 454
	Break
	}
}
Loop{
	for j, by in byArray
		for i, bx in bxArray
		{
			ErrorLevel:=1						;set errorlevel to 1 as default
			PixelGetColor, color, bx, by		;get color
			if(color!=colorArray[i+(j-1)*5] and color!=greyArray[i+(j-1)*5]){ 	
			MouseMove bx,by
			Click, bx,by
			MouseMove bx,by-200			;get away to not change colors
	
			;FileAppend, % i sp j sp color sp colorArray[i+(j-1)*5] sp greyArray[i+(j-1)*5]  ,Test.txt
			;FileAppend, `n, Test.txt
				
			}

		}
	ImageSearch,,, ax1, ay1, ax2, ay2, 16.bmp
	if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
	if (ErrorLevel<1){
	Send {Esc}
	Sleep 1000
    Click, 897, 462
	Break
	}
}
return

f2::Reload
f4::ExitApp

f7::
Loop{
MouseGetPos , x,y
ToolTip, Select point 1
if GetKeyState("LButton")
{
x1:=x
y1:=y
break
}
Sleep 10
}
Sleep 300
Loop{
MouseGetPos , x,y
ToolTip, Select point 2
if GetKeyState("LButton")
{
x2:=x
y2:=y
break
}
Sleep 10
}
ToolTip
return
