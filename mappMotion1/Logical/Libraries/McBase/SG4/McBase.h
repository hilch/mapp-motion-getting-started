/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _MCBASE_
#define _MCBASE_

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#if defined(_WIN32) || defined(__WINDOWS__) || defined(__MINGW32__) || defined(__CYGWIN__)
#if defined(BUILD_MCBASE) || defined(MCBASE_EXPORTS)
#define MCBASE_DLLAPI __declspec(dllexport)
#else
#define MCBASE_DLLAPI __declspec(dllimport)
#endif
#else /* not Windows */
#define MCBASE_DLLAPI _BUR_PUBLIC
#endif

/** @cond NO */
#ifdef	__cplusplus
#define TYPEDEF_FORWARD_MMO_CLASS(ClassName) \
	namespace Gmc { class ClassName; } \
	typedef ::Gmc::ClassName
#define TYPEDEF_FORWARD_MMO_STRUCT(StructName) \
	namespace Gmc { struct StructName; } \
	typedef ::Gmc::StructName

#ifndef _COMMONIF_MOTIONTYPES_DECLARED_
/**
 * Forward declaration of (internal) C++ - interface types or ...
 */
TYPEDEF_FORWARD_MMO_CLASS(TaskMediator) McInternalFubProcessingType;
TYPEDEF_FORWARD_MMO_CLASS(IControlIf) McInternalControlIfType;
TYPEDEF_FORWARD_MMO_CLASS(IAxisIf) McInternalAxisIfType;
TYPEDEF_FORWARD_MMO_CLASS(IAxesGrpIf) McInternalAxesGroupIfType;
#endif
/**
 *  ... declaration of a comparatively equivalent C structure type.
 */
#else	/*< not C++ >:O */
#if !defined(__STDC__) || defined(__STRICT_ANSI__)
#define TYPEDEF_PSEUDO_MMO_CSTRUCT(StructName, Content) \
	typedef struct StructName Content
#else
#define TYPEDEF_PSEUDO_MMO_CSTRUCT(StructName, Content) \
	struct StructName; typedef struct StructName
#endif
TYPEDEF_PSEUDO_MMO_CSTRUCT(FubProcessing_csub, { long states[2]; }) McInternalFubProcessingType;
TYPEDEF_PSEUDO_MMO_CSTRUCT(McControlIfType_csub, { plcdword vtable; }) McInternalControlIfType;
TYPEDEF_PSEUDO_MMO_CSTRUCT(McAxisIfType_csub, { plcdword vtable; }) McInternalAxisIfType;
TYPEDEF_PSEUDO_MMO_CSTRUCT(McAxesGroupIfType_csub, { plcdword vtable; }) McInternalAxesGroupIfType;
#endif	/*< end plain C */
/** @endcond */

/* Datatypes and datatypes of function blocks */
typedef enum McAxisPLCopenStateEnum
{
	mcAXIS_DISABLED,
	mcAXIS_STANDSTILL,
	mcAXIS_HOMING,
	mcAXIS_STOPPING,
	mcAXIS_DISCRETE_MOTION,
	mcAXIS_CONTINUOUS_MOTION,
	mcAXIS_SYNCHRONIZED_MOTION,
	mcAXIS_ERRORSTOP
} McAxisPLCopenStateEnum;

typedef enum McGroupPLCopenStateEnum
{
	mcGROUP_DISABLED,
	mcGROUP_HOMING,
	mcGROUP_STANDBY,
	mcGROUP_MOVING,
	mcGROUP_STOPPING,
	mcGROUP_ERRORSTOP
} McGroupPLCopenStateEnum;

typedef enum McBufferModeEnum
{
	mcABORTING,
	mcBUFFERED
} McBufferModeEnum;


typedef enum McHomingModeEnum
{
	mcHOMING_DIRECT = 0,
	mcHOMING_SWITCH_GATE,
	mcHOMING_ABSOLUTE_SWITCH,
	mcHOMING_LIMIT_SWITCH = 4,
	mcHOMING_ABSOLUTE,
	mcHOMING_DCM = 7,
	mcHOMING_BLOCK_TORQUE = 9,
	mcHOMING_BLOCK_LAG_ERROR = 10,
	mcHOMING_ABSOLUTE_CORRECTION = 133,
	mcHOMING_DCM_CORRECTION = 135,
	mcHOMING_DEFAULT = 140,
	mcHOMING_INIT,
	mcHOMING_RESTORE_POSITION
} McHomingModeEnum;

typedef enum McIplModeEnum
{
	mcIPLM_DEFAULT,
	mcIPLM_OFF,
	mcIPLM_LINEAR,
	mcIPLM_QUADRATIC,
	mcIPLM_QUADRATIC_NO_OVERSHOOT
} McIplModeEnum;

