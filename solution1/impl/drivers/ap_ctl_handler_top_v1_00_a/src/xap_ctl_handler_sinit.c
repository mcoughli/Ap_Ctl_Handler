// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.4
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xap_ctl_handler.h"

extern XAp_ctl_handler_Config XAp_ctl_handler_ConfigTable[];

XAp_ctl_handler_Config *XAp_ctl_handler_LookupConfig(u16 DeviceId) {
	XAp_ctl_handler_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XAP_CTL_HANDLER_NUM_INSTANCES; Index++) {
		if (XAp_ctl_handler_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAp_ctl_handler_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAp_ctl_handler_Initialize(XAp_ctl_handler *InstancePtr, u16 DeviceId) {
	XAp_ctl_handler_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAp_ctl_handler_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAp_ctl_handler_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

