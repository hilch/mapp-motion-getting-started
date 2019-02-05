/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _MCACPAX_
#define _MCACPAX_
#ifdef __cplusplus
extern "C" {
#endif

#ifndef _MCAXIS_
#include <McAxis.h>
#endif
#ifndef _PLCTYPES_H_
#include <bur/plctypes.h>
#endif

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum McAcpAxDataTypeEnum
{
	mcACPAX_PARTYPE_BOOL = 1,
	mcACPAX_PARTYPE_SINT,
	mcACPAX_PARTYPE_INT,
	mcACPAX_PARTYPE_DINT,
	mcACPAX_PARTYPE_USINT,
	mcACPAX_PARTYPE_UINT,
	mcACPAX_PARTYPE_UDINT,
	mcACPAX_PARTYPE_REAL,
	mcACPAX_PARTYPE_VOID = 65535
} McAcpAxDataTypeEnum;

typedef enum McAcpAxProcessParIDModeEnum
{
	mcACPAX_PARID_GET = 0,
	mcACPAX_PARID_SET,
	mcACPAX_PARID_GET_NO_NCT
} McAcpAxProcessParIDModeEnum;

typedef enum McAcpAxCycParIDModeEnum
{
	mcACPAX_CYCLIC_PARID_READ = 0,
	mcACPAX_CYCLIC_PARID_WRITE
} McAcpAxCycParIDModeEnum;

typedef enum McAcpAxCycParIDRefreshModeEnum
{
	mcACPAX_CYCLIC_MULTIPLEXED = 0,
	mcACPAX_CYCLIC_EVERY_RECORD
} McAcpAxCycParIDRefreshModeEnum;

typedef enum McAcpAxTriggerEnum
{
	mcACPAX_TRIGGER_1,
	mcACPAX_TRIGGER_2
} McAcpAxTriggerEnum;

typedef enum McAcpAxLimitLoadModeEnum
{
	mcACPAX_LL_WITH_FEED_FORWARD = 0,
	mcACPAX_LL_WITHOUT_FEED_FORWARD
} McAcpAxLimitLoadModeEnum;

typedef enum McAcpAxBrakeTestCmdEnum
{
	mcACPAX_BRAKE_TEST_INIT = 0,
	mcACPAX_BRAKE_TEST_START = 1,
	mcACPAX_BRAKE_TEST_INIT_START
} McAcpAxBrakeTestCmdEnum;

typedef enum McAcpAxBrakeTestModeEnum
{
	mcACPAX_BRAKE_TEST_STANDARD = 0,
	mcACPAX_BRAKE_TEST_SAFETY
} McAcpAxBrakeTestModeEnum;

typedef enum McAcpAxAxisTypeEnum
{
	mcACPAX_AXIS_REAL,
	mcACPAX_AXIS_VIRTUAL
} McAcpAxAxisTypeEnum;

typedef enum McAcpAxProductFamilyEnum
{
	mcACPAX_ACOPOS,
	mcACPAX_ACOPOS_MULTI,
	mcACPAX_ACOPOS_MICRO,
	mcACPAX_ACOPOS_REMOTE,
	mcACPAX_ACOPOS_MOTOR,
	mcACPAX_ACOPOS_P3
} McAcpAxProductFamilyEnum;

typedef enum McAcpAxModuleTypeEnum
{
	mcACPAX_MODULE_INVERTER,
	mcACPAX_MODULE_ACTIVE_SUPPLY,
	mcACPAX_MODULE_PASSIVE_SUPPLY
} McAcpAxModuleTypeEnum;

typedef enum McAcpAxSimulationOnPlcEnum
{
	mcACPAX_SIM_STATE_OFF,
	mcACPAX_SIM_STATE_ON,
	mcACPAX_SIM_SET_VALUE_GENERATION,
	mcACPAX_SIM_COMPLETE_CTRL_SYSTEM
} McAcpAxSimulationOnPlcEnum;

typedef enum McAcpAxCtrlModeEnum
{
	mcACPAX_CTRL_POSITION = 1,
	mcACPAX_CTRL_POSITION_WITH_FF = 33
} McAcpAxCtrlModeEnum;

typedef enum McAcpAxCtrlParSelectEnum
{
	mcACPAX_CTRL_SELECT_ALL_PAR,
	mcACPAX_CTRL_SELECT_POSITION,
	mcACPAX_CTRL_SELECT_SPEED,
	mcACPAX_CTRL_SELECT_FEED_FORWARD,
	mcACPAX_CTRL_SELECT_ADV_PAR_ONLY
} McAcpAxCtrlParSelectEnum;

typedef enum McAcpAxLoopFilterTypeEnum
{
	mcACPAX_LOOP_FILTER_NO_TRANSFER,
	mcACPAX_LOOP_FILTER_OFF,
	mcACPAX_LOOP_FILTER_LOWPASS,
	mcACPAX_LOOP_FILTER_NOTCH,
	mcACPAX_LOOP_FILTER_Z_TRANS_FUN,
	mcACPAX_LOOP_FILTER_COMPENSATION,
	mcACPAX_LOOP_FILTER_BIQUAD,
	mcACPAX_LOOP_FILTER_LIM,
	mcACPAX_LOOP_FILTER_LIM_LINEAR,
	mcACPAX_LOOP_FILTER_LIM_R_TIME
} McAcpAxLoopFilterTypeEnum;

typedef enum McAcpAxAutoTuneExSignalEnum
{
	mcACPAX_EX_SIGNAL_PRBS = 0,
	mcACPAX_EX_SIGNAL_CHIRP = 1,
	mcACPAX_EX_SIGNAL_CHIRP_TRAPEZ = 2
} McAcpAxAutoTuneExSignalEnum;

typedef enum McAcpAxAutoTuneTestModeEnum
{
	mcACPAX_TEST,
	mcACPAX_TEST_POSITION,
	mcACPAX_TEST_SPEED
} McAcpAxAutoTuneTestModeEnum;

typedef enum McAcpAxAutoTuneOrientationEnum
{
	mcACPAX_ORIENTATION_HORIZONTAL,
	mcACPAX_ORIENTATION_VERTICAL
} McAcpAxAutoTuneOrientationEnum;

typedef enum McAcpAxFilterTimeModeEnum
{
	mcACPAX_FILTER_TIME_USE,
	mcACPAX_FILTER_TIME_TUNE_MODE1,
	mcACPAX_FILTER_TIME_TUNE_MODE2
} McAcpAxFilterTimeModeEnum;

typedef enum McAcpAxLoopFilterModeEnum
{
	mcACPAX_LOOP_FILTER_IGNORE,
	mcACPAX_LOOP_FILTER_USE,
	mcACPAX_LOOP_FILTER_TUNE_NOTCH
} McAcpAxLoopFilterModeEnum;

typedef enum McAcpAxIntegrationTimeModeEnum
{
	mcACPAX_INTEGRATION_TIME_IGNORE,
	mcACPAX_INTEGRATION_TIME_USE,
	mcACPAX_INTEGRATION_TIME_TUNE
} McAcpAxIntegrationTimeModeEnum;

typedef enum McAcpAxAutoTuneOperatPointEnum
{
	mcACPAX_OP_TUNE_STANDSTILL,
	mcACPAX_OP_TUNE_V_CONSTANT
} McAcpAxAutoTuneOperatPointEnum;

typedef enum McAcpAxSimulationModeEnum
{
	mcACPAX_SIMULATION_1MASS_AUTO,
	mcACPAX_SIMULATION_1MASS,
	mcACPAX_SIMULATION_2MASS,
	mcACPAX_SIMULATION_SET_GEN_ONLY
} McAcpAxSimulationModeEnum;

typedef struct McAcpAxHomingParType
{
	McHomingModeEnum HomingMode;
	double Position;
	float StartVelocity;
	float HomingVelocity;
	float Acceleration;
	McDirectionEnum SwitchEdge;
	McDirectionEnum StartDirection;
	McDirectionEnum HomingDirection;
	McSwitchEnum ReferencePulse;
	McSwitchEnum KeepDirection;
	float ReferencePulseBlockingDistance;
	float TorqueLimit;
	float BlockDetectionPositionError;
	float PositionErrorStopLimit;
	unsigned long RestorePositionVariableAddress;
} McAcpAxHomingParType;

typedef struct McAcpAxProcessParIDType
{
	unsigned short ParID;
	unsigned long VariableAddress;
	enum McAcpAxDataTypeEnum DataType;
} McAcpAxProcessParIDType;

typedef struct McAcpAxCycParIDType
{
	unsigned short ParID;
	unsigned long VariableAddress;
	enum McAcpAxDataTypeEnum DataType;
	enum McAcpAxCycParIDRefreshModeEnum RefreshMode;
} McAcpAxCycParIDType;

typedef struct McAcpAxTriggerStopType
{
	enum McAcpAxTriggerEnum TriggerSource;
	McEdgeEnum TriggerEdge;
	double TriggerDistance;
	McSwitchEnum ForceTriggerDistance;
} McAcpAxTriggerStopType;

typedef struct McAcpAxAdvLimitLoadParType
{
	unsigned short LoadPosAccelParID;
	unsigned short LoadPosDecelParID;
	unsigned short LoadNegAccelParID;
	unsigned short LoadNegDecelParID;
} McAcpAxAdvLimitLoadParType;

typedef struct McAcpAxBrakeParType
{
	McSwitchEnum AutomaticControl;
	McSwitchEnum RestrictedBrakeControl;
	McSwitchEnum ControlMonitoring;
	McSwitchEnum MovementMonitoring;
	McSwitchEnum VoltageMonitoring;
	McSwitchEnum TestAtPowerOn;
	McSwitchEnum TestAtPowerOff;
	McSwitchEnum AutomaticInductionStop;
	McSwitchEnum EnableSBTRequestBySMC;
	float ControlMonitoringFilterTime;
} McAcpAxBrakeParType;

typedef struct McAcpAxBrakeTestParType
{
	enum McAcpAxBrakeTestModeEnum Mode;
	float Torque;
	float Duration;
	double PositionLimit;
} McAcpAxBrakeTestParType;

typedef struct McAcpAxSimulationMass1Type
{
	float Inertia;
	float StaticFriction;
	float ViscousFriction;
} McAcpAxSimulationMass1Type;

typedef struct McAcpAxSimulationMass2Type
{
	float Inertia;
	float StaticFriction;
	float ViscousFriction;
	float Stiffness;
	float Damping;
} McAcpAxSimulationMass2Type;

typedef struct McAcpAxSimulationParType
{
	enum McAcpAxSimulationModeEnum Mode;
	unsigned short AdditiveLoadParID;
	struct McAcpAxSimulationMass1Type Mass1;
	struct McAcpAxSimulationMass2Type Mass2;
} McAcpAxSimulationParType;

typedef struct McAcpAxRestorePosType
{
	signed long Data[18];
} McAcpAxRestorePosType;

typedef struct McAcpAxAxisInfoType
{
	enum McAcpAxAxisTypeEnum AxisType;
	unsigned long ChannelNumber;
	enum McAcpAxSimulationOnPlcEnum AcoposSimulationOnPlcMode;
} McAcpAxAxisInfoType;

typedef struct McAcpAxModuleInfoType
{
	enum McAcpAxProductFamilyEnum ProductFamily;
	enum McAcpAxModuleTypeEnum ModuleType;
	McNetworkTypeEnum NetworkType;
	unsigned long NodeNumber;
	enum McAcpAxSimulationOnPlcEnum AcoposSimulationOnPlc;
} McAcpAxModuleInfoType;

typedef struct McAcpAxPosCtrlParType
{
	float ProportionalGain;
	float IntegrationTime;
	float PredictionTime;
	float TotalDelayTime;
} McAcpAxPosCtrlParType;

typedef struct McAcpAxSpeedCtrlParType
{
	float ProportionalGain;
	float IntegrationTime;
	float FilterTime;
} McAcpAxSpeedCtrlParType;

typedef struct McAcpAxFeedForwardParType
{
	float TorqueLoad;
	float TorquePositive;
	float TorqueNegative;
	float SpeedTorqueFactor;
	float Inertia;
	float AccelerationFilterTime;
} McAcpAxFeedForwardParType;

typedef struct McAcpAxCtrlParType
{
	enum McAcpAxCtrlModeEnum Mode;
	struct McAcpAxPosCtrlParType PositionController;
	struct McAcpAxSpeedCtrlParType SpeedController;
	struct McAcpAxFeedForwardParType FeedForward;
	enum McAcpAxCtrlParSelectEnum ParameterSelector;
} McAcpAxCtrlParType;

typedef struct McAcpAxLoopFilterLowPassType
{
	float CutOffFrequency;
} McAcpAxLoopFilterLowPassType;

typedef struct McAcpAxLoopFilterNotchType
{
	float CenterFrequency;
	float Bandwidth;
} McAcpAxLoopFilterNotchType;

typedef struct McAcpAxLoopFilterZTransFunType
{
	float A0;
	float A1;
	float B0;
	float B1;
	float B2;
} McAcpAxLoopFilterZTransFunType;

typedef struct McAcpAxLoopFilterCompType
{
	unsigned short MultiplicationFactorParID;
	unsigned short AdditiveValueParID;
} McAcpAxLoopFilterCompType;

typedef struct McAcpAxLoopFilterBiquadType
{
	float FrequencyNumerator;
	float DampingNumerator;
	float FrequencyDenominator;
	float DampingDenominator;
} McAcpAxLoopFilterBiquadType;

typedef struct McAcpAxLoopFilterLimType
{
	float PositiveLimit;
	float NegativeLimit;
	unsigned short PositiveLimitParID;
	unsigned short NegativeLimitParID;
} McAcpAxLoopFilterLimType;

typedef struct McAcpAxLoopFilterLimLinearType
{
	unsigned short InputParID;
	float InputLimit;
	float Gradient;
} McAcpAxLoopFilterLimLinearType;

typedef struct McAcpAxLoopFilterLimRiseTimeType
{
	float RiseTime;
	float NormalizedLimit;
} McAcpAxLoopFilterLimRiseTimeType;

typedef struct McAcpAxLoopFilterParType
{
	enum McAcpAxLoopFilterTypeEnum Type;
	struct McAcpAxLoopFilterLowPassType LowPass;
	struct McAcpAxLoopFilterNotchType Notch;
	struct McAcpAxLoopFilterZTransFunType ZTransferFunction;
	struct McAcpAxLoopFilterCompType Compensation;
	struct McAcpAxLoopFilterBiquadType Biquad;
	struct McAcpAxLoopFilterLimType Limiter;
	struct McAcpAxLoopFilterLimLinearType LimiterLinear;
	struct McAcpAxLoopFilterLimRiseTimeType LimiterRiseTime;
} McAcpAxLoopFilterParType;

typedef struct McAcpAxAdvCtrlParType
{
	struct McAcpAxLoopFilterParType LoopFilter1;
	struct McAcpAxLoopFilterParType LoopFilter2;
	struct McAcpAxLoopFilterParType LoopFilter3;
} McAcpAxAdvCtrlParType;

typedef struct McAcpAxAutoTuneExSignalType
{
	enum McAcpAxAutoTuneExSignalEnum SignalType;
	unsigned long SignalOrder;
	float DelayTime;
	float SignalStartFrequency;
	float SignalStopFrequency;
	float SignalTime;
} McAcpAxAutoTuneExSignalType;

typedef struct McAcpAxAutoTuneParType
{
	enum McAcpAxAutoTuneOrientationEnum Orientation;
	float MaxCurrentPercent;
	double MaxDistance;
	double MaxPositionError;
} McAcpAxAutoTuneParType;

typedef struct McAcpAxAutoTuneSpeedCtrlOutType
{
	float Quality;
	float EstimatedInertia;
	float ProportionalGain;
	float IntegrationTime;
	float FilterTime;
	struct McAcpAxLoopFilterParType LoopFilter1;
} McAcpAxAutoTuneSpeedCtrlOutType;

typedef struct McAcpAxAutoTuneLoopFilterOutType
{
	float Quality;
	struct McAcpAxLoopFilterParType LoopFilter1;
	struct McAcpAxLoopFilterParType LoopFilter2;
	struct McAcpAxLoopFilterParType LoopFilter3;
} McAcpAxAutoTuneLoopFilterOutType;

typedef struct McAcpAxAutoTunePosCtrlOutType
{
	float Quality;
	float ProportionalGain;
} McAcpAxAutoTunePosCtrlOutType;

typedef struct McAcpAxAutoTuneTestOutType
{
	float Quality;
} McAcpAxAutoTuneTestOutType;

typedef struct McAcpAxAutoTuneFeedFwdOutType
{
	float Quality;
	struct McAcpAxFeedForwardParType FeedForward;
} McAcpAxAutoTuneFeedFwdOutType;

typedef struct McAcpAxAutoTuneLoopFiltersType
{
	enum McAcpAxLoopFilterModeEnum LoopFilter1Mode;
	enum McAcpAxLoopFilterModeEnum LoopFilter2Mode;
	enum McAcpAxLoopFilterModeEnum LoopFilter3Mode;
} McAcpAxAutoTuneLoopFiltersType;

typedef struct McAcpAxAutoTuneFeedFwdType
{
	enum McDirectionEnum Direction;
	enum McAcpAxAutoTuneOrientationEnum Orientation;
	double MaxDistance;
	double MaxPositionError;
	float Velocity;
	float Acceleration;
	float MaxCurrentPercent;
	float MaxVelocityPercent;
} McAcpAxAutoTuneFeedFwdType;

typedef struct McAcpAxAdvAutoTuneSpeedCtrlType
{
	enum McAcpAxLoopFilterModeEnum LoopFilter1Mode;
	enum McAcpAxFilterTimeModeEnum FilterTimeMode;
	enum McAcpAxIntegrationTimeModeEnum IntegrationTimeMode;
	enum McAcpAxAutoTuneOperatPointEnum OperatingPoint;
	float Velocity;
	float Acceleration;
	float MaxProportionalGain;
	float ProportionalGainPercent;
	float ResonanceFactor;
	float InertiaEstimationLowerFrequency;
	float InertiaEstimationUpperFrequency;
	struct McAcpAxAutoTuneExSignalType ExcitationSignal;
} McAcpAxAdvAutoTuneSpeedCtrlType;

typedef struct McAcpAxAdvAutoTuneLoopFilterType
{
	enum McAcpAxAutoTuneOperatPointEnum OperatingPoint;
	float Velocity;
	float Acceleration;
	float ResonanceFactor;
	struct McAcpAxAutoTuneExSignalType ExcitationSignal;
} McAcpAxAdvAutoTuneLoopFilterType;

typedef struct McAcpAxAdvAutoTunePosCtrlType
{
	enum McAcpAxAutoTuneOperatPointEnum OperatingPoint;
	float Velocity;
	float Acceleration;
	float MaxProportionalGain;
	float ProportionalGainPercent;
	struct McAcpAxAutoTuneExSignalType ExcitationSignal;
} McAcpAxAdvAutoTunePosCtrlType;

typedef struct McAcpAxAdvAutoTuneTestType
{
	struct McAcpAxAutoTuneExSignalType ExcitationSignal;
} McAcpAxAdvAutoTuneTestType;

typedef struct McAcpAxAdvAutoTuneFeedFwdType
{
	struct McAcpAxAutoTuneExSignalType ExcitationSignal;
} McAcpAxAdvAutoTuneFeedFwdType;

typedef struct McAcpAxAdvCamAutSetParType
{
	McCamAutParLockCmdEnum ParLock;
} McAcpAxAdvCamAutSetParType;

typedef struct McAcpAxCamAutEventParType
{
	McCamAutEventTypeEnum Type;
	McCamAutEventTransitionEnum Transition;
	McSwitchEnum SynchronousUpdate;
	unsigned char NextState;
} McAcpAxCamAutEventParType;

typedef struct McAcpAxCamAutCompParType
{
	double MasterCompDistance;
	double SlaveCompDistance;
	double MasterCamLeadIn;
	double MinMasterCompDistance;
	double MinSlaveCompDistance;
	double MaxSlaveCompDistance;
	float MinSlaveCompVelocity;
	float MaxSlaveCompVelocity;
	float MaxSlaveCompAccel1;
	float MaxSlaveCompAccel2;
	float SlaveCompJoltTime;
} McAcpAxCamAutCompParType;

typedef struct McAcpAxCamAutAdvStateParType
{
	unsigned short RepeatCounterInit;
	McSwitchEnum RepeatCounterSetTransfer;
	unsigned short RepeatCounterSet;
	McAxisType* MasterAxis;
	unsigned short MasterParID;
} McAcpAxCamAutAdvStateParType;

typedef struct McAcpAxCamAutStateParType
{
	unsigned short CamID;
	signed long MasterFactor;
	signed long SlaveFactor;
	McCamAutCompModeEnum CompensationMode;
	McAcpAxCamAutCompParType CompensationParameters;
	McAcpAxCamAutAdvStateParType AdvancedParameters;
	McAcpAxCamAutEventParType Event[5];
} McAcpAxCamAutStateParType;

typedef struct McAcpAxCamAutCtrlSettingsType
{
	McCamAutCrossLeftBoundEnum CrossLeftBoundary;
	McCamAutCamChangeImmedEnum CamChangeImmediately;
} McAcpAxCamAutCtrlSettingsType;

typedef struct McAcpAxCamAutMsgSettingsType
{
	McCamAutErrorsInStandbyEnum ErrorsInStandby;
	McCamAutExceedingLimitsEnum ExceedingLimits;
} McAcpAxCamAutMsgSettingsType;

typedef struct McAcpAxCamAutTriggerAndLatchType
{
	float Trigger1Delay;
	float Trigger2Delay;
	unsigned short SlaveLatchParID;
} McAcpAxCamAutTriggerAndLatchType;

typedef struct McAcpAxCamAutStartStateParType
{
	unsigned char StartState;
	double MasterStartRelPos;
} McAcpAxCamAutStartStateParType;

typedef struct McAcpAxCamAutAddAxesType
{
	McAxisType* AdditiveMasterAxis;
	unsigned short AdditiveMasterParID;
	McAxisType* AdditiveSlaveAxis;
	unsigned short AdditiveSlaveParID;
} McAcpAxCamAutAddAxesType;

typedef struct McAcpAxCamAutCommonFactorsType
{
	unsigned short SlaveFactorParID;
} McAcpAxCamAutCommonFactorsType;

typedef struct McAcpAxCamAutAdvParType
{
	McAcpAxCamAutStartStateParType StartStateParam;
	McAcpAxCamAutAddAxesType AdditiveAxes;
	McCamAutMaStartPosModeEnum MasterStartPosMode;
	McAcpAxCamAutCtrlSettingsType ControlSettings;
	McAcpAxCamAutMsgSettingsType MessageSettings;
	McAcpAxCamAutTriggerAndLatchType TriggerAndLatch;
	unsigned short EventParID1;
	unsigned short EventParID2;
	unsigned short EventParID3;
	unsigned short EventParID4;
	double StartIntervalPos1;
	double StartIntervalPos2;
	double StartIntervalPos3;
	double StartIntervalPos4;
	McAcpAxCamAutCommonFactorsType Factors;
} McAcpAxCamAutAdvParType;

typedef struct McAcpAxCamAutMasterParType
{
	McAxisType* MasterAxis;
	unsigned short MasterParID;
	double MasterStartPosition;
	double MasterStartInterval;
	float MaxMasterVelocity;
} McAcpAxCamAutMasterParType;

typedef struct McAcpAxCamAutCommonParType
{
	McAcpAxCamAutMasterParType Master;
	McAcpAxCamAutAdvParType AdvancedParameters;
} McAcpAxCamAutCommonParType;

typedef struct McAcpAxCamAutParType
{
	McAcpAxCamAutCommonParType Common;
	McAcpAxCamAutStateParType State[15];
} McAcpAxCamAutParType;

typedef struct McAcpAxCamAutDefineType
{
	plcstring DataObjectName[33];
	unsigned long DataAddress;
} McAcpAxCamAutDefineType;

typedef struct McAcpAxAdvPhasingParType
{
	unsigned short VelocityParID;
	unsigned short PosVelocityTriggerParID;
	unsigned short NegVelocityTriggerParID;
} McAcpAxAdvPhasingParType;

typedef struct McAcpAxAdvOffsetParType
{
	unsigned short VelocityParID;
	unsigned short PosVelocityTriggerParID;
	unsigned short NegVelocityTriggerParID;
} McAcpAxAdvOffsetParType;

typedef struct MC_BR_InitHome_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxHomingParType HomingParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_InitHome_AcpAx_typ;

typedef struct MC_BR_ProcessParID_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	unsigned long DataAddress;
	unsigned long NumberOfParIDs;
	enum McAcpAxProcessParIDModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ProcessParID_AcpAx_typ;

typedef struct MC_BR_CyclicProcessParID_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	unsigned long DataAddress;
	unsigned long NumberOfParIDs;
	enum McAcpAxCycParIDModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_CyclicProcessParID_AcpAx_typ;

typedef struct MC_BR_MoveAbsoluteTrgStop_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	double Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	McDirectionEnum Direction;
	McBufferModeEnum BufferMode;
	struct McAcpAxTriggerStopType TriggerStopParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
	plcbit StoppedAtTargetPosition;
} MC_BR_MoveAbsoluteTrgStop_AcpAx_typ;

