
FUNCTION_BLOCK MpAxisBasic
	VAR_INPUT
		MpLink : REFERENCE TO McAxisType; (*The axis reference creates a link between the function block and an axis.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		ErrorReset : BOOL; (*Used to reset errors*)
		Parameters : REFERENCE TO MpAxisBasicParType; (*Parameters of the function block*)
		Update : BOOL; (*Updates the parameters*)
		Power : BOOL; (*Level-sensitive command for turning an axis on/off. In the event of an error, a new rising edge is required to restart the axis.*)
		Home : BOOL; (*Command for homing the axis*)
		MoveVelocity : BOOL; (*Starts a constant movement with a defined velocity*)
		MoveAbsolute : BOOL; (*Starts an absolute movement*)
		MoveAdditive : BOOL; (*Starts a relative movement*)
		Stop : BOOL; (*Stops the axis*)
		JogPositive : BOOL; (*Movement in the positive direction. Stops automatically at the software limit position.*)
		JogNegative : BOOL; (*Movement in the negative direction. Stops automatically at the software limit position.*)
		LimitLoad : BOOL; (*Enables torque limitation*)
		ReleaseBrake : BOOL; (*Releases the brake (but only when the motor is switched off)*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*)
		Error : BOOL; (*Error occurred during operation*)
		StatusID : DINT; (*Status information about the function block*)
		UpdateDone : BOOL; (*Parameter update completed*)
		Position : LREAL; (*Current position of the axis [measurement units]*)
		Velocity : REAL; (*Current speed of the axis [measurement units/s]*)
		CommandBusy : BOOL; (*Function block currently executing a command*)
		CommandAborted : BOOL; (*Function block interrupted while executing a command*)
		PowerOn : BOOL; (*Axis switched on*)
		IsHomed : BOOL; (*Axis referenced*)
		InVelocity : BOOL; (*Axis running with defined velocity*)
		InPosition : BOOL; (*Axis reached the desired position*)
		MoveActive : BOOL; (*Movement active*)
		MoveDone : BOOL; (*Movement complete*)
		Stopped : BOOL; (*Axis stopped*)
		LimitLoadReady : BOOL; (*Torque limitation ready*)
		BrakeReleased : BOOL; (*Brake released*)
		Info : MpAxisBasicInfoType; (*Additional information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
