TYPE

    (*Enum types*)

    McBrakeCmdEnum :
	(
		mcBRAKE_CLOSE,					 (*Engages the brake*)
		mcBRAKE_OPEN,					 (*Releases the brake*)
		mcBRAKE_GET_STATUS				 (*Reads out the current brake status*)
	);

	McBrakeStatusEnum :
	(
		mcBRAKE_STATUS_NOT_PROVIDED,	 (*Commands was not *)
		mcBRAKE_CLOSED,					 (*Holding brake engaged*)
		mcBRAKE_OPENED					 (*Holding brake released*)
	);

	McDirectionEnum :
	(
		mcDIR_POSITIVE,					 (*Movement only in the positive direction  *)
		mcDIR_NEGATIVE,					 (*Movement only in the negative direction*)
		mcDIR_CURRENT,					 (*Movement in the direction of the active movement*)
		mcDIR_SHORTEST_WAY,				 (*Movement with the shortest distance to the target, either in positive or negative direction. The movement will be in the positive direction if the distance is the same in both directions*)
		mcDIR_EXCEED_PERIOD := 8,		 (*The end position can be located outside of the axis period. The axis period can be exited in the negative direction if the end position is also negative.  *)
		mcDIR_UNDEFINED,				 (*Movement in undefined direction*)
		mcDIR_BOTH						 (*Movement in both directions*)
	);

	 McCamAutCouplingSourceEnum :
	(
		mcCAMAUT_COUPLING_SRC_NOT_USED, 	(*No source*)
		mcCAMAUT_COUPLING_SRC_AXIS,		(*Axis as source*)
		mcCAMAUT_COUPLING_SRC_VARIABLE,		(*Process variable as source*)
		mcCAMAUT_COUPLING_SRC_SYSTIME		(*System time as source*)
	);

	McValueSrcEnum :
	(
		mcVALUE_SET, 					 (*Position setpoint value [Measurement units]*)
		mcVALUE_ACTUAL,					 (*Actual position value [Measurement units]*)
		mcVALUE_SET_AXIS_UNITS,			 (*Position setpoint value [axis units]*)
		mcVALUE_ACTUAL_AXIS_UNITS,		 (*Actual value for position [axis units]*)
		mcVALUE_AUTOMATIC_SELECTION		 (*The value for the source is selected automatically in relation to the active controller mode*)
	);

	McPlcopenParEnum :
	(
		mcPAR_COMMANDED_AX_POSITION := 1, 	 (*Target position for the movement [Measurement units]*)
		mcPAR_SW_LIMIT_POSITIVE,		 (*not currently available*)
		mcPAR_SW_LIMIT_NEGATIVE,		 (*not currently available*)
		mcPAR_ENABLE_LIMIT_POSITIVE,	 (*not currently available*)
		mcPAR_ENABLE_LIMIT_NEGATIVE,	 (*not currently available*)
		mcPAR_ENABLE_POS_LAG_MONITORING, (*not currently available*)
		mcPAR_MAX_AX_POSITION_LAG,		 (*not currently available*)
		mcPAR_MAX_AX_VELOCITY_SYSTEM,	 (*not currently available*)
		mcPAR_MAX_AX_VELOCITY_APPL,		 (*not currently available*)
		mcPAR_ACTUAL_AX_VELOCITY,  		 (*Current speed [Measurement units/s]*)
		mcPAR_COMMANDED_AX_VELOCITY,	 (*not currently available*)
		mcPAR_MAX_AX_ACCELERATION_SYSTEM,	 (*not currently available*)
		mcPAR_MAX_AX_ACCELERATION_APPL,	 (*not currently available*)
		mcPAR_MAX_AX_DECELERATION_SYSTEM,	 (*not currently available*)
		mcPAR_MAX_AX_DECELERATION_APPL,	 (*not currently available*)
		mcPAR_MAX_AX_JERK,			(*Maximum jerk of the axis*)
		mcPAR_AX_PERIOD := 1008,     (*The range of values of the axis position is [0, period] in [Measurement units]*)
		mcPAR_HOMING_OFFSET := 1019, 	 (*Homing offset. Cannot be read before the first homing procedure*)
		mcPAR_AX_MEASUREMENT_RESOLUTION := 1020   (*Defines the possible resolution of [Measurement units] that can be met*)
	);

	McCamIplModeEnum :
	(
		mcCAMIPL_CUBIC_SPLINE, 				(*Cubic spline interpolation (3rd order polynomial)*)
		mcCAMIPL_OPTIMIZED_VELOCITY,			(*5th order polynomials with optimized velocity characteristics*)
		mcCAMIPL_OPTIMIZED_ACCELERATION,		(*5th order polynomials with optimized velocity and acceleration characteristics*)
		mcCAMIPL_BESTFIT_5TH_ORDER,			(*Best fit interpolation with 5th order polynomials*)
		mcCAMIPL_BESTFIT_6TH_ORDER				(*Best fit interpolation with 6th order polynomials*)
	);

	McCamTypeEnum :
	(
		mcCAMTYPE_NON_PERIODIC,	(*Parameters "StartSlope", "EndSlope" and "StartCurvature", "EndCurvature" are used for the slope at the beginning and end as well as the curvature at the beginning and end of the polynomial cam*)
		mcCAMTYPE_PERIODIC	(*The slope and curvature for the beginning and endpoints are set the same as each other*)
	);

	(*Structure types*)

	McLibraryInfoType : STRUCT
		Name : STRING[32]; (*Name of the implementation-specific axis library*)
	END_STRUCT;

	McDigitalInputStatusType : STRUCT
	    HomingSwitch : BOOL; (*The digital reference switch input is active*)
        PositiveLimitSwitch : BOOL; (*The positive hardware limit switch is active*)
	    NegativeLimitSwitch : BOOL; (*The negative hardware limit switch is active*)
		Trigger1 : BOOL; (*Trigger input 1 is enabled*)
		Trigger2 : BOOL; (*Trigger input 2 is enabled*)
		DriveEnable : BOOL; (*Drive input "Enable" is active*)
	END_STRUCT;

	McAddInfoType : STRUCT
		DigitalInputStatus : McDigitalInputStatusType; (*Status of the digital inputs*)
		LagWarning : BOOL; (*Lag error warning limit reached*)
		StartupCount : UDINT; (*Number of times the drive was started up since the last PLC start*)
	END_STRUCT;

	McAdvVelCtrlParType : STRUCT
		Acceleration : REAL; (*Maximum acceleration [Measurement units/s�]*)
		Deceleration : REAL; (*Maximum deceleration [Measurement units/s�]*)
		Jerk : REAL; (*Maximum jerk [measurement units / s�]*)
	END_STRUCT;

	McShiftModeEnum:
	(
		mcSHIFT_ABSOLUTE,  (*The value on input "XxxShift" is interpreted as an absolute value*)
		mcSHIFT_RELATIVE,  (*The value on input "XxxShift" is interpreted as a relative value*)
		mcSHIFT_ABSOLUTE_NO_RESET,  (*The functionality here is effectively the same as for mcSHIFT_ABSOLUTE. With this setting, however, the shift value on the drive is not set to 0 if the slave axis leaves state Synchronized Motion and input "Enable" is still set*)
		mcSHIFT_RELATIVE_NO_RESET  (*The functionality here is effectively the same as for mcSHIFT_RELATIVE. With this setting, however, the shift value on the drive is not set to 0 if the slave axis leaves state Synchronized Motion and input "Enable" is still set*)
	);

	McProfileBaseEnum:
	(
		mcPROFBASE_TIME,  (*A speed profile is calculated depending on the "Velocity" and "Acceleration" inputs. The duration of the phase shift is independent of a master speed. If a negative value is entered, this can cause the slave axis to move in the negative direction if the original master speed is low or 0*)
		mcPROFBASE_MASTER_POSITION,  (*The speed profile is calculated from the speed of the coupling master measured at the beginning of the phase shift and function block inputs "Velocity" and "Acceleration". The current master position serves as a basis for calculating the actual shift from the speed profile. The duration of the phase shift depends on the master speed measured at the beginning (profile calculation) and the current master speed*)
		mcPROFBASE_MASTER_DISTANCE,  (*A smooth motion profile is calculated based on the configured value for "ProfileDistance". "ProfileDistance" refers to the sections completed by the master axis. This prevents the slave from moving in the negative direction. The movement is limited by the "Velocity" and "Acceleration" values*)
		mcPROFBASE_SLAVE_POSITION,  (*As per mcPROFBASE_MASTER_POSITION, but in reference to the slave*)
		mcPROFBASE_SLAVE_DISTANCE,  (*As per mcPROFBASE_MASTER_DISTANCE, but in reference to the slave*)
		mcPROFBASE_MASTER_ZONE,  (*A smooth motion profile is calculated based on the configured values for "ZoneParameters". These parameters refer to sections of the master axis*)
		mcPROFBASE_SLAVE_ZONE  (*As per mcPROFBASE_MASTER_ZONE, but in reference to the slave*)
	);

	McAdvShiftDistanceParType : STRUCT
		ProfileDistance : LREAL; (*Distance to the offset [Measurement units]*)
	END_STRUCT;

	McAdvShiftZoneParType : STRUCT
		StartPosition : LREAL; (*Starting position in the profile base for starting the offset [Measurement units]*)
		EndPosition : LREAL; (*End position in the profile base for ending the offset [Measurement units]*)
		Period : LREAL; (*Defines the period if a non-periodic profile base axis or an offset period other than the axis period is to be used [Measurement units]*)
	END_STRUCT;

	McAdvPhasingParType : STRUCT
		ShiftMode : McShiftModeEnum; (*Defines how the value on input "XxxShift" should be used*)
		ProfileBase : McProfileBaseEnum; (*Defines the profile base for the offset as a time or position value*)
		ProfileBaseMaxVelocity : REAL; (*Maximum speed of profile base during offset [Measurement units]*)
		DistanceParameters : McAdvShiftDistanceParType ; (*Distance to the offset [Measurement units]*)
		ZoneParameters : McAdvShiftZoneParType ; (*Position range in which the offset occurs [Measurement units]*)
	END_STRUCT;

	McAdvOffsetParType : STRUCT
		ShiftMode : McShiftModeEnum; (*Defines how the value on input "XxxShift" should be used*)
		ProfileBase : McProfileBaseEnum; (*Defines the profile base for the offset as a time or position value*)
		ProfileBaseMaxVelocity : REAL; (*Maximum speed of profile base during offset [Measurement units]*)
		DistanceParameters : McAdvShiftDistanceParType ; (*Distance to the offset [Measurement units]*)
		ZoneParameters : McAdvShiftZoneParType ; (*Position range in which the offset occurs [Measurement units]*)
	END_STRUCT;

	McAdvGearInParType : STRUCT
		MasterMaxVelocity : REAL; (*Maximum velocity of the master axis [measurement units of master / s]*)
	END_STRUCT;

	McCamAutCrossLeftBoundEnum:
	(
		mcCAMAUT_LIMIT_HORIZONTAL,  (*Position has a horizontal limit*)
		mcCAMAUT_EXTEND_POLY  (*Left limit polynomial is extended*)
	);

	McCamAutCamChangeImmedEnum:
	(
		mcCAMAUT_MASTER_DIR,  (*In the current master direction of movement*)
		mcCAMAUT_POSITIVE_DIR  (*In the positive direction only*)
	);

	McCamAutErrorsInStandbyEnum:
	(
		mcCAMAUT_ERRORS_OFF,  (*No error message in standby mode*)
		mcCAMAUT_ERRORS_ON  (*Error message in standby mode*)
	);

	McCamAutExceedingLimitsEnum:
	(
		mcCAMAUT_WARNING,  (*Warning when limit values have been exceeded*)
		mcCAMAUT_ERROR  (*Error when limit values have been exceeded*)
	);

	McCamAutGetParCmdEnum:
	(
		mcGET_PAR_FROM_OBJECT,  (*Copies parameters from a cam configuration object*)
		mcGET_PAR_ACTUAL,  (*Copies parameters from the configured cam automat for the axis*)
		mcGET_PAR_DEFAULT  (*Copies parameters from the preconfigured cam automat configuration object for the axis*)
	);

	McCamAutSetParCmdEnum:
	(
		mcSET_ALL_PAR_FROM_OBJ, 		 (*Transfers all parameters from a cam automat configuration object*)
		mcSET_ALL_PAR_FROM_ADR, 		 (*Transfers all parameters from the specified user structure*)
		mcSET_ALL_PAR_DEFAULT, 		 (*Transfers all parameters from the preconfigured cam automat configuration object for the axis*)
		mcSET_UPDATE_FROM_OBJ, 		 (*Transfers all update parameters from a cam automat configuration object*)
		mcSET_UPDATE_FROM_ADR, 		 (*Transfers all update parameters from the specified user structure*)
		mcSET_UPDATE_DEFAULT, 		 (*Transfers all update parameters from the preconfigured cam automat configuration object for the axis*)
		mcSET_SYNC_UPDATE_FROM_OBJ,	 (*Transfers all SyncUpdate parameters from a cam automat configuration object*)
		mcSET_SYNC_UPDATE_FROM_ADR, 	 (*Transfers all SyncUpdate parameters from the specified user structure*)
		mcSET_SYNC_UPDATE_DEFAULT 	 (*Transfers all SyncUpdate parameters from the preconfigured cam automat configuration object for the axis*)
	);

	McCamAutResetCmdEnum:
	(
		mcRESET_ALL_AUTOMAT_PARAMS,  (*Resets general automat parameters and all automat states*)
		mcRESET_COMMON_PARAMS,  (*Resets general automat parameters*)
		mcRESET_ALL_STATE_PARAMS,  (*Resets all automat states*)
		mcRESET_ONE_STATE_PARAMS  (*Resets a specific automat state*)
	);

	McCamAutParLockCmdEnum:
	(
		mcCAMAUT_NO_LOCK, 				 (*Automat is not locked*)
		mcCAMAUT_LOCK, 					 (*Locks the automat in order to transfer parameters*)
		mcCAMAUT_UNLOCK_NEXT_STATE, 	 (*Unlocks the automat when switching to the next automat state*)
		mcCAMAUT_UNLOCK_SYNCHRON 		 (*Unlocks the automat when a defined event occurs*)
	);

	McCamAutCompModeEnum:
	(
		mcCOMP_OFF := 0, 					 (*No compensation*)
		mcCOMP_BETWEEN_CAMS := 30, 		 (*Spacing between cams*)
		mcCOMP_BETWEEN_CAMS_DIRECT := 35,  (*Spacing between the end of one cam and the start of another*)
		mcCOMP_CAM_CENTER_POINTS := 31, 	 (*Spacing from the center of one cam to another*)
		mcCOMP_MA_LATCHPOS := 32, 		 (*Master spacing between latch position and cam center*)
		mcCOMP_SL_LATCHPOS := 34, 		 (*Slave spacing between latch position and cam center*)
		mcCOMP_SL_ABSOLUTE := 33, 		 (*Slave compensation for absolute slave position*)
		mcCOMP_VELOCITY_S_MA := 37, 		 (*Minimum jerk velocity mode with master target distance*)
		mcCOMP_VELOCITY_S_SL := 38, 		 (*Minimum jerk velocity mode with slave target distance*)
		mcCOMP_VELOCITY_A_SL := 36, 		(*time optimal jolt limited velocity mode*)
		mcCOMP_VELOCITY_A_CYC := 39, 		 (*Time-optimized jerk-limited velocity mode, cyclical master velocity determination*)
		mcCOMP_MA_SL_ABSOLUTE := 40 		 	     (*Absolute master and slave position when compensation is finished*)
	);

	McCamAutEventTypeEnum:
	(
		mcEVENT_OFF := 0,  (*Disables the event*)
		mcEVENT_START_POSITION := 10,  (*Event is triggered at master starting position*)
		mcEVENT_STATE_END := 12,  (*Event is triggered at end of state*)
		mcEVENT_STATE_END_NEGATIVE := 13,  (*Event is triggered at left end of state*)
		mcEVENT_COUNT := 11,  (*Event is triggered when RepeatCounter is reached*)
		mcEVENT_SIGNAL1 := 91,  (*Event is triggered by Signal1*)
		mcEVENT_SIGNAL2 := 92,  (*Event is triggered by Signal2*)
		mcEVENT_SIGNAL3 := 93,  (*Event is triggered by Signal3*)
		mcEVENT_SIGNAL4 := 94,  (*Event is triggered by Signal4*)
		mcEVENT_TRIGGER1_P_EDGE := 20,  (*Event is triggered by rising edge of Trigger1*)
		mcEVENT_TRIGGER1_N_EDGE := 21,  (*Event is triggered by falling edge of Trigger1*)
		mcEVENT_TRIGGER2_P_EDGE := 22,  (*Event is triggered by rising edge of Trigger2*)
		mcEVENT_TRIGGER2_N_EDGE := 23,  (*Event is triggered by falling edge of Trigger2*)
		mcEVENT_AND_NEXT_TWO := 15,  (*Event is triggered by the next two defined events triggered*)
		mcEVENT_PARID1 := 16,  (*Event is triggered when EventParID1 changes from 0 to not 0*)
		mcEVENT_PARID2 := 17,  (*Event is triggered when EventParID2 changes from 0 to not 0*)
		mcEVENT_PARID3 := 18,  (*Event is triggered when EventParID3 changes from 0 to not 0*)
		mcEVENT_PARID4 := 19,  (*Event is triggered when EventParID4 changes from 0 to not 0*)
		mcEVENT_START_IV_POS1 := 41,  (*Event is triggered when starting interval Position1 is reached*)
		mcEVENT_START_IV_POS2 := 42,  (*Event is triggered when starting interval Position2 is reached*)
		mcEVENT_START_IV_POS3 := 43,  (*Event is triggered when starting interval Position3 is reached*)
		mcEVENT_START_IV_POS4 := 44  (*Event is triggered when starting interval Position4 is reached*)
	);

	McCamAutMaStartPosModeEnum:
	(
		mcCAMAUT_EVALUATE_NEW,  (*Starting position is recalculated*)
		mcCAMAUT_NO_NEW_EVALUATION  (*Starting position is not recalculated*)
	);

	McCamAutEventTransitionEnum:
	(
		mcEVENT_IMMEDIATELY := 0,  (*State changes immediately*)
		mcEVENT_END_OF_STATE := 12  (*State changes at end of state*)
	);

	McCamDefineType : STRUCT
		DataObjectName : STRING[12]; (*Name of the cam data object*)
		DataAdress : UDINT; (*Address of the cam data on the PLC provided in a PV of data type "McCamDataType"*)
	END_STRUCT;

	McAdvCamAutSetParType : STRUCT
		ParLock : McCamAutParLockCmdEnum; (*Command for the transfer of the parameter*)
	END_STRUCT;

	McCamAutEventParType : STRUCT
	    Type : McCamAutEventTypeEnum; (*Event type*)
	    Transition :	McCamAutEventTransitionEnum; (*Event transition*)
	    SynchronousUpdate: McSwitchEnum; (*Synchronous parameter update if event occurs*)
	    NextState : USINT; (*Index of the next state if the event occurs*)
	END_STRUCT;

	McCamAutCompParType : STRUCT
	    MasterCompDistance : LREAL; (*Compensation distance for the master axis [measurement units of master]*)
	    SlaveCompDistance : LREAL; (*Compensation distance for the slave axis [measurement units of slave]*)
	    MasterCamLeadIn : LREAL; (*Relative position at which the master axis enters the state [measurement units of master]*)
	    MinMasterCompDistance : LREAL; (*Minimum compensation distance for the master axis [measurement units of master]*)
	    MinSlaveCompDistance : LREAL; (*Minimum compensation distance for the slave axis [slave measurement unit]*)
	    MaxSlaveCompDistance : LREAL; (*Maximum compensation distance for the slave axis [slave measurement unit]*)
	    MinSlaveCompVelocity : REAL; (*Minimum velocity of the slave axis during compensation [measurement units of slave / s]*)
	    MaxSlaveCompVelocity : REAL; (*Maximum velocity of the slave axis during compensation [measurement units of slave / s]*)
	    MaxSlaveCompAccel1 : REAL; (*Maximum acceleration of the slave axis during compensation phase 1 [measurement units of slave / s�]*)
	    MaxSlaveCompAccel2 : REAL; (*Maximum acceleration of the slave axis during compensation phase 2 [measurement units of slave / s�]*)
	    SlaveCompJoltTime : REAL; (*Jerk time of the slave axis during compensation [s]*)
	END_STRUCT;

	McCamAutMasterAxisType : STRUCT
		Axis : REFERENCE TO McAxisType; (*Axis reference of master axis*)
		ValueSource : McValueSrcEnum ; (*Defines the source of the position to be read*)
		MaxVelocity : REAL; (*Maximum velocity of the master axis [measurement units of master / s]*)
	END_STRUCT;

	McCamAutMasterVarType : STRUCT
		VariableAddress  :  REFERENCE TO LREAL; (*Address of the process variable*)
		MaxVelocity : REAL; (*Maximum velocity of the master axis [measurement units of master / s]*)
	END_STRUCT;

	McCamAutAxisType : STRUCT
		Axis : REFERENCE TO McAxisType; (*Axis reference*)
		ValueSource : McValueSrcEnum ; (*Defines the source of the position to be read*)
	END_STRUCT;

	McCamAutVariableType : STRUCT
		VariableAddress  :  REFERENCE TO LREAL; (*Address of the process variable*)
	END_STRUCT;

	McCamAutAdvStateParType : STRUCT
	    RepeatCounterInit : UINT; (*Starting value of state repetitions for event mcACPAX_EVENT_COUNT*)
	    RepeatCounterSetTransfer : McSwitchEnum; (*"RepeatCounterInit" is transferred*)
	    RepeatCounterSet : UINT; (*State repetitions counter for event mcACPAX_EVENT_COUNT*)
	    MasterSource : McCamAutCouplingSourceEnum; (*Source to be used as master of this state*)
	    MasterAxis : McCamAutAxisType; (*Master axis for this state*)
	    MasterVariable : McCamAutVariableType; (*Process variable that is used as master position for this state*)
	END_STRUCT;

	McCamAutStateParType : STRUCT
	    CamID : UINT; (*Index of the cam data for a state*)
	    MasterFactor : DINT; (*Master gauge factor for the cam profile for this state*)
	    SlaveFactor: DINT; (*Slave gauge factor for the cam profile for this state*)
	    CompensationMode : McCamAutCompModeEnum; (*Compensation gear mode*)
	    CompensationParameters : McCamAutCompParType; (*Parameters for the compensation gear*)
	    AdvancedParameters : McCamAutAdvStateParType; (*Advanced state parameter*)
	    Event : ARRAY[0..4] OF McCamAutEventParType; (*Definition of the event for a state*)
	END_STRUCT;

	McCamAutCtrlSettingsType : STRUCT
	    CrossLeftBoundary : McCamAutCrossLeftBoundEnum; (*Function on the left cam edge during backward movement of the master without event mcEVENT_STATE_END_NEGATIVE*)
	    CamChangeImmediately : McCamAutCamChangeImmedEnum; (*Direction of the cam change on event transition mcEVENT_IMMEDIATELY*)
	END_STRUCT;

	McCamAutStartStateParType : STRUCT
	    StartState : USINT; (*State in which the cam automat is started*)
	    MasterStartRelPos : LREAL; (*Master position within the starting state at which the cam automat is started [measurements units of the master]*)
	END_STRUCT;

	McCamAutAddAxesType : STRUCT
	    AdditiveMasterSource : McCamAutCouplingSourceEnum; (*Source to be used as additive master*)
	    AdditiveMasterAxis : McCamAutAxisType; (*Additive master axis*)
	    AdditiveMasterVariable : McCamAutVariableType; (*Process variable specifying the additive master position*)
	    AdditiveSlaveSource : McCamAutCouplingSourceEnum; (*Source to be used as additive slave*)
	    AdditiveSlaveAxis : McCamAutAxisType; (*Additive slave axis*)
	    AdditiveSlaveVariable : McCamAutVariableType; (*Process variable specifying the additive slave position*)
	END_STRUCT;

	McCamAutAdvParType : STRUCT
		StartStateParam : McCamAutStartStateParType; (*Parameter used for starting directly from a state*)
		AdditiveAxes : McCamAutAddAxesType; (*Parameter for additive axes*)
	    MasterStartPosMode : McCamAutMaStartPosModeEnum; (*Mode for event type mcEVENT_START_POSITION*)
	    ControlSettings : McCamAutCtrlSettingsType; (*Control settings for cam automat*)
	    StartIntervalPos1 : LREAL; (*Relative starting positions of the master axis in the interval for generating event mcEVENT_START_IV_POS1 [measurement units of master]*)
	    StartIntervalPos2 : LREAL; (*Relative starting positions of the master axis in the interval for generating event mcEVENT_START_IV_POS2 [measurement units of master]*)
	    StartIntervalPos3 : LREAL; (*Relative starting positions of the master axis in the interval for generating event mcEVENT_START_IV_POS3 [measurement units of master]*)
	    StartIntervalPos4 : LREAL; (*Relative starting positions of the master axis in the interval for generating event mcEVENT_START_IV_POS4 [measurement units of master]*)
	END_STRUCT;

	McCamAutMasterParType : STRUCT
	    MasterSource : McCamAutCouplingSourceEnum; (*Source to be used as master*)
	    MasterAxis : McCamAutMasterAxisType; (*Master axis*)
	    MasterVariable : McCamAutMasterVarType; (*Process variable specifying the master position*)
	    MasterStartPosition : LREAL; (*Starting position of the master axis [measurement units of master]*)
	    MasterStartInterval : LREAL; (*Starting interval of the master axis [measurement units of master]*)
	END_STRUCT;

	McCamAutCommonParType : STRUCT
	    Master : McCamAutMasterParType; (*Parameter for the cam automat master*)
	    AdvancedParameters : McCamAutAdvParType; (*Optional parameter for the cam automat*)
	END_STRUCT;

	McCamAutParType : STRUCT
	    Common : McCamAutCommonParType; (*General parameter for all states of the cam automat*)
	    State : ARRAY[0..14] OF McCamAutStateParType; (*Parameter for the states of the cam automat*)
	END_STRUCT;

	McCamAutDefineType : STRUCT
	    DataObjectName : STRING[32]; (*Name of the cam automat configuration object*)
	    DataAddress : UDINT; (*Address of a variable of data type McCamAutParType*)
	END_STRUCT;

	McPolynomialDataType : STRUCT  (*structure with polynomial coefficient*)
		A : REAL; (*Polynomial coefficient*)
		B : REAL; (*Polynomial coefficient*)
		C : REAL; (*Polynomial coefficient*)
		D : REAL; (*Polynomial coefficient*)
		E : REAL; (*Polynomial coefficient*)
		F : REAL; (*Polynomial coefficient*)
		G : REAL; (*Polynomial coefficient*)
		X : REAL; (*Maximum master position*)
		Reserve : UDINT; (*= 0 (Reserve)*)
	END_STRUCT;

	McCamDataType : STRUCT  (*structure with cam data*)
		MasterPeriod : DINT; (*Length of the master period*)
		SlavePeriod : DINT; (*Length of the slave period*)
		PolynomialNumber : UDINT; (*Number of polynomials: 1..128*)
		PolynomialData : ARRAY[0..127] OF McPolynomialDataType; (*Polynomial coefficient*)
	END_STRUCT;

	McAdvCalcCamFromPointsParType : STRUCT
 		InterpolationMode 	: McCamIplModeEnum; (*Interpolation mode*)
 		Type 				: McCamTypeEnum; (*Periodic or non-periodic operation*)
 		NumberOfPolynomials : UDINT; (*Maximum number of calculated polynomials: 1 .. 128*)
 		MasterPeriod 		: DINT; (*Length of the master period*)
 		StartSlope 			: LREAL; (*Slope (velocity) at the beginning of the curve*)
 		StartCurvature 		: LREAL; (*Curvature (acceleration) at the beginning of the curve*)
 		EndSlope 			: LREAL; (*Slope (velocity) at the end of the curve*)
 		EndCurvature 		: LREAL; (*Curvature (acceleration) at the end of the curve*)
 	END_STRUCT;

	McExec1InternalType : STRUCT (*Internal structure-types for FB-processing*)
		i_serno : UINT; (**)
		i_state : UINT; (**)
		Result	: DINT; (**)
	END_STRUCT;

END_TYPE