typedef struct MC_BR_MoveAdditiveTrgStop_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	double Distance;
	float Velocity;
	float Acceleration;
	float Deceleration;
	McBufferModeEnum BufferMode;
	struct McAcpAxTriggerStopType TriggerStopParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
	plcbit StoppedAtTargetPosition;
} MC_BR_MoveAdditiveTrgStop_AcpAx_typ;

typedef struct MC_BR_MoveVelocityTrgStop_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	float Velocity;
	float Acceleration;
	float Deceleration;
	McDirectionEnum Direction;
	McBufferModeEnum BufferMode;
	struct McAcpAxTriggerStopType TriggerStopParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
	plcbit InVelocity;
} MC_BR_MoveVelocityTrgStop_AcpAx_typ;

typedef struct MC_BR_LimitLoad_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	float LoadPosAccel;
	float LoadPosDecel;
	float LoadNegAccel;
	float LoadNegDecel;
	enum McAcpAxLimitLoadModeEnum Mode;
	struct McAcpAxAdvLimitLoadParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitData;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Ready;
	plcbit Active;
	plcbit Error;
	plcbit DataInitialized;
} MC_BR_LimitLoad_AcpAx_typ;

typedef struct MC_BR_BrakeSetPar_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxBrakeParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_BrakeSetPar_AcpAx_typ;

