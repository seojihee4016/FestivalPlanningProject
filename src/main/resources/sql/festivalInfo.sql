CREATE TABLE festival_info
(   
    ft_Code NUMBER(4) PRIMARY KEY,
    fstvl_Nm VARCHAR2(200),
    opar VARCHAR2(200),
    fstvl_Start_Date VARCHAR2(20),
    fstvl_End_Date VARCHAR2(20),
    fstvl_Co VARCHAR2(2000),
    mnnst VARCHAR2(200),
    auspc_Instt VARCHAR2(400),
    suprt_Instt VARCHAR2(400),
    phone_Number VARCHAR2(13),
    homepage_Url VARCHAR2(300),
    relate_Info VARCHAR2(200),
    rdnmadr VARCHAR2(200),
    lnmadr VARCHAR2(200),
    latitude VARCHAR2(200),
    longitude VARCHAR2(200),
    reference_Date VARCHAR2(200),
    instt_code VARCHAR2(200)
);
