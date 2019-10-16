# init
## OS
1. USB startup with Ubuntu - 40min
  - [x] browser search type >> bing
  - [x] change sources.list
> ref: https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo vi /etc/apt/sources.list

sudo apt update && sudo apt dist-upgrade && sudo apt autoremove

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential
```
2. download software
  - [x] chrome  -10min
  - [x] vscode  -10min
    * flutter
    * markdown preview
    * bloc
  - [x] git     -20min
  - [x] aptitude
  - [x] Android Studio -30min
    * tar,move to ~,sh studio.sh
    * virtual startup
    * plugins install in vs and AS
      + please install dart first
  - [x] flutter -10min
    * path set
    ```bash

    ```
  - [ ] SSR[ ShadowsocksX-NG-R8 ]
    ```
    服务器--->>二维码
    ```
```bash
sudo apt-get install git
sudo apt-get install aptitude
```
3. new a flutter
  - [x] reset maven
  * .gradle/init.gradle
  ```dart
  # geit ~/.gradle/init.gradle

def ALIYUN_REPOSITORY_URL = 'https://maven.aliyun.com/repository/public'
def ALIYUN_JCENTER_URL = 'https://maven.aliyun.com/repository/jcenter'
def ALIYUN_PUBISH_URL = 'https://maven.aliyun.com/nexus/context/groups/publish'
buildscript {
  repositories {
  	maven {
            url ALIYUN_REPOSITORY_URL
            url ALIYUN_JCENTER_URL
	    url ALIYUN_PUBISH_URL
        }
  }
}

allprojects{
    repositories {
        maven {
            url ALIYUN_REPOSITORY_URL
            url ALIYUN_JCENTER_URL
	    url ALIYUN_PUBISH_URL
        }
    }
}
  ```
4. virtualbox--8h  <font color=red>失败</font>
 - [x] MAC
https://zhuanlan.zhihu.com/p/47707748
```bash
VBoxManage modifyvm MacOS --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata MacOS "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata MacOS "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata MacOS "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata MacOS "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata MacOS "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
# 修改屏幕分辨率为 1440 * 900
VBoxManage setextradata MacOS VBoxInternal2/EfiGopMode 4
```

5. git clone
6. account info