typedef struct MC_BR_BrakeTest_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpAxBrakeTestCmdEnum Command;
	struct McAcpAxBrakeTestParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	double PositionError;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_BrakeTest_AcpAx_typ;

typedef struct MC_BR_LoadSimulationSetPar_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxSimulationParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_LoadSimulationSetPar_AcpAx_typ;

typedef struct MC_BR_LoadSimulationGetPar_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxSimulationParType Parameters;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_LoadSimulationGetPar_AcpAx_typ;

typedef struct MC_BR_GetDriveInfo_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxAxisInfoType AxisInfo;
	struct McAcpAxModuleInfoType ModuleInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_GetDriveInfo_AcpAx_typ;

typedef struct MC_BR_ControllerSetPar_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxCtrlParType Parameters;
	struct McAcpAxAdvCtrlParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ControllerSetPar_AcpAx_typ;

typedef struct MC_BR_AutoTuneSpeedCtrl_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxAutoTuneParType Parameters;
	struct McAcpAxAdvAutoTuneSpeedCtrlType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxAutoTuneSpeedCtrlOutType Output;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AutoTuneSpeedCtrl_AcpAx_typ;

typedef struct MC_BR_AutoTuneLoopFilters_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxAutoTuneLoopFiltersType LoopFilters;
	struct McAcpAxAutoTuneParType Parameters;
	struct McAcpAxAdvAutoTuneLoopFilterType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxAutoTuneLoopFilterOutType Output;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AutoTuneLoopFilters_AcpAx_typ;

