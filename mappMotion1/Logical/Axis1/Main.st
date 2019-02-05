
PROGRAM _INIT
    
    MpAxisBasic_0.MpLink := ADR(gAxis_1);
    MpAxisBasic_0.Enable := TRUE;
    MpAxisBasic_0.Parameters := ADR(AxisParameters);
    
    AxisParameters.Position := 100.0;
    AxisParameters.Velocity := 10.0;
    AxisParameters.Acceleration := 50.0;
    AxisParameters.Deceleration := 50.0;
     
END_PROGRAM

PROGRAM _CYCLIC
    
    MpAxisBasic_0();
     
END_PROGRAM

PROGRAM _EXIT

    MpAxisBasic_0.Power  := FALSE;
    MpAxisBasic_0.Home   := FALSE;
    MpAxisBasic_0.MoveAbsolute := FALSE;
    MpAxisBasic_0.MoveAdditive := FALSE;
    MpAxisBasic_0.MoveVelocity := FALSE;
    MpAxisBasic_0.Stop         := FALSE;
    MpAxisBasic_0.ErrorReset   := FALSE;
    MpAxisBasic_0();

    MpAxisBasic_0.Enable := FALSE;
    MpAxisBasic_0();
     
END_PROGRAM

