//START_TABLE sw_reg
`SWREG_W(KNN_RESET,          1, 0) //KNN soft reset
`SWREG_W(KNN_ENABLE,         1, 0) //KNN enable
`SWREG_W(X1        ,    WDATA_W, 0) //x coordenate for point 1
`SWREG_W(Y1        ,    WDATA_W, 0) //y coordenate for point 1
`SWREG_W(X2        ,    WDATA_W, 0) //x coordenate for point 2
`SWREG_W(Y2        ,    WDATA_W, 0) //y coordenate for point 2
`SWREG_R(D2        ,  2*WDATA_W, 0) //square distance for points 1 and 2
