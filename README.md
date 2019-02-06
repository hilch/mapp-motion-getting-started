# Getting Started with B&R "Mapp Motion"

[![License: CC0-1.0](https://licensebuttons.net/l/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/)

This tutorial shows how to use B&amp;R "Mapp Motion" Technology Package to implement a single axis project.
Follow the steps below (some pics link to YouTube) or just download the complete release with Automation Studio
project included.

We will use a B&amp;R "ETA410.0100-132" training "cube"

![ETA410](https://github.com/hilch/mapp-motion-getting-started/blob/master/media/00_ETA410.0100-00_132.png)

The ETA uses an ACOPOS P3 and some additional X20 IO. A switch connected to both IO card and Trigger 1 input is
also added.

![ETA410 topology](https://github.com/hilch/mapp-motion-getting-started/blob/master/media/01_ETA410.0100-01_132_topology.png)

---


## 1. Install Technology Package Mapp Motion 5.5

![install mapp motion](https://github.com/hilch/mapp-motion-getting-started/blob/master/media/02_install_mapp_motion_55.png)

## 2. Create a new project with a running CPU

(nothing special e.g. as you are used to)

![new project](https://github.com/hilch/mapp-motion-getting-started/blob/master/media/03_running_cpu.png)

## 3. Insert a Mapp Motion Single Axis Configuration

open Configuration View and add a Single Axis Configuration file. All required libraries will be added automatically.

[![04](http://img.youtube.com/vi/qdOVnebVUVw/0.jpg)](http://www.youtube.com/watch?v=qdOVnebVUVw)

## 4. Insert an ACOPOS P3 in Physical View

1. insert ACOPOS and set correct node number
2. set DC bus voltage to 24V due to ETA limitations
3. set encoder to "Endat"
4. apply mapp Single axis to hardware

[![05](http://img.youtube.com/vi/tMh8Yh_kcs4/0.jpg)](http://www.youtube.com/watch?v=tMh8Yh_kcs4)

## 5. Insert Mapp Cockpit

Mapp Cockpit is based on Mapp View Technology (but there is no license required).

1. Open Project/Change Runtime Version and set Mapp View and Mapp Cockpit to V5.5
2. use SAFE file system and add an user partition (F-drive)
3. add a file device where Mapp Cockpit can store trace data.
4. activate OPC-Ua as Mapp Cockpit

[![06](http://img.youtube.com/vi/yQiHJyo_oQ8/0.jpg)](http://www.youtube.com/watch?v=yQiHJyo_oQ8)

## 6. Commissioning with Mapp Cockpit

open browser and navigate to 

`http://<IPADDRESS or HOSTNAME>:81/index.html?visuId=mappCockpit`

e.g.

`http://192.168.0.10:81/index.html?visuId=mappCockpit`

or 

`http://localhost:81/index.html?visuId=mappCockpit`

1. autotune speed controller
2. autotune position controller
3. switch axis on
4. start homing
5. perform some movements to determine correct axis settings
6. save the axis settings to permanent memory

[![07](http://img.youtube.com/vi/ZbgP48_rO-A/0.jpg)](http://www.youtube.com/watch?v=ZbgP48_rO-A)

## 7. Upload the axis settings from target to Automation Studio project

1. use Online/Compare/Automation Components to upload the Mapp Single Axis configuration
2. use Online/Compare/Hardware to upload controller settings
3. Transfer project with uploaded configuration to target again

[![08](http://img.youtube.com/vi/qrduv-qJtsY/0.jpg)](http://www.youtube.com/watch?v=qrduv-qJtsY)

## 8. Insert MpAxisBasic Function Block

Just copy the code from GUID a85aaaa7-f087-4977-b4ef-f4bbb1e069bb (Automation Help 4.5.2.10)

[![09](http://img.youtube.com/vi/G-ZkjUBLmXo/0.jpg)](http://www.youtube.com/watch?v=G-ZkjUBLmXo)

## 9. Test the axis with MpAxisBasic

1. set variable "AxisParameters"
1. Power
2. Home
3. MoveAdditive


[![10](http://img.youtube.com/vi/RnY5mPLEc3Q/0.jpg)](http://www.youtube.com/watch?v=RnY5mPLEc3Q)

## 10. Trace Velocity and Lag Error with mapp Cockpit

[![11](http://img.youtube.com/vi/tcPd2fxRN3M/0.jpg)](http://www.youtube.com/watch?v=tcPd2fxRN3M)