typedef struct MC_BR_AutoTunePositionCtrl_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxAutoTuneParType Parameters;
	struct McAcpAxAdvAutoTunePosCtrlType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxAutoTunePosCtrlOutType Output;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AutoTunePositionCtrl_AcpAx_typ;

typedef struct MC_BR_AutoTuneTest_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpAxAutoTuneTestModeEnum Mode;
	struct McAcpAxAutoTuneParType Parameters;
	struct McAcpAxAdvAutoTuneTestType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxAutoTuneTestOutType Output;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AutoTuneTest_AcpAx_typ;

typedef struct MC_BR_AutoTuneFeedForward_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpAxAutoTuneFeedFwdType Parameters;
	struct McAcpAxAdvAutoTuneFeedFwdType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpAxAutoTuneFeedFwdOutType Output;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AutoTuneFeedForward_AcpAx_typ;

typedef struct MC_BR_CamAutomatSetPar_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Slave;
	enum McCamAutSetParCmdEnum Command;
	struct McAcpAxCamAutDefineType CamAutomat;
	struct McAcpAxAdvCamAutSetParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_CamAutomatSetPar_AcpAx_typ;

typedef struct MC_BR_CamAutomatGetPar_AcpAx
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Slave;
	enum McCamAutGetParCmdEnum Command;
	struct McAcpAxCamAutDefineType CamAutomat;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_CamAutomatGetPar_AcpAx_typ;

