(*Single-Axis Function Blocks*)

FUNCTION_BLOCK MC_BR_GetAxisLibraryInfo (*commands a controlled motion to a specified absolute position.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Active : BOOL; (*FB has control over the axis*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		Info : McLibraryInfoType; (*implementation lib of the axis*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_Power (*switches on the controller of the axis*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Status : BOOL; (*effective status of the power stage*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_Home (*start the homing movement of an axis according to the homing parameters*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
        Position : LREAL; (*absolute position when the reference signal is detected*)
        HomingMode : McHomingModeEnum; (*select the homing mode*)
        BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Active : BOOL; (*FB has control over the axis*)
        CommandAborted : BOOL; (*Command was aborted by another command*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_BrakeOperation (*to operate the brake and get the brake status*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
        Command : McBrakeCmdEnum; (*select the brake command*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        BrakeStatus : McBrakeStatusEnum; (*shows the brake status*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_Stop (*commands a controlled motion stop and transfers the axis to the state Stopping*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
        Deceleration : REAL; (*value of deceleration*)
	Jerk : REAL; (*maximum jerk*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        CommandAborted : BOOL; (*Command was aborted by another command*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_Halt (*commands a controlled motion stop.*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
        Deceleration : REAL; (*value of deceleration*)
	Jerk : REAL; (*maximum jerk*)
        BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Active : BOOL; (*FB has control over the axis*)
        CommandAborted : BOOL; (*Command was aborted by another command*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_CamAutomatCommand (*send command for the cam automat to the drive*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Enable : BOOL; (*when set commands can be given*)
		Deceleration : REAL; (*maximum deceleration*)
		Start : BOOL; (*starts the cam automat*)
		Stop : BOOL; (*stops the movement on the slave axis*)
		Restart : BOOL; (*restarts a cam automat which is in stand by*)
		EndAutomat : BOOL; (*finishes the execution of the cam automat*)
		SetSignal1 : BOOL; (*sets signal 1 of the cam automat*)
		SetSignal2 : BOOL; (*sets signal 2 of the cam automat*)
		SetSignal3 : BOOL; (*sets signal 3 of the cam automat*)
		SetSignal4 : BOOL; (*sets signal 4 of the cam automat*)
		ResetSignal1 : BOOL; (*resets signal 1 of the cam automat*)
		ResetSignal2 : BOOL; (*resets signal 2 of the cam automat*)
		ResetSignal3 : BOOL; (*resets signal 3 of the cam automat*)
		ResetSignal4 : BOOL; (*resets signal 4 of the cam automat*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*output values are valid*)
		Busy : BOOL; (*FB is active and needs to be called*)
		CommandAborted : BOOL; (*Command was aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		Running : BOOL; (*automat is currently running*)
		StandBy : BOOL; (*automat is in standby and can be restarted*)
		ActualStateIndex : USINT; (*index of the actual cam automat state*)
		ActualStateCamIndex : UINT; (*index of the cam of the actual cam automat state*)
		InCam : BOOL; (*cam in the current cam automat state is active*)
		InCompensation : BOOL; (*compensation in the current cam automat state is active*)
		Ready : BOOL; (*command can be given*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_CamAutomatReset (*send reset command for the cam automat to the drive*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Command : McCamAutResetCmdEnum; (*command for reset*)
		StateIndex : USINT; (*index of state which should be reset*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_CamAutomatParLock (*send parlock command for the cam automat to the drive*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Command : McCamAutParLockCmdEnum; (*command for reset*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveAbsolute (*commands a controlled motion to a specified absolute position.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Position : LREAL; (*target position for the motion*)
		Velocity : REAL; (*maximum velocity*)
		Acceleration : REAL; (*maximum acceleration*)
		Deceleration : REAL; (*maximum deceleration*)
		Jerk : REAL; (*maximum jerk*)
		Direction : McDirectionEnum; (*movement direction*)
		BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Active : BOOL; (*FB has control over the axis*)
		CommandAborted : BOOL; (*Command was aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveAdditive (*commands a motion of a specified relative distance*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Distance : LREAL; (*relative distance for the motion*)
		Velocity : REAL; (*maximum velocity*)
		Acceleration : REAL; (*maximum acceleration*)
		Deceleration : REAL; (*maximum deceleration*)
		Jerk : REAL; (*maximum jerk*)
		BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Active : BOOL; (*FB has control over the axis*)
		CommandAborted : BOOL; (*Command was aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveVelocity (*commands a motion with specific velocity*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Velocity : REAL; (*maximum velocity*)
		Acceleration : REAL; (*maximum acceleration*)
		Deceleration : REAL; (*maximum deceleration*)
		Jerk : REAL; (*maximum jerk*)
		Direction : McDirectionEnum; (*movement direction*)
		BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
	END_VAR
	VAR_OUTPUT
		InVelocity : BOOL; (*Commanded velocity reached*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Active : BOOL; (*FB has control over the axis*)
		CommandAborted : BOOL; (*Command was aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MoveCyclicPosition (*commands the axis to follow a cyclically transferred position*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
        InterpolationMode : McIplModeEnum; (*interpolation mode of cyclic position on receiving drive*)
        AdvancedParameters : McAdvMoveCycParType; (*structure for using additional functions*)
	CyclicPosition : LREAL; (*cyclic position that is transferred to the axis*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*initialization complete, position is beeing transferred cyclically*)
        Busy : BOOL; (*FB is active and needs to be called*)
        CommandAborted : BOOL; (*Command was aborted by another command*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType;(*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MoveCyclicVelocity (*commands the axis to follow a cyclically transferred velocity*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
        InterpolationMode : McIplModeEnum; (*interpolation mode of cyclic set value on receiving drive*)
        AdvancedParameters : McAdvMoveCycParType; (*structure for using additional functions*)
	CyclicVelocity : REAL; (*cyclic velocity that is transferred to the axis*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*initialization complete, velocity is beeing transferred cyclically*)
        Busy : BOOL; (*FB is active and needs to be called*)
        CommandAborted : BOOL; (*Command was aborted by another command*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType;(*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_SetOverride (*sets the values of override parameters for velocity and acceleration/deceleration*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
        VelFactor : REAL; (*New override factor for the velocity*)
        AccFactor : REAL; (*New override factor for the acceleration/deceleration*)
    END_VAR
    VAR_OUTPUT
        Enabled : BOOL; (*Signals that the override factors are set successfully.*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType;
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadStatus (*returns the detailed status of the motion currently in progress according to the State Diagram*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        ErrorStop : BOOL; (*axis is in state Errorstop*)
        Disabled : BOOL; (*axis is in state Disabled*)
        Stopping : BOOL; (*axis is in state Stopping*)
        Homing : BOOL; (*axis is in state Homing*)
        StandStill : BOOL; (*axis is in state Standstill*)
        DiscreteMotion : BOOL; (*axis is in state DiscreteMotion*)
        ContinuousMotion : BOOL; (*axis is in state ContinuousMotion*)
        SynchronizedMotion : BOOL; (*axis is in state SynchronizedMotion*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadAxisInfo (*reads status information of the axis*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        Simulation : BOOL; (*the motor is simulated*)
        CommunicationReady : BOOL; (*drive has a network connection*)
        ReadyForPowerOn : BOOL; (*controller can be switched on*)
        PowerOn : BOOL; (*controller is switched on*)
        IsHomed : BOOL; (*axis is homed*)
        AxisWarning : BOOL; (*a warning is active on the drive*)
        AdditionalInfo : McAddInfoType; (*additional information*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadActualPosition (*returns the actual axis position.*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        Position : LREAL; (*actual position of the axis*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadActualVelocity (*returns the actual axis velocity.*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        Velocity : REAL; (*actual velocity of the axis*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadActualTorque (*returns the actual axis torque.*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        Torque : REAL; (*actual torque of the axis*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadAxisError (*reads an error number and deletes it from the error number FIFO*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
        ReadNext: BOOL; (* Error is deleted from the FIFO at rising edge*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
        AxisErrorID : DINT; (*error number of the drive error*)
        RecordID : DINT; (*ID of the event log entry*)
    END_VAR
    VAR
        Internal : McInternalType;
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_Reset (*makes the transition from the state ‘ErrorStop’ to ‘Standstill’ or ‘Disabled’*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*FB is active as long as input is set*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_VelocityControl (*sends cyclic speed set value for velocity control*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Enable : BOOL; (*FB is active as long as input is set*)
        AdvancedParameters : McAdvVelCtrlParType; (*structure for using additional functions*)
        CyclicVelocity : REAL; (*parameter input for set speed*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*the output values of the FB can be used*)
        Busy : BOOL; (*FB is active and needs to be called*)
        CommandAborted : BOOL; (*Command was aborted by another command*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ReadCyclicPosition (*reads the high resoluted position of the axis cyclically*)
    VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Enable : BOOL; (*FB is active as long as input is set*)
	ValueSource : McValueSrcEnum; (*selection which position should be read*)
    END_VAR
    VAR_OUTPUT
	Valid : BOOL; (*the output values of the FB can be used*)
	Busy : BOOL; (*FB is active and needs to be called*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
	CyclicPosition : LREAL; (*cyclic position that is read from the axis*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_ReadParameter (*reads the specified PLCopen Parameter*)
    VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Enable : BOOL; (*FB is active as long as input is set*)
		ParameterNumber : McPlcopenParEnum; (*number of the parameter*)
    END_VAR
    VAR_OUTPUT
	Valid : BOOL; (*the output value of the FB can be used*)
	Busy : BOOL; (*FB is active and needs to be called*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
	Value : LREAL; (*value of parameter*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_JogVelocity (*enables and executes jog movements*)
    VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Enable : BOOL; (*FB is active as long as input is set*)
	Velocity : REAL; (*maximum velocity*)
	Acceleration : REAL; (*maximum acceleration*)
	Deceleration : REAL; (*maximum deceleration*)
	Jerk : REAL; (*maximum jerk*)
	JogPositive : BOOL; (*executes positive movement at high level*)
	JogNegative : BOOL; (*executes negative movement at high level*)
    END_VAR
    VAR_OUTPUT
	Ready : BOOL; (*function block is active*)
	Busy : BOOL; (*FB is active and needs to be called*)
	CommandAborted : BOOL; (*Command was aborted by another command*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
	Jogging : BOOL; (*jog movement is active*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_JogLimitPosition (*enables and executes jog movements between two limit positions*)
    VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Enable : BOOL; (*FB is active as long as input is set*)
	FirstPosition : LREAL; (*lower limit position*)
	LastPosition : LREAL; (*upper limit position*)
	Velocity : REAL; (*maximum velocity*)
	Acceleration : REAL; (*maximum acceleration*)
	Deceleration : REAL; (*maximum deceleration*)
	Jerk : REAL; (*maximum jerk*)
	JogPositive : BOOL; (*executes positive movement at high level*)
	JogNegative : BOOL; (*executes negative movement at high level*)
    END_VAR
    VAR_OUTPUT
	Ready : BOOL; (*function block is active*)
	Busy : BOOL; (*FB is active and needs to be called*)
	CommandAborted : BOOL; (*Command was aborted by another command*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
	Jogging : BOOL; (*jog movement is active*)
	LimitReached : BOOL; (*limit position is reached*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_JogTargetPosition (*enables and executes jog movements with a defined target position*)
    VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Enable : BOOL; (*FB is active as long as input is set*)
	Velocity : REAL; (*maximum velocity*)
	Acceleration : REAL; (*maximum acceleration*)
	Deceleration : REAL; (*maximum deceleration*)
	Jerk : REAL; (*maximum jerk*)
	TargetPosition : LREAL; (*target position*)
	JogToTarget : BOOL; (*moves to target position at high level*)
	JogPositive : BOOL; (*executes positive movement at high level*)
	JogNegative : BOOL; (*executes negative movement at high level*)
    END_VAR
    VAR_OUTPUT
	Ready : BOOL; (*function block is active*)
	Busy : BOOL; (*FB is active and needs to be called*)
	CommandAborted : BOOL; (*Command was aborted by another command*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
	Jogging : BOOL; (*jog movement is active*)
	MovingToTarget : BOOL; (*axis is moving to target*)
	TargetReached : BOOL; (*target position reached*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_TorqueControl (*startes a torque control movement on the drive*)
    VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
	Torque : REAL; (*signed set torque*)
	TorqueRamp : REAL; (*torque increase while reaching Torque*)
	Velocity : REAL; (*maximum velocity*)
	Acceleration : REAL; (*maximum acceleration*)
	Jerk : REAL; (*maximum jerk*)
	BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
    END_VAR
    VAR_OUTPUT
	InTorque : BOOL; (*set torque reached*)
	Busy : BOOL; (*FB is active and needs to be called*)
	Active : BOOL; (*FB has control over the axis*)
	CommandAborted : BOOL; (*Command was aborted by another command*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
	AxisLimitActive : BOOL; (*is set if velocity limit is reached*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_LimitLoad (*limits the motor torque to a set value*)
VAR_INPUT
	Axis : REFERENCE TO McAxisType; (*axis reference*)
	Enable : BOOL; (*when set limitation is activated*)
	Load : REAL; (*limit for the motor torque [Nm]*)
	Direction : McDirectionEnum; (*movement direction*)
    END_VAR
    VAR_OUTPUT
	Busy : BOOL; (*FB is active and needs to be called*)
        Ready : BOOL; (*parameter initialized*)
	Active : BOOL; (*torque is limited*)
	Error : BOOL; (*error occurred during operation*)
	ErrorID : DINT; (*error number*)
    END_VAR
    VAR
	Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_LoadSimulationCommand (*switch the load simulation of the axis on or off*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
        Command : McSwitchEnum; (*simulation command*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_GearIn (*commands a ratio between the velocity of the master and slave axes*)
    VAR_INPUT
        Master : REFERENCE TO McAxisType; (*master axis reference*)
        Slave : REFERENCE TO McAxisType; (*slave axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		RatioNumerator : DINT; (*gear ratio numerator*)
		RatioDenominator : DINT; (*gear ratio denominator*)
		MasterValueSource : McValueSrcEnum; (*defines the source for synchronization*)
		Acceleration : REAL; (*maximum acceleration for gearing in*)
		Deceleration : REAL; (*maximum deceleration for gearing in*)
		Jerk : REAL; (*maximum jerk for gearing in*)
		BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
		AdvancedParameters : McAdvGearInParType; (*structure for using additional functions*)
	END_VAR
	VAR_OUTPUT
		InGear : BOOL; (*commanded gearing complete*)
		Busy : BOOL; (*function block is not finished*)
		Active : BOOL; (*FB has control over the axis*)
		CommandAborted : BOOL; (*function block is aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
	END_VAR
    VAR
        Internal : McInternalTwoRefType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_CamPrepare (*prepare cam to use for synchronous movement or functionality*)
    VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*axis reference*)
        Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
        Cam : McCamDefineType; (*specify cam to use*)
        CamID : UINT; (*index for cam data object*)
    END_VAR
    VAR_OUTPUT
        Done : BOOL; (*execution successful. FB finished*)
        Busy : BOOL; (*FB is active and needs to be called*)
        Error : BOOL; (*error occurred during operation*)
        ErrorID : DINT; (*error number*)
    END_VAR
    VAR
        Internal : McInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_CommandError (*generates a warning or an error on the axis*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Command : McErrorCmdEnum; (*selection which error should be generated*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_PhasingAbsolute (*Creates an absolute phase shift in the master position of a slave axis*)
	VAR_INPUT
		Master : REFERENCE TO McAxisType; (*Master axis reference*)
		Slave : REFERENCE TO McAxisType; (*Slave axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		PhaseShift : LREAL; (*Absolute phase difference in master position of the slave axis*)
		Velocity : REAL; (*maximum velocity*)
		Acceleration : REAL; (*maximum acceleration*)
		Deceleration : REAL; (*maximum deceleration*)
		Jerk : REAL; (*maximum jerk*)
		BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Active : BOOL; (*FB has control over the axis*)
		CommandAborted : BOOL; (*Command was aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		AbsolutePhaseShift : LREAL; (*Current absolute phase shift*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_PhasingRelative (*Creates a relative phase shift in the master position of a slave axis*)
	VAR_INPUT
		Master : REFERENCE TO McAxisType; (*Master axis reference*)
		Slave : REFERENCE TO McAxisType; (*Slave axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		PhaseShift : LREAL; (*Absolute phase difference in master position of the slave axis*)
		Velocity : REAL; (*maximum velocity*)
		Acceleration : REAL; (*maximum acceleration*)
		Deceleration : REAL; (*maximum deceleration*)
		Jerk : REAL; (*maximum jerk*)
		BufferMode : McBufferModeEnum; (*defines the chronological sequence of FB*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Active : BOOL; (*FB has control over the axis*)
		CommandAborted : BOOL; (*Command was aborted by another command*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		CoveredPhaseShift : LREAL; (*Current absolute phase shift*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_Phasing (*controls phase shift of an axis coupling*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Enable: BOOL; (*FB is active as long as input is set*)
		PhaseShift : LREAL; (*value added as phase to the master position*)
		Velocity : REAL; (*velocity the phase shift is applied with*)
		Acceleration : REAL; (*acceleration the phase shift is applied with*)
		AdvancedParameters : McAdvPhasingParType; (*structure for using additional functions*)
		StartShift : BOOL; (*start shift at rising edge*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*initialization complete, shift can be started*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		ShiftAttained : BOOL; (*commanded shift reached*)
		ShiftStarted : BOOL; (*shift has been started*)
		ActualPhaseShift : LREAL; (*actual phase shift value*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_Offset (*controls offset shift of an axis coupling*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Enable: BOOL; (*FB is active as long as input is set*)
		OffsetShift : LREAL; (*value added as offset to the slave position*)
		Velocity : REAL; (*velocity the offset shift is applied with*)
		Acceleration : REAL; (*acceleration the offset shift is applied with*)
		AdvancedParameters : McAdvOffsetParType; (*structure for using additional functions*)
		StartShift : BOOL; (*start shift at rising edge*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*initialization complete, shift can be started*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		ShiftAttained : BOOL; (*commanded shift reached*)
		ShiftStarted : BOOL; (*shift has been started*)
		ActualOffsetShift : LREAL; (*actual offset shift value*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MC_BR_CamAutomatSetPar (*set parameter for configuration of cam automat*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Command : McCamAutSetParCmdEnum; (*command for sending values*)
		CamAutomat : McCamAutDefineType; (*parameter source for cam automat*)
		AdvancedParameters : McAdvCamAutSetParType; (*advanced parameters for configuration options*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_CamAutomatGetPar (*get parameter of configured cam automat*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		Command :  McCamAutGetParCmdEnum; (*command for sending values*)
		CamAutomat : McCamAutDefineType; (*parameter source for cam automat*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MC_BR_CalcCamFromPoints (*calculate cam data from points*)
	VAR_INPUT
		Execute 			: BOOL; 		(*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR*)
		MasterPointsAddress	: REFERENCE TO LREAL;
		SlavePointsAddress 	: REFERENCE TO LREAL;
		NumberOfPoints 		: UINT;
		CamDataAddress 		: REFERENCE TO McCamDataType;
		AdvancedParameters 	: McAdvCalcCamFromPointsParType;
	END_VAR
	VAR_OUTPUT
		Done		: BOOL; 			(*Execution successful. Function block is finished.*) (* *) (*#PAR*)
		Busy		: BOOL; 			(*The function block is busy and must continue to be called.*) (* *) (*#PAR*)
		Error		: BOOL; 			(*An error occurred during operation. The function block must be disabled to get out of the error state.*) (* *) (*#PAR*)
		ErrorID 	: DINT; 			(*Status information*)(* *) (*#PAR*)
	END_VAR
	VAR
		Internal : McExec1InternalType; (*Data for internal use*)
	END_VAR
END_FUNCTION_BLOCK
