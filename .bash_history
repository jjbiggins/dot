cd ..
#1613793478
c
#1613793479
ls
#1613793481
c
#1613793485
cd Desktop/
#1613793486
ls
#1613793491
rm Screen\ Shot\ 2021-02-19\ at\ 6.20.31\ PM.png 
#1613793494
c
#1613793494
ls
#1613793498
rm eCommerce/
#1613793502
rm -rf eCommerce/
#1613793503
ls
#1613793509
cd Xcode/
#1613793515
gcl https://github.com/michaelvillar/timer-app.git
#1613793745
c
#1613793745
ls
#1613793749
c
#1613793857
ls
#1613793858
du
#1613793859
c
#1613793861
df
#1613793924
cd ~
#1613793925
c
#1613793930
vim ~/.wordpress-admin-url 
#1613793938
c
#1613794476
cd ~/Library/
#1613794488
find . -type d -name Extensions
#1613794513
sudo rm -rf Caches/*
#1613794523
cd Caches/com.apple.Safari/
#1613794524
ls
#1613794527
ls -al
#1613794530
sudo ls
#1613794533
ls -la
#1613794535
cd ..
#1613794542
ll com.apple.Safari/
#1613794544
cd ..
#1613794544
c
#1613794545
ls
#1613794550
cd Safari
#1613794550
ls
#1613794557
cd 
#1613794558
ls
#1613794562
cd ~/Library/
#1613794565
cd Safari
#1613794566
ls
#1613794573
sudo ls
#1613794574
c
#1613794577
cde
#1613794630
killall Safari
#1613794634
killall SafariCloudHistoryPushAgent 
#1613794638
killall SafariBookmarksSyncAgent 
#1613794646
killall Firefox
#1613794648
killall Firefox.app
#1613794650
ps
#1613794653
ps -ua
#1613794654
ps -u
#1613794655
c
#1613794658
ps -uax
#1613794663
ps -u jjbiggins
#1613794667
c
#1613795530
sudo port install ffmpeg
#1613795558
sudo port uninstall python38
#1613795566
sudo port uninstall python39
#1613795581
sudo port install python38
#1613795422
ssh jbiggins@192.168.1.89
#1613795980
        sudo port select --set python python38
#1613795990
        sudo port select --set python python39
#1613795998
sudo port install python39
#1613796046
        sudo port select --set python python39
#1613796050
        sudo port select --set python3 python39
#1613796062
cd Sites/
#1613796062
ls
#1613796064
scp         sudo port select --set python python39
#1613796070
gcl https://github.com/reactioncommerce/reaction.git
#1613796057
sudo port selfupdate
#1613796091
ssh test
#1613796096
ssh oper@test
#1613797311
clear
#1613797369
c
#1613797371
ls
#1613797375
cd eCommerce/
#1613797376
ls
#1613797380
vim README.md 
#1613797440
cd ../sa
#1613797441
cd ..
#1613797442
ls
#1613797463
cd reaction/
#1613797463
ls
#1613797471
cd ..
#1613797474
rm -rf reaction/
#1613797484
git clone https://github.com/mirumee/saleor-platform.git --recursive --jobs 3
#1613797498
sudo port upgrade outdated
#1613797641
ssh oper@test "gcl https://github.com/reactioncommerce/reaction.git" 
#1613797650
ssh oper@test "git clone https://github.com/reactioncommerce/reaction.git" 
#1613797685
c
#1613797689
c
#1613797697
ls
#1613797761
cd Sites/
#1613797761
ls
#1613797763
cd eCommerce/
#1613797764
c
#1613797764
ls
#1613797769
vim README.md 
#1613797812
cat README.md | grep https
#1613797840
cat README.md | grep "Full Course is here: https"
#1613797843
cat README.md | grep "Full Course is here: "
#1613797932
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' file 
#1613797935
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}'
#1613797943
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | open
#1613797945
c
#1613797984
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox
#1613797987
firefox
#1613797990
c
#1613798008
open < (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798017
open < cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}'
#1613798036
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' > open
#1613798039
ls
#1613798047
rm open 
#1613798054
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' > firefox
#1613798060
rm firefox 
#1613798101
(cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798107
open (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798113
open <  (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798128
c
#1613798135
firefox <  (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798160
firefox <  $(cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798168
firefox   $(cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613798178
which firefox
#1613798187
vim ~/.bashrc
#1613798191
c
#1613798203
cd /Applications/Firefox.app/Contents/
#1613798204
ls
#1613798206
ll Library/
#1613798208
ll Library/LaunchServices/
#1613798213
ll Resources/
#1613798214
c
#1613798215
ll Resources/
#1613798221
c
#1613798224
ll Resources/res/
#1613798227
ll Resources/res/cursors/
#1613798228
c
#1613798231
ll Resources/res/
#1613798232
ll Resources/
#1613798235
ll Resources/browser/
#1613798237
ll Resources/browser/features/
#1613798238
c
#1613798251
find . -type f firefox
#1613798255
find . -type f -name firefox
#1613798257
ls
#1613798260
ll Resources/
#1613798265
cd Resources/
#1613798265
c
#1613798266
ls
#1613798271
ll defaults/
#1613798273
ll defaults/pref/
#1613798278
ll browser/
#1613798281
ll browser/features/
#1613798282
c
#1613798283
ls
#1613798292
where firefox
#1613798298
which firefox
#1613798300
cd ~
#1613798300
c
#1613798301
ls
#1613798305
command firefox
#1613798307
vim .functions 
#1613798328
firefox
#1613798328
c
#1613798329
ls
#1613798417
vlc
#1613798421
vlc -H
#1613798422
c
#1613798440
/Applications/VLC.app/Contents/MacOS/VLC
#1613798449
/Applications/VLC.app/Contents/MacOS/VLC &
#1613798460
c
#1613798463
/Applications/VLC.app/Contents/MacOS/VLC 
#1613798469
c
#1613798474
cvlc
#1613798479
/Applications/VLC.app/Contents/MacOS/VLC 
#1613798488
/Applications/VLC.app/Contents/MacOS/cvlc
#1613798494
cd /Applications/VLC.app/Contents/
#1613798495
ls
#1613798498
ll Frameworks/
#1613798502
ll Frameworks/Breakpad.framework/
#1613798504
ll Frameworks/Breakpad.framework/Versions/
#1613798506
ll Frameworks/Breakpad.framework/Versions/Current
#1613798509
ll Frameworks/Breakpad.framework/Versions/CurrentA
#1613798513
ll Frameworks/Breakpad.framework/Versions/A/
#1613798515
ll Frameworks/Breakpad.framework/Versions/A/Resources/
#1613798517
c
#1613798517
ls
#1613798520
ll Resources/
#1613798556
vim ~/.bashrc_aliases 
#1613798589
c
#1613798600
vlc --help
#1613798609
c
#1613798702
youtube-dl https://www.youtube.com/watch?v=sz_dsktIjt4&feature=emb_logo
#1613798718
ls
#1613798912
vim ~/.bashrc_aliases 
#1613798942
firefox
#1613798950
c
#1613798951
clear
#1613798361
ssh oper@192.168.1.165
#1613797505
ssh oper@test
#1613798991
ls
#1613798999
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' > firefox
#1613799007
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox &
#1613799016
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox
#1613799024
exec $SHELL
#1613799026
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox
#1613799033
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox ~&
#1613799039
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox &
#1613799049
c
#1613799051
cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}' | firefox &
#1613799057
c
#1613799070
firefox < (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613799073
firefox  (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613799080
 (cat README.md | grep "Full Course is here: " | awk -F"[()]" '{print $2}')
#1613799088
c
#1613799264
cd ..
#1613799264
c
#1613799265
ls
#1613799269
rm -rf eCommerce/
#1613799269
c
#1613799270
ls
#1613799276
rm -rf saleor-platform/
#1613799277
c
#1613799278
ls
#1613799284
rm -rf django_test/
#1613799285
c
#1613799287
cd django-ecommerce/
#1613799288
ls
#1613799291
vim README.md 
#1613799312
virtualenv env
#1613799316
ls
#1613799326
source env/bin/activate
#1613799327
c
#1613799327
ls
#1613799333
pip install -r requirements.txt 
#1613799351
c
#1613799357
python manage.py runserver
#1613799366
python manage.py runserver &
#1613799370
ls
#1613799373
vim README.md 
#1613799404
ls
#1613799467
c
#1613799468
ls
#1613799476
deactivate 
#1613799478
cd ..
#1613799498
django-admin startproject django-portfolio
#1613799505
django-admin startproject django_portfolio
#1613799510
cd django_portfolio/
#1613799510
c
#1613799511
ls
#1613799551
c
#1613799551
ls
#1613799603
c
#1613799604
ls
#1613799609
cd ~/Applications/
#1613799610
c
#1613799610
ls
#1613799616
ll OpenVBX/
#1613799624
ll OpenVBX/README.markdown 
#1613799629
vim OpenVBX/README.markdown 
#1613799635
c
#1613799635
ls
#1613799638
ll LuLu/
#1613799643
ll LuLu/Uninstaller/
#1613799646
ll LuLu/Uninstaller/Uninstaller
#1613799647
c
#1613799648
ls
#1613799653
ll mrmc/
#1613799658
ll mrmc/README.md 
#1613799662
vim mrmc/README.md 
#1613799671
c
#1613799671
ls
#1613799678
rm -rf pyatv/
#1613799697
scp -r test oper@ubuntu
#1613799703
scp -r test ubuntu@ubuntu
#1613799714
scp -r test oper@192.165.1.165
#1613799715
ls
#1613799718
rm -rf test/
#1613799731
scp -r test oper@192.165.1.165:~
#1613799744
scp -r test oper@test:~
#1613799754
scp -r test oper@test:/Users/oper/
#1613799763
scp -r ./test oper@test:/Users/oper/
#1613799767
ls
#1613799781
ll oper@ubuntu
#1613799790
mv *@* test
#1613799791
ls
#1613799800
mv oper@ubuntu test
#1613799800
ls
#1613799807
rm -rf  ubuntu@ubuntu
#1613799819
rm -rf oper@*
#1613799820
c
#1613799831
ls
#1613799880
cd Applications/
#1613799904
scp -r ./test/ ubuntu@192.168.1.162:/test
#1613799845
scp -r ./test/ oper@test:test
#1613799928
c
#1613799929
ls
#1613799931
c
#1613799932
ls
#1613799940
c
#1613799919
scp -r ./test/ ubuntu@192.168.1.162:/home/ubuntu/test
#1613799962
ls
#1613799965
c
#1613799968
rm -rf test/
#1613799969
ls
#1613799977
rm -rf youtube-dl/
#1613799977
c
#1613799978
ls
#1613799996
mv tmp edgar-stocks-data
#1613799998
c
#1613800000
ll github/
#1613800009
ll github/wt2db-1.0/
#1613800018
vim github/wt2db-1.0/README 
#1613800028
rm -rf github/
#1613800029
ls
#1613800031
ll cloudflared/
#1613800034
rm -rf cloudflared/
#1613800036
c
#1613800036
ls
#1613800042
rm -rf LuLu/
#1613800042
ls
#1613800050
rm -rf Xcode-beta.app/
#1613800055
ls
#1613800058
c
#1613800073
mv Xcode-beta.app /Applications/
#1613800074
ls
#1613800093
rm -rf /Applications/Xcode-beta.app/
#1613800452
cd ~/Library/
#1613800453
ls
#1613800458
cd Safari
#1613800459
ls
#1613800526
c
#1613800535
cd ~/Library/Safari
#1613800536
c
#1613800537
ls
#1613800541
ll LocalStorage/
#1613800560
rm LocalStorage/*
#1613800569
rm -f  LocalStorage/*
#1613800570
ls
#1613800576
ll ReadingListArchives/
#1613800580
ll ReadingListArchives/01A0B427-C178-45AF-B6A9-3B6DBFEB5CED/
#1613800586
ll ReadingListArchives/0369E09B-AE99-43AB-87A2-2D6CC9D0CDA9/
#1613800602
ls -lG ReadingListArchives/
#1613800614
rm -rf ReadingListArchives/*
#1613800615
ls
#1613800636
ll Databases/
#1613800639
ll Databases/___IndexedDB/
#1613800642
ll Databases/___IndexedDB/v1/
#1613800647
ll Databases/___IndexedDB/v0/
#1613800651
ll Databases/___IndexedDB/v0/v1/
#1613800654
ll Databases/___IndexedDB/v0/v0/
#1613800657
ll Databases/___IndexedDB/v0/v0/v0/
#1613800663
ll Databases/___IndexedDB/v0/v0/v0/v0/
#1613800664
c
#1613800665
ls
#1613800730
ssh oper@test
#1613800764
c
#1613800764
ls
#1613800766
cd ..
#1613800767
c
#1613800767
ls
#1613800775
cd SafariSafeBrowsing/
#1613800776
ls
#1613800777
ls -al
#1613800779
cd ..
#1613800780
c
#1613800780
ls
#1613800787
ll Application\ Support/
#1613800810
ll Application\ Support/CallHistory
#1613800814
ll Application\ Support/CallHistoryDB/
#1613800819
c
#1613800819
ls
#1613800822
ll Acc
#1613800825
ll Accounts/
#1613800835
sqlite3 Accounts/Accounts4.sqlite
#1613800894
c
#1613800894
ls
#1613800899
ll Application\ Scripts/
#1613800936
ls --sort=size Application\ Scripts/
#1613800942
ls --sort=size -l Application\ Scripts/
#1613800951
c
#1613800952
ls
#1613800958
ll Assistant
#1613800972
ll Assistant/CustomVocabulary/
#1613800974
ll Assistant/CustomVocabulary/com.apple.iChat/
#1613800976
ll Assistant/CustomVocabulary/com.apple.iChat/0000000000000000000000000000000000000000/
#1613800978
ll Assistant/CustomVocabulary/com.apple.iChat/0000000000000000000000000000000000000000/ContactGroupNameType/
#1613800980
c
#1613800981
ls
#1613800984
ll Assistants/
#1613800985
c
#1613800987
ls
#1613800990
ll Audio/
#1613800993
ll Audio/Sounds/
#1613800995
ll Audio/Sounds/Alerts/
#1613800997
ll Audio/Sounds/Banks/
#1613801007
ll Audio/Plug-Ins/
#1613801011
ll Audio/Plug-Ins/Components/
#1613801015
ll Audio/Plug-Ins/VST/
#1613801016
c
#1613801016
ls
#1613801022
ll Calendars/
#1613801023
c
#1613801023
ls
#1613801027
ll Compositions/
#1613801028
ls
#1613801030
c
#1613801034
ll ContainerManager/
#1613801047
sqlite3  ContainerManager/containers.sqlite3
#1613801055
c
#1613801056
ls
#1613801059
ll Containers
#1613801070
c
#1613801071
ls
#1613801075
ll Cookies/
#1613801076
c
#1613801079
ls
#1613801082
ll DataDeliveryServices/
#1613801084
c
#1613801085
ls
#1613801087
ll Developer/
#1613801090
ll Developer/CoreSimulator/
#1613801098
ll Developer/Xcode/
#1613801101
ll Developer/Xcode/UserData/
#1613801102
c
#1613801103
ls
#1613801105
ll Dictionaries/
#1613801108
c
#1613801109
ls
#1613801113
ll Group\ Containers/
#1613801114
c
#1613801114
ls
#1613801119
ll HTTPStorages/
#1613801121
c
#1613801121
ls
#1613801124
ll IdentityServices/
#1613801127
c
#1613801128
ls
#1613801133
ll KeyboardServices/
#1613801140
ll LaunchAgents/
#1613801143
ll Logs/
#1613801150
ll Mail/
#1613801157
ll PDF\ Services/
#1613801158
c
#1613801159
ls
#1613801162
ll Passes/
#1613801168
ll Preferences
#1613801169
c
#1613801169
ls
#1613801172
ll Pr
#1613801174
ll Printers/
#1613801177
ll Printers/HP\ Officejet\ 5740\ series.app/
#1613801179
ll Printers/HP\ Officejet\ 5740\ series.app/Contents/
#1613801183
ll Printers/HP\ Officejet\ 5740\ series.app/Contents/Resources/
#1613801184
c
#1613801185
ls
#1613801189
ll Scripts/
#1613801192
ll Services/
#1613801195
ll Sharing/
#1613801202
ll Speech/
#1613801206
ll Spelling/
#1613801213
ll Suggestions/
#1613801221
ll Workflows/
#1613801223
ll Workflows/Applications/
#1613801225
ll Workflows/Applications/Calendar/
#1613801226
c
#1613801226
ls
#1613801246
cd ~/Applications/
#1613801246
c
#1613801247
ls
#1613801250
ll edgar-stocks-data/
#1613801251
ls
#1613801253
cd edgar-stocks-data/
#1613801253
c
#1613801254
ls
#1613801258
ll AAPL/
#1613801259
c
#1613801266
ls
#1613801274
cd ~
#1613801275
ls
#1613801275
c
#1613801276
ls
#1613801292
cp ~/.bashrc ~/.bashrc.bak
#1613801297
rm ~/.bashrc
#1613801315
cp ~/bashrc.ubuntu ~/.bashrc
ll
c
clear
at
at 12:10am today
c
clear
cp ~/.bashrc.ubuntu.bak
cp ~/.bashrc ~/.bashrc.ubuntu.bak
cp ~/.bashrc.bak ~/.bashrc
config ass .bashrc
#1613801401
config add .bashrc
#1613801409
config commit -m "bashrc"
#1613801415
config push
#1613801420
c
#1613801426
config add .vimrc
#1613801435
config commit -m "vimrc"
#1613801439
config push
#1613801448
config add ~/.vim
#1613801456
config commit -m ".vim"
#1613801461
config push