typedef struct MC_BR_PhasingVelocity_AcpAx
{
	/* VAR_INPUT (analog) */
	McAxisType* Slave;
	float Acceleration;
	McAcpAxAdvPhasingParType AdvancedParameters;
	float CyclicVelocity;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	double ActualPhaseShift;
	/* VAR (analog) */
	McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit VelocityAttained;
} MC_BR_PhasingVelocity_AcpAx_typ;

typedef struct MC_BR_OffsetVelocity_AcpAx
{
	/* VAR_INPUT (analog) */
	McAxisType* Slave;
	float Acceleration;
	McAcpAxAdvPhasingParType AdvancedParameters;
	float CyclicVelocity;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	double ActualOffsetShift;
	/* VAR (analog) */
	McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit VelocityAttained;
} MC_BR_OffsetVelocity_AcpAx_typ;

/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MC_BR_InitHome_AcpAx(struct MC_BR_InitHome_AcpAx* inst);
_BUR_PUBLIC void MC_BR_ProcessParID_AcpAx(struct MC_BR_ProcessParID_AcpAx* inst);
_BUR_PUBLIC void MC_BR_CyclicProcessParID_AcpAx(struct MC_BR_CyclicProcessParID_AcpAx* inst);
_BUR_PUBLIC void MC_BR_MoveAbsoluteTrgStop_AcpAx(struct MC_BR_MoveAbsoluteTrgStop_AcpAx* inst);
_BUR_PUBLIC void MC_BR_MoveAdditiveTrgStop_AcpAx(struct MC_BR_MoveAdditiveTrgStop_AcpAx* inst);
_BUR_PUBLIC void MC_BR_MoveVelocityTrgStop_AcpAx(struct MC_BR_MoveVelocityTrgStop_AcpAx* inst);
_BUR_PUBLIC void MC_BR_LimitLoad_AcpAx(struct MC_BR_LimitLoad_AcpAx* inst);
_BUR_PUBLIC void MC_BR_BrakeSetPar_AcpAx(struct MC_BR_BrakeSetPar_AcpAx* inst);
_BUR_PUBLIC void MC_BR_BrakeTest_AcpAx(struct MC_BR_BrakeTest_AcpAx* inst);
_BUR_PUBLIC void MC_BR_LoadSimulationSetPar_AcpAx(struct MC_BR_LoadSimulationSetPar_AcpAx* inst);
_BUR_PUBLIC void MC_BR_LoadSimulationGetPar_AcpAx(struct MC_BR_LoadSimulationGetPar_AcpAx* inst);
_BUR_PUBLIC void MC_BR_GetDriveInfo_AcpAx(struct MC_BR_GetDriveInfo_AcpAx* inst);
_BUR_PUBLIC void MC_BR_ControllerSetPar_AcpAx(struct MC_BR_ControllerSetPar_AcpAx* inst);
_BUR_PUBLIC void MC_BR_AutoTuneSpeedCtrl_AcpAx(struct MC_BR_AutoTuneSpeedCtrl_AcpAx* inst);
_BUR_PUBLIC void MC_BR_AutoTuneLoopFilters_AcpAx(struct MC_BR_AutoTuneLoopFilters_AcpAx* inst);
_BUR_PUBLIC void MC_BR_AutoTunePositionCtrl_AcpAx(struct MC_BR_AutoTunePositionCtrl_AcpAx* inst);
_BUR_PUBLIC void MC_BR_AutoTuneTest_AcpAx(struct MC_BR_AutoTuneTest_AcpAx* inst);
_BUR_PUBLIC void MC_BR_AutoTuneFeedForward_AcpAx(struct MC_BR_AutoTuneFeedForward_AcpAx* inst);
_BUR_PUBLIC void MC_BR_CamAutomatSetPar_AcpAx(struct MC_BR_CamAutomatSetPar_AcpAx* inst);
_BUR_PUBLIC void MC_BR_CamAutomatGetPar_AcpAx(struct MC_BR_CamAutomatGetPar_AcpAx* inst);
_BUR_PUBLIC void MC_BR_PhasingVelocity_AcpAx(struct MC_BR_PhasingVelocity_AcpAx* inst);
_BUR_PUBLIC void MC_BR_OffsetVelocity_AcpAx(struct MC_BR_OffsetVelocity_AcpAx* inst);

#ifdef __cplusplus
} // End of C-Linkage
#endif
#endif /* _MCACPAX_ */