typedef enum McErrorCmdEnum
{
	mcWARNING_CMD = 0,
	mcERROR_CMD,
	mcERROR_STOP_CMD,
	mcERROR_STOP_CTRL_OFF_CMD,
	mcERROR_V_STOP_CTRL_OFF_CMD,
	mcERROR_COAST_TO_STANDSTILL_CMD,
	mcERROR_INDUCTION_HALT_CMD
} McErrorCmdEnum;

typedef enum McEdgeEnum
{
	mcEDGE_POSITIVE,
	mcEDGE_NEGATIVE
} McEdgeEnum;

typedef enum McNetworkTypeEnum
{
	mcNETWORK_POWERLINK
} McNetworkTypeEnum;

typedef enum McTransitionModeEnum
{
	mcTM_NONE
} McTransitionModeEnum;

typedef enum McExecutionModeEnum
{
	mcEM_IMMEDIATELY
} McExecutionModeEnum;
typedef enum McCoordinateSystemEnum
{
	mcACS = 0,
	mcMCS = 1,
	mcPCS = 2,
	mcSCS1 = 3,
	mcSCS2 = 4,
	mcSCS3 = 5,
	mcSCS4 = 6,
	mcSCS5 = 7,
	mcTCS = 9,
	mcJACS = 100
} McCoordinateSystemEnum;

typedef enum McSwitchEnum
{
	mcSWITCH_OFF,
	mcSWITCH_ON
} McSwitchEnum;

typedef enum McModifyParameterizationModeEnum
{
	mcREAD,
	mcWRITE,
	mcLOAD,
	mcSAVE
} McModifyParameterizationModeEnum;

typedef enum McLoadSaveCfgModeEnum
{
	mcLOADCfg,
	mcSAVECfg
} McLoadSaveCfgModeEnum;

typedef struct McAdvMoveCycParType
{
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	McSwitchEnum DisableJoltLimitation;
} McAdvMoveCycParType;

typedef struct McOrientType
{
	unsigned long Type;
	double Angle1;
	double Angle2;
	double Angle3;
} McOrientType;

typedef struct McPosType
{
	double X;
	double Y;
	double Z;
} McPosType;

typedef struct McFrameType
{
	McPosType Pos;
	McOrientType Orient;
} McFrameType;

typedef struct McInternalType
{
	unsigned long ID;
	unsigned long Check;
	unsigned long ParamHash;
	plcword State;
	unsigned short Error;
	McInternalFubProcessingType* Treating;
	unsigned long Memory[14];
	unsigned char Flags;
	McInternalControlIfType* ControlIf;
	long SeqNo;
} McInternalType;

#if !(defined(__cplusplus) || defined(_MCBASE_HPP_INCLUDED_))
typedef struct McInternalTwoRefType
{
	unsigned long ID;
	unsigned long Check;
	unsigned long ParamHash;
	plcword State;
	unsigned short Error;
	McInternalFubProcessingType* Treating;
	unsigned long Memory[14];
	unsigned char Flags;
	McInternalControlIfType* ControlIf;
	long SeqNo;
	McInternalControlIfType* MaControlIf;
	long MaSeqNo;
} McInternalTwoRefType;
#else
typedef struct McInternalTwoRefType : public McInternalType
{
	McInternalControlIfType* MaControlIf;
	long MaSeqNo;
} McInternalTwoRefType;
#endif

typedef struct McInternalMappLinkType
{
	unsigned long Internal[2];
} McInternalMappLinkType;

typedef struct McAxisType
{
	McInternalAxisIfType* controlif;
	McInternalMappLinkType mappLinkInternal;
	signed long seqNo;
} McAxisType;

typedef McAxisType McPsmAxisType;

typedef struct McAxesGroupType
{
	McInternalAxesGroupIfType* controlif;
	McInternalMappLinkType mappLinkInternal;
} McAxesGroupType;

typedef struct McGetCoordSystemIdentParType
{
	McAxesGroupType* AxesGroup;
	//AssemblyType missing

} McGetCoordSystemIdentParType;

typedef struct McModifyParameterizationParType
{
	McAxisType* Axis;
	McAxesGroupType* AxesGroup;
} McModifyParameterizationParType;

typedef struct MC_BR_GetCoordSystemIdent
{
	/* VAR_INPUT (analog) */
	plcstring CoordSystemName[261];
	McGetCoordSystemIdentParType Parameter;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned long Ident;
	/* VAR (analog) */
	McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_GetCoordSystemIdent_typ;

/* Prototyping of functions and function blocks */
#ifdef __cplusplus
extern "C" {
#endif

_BUR_PUBLIC void MC_BR_GetCoordSystemIdent(struct MC_BR_GetCoordSystemIdent* inst);

#ifdef __cplusplus
} // End of C-Linkage
#endif


#endif /* _MCBASE_ */

