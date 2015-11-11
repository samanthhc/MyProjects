# -*- coding: utf-8 -*-
"""
Created on Fri May 15 13:28:53 2015

@author: Samanth
"""

import vrep
import sys
import math
import time

vrep.simxFinish(-1) # just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19997,True,True,5000,5)
if clientID!=-1:
    print ('Connected to remote API server')
else:
    print 'connection not successful'
    sys.exit('could not connect')
    
errorCode,joint_Handle1=vrep.simxGetObjectHandle(clientID,"LBR4p_joint2",vrep.simx_opmode_oneshot_wait) # Handling of Joints
errorCode,joint_Handle2=vrep.simxGetObjectHandle(clientID,"LBR4p_joint4",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle3=vrep.simxGetObjectHandle(clientID,"LBR4p_joint6",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle4=vrep.simxGetObjectHandle(clientID,"LBR4p_joint7",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle12=vrep.simxGetObjectHandle(clientID,"LBR4p_joint5",vrep.simx_opmode_oneshot_wait)

errorCode,joint_Handle11=vrep.simxGetObjectHandle(clientID,"LBR4p_joint1",vrep.simx_opmode_oneshot_wait)

errorCode,joint_Handle5=vrep.simxGetObjectHandle(clientID,"BarrettHand_jointB_1",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle6=vrep.simxGetObjectHandle(clientID,"BarrettHand_jointC_1",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle7=vrep.simxGetObjectHandle(clientID,"BarrettHand_jointB_0",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle8=vrep.simxGetObjectHandle(clientID,"BarrettHand_jointC_0",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle9=vrep.simxGetObjectHandle(clientID,"BarrettHand_jointB_2",vrep.simx_opmode_oneshot_wait)
errorCode,joint_Handle10=vrep.simxGetObjectHandle(clientID,"BarrettHand_jointC_2",vrep.simx_opmode_oneshot_wait)

errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle1,math.radians(65),vrep.simx_opmode_oneshot_wait)
errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle2,math.radians(170),vrep.simx_opmode_oneshot_wait)
errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle3,math.radians(90),vrep.simx_opmode_oneshot_wait)


errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle12,math.radians(90),vrep.simx_opmode_oneshot_wait)#gives position to the joint5

vrep.simxSetIntegerSignal(clientID,"closing_signal",1,vrep.simx_opmode_oneshot_wait)# sends signal to child script

errorCode,joint=vrep.simxGetJointPosition(clientID,joint_Handle7,vrep.simx_opmode_oneshot_wait)# get the position of the joint7
time.sleep(5)
while joint >= 0.0104653835297:
 errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle1,math.radians(5),vrep.simx_opmode_oneshot_wait)
 errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle11,math.radians(90),vrep.simx_opmode_oneshot_wait)
 break;

time.sleep(2)
errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle4,math.radians(10),vrep.simx_opmode_oneshot_wait)
errorCode=vrep.simxSetJointTargetPosition(clientID,joint_Handle1,math.radians(35),vrep.simx_opmode_oneshot_wait)
vrep.simxSetIntegerSignal(clientID,"closing_signal",0,vrep.simx_opmode_oneshot_wait)

