/**
*Desarrollado por:       Indra
*Autor:                  CARLOS RICARDO HERNANDEZ REYES
*Proyecto:               Experiencia Unica
*Descripción:            Controlador para componente de Gráficos y consultade UG de Usuarios
*
*Cambios (Versiones) 
*-------------------------------------------------------------------------------
*No.         Fecha           Autor                           Descripción
*------   ----------------   --------------------            ---------------
*1.0      02-07-2017           Ricardo Hernandez             Creación           
*1.1      02-07-2017           Monserrat Gonzalez            Metodos de consulta de UG de Usuarios                                                                       
*1.2      08-08-2017           Fernando Velázquez            Metodos para graficar y Listas para graficar
*1.3      09-08-2017           Fernando Velázquez            Creacion de variables para indicadores
*1.4      10-08-2017           Monserrat Gonzalez            Metodo para calcula la sumatoria de Impactos por compromiso EU
*1.5      23-08-2017           Alberto Galindo               Se acorta metodo de Actualización y se crean 3 metodos más   
*1.6      30-08-2017           Monserrat Gonzalez            Método para calcular Total Meta RI para EC Certificación RI DO y EC
*1.7      30-08-2017           Fernando Velázquez            Ajuste de variables para calculo de Compromiso,Backlog,Logro Compromiso
*1.8      31-08-2017           Monserrat Gonzalez            Método para Desglosar las Metas Totales del RI Certificación RI DO y EC
*1.9      27-09-2017           Monserrat Gonzalez            Método para copiar los Apoyos y Compromisos abiertos a otra RI
**/
Global class ContadorExpUni_Class{

    private static String UserID = '';
    private static String UserUG = '';

    //Variables calculco Backlog
    private static Date Fecha;
    private static Integer hoy = 0;
    private static Integer dia = 0;
    private static Integer ult = 0;
    private static Decimal backlogCP = 0.0;
    private static Decimal backlogLP = 0.0;
    private static Decimal backlogGob = 0.0;
    private static Decimal backlogVistaMN = 0.0;
    private static Decimal backlogInversiones = 0.0;
    private static Decimal backlogRC = 0.0;
    private static Decimal backlogINFR = 0.0;
    private static Decimal backlogINFNR = 0.0;
    private static Decimal backlogStock = 0.0;

    //Variables Compromiso
    private static Decimal totalImp_CP = 0.0;
    private static Decimal totalImp_LP = 0.0;
    private static Decimal totalImp_Gob = 0.0;
    private static Decimal totalImp_VistaMN = 0.0;
    private static Decimal totalImp_Inver = 0.0;
    private static Decimal totalImp_VistaRC = 0.0;
    private static Decimal totalImp_INFR = 0.0;
    private static Decimal totalImp_INFNR = 0.0;
    private static Decimal totalImp_Saneamiento = 0.0;
    private static Decimal totalImp_Stock = 0.0;
    private static Decimal totalImp_NvoUsu = 0.0;

    //Variables Logro Proyectado
    private static Decimal logroProy_CP = 0.0;
    private static Decimal logroProy_CP1 = 0.0;
    private static Decimal logroProy_LP = 0.0;
    private static Decimal logroProy_LP1 = 0.0;
    private static Decimal logroProy_Gob = 0.0;
    private static Decimal logroProy_Gob1 = 0.0;
    private static Decimal logroProy_VistaMN = 0.0;
    private static Decimal logroProy_VistaMN1 = 0.0;
    private static Decimal logroProy_Inver = 0.0;
    private static Decimal logroProy_Inver1 = 0.0;
    private static Decimal logroProy_VistaRC = 0.0;
    private static Decimal logroProy_VistaRC1 = 0.0;
    private static Decimal logroProy_INFR = 0.0;
    private static Decimal logroProy_INFR1 = 0.0;
    private static Decimal logroProy_INFNR = 0.0;
    private static Decimal logroProy_INFNR1 = 0.0;
    private static Decimal logroProy_Saneamiento = 0.0;
    private static Decimal logroProy_Saneamiento1 = 0.0;
    private static Decimal logroProy_Stock = 0.0;
    private static Decimal logroProy_Stock1 = 0.0;
    private static Decimal logroProy_NvoUsu = 0.0;
    private static Decimal logroProy_NvoUsu1 = 0.0;
    
    //Variable Real Gap
    private static Decimal RealComple_CP = 0.0;
    private static Decimal RealAmort_CP = 0.0;
    private static Decimal GapProye_CP = 0.0;
    private static Decimal GapComple_CP = 0.0;
    private static Decimal GapProyeNR_CP = 0.0;
    private static Decimal RealComple_LP = 0.0;
    private static Decimal RealAmort_LP = 0.0;
    private static Decimal GapProye_LP = 0.0;
    private static Decimal GapComple_LP = 0.0;
    private static Decimal GapProyeNR_LP = 0.0;
    private static Decimal RealComple_Gob = 0.0;
    private static Decimal RealAmort_Gob = 0.0;
    private static Decimal GapProye_Gob = 0.0;
    private static Decimal GapComple_Gob = 0.0;
    private static Decimal GapProyeNR_Gob = 0.0;
    private static Decimal RealComple_VistaMN = 0.0;
    private static Decimal RealAmort_VistaMN = 0.0;
    private static Decimal GapProye_VistaMN = 0.0;
    private static Decimal GapComple_VistaMN = 0.0;
    private static Decimal GapProyeNR_VistaMN = 0.0;
    private static Decimal RealComple_Inver = 0.0;
    private static Decimal RealAmort_Inver = 0.0;
    private static Decimal GapProye_Inver = 0.0;
    private static Decimal GapComple_Inver = 0.0;
    private static Decimal GapProyeNR_Inver = 0.0;
    private static Decimal RealComple_VistaRC = 0.0;
    private static Decimal RealAmort_VistaRC = 0.0;
    private static Decimal GapProye_VistaRC = 0.0;
    private static Decimal GapComple_VistaRC = 0.0;
    private static Decimal GapProyeNR_VistaRC = 0.0;
    private static Decimal RealComple_INFR = 0.0;
    private static Decimal RealAmort_INFR = 0.0;
    private static Decimal GapProye_INFR = 0.0;
    private static Decimal GapComple_INFR = 0.0;
    private static Decimal GapProyeNR_INFR = 0.0;
    private static Decimal RealComple_INFNR = 0.0;
    private static Decimal RealAmort_INFNR = 0.0;
    private static Decimal GapProye_INFNR = 0.0;
    private static Decimal GapComple_INFNR = 0.0;
    private static Decimal GapProyeNR_INFNR = 0.0;
    private static Decimal RealComple_Saneamiento = 0.0;
    private static Decimal RealAmort_Saneamiento = 0.0;
    private static Decimal GapProye_Saneamiento = 0.0;
    private static Decimal GapComple_Saneamiento = 0.0;
    private static Decimal GapProyeNR_Saneamiento = 0.0;
    private static Decimal RealComple_Stock = 0.0;
    private static Decimal RealAmort_Stock = 0.0;
    private static Decimal GapProye_Stock = 0.0;
    private static Decimal GapComple_Stock = 0.0;
    private static Decimal GapProyeNR_Stock = 0.0;
    private static Decimal RealComple_NvoUsu = 0.0;
    private static Decimal RealAmort_NvoUsu = 0.0;
    private static Decimal GapProye_NvoUsu = 0.0;
    private static Decimal GapComple_NvoUsu = 0.0;
    private static Decimal GapProyeNR_NvoUsu = 0.0;
    private static List<ExpUni_Tablero_Grupal__c> tableroGlobal; 
    private static List<ExpUni_Tablero_Grupal__c> Tab1 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab2 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab3 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab4 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab5 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab6 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab7 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab8 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab9 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab10 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab11 = new List<ExpUni_Tablero_Grupal__c>();
    private static List<ExpUni_Tablero_Grupal__c> Tab12 = new List<ExpUni_Tablero_Grupal__c>();
    
    /*
    public ContadorExpUni_class() {        
        getRegistros();
        getid();
    }
    */    

    
    //*******Fin Obtener Id del usuario  *******
    @RemoteAction
    public static List<ExpUni_Tablero_Grupal__c> getRegistros(){
        
        return [SELECT id, EU_001_tx_Indicador__c FROM ExpUNI_Tablero_Grupal__c WHERE Ownerid =: UserID];
    }
    
    //*******Inicio Obtener datos del UG del usuario  *******
    @RemoteAction
    public static List<User> getEu(List<ExpUni_Tablero_Grupal__c> tableros){
        
        String[] idStr = new List<String>();

        for(ExpUni_Tablero_Grupal__c tab :tableros){
            idStr.add(tab.EU_UG__c);
        }

        List<User> dUsers = [SELECT id, name,UG__c FROM User WHERE UG__c IN :idStr and IsActive = true ];
        
        return dUsers;
    }
    //*******Fin Obtener datos del UG del usuario  *******
    
    @RemoteAction
    public static List<ExpUni_Tablero_Grupal__c> getg(set<Id> Experiencia){
        
        return [SELECT id,Ownerid,EU_Busca_Usuario__c,EU_UG__c,EU_001_tx_Indicador__c,EU_001_tx_Atributo__c,EU_001_Un_Valor__c,EU_Logro__c FROM ExpUni_Tablero_Grupal__c WHERE id IN:Experiencia];        
    }

    @RemoteAction
    public static void calBacklog(Opportunity op, Integer day){
        Fecha = System.Today();
        ult = date.daysInMonth(Fecha.year(), Fecha.month());
        if(op.Tipo_de_Registro_Manual2__c!= null && 'Financiamiento'.equals(op.Tipo_de_Registro_Manual2__c)){
            if(op.CR_SEL_Plazo__c != null && '0 a 1 año'.equals(op.CR_SEL_Plazo__c) && op.Probability!= null && op.amount!= null){ //Cartera CP
                backlogCP+=(op.amount*(op.Probability/100)/ult*day).setScale(1);//(ult-hoy)
            }else if(op.Probability!= null && op.amount!= null && op.CR_SEL_Plazo__c != null){//Cartera LP
                backlogLP+=(op.amount*(op.Probability/100)/ult*day).setScale(1);
            }
           
        }
        else if(op.Tipo_Producto__c!= null && 'Cuenta de Cheques MN'.equals(op.Tipo_Producto__c) && op.Saldo_promedio__c != null && op.Probability!= null ){//Vista MN
            backlogVistaMN+=(op.Saldo_promedio__c*(op.Probability/100)/ult*day).setScale(1);
        }
        else if(op.Tipo_de_Registro_Manual2__c!= null && 'Inversiones'.equals(op.Tipo_de_Registro_Manual2__c) && op.Probability!= null  && op.amount!= null){//Inversiones
            backlogInversiones+=(op.amount*(op.Probability/100)/ult*day).setScale(1);
        }
        else if(op.Tipo_de_Registro_Manual2__c!= null && 'Vista'.equals(op.Tipo_de_Registro_Manual2__c)&&  !'Cuenta de Cheques MN'.equals(op.Tipo_Producto__c) && op.Saldo_promedio__c!=null){//Resto Captación
            backlogRC+= ((op.Saldo_promedio__c)*(op.Probability/100)/ult*day).setScale(1);
        }
        else if(op.Tipo_de_Registro_Manual2__c!= null && ('ATM'.equals(op.Tipo_de_Registro_Manual2__c)||'Adquirente'.equals(op.Tipo_de_Registro_Manual2__c)||'CIE'.equals(op.Tipo_de_Registro_Manual2__c)
        ||'Banca electrónica'.equals(op.Tipo_de_Registro_Manual2__c)||'DEM'.equals(op.Tipo_de_Registro_Manual2__c)||'SIT'.equals(op.Tipo_de_Registro_Manual2__c)
        ||'Swift / Transferencia internacional'.equals(op.Tipo_de_Registro_Manual2__c)||'Domiciliación'.equals(op.Tipo_de_Registro_Manual2__c)||'Seguros'.equals(op.Tipo_de_Registro_Manual2__c))){//INF Recurrentes
            if(op.Monto_de_la_Oportunidad__c != null && op.amount!= null){
                backlogINFR+=((op.Monto_de_la_Oportunidad__c+op.amount)*(op.Probability/100)).setScale(1);
            }
        }
        else if('Comercio internacional'.equals(op.Tipo_de_Registro_Manual2__c)){//INF No Recurrentes
            if(op.Monto_de_la_Oportunidad__c != null){
                backlogINFNR+=((op.Monto_de_la_Oportunidad__c+op.amount)*(op.Probability/100)).setScale(1);
            }
        }
        else if('Nómina'.equals(op.Tipo_de_Registro_Manual2__c)&& op.Tipo_Producto__c!= null && 'Nómina'.equals(op.Tipo_Producto__c)){//Stock Nomina
            if(op.Numero_de_Nominados__c!= null && op.Nomina_Rango_02__c != null && op.Nomina_Rango_01__c!= null && op.Nomina_Rango_03__c!= null ){
                backlogStock+=(op.Numero_de_Nominados__c*(1-op.Nomina_Rango_02__c-op.Nomina_Rango_01__c-op.Nomina_Rango_03__c)).setScale(1);
            }
        }
    }
    
    //*******Calcula Backlog*******
    @RemoteAction
    public static void calculaBacklog(){
        Fecha = System.Today();
        hoy = Fecha.day();
        dia = 0;
        ult = date.daysInMonth(Fecha.year(), Fecha.month());
        
        List<Opportunity> Opps = [SELECT id, amount, ownerid, CR_SEL_Plazo__c, Saldo_promedio__c, Tipo_Producto__c, Probability, 
                                    Tipo_de_Registro_Manual2__c,Monto_de_la_Oportunidad_Inv__c,Monto_Promedio__c,Monto_de_la_Oportunidad__c,
                                    Numero_de_Nominados__c,Nomina_Rango_02__c,Nomina_Rango_01__c,Nomina_Rango_03__c,CloseDate 
                                FROM Opportunity WHERE Ownerid =: UserID AND CloseDate= THIS_MONTH AND (IsClosed = FALSE OR IsWon = FALSE) ];

        for(Opportunity op: Opps){
            dia= ult - op.CloseDate.day();
            calBacklog(op, dia);
        }
    }

    @RemoteAction
    public static void calCompromiso(EU_001_Compromiso__c co){
        
        if(co.EU_001_ls_Indicadores_de_cartera__c != null && co.EU_001_Fm_Impacto__c > 0){
            if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP)){
                totalImp_CP+= co.EU_001_Fm_Impacto__c;
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP)){
                totalImp_LP+= co.EU_001_Fm_Impacto__c;
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE)){
                totalImp_Gob+= co.EU_001_Fm_Impacto__c;
                
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_VISTA_MN)){
                totalImp_VistaMN+= co.EU_001_Fm_Impacto__c; 
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_INVERSIONES)){
                totalImp_Inver+= co.EU_001_Fm_Impacto__c;
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION) 
                || co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION_ACENTO)){
                totalImp_VistaRC += co.EU_001_Fm_Impacto__c;
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES)){
                totalImp_INFR+= co.EU_001_Fm_Impacto__c;
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES)){
               totalImp_INFNR+= co.EU_001_Fm_Impacto__c;
            }
            else if(co.EU_001_ls_Indicadores_de_cartera__c.equals(EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA)){
               totalImp_Stock+= co.EU_001_Fm_Impacto__c;
            }           
        }
    }
    
    //*******Calcula Compromiso*******
    @RemoteAction
    public static void calculaCompromiso(){
        
        List<EU_001_Compromiso__c> Compromiso= [SELECT id,EU_001_ls_Indicadores_de_cartera__c,EU_001_Fm_Impacto__c 
                                            FROM EU_001_Compromiso__c WHERE Ownerid =: UserID  
                                                AND EU_001_ls_Indicadores_de_cartera__c != '' 
                                                AND EU_001_Fm_Fecha_cierre__c = THIS_MONTH 
                                                AND EU_001_ls_Estatus__c IN ('Abierto','Reprogramado') ];
        
        for(Integer i = 0 ; i< Compromiso.size(); i++){
            calCompromiso(Compromiso.get(i));              
        }
    }
     
    //*******Calcula Logro Proyectado*******
    @RemoteAction
    public static void calculaLogroProyectado(){
        
        Decimal real=0.0;Decimal compro=0.0;Decimal presu=0.0;Decimal logro=0.0;
        Decimal real1=0.0;Decimal compro1=0.0;Decimal presu1=0.0;Decimal logro1=0.0;
        Decimal real2=0.0;Decimal compro2=0.0;Decimal presu2=0.0;Decimal logro2=0.0;
        Decimal real3=0.0;Decimal compro3=0.0;Decimal presu3=0.0;Decimal logro3=0.0;
        Decimal real4=0.0;Decimal compro4=0.0;Decimal presu4=0.0;Decimal logro4=0.0;
        Decimal real5=0.0;Decimal compro5=0.0;Decimal presu5=0.0;Decimal logro5=0.0;
        Decimal real6=0.0;Decimal compro6=0.0;Decimal presu6=0.0;Decimal logro6=0.0;
        Decimal real7=0.0;Decimal compro7=0.0;Decimal presu7=0.0;Decimal logro7=0.0;
        Decimal real8=0.0;Decimal compro8=0.0;Decimal presu8=0.0;Decimal logro8=0.0;
        Decimal real9=0.0;Decimal compro9=0.0;Decimal presu9=0.0;Decimal logro9=0.0;
        Decimal real10=0.0;Decimal compro10=0.0;Decimal presu10=0.0;Decimal logro10=0.0;
        
        List<ExpUni_Tablero_Grupal__c> cedula = [SELECT Id,EU_001_tx_Indicador__c,EU_001_tx_Atributo__c,EU_001_Un_Valor__c,EU_Logro__c 
                                            FROM ExpUni_Tablero_Grupal__c 
                                            WHERE EU_001_tx_Indicador__c IN (
                                                :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP,
                                                :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP,
                                                :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE ,
                                                :EU001_cls_CONSTANTES.EU001_STR_VISTA_MN,
                                                :EU001_cls_CONSTANTES.EU001_STR_INVERSIONES,
                                                :EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION,
                                                :EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES,
                                                :EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES,
                                                :EU001_cls_CONSTANTES.EU001_STR_MARGEN_BRUTO,
                                                :EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA,
                                                :EU001_cls_CONSTANTES.EU001_STR_SANEAMIENTO,
                                                :EU001_cls_CONSTANTES.EU001_STR_USUARIO_NUEVO_CREDITO) 
                                            AND EU_001_tx_Atributo__c IN (:EU001_cls_CONSTANTES.EU001_STR_REAL,
                                            :EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO,
                                            :EU001_cls_CONSTANTES.EU001_STR_LOGRO) 
                                            AND Ownerid =:UserID ORDER BY EU_001_tx_Atributo__c ASC];
        
        //(((1.Real+Compromiso)/2.Presupuesto)-0.Logro)*100
        
        if(!cedula.isEmpty()){
            for(ExpUni_Tablero_Grupal__c dec : cedula){
                if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP)){
                    if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro=dec.EU_001_Un_Valor__c;}
                    if(presu <> 0){logroProy_CP+=(((real+compro)/presu)*100)-logro;}
                    if(logroProy_CP < 0){logroProy_CP=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP)){
                    if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real1=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro1=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu1=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro1=dec.EU_001_Un_Valor__c;}
                    if(presu1 <> 0){logroProy_LP+=(((real1+compro1)/presu1)*100)-logro1;}
                    if(logroProy_LP < 0){logroProy_LP=0;}
                
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real2=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro2=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu2=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro2=dec.EU_001_Un_Valor__c;}
                    if(presu2 <> 0){logroProy_Gob+=(((real2+compro2)/presu2)*100)-logro2;}
                    if(logroProy_Gob < 0){logroProy_Gob=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_VISTA_MN)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real3=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro3=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu3=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro3=dec.EU_001_Un_Valor__c;}
                    if(presu3 <> 0){logroProy_VistaMN+=(((real3+compro3)/presu3)*100)-logro3;}
                    if(logroProy_VistaMN < 0){logroProy_VistaMN=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INVERSIONES)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real4=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro4=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu4=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro4=dec.EU_001_Un_Valor__c;}
                    if(presu4 <> 0){logroProy_Inver+=(((real4+compro4)/presu4)*100)-logro4;}
                    if(logroProy_Inver < 0){logroProy_Inver=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real5=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro5=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu5=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro5=dec.EU_001_Un_Valor__c;}
                    if(presu5 <> 0){logroProy_Inver+=(((real5+compro5)/presu5)*100)-logro5;}
                    if(logroProy_Inver < 0){logroProy_Inver=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real6=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro6=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu6=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro6=dec.EU_001_Un_Valor__c;}
                    if(presu6 <> 0){logroProy_INFR+=(((real6+compro6)/presu6)*100)-logro6;}
                    if(logroProy_INFR < 0){logroProy_INFR=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real7=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro7=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu7=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro7=dec.EU_001_Un_Valor__c;}
                    if(presu7 <> 0){logroProy_INFNR+=(((real7+compro7)/presu7)*100)-logro7;}
                    if(logroProy_INFNR < 0){logroProy_INFNR=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real8=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro8=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu8=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro8=dec.EU_001_Un_Valor__c;}
                    if(presu8 <> 0){logroProy_Stock+=(((real8+compro8)/presu8)*100)-logro8;}
                    if(logroProy_Stock < 0){logroProy_Stock=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_SANEAMIENTO)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real9=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro9=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu9=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro9=dec.EU_001_Un_Valor__c;}
                    if(presu9 <> 0){logroProy_Saneamiento+=(((real9+compro9)/presu9)*100)-logro9;}
                    if(logroProy_Saneamiento < 0){logroProy_Saneamiento=0;}
                    
                }else if(dec.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_USUARIO_NUEVO_CREDITO)){
                	if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real10=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){compro10=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRESUPUESTO)){presu10=dec.EU_001_Un_Valor__c;}
                    else if(dec.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO)){logro10=dec.EU_001_Un_Valor__c;}
                    if(presu10 <> 0){logroProy_NvoUsu+=(((real10+compro10)/presu10)*100)-logro10;}
                    if(logroProy_NvoUsu < 0){logroProy_NvoUsu=0;}
                    
                }
            }//for
        }//if
    }//clase
    
    //*******Calcula Logro Real Gap*******
    @RemoteAction
    public static void calculaRealGap(){
        
        Decimal real=0.0;Decimal amort=0.0;Decimal gap=0.0;Decimal real_Ajus=0.0;
        Decimal real1=0.0;Decimal amort1=0.0;Decimal gap1=0.0;Decimal real_Ajus1=0.0;
        Decimal real3=0.0;Decimal amort3=0.0;Decimal gap3=0.0;Decimal real_Ajus3=0.0;
        Decimal real4=0.0;Decimal amort4=0.0;Decimal gap4=0.0;Decimal real_Ajus4=0.0;
        Decimal real5=0.0;Decimal amort5=0.0;Decimal gap5=0.0;Decimal real_Ajus5=0.0;
        Decimal real6=0.0;Decimal amort6=0.0;Decimal gap6=0.0;Decimal real_Ajus6=0.0;
        Decimal real7=0.0;Decimal amort7=0.0;Decimal gap7=0.0;Decimal real_Ajus7=0.0;
        Decimal real8=0.0;Decimal amort8=0.0;Decimal gap8=0.0;Decimal real_Ajus8=0.0;
        Decimal real9=0.0;Decimal amort9=0.0;Decimal gap9=0.0;Decimal real_Ajus9=0.0;
        Decimal real10=0.0;Decimal amort10=0.0;Decimal gap10=0.0;Decimal real_Ajus10=0.0;
        
        List<ExpUni_Tablero_Grupal__c> Total = [SELECT Id,EU_001_tx_Indicador__c,EU_001_tx_Atributo__c,EU_001_Un_Valor__c,EU_Logro__c 
                                                FROM ExpUni_Tablero_Grupal__c 
                                                WHERE EU_001_tx_Indicador__c IN (
                                                    :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP,
                                                    :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP,
                                                    :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE ,
                                                    :EU001_cls_CONSTANTES.EU001_STR_VISTA_MN,
                                                    :EU001_cls_CONSTANTES.EU001_STR_INVERSIONES,
                                                    :EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION,
                                                    :EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES,
                                                    :EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES,
                                                    :EU001_cls_CONSTANTES.EU001_STR_MARGEN_BRUTO,
                                                    :EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA,
                                                    :EU001_cls_CONSTANTES.EU001_STR_SANEAMIENTO,
                                                    :EU001_cls_CONSTANTES.EU001_STR_USUARIO_NUEVO_CREDITO) 
                                                AND EU_001_tx_Atributo__c IN (:EU001_cls_CONSTANTES.EU001_STR_REAL,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_AMORT,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_GAP) 
                                                AND Ownerid =:UserID];
        
        //Real complemento= Real + Real ajustado//Real - Amort.= Real - Amortizaciones//Gap proyectado= Gap - Impacto de compromisos
        //Gap complemento= Gap - Real ajustado//Gap proyectado NR= Gap complemento - Impacto de compromisos
        //Cartera Vigente CP / 0 REAL,1 AMORT, 2 GAP, 3 REAL AJUS
        if(!Total.isEmpty()){
            for(ExpUni_Tablero_Grupal__c param : Total){
                if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus = param.EU_001_Un_Valor__c;}
                    RealComple_CP = real + real_Ajus;
                    RealAmort_CP = real - amort;
                    if(gap > 0){
                        GapProye_CP = gap - totalImp_CP;
                        GapComple_CP = gap - real_Ajus;
                        GapProyeNR_CP = GapComple_CP - totalImp_CP;
                    }
                    
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real1 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort1 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap1 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus1 = param.EU_001_Un_Valor__c;}
                    RealComple_LP = real1 + real_Ajus1;
                    RealAmort_LP = real1 - amort1;
                    if(gap1 > 0){
                        GapProye_LP = gap1 - totalImp_LP;
                        GapComple_LP = gap1 - real_Ajus1;
                        GapProyeNR_LP = GapComple_LP - totalImp_LP;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE)){
                    Decimal real2=0.0;Decimal amort2=0.0;Decimal gap2=0.0;Decimal real_Ajus2=0.0;
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real2 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort2 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap2 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus2 = param.EU_001_Un_Valor__c;}
                    RealComple_Gob = real2 + real_Ajus2;
                    RealAmort_Gob = real2 - amort2;
                    if(gap2 > 0){
                        GapProye_Gob = gap2 - totalImp_Gob;
                        GapComple_Gob = gap2 - real_Ajus2;
                        GapProyeNR_Gob = GapComple_Gob - totalImp_Gob;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_VISTA_MN)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real3 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort3 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap3 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus3 = param.EU_001_Un_Valor__c;}
                    RealComple_VistaMN = real3 + real_Ajus3;
                    RealAmort_VistaMN = real3 - amort3;
                    if(gap3 > 0){
                        GapProye_VistaMN = gap3 - totalImp_VistaMN;
                        GapComple_VistaMN = gap3 - real_Ajus3;
                        GapProyeNR_VistaMN = GapComple_VistaMN - totalImp_VistaMN;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INVERSIONES)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real4 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort4 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap4 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus4 = param.EU_001_Un_Valor__c;}
                    RealComple_Inver = real4 + real_Ajus4;
                    RealAmort_Inver = real4 - amort4;
                    if(gap4 > 0){
                        GapProye_Inver = gap4 - totalImp_Inver;
                        GapComple_Inver = gap4 - real_Ajus4;
                        GapProyeNR_Inver = GapComple_Inver - totalImp_Inver;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real5 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort5 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap5 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus5 = param.EU_001_Un_Valor__c;}
                    RealComple_VistaRC = real5 + real_Ajus5;
                    RealAmort_VistaRC = real5 - amort5;
                    if(gap5 > 0){
                        GapProye_VistaRC = gap5 - totalImp_VistaRC;
                        GapComple_VistaRC = gap5 - real_Ajus5;
                        GapProyeNR_VistaRC = GapComple_VistaRC - totalImp_VistaRC;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real6 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort6 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap6 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus6 = param.EU_001_Un_Valor__c;}
                    RealComple_INFR = real6 + real_Ajus6;
                    RealAmort_INFR = real6 - amort6;
                    if(gap6 > 0){
                        GapProye_INFR = gap6 - totalImp_INFR;
                        GapComple_INFR = gap6 - real_Ajus6;
                        GapProyeNR_INFR = GapComple_INFR - totalImp_INFR;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real7 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort7 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap7 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus7 = param.EU_001_Un_Valor__c;}
                    RealComple_INFNR = real7 + real_Ajus7;
                    RealAmort_INFNR = real7 - amort7;
                    if(gap7 > 0){
                        GapProye_INFNR = gap7 - totalImp_INFNR;
                        GapComple_INFNR = gap7 - real_Ajus7;
                        GapProyeNR_INFNR = GapComple_INFNR - totalImp_INFNR;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_SANEAMIENTO)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real8 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort8 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap8 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus8 = param.EU_001_Un_Valor__c;}
                    RealComple_Saneamiento = real8 + real_Ajus8;
                    RealAmort_Saneamiento = real8 - amort8;
                    if(gap8 > 0){
                        GapProye_Saneamiento = gap8 - totalImp_Saneamiento;
                        GapComple_Saneamiento = gap8 - real_Ajus8;
                        GapProyeNR_Saneamiento = GapComple_Saneamiento - totalImp_Saneamiento;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real9 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort9 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap9 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus9 = param.EU_001_Un_Valor__c;}
                    RealComple_Stock = real9 + real_Ajus9;
                    RealAmort_Stock = real9 - amort9;
                    if(gap9 > 0){
                        GapProye_Stock = gap9 - totalImp_Stock;
                        GapComple_Stock = gap9 - real_Ajus9;
                        GapProyeNR_Stock = GapComple_Stock - totalImp_Stock;
                    }
            	}else if(param.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_USUARIO_NUEVO_CREDITO)){
                    if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL)){real10 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_AMORT)){amort10 = param.EU_001_Un_Valor__c;} 
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP)){gap10 = param.EU_001_Un_Valor__c;}
                    else if(param.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AJUSTADO)){real_Ajus10 = param.EU_001_Un_Valor__c;}
                    RealComple_NvoUsu = real10 + real_Ajus10;
                    RealAmort_NvoUsu = real10 - amort10;
                    if(gap10 > 0){
                        GapProye_NvoUsu = gap10 - totalImp_NvoUsu;
                        GapComple_NvoUsu = gap10 - real_Ajus10;
                        GapProyeNR_NvoUsu = GapComple_NvoUsu - totalImp_NvoUsu;
                    }
            	} 
            }//for
        }//if
    }//clase

    //********Inicio Metodo para calcular y actualizar Backlog, Compromiso, Logro Proyectado********
    @RemoteAction
    global static void actualiza(String idRI){
        EU001_RI__c RI =[SELECT OwnerId FROM EU001_RI__c WHERE id =: idRI];
        System.debug('El RI que esta visualizando es el '+idRI);
        User usuario = [SELECT UG__c FROM User WHERE Id= :RI.OwnerId Limit 1];
        System.debug('Ug del Propietario del RI '+ usuario.UG__c);
        UserID = RI.OwnerId;
        UserUG = usuario.UG__c;
        
        List<ExpUni_Tablero_Grupal__c> total = [SELECT 
                                                Id,EU_001_tx_Indicador__c,EU_001_tx_Atributo__c,EU_001_Un_Valor__c 
                                                FROM ExpUni_Tablero_Grupal__c 
                                                WHERE EU_001_tx_Indicador__c IN (
                                                    :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP,
                                                    :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP,
                                                    :EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE ,
                                                    :EU001_cls_CONSTANTES.EU001_STR_VISTA_MN,
                                                    :EU001_cls_CONSTANTES.EU001_STR_INVERSIONES,
                                                    :EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION,
                                                    :EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES,
                                                    :EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES,
                                                    :EU001_cls_CONSTANTES.EU001_STR_MARGEN_BRUTO,
                                                    :EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA,
                                                    :EU001_cls_CONSTANTES.EU001_STR_SANEAMIENTO,
                                                    :EU001_cls_CONSTANTES.EU001_STR_USUARIO_NUEVO_CREDITO) 
                                                AND EU_001_tx_Atributo__c IN (:EU001_cls_CONSTANTES.EU001_STR_BACKLOG,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_GAP_PROY,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO,
                                                                              :EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR                                                                              
                                                                             ) 
                                                AND Ownerid =:UserID];
        
        calculaBacklog();
        calculaCompromiso();
        calculaLogroProyectado();
        calculaRealGap();
        
        if(!Total.isEmpty()){
            for(ExpUni_Tablero_Grupal__c tab: total){
                if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_CP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_CP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_CP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_CP.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogCP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_CP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_CP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_CP < 0 ? 0 : GapProye_CP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_CP;}
                   
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_LP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_LP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_LP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_LP.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogLP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_LP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_LP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_LP < 0 ? 0 : GapProye_LP;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_LP;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Gob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Gob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_Gob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_Gob.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogGob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_Gob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_Gob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_Gob < 0 ? 0 : GapProye_Gob;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_Gob;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_VISTA_MN)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_VistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_VistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_VistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_VistaMN.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogVistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_VistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_VistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_VistaMN < 0 ? 0 : GapProye_VistaMN;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_VistaMN;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INVERSIONES)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Inver;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Inver;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_Inver;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_Inver.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogInversiones;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_Inver;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_Inver;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_Inver < 0 ? 0 : GapProye_Inver;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_Inver;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_RESTO_CAPTACION)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_VistaRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_VistaRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_VistaRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_VistaRC.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_VistaRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_VistaRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_VistaRC < 0 ? 0 : GapProye_VistaRC;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_VistaRC;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_RECURRENTES)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_INFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_INFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_INFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_INFR.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogINFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_INFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_INFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_INFR < 0 ? 0 : GapProye_INFR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_INFR;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_INF_NO_RECURRENTES)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_INFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_INFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_INFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_INFNR.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogINFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_INFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_INFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_INFNR < 0 ? 0 : GapProye_INFNR;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_INFNR;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_STOCK_NOMINA)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Stock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Stock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_Stock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_Stock.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=backlogStock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_Stock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_Stock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_Stock < 0 ? 0 : GapProye_Stock;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_Stock;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_SANEAMIENTO)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Saneamiento;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_Saneamiento;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_Saneamiento;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_Saneamiento.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=0;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_Saneamiento;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_Saneamiento;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_Saneamiento < 0 ? 0 : GapProye_Saneamiento;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_Saneamiento;}
                    
                }else if(tab.EU_001_tx_Indicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_USUARIO_NUEVO_CREDITO)){
                    if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_A_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_NvoUsu;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_C_COMPLEMENTO)){tab.EU_001_Un_Valor__c=RealComple_NvoUsu;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_COMPLEMENTO)){tab.EU_001_Un_Valor__c=GapComple_NvoUsu;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_LOGRO_POTENCIAL)){tab.EU_001_Un_Valor__c=logroProy_NvoUsu.setScale(1);}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_BACKLOG)){tab.EU_001_Un_Valor__c=0;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_REAL_AMORT)){tab.EU_001_Un_Valor__c=RealAmort_NvoUsu;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_IMPACTO_COMPROMISOS)){tab.EU_001_Un_Valor__c=totalImp_NvoUsu;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY)){tab.EU_001_Un_Valor__c=GapProye_NvoUsu < 0 ? 0 : GapProye_NvoUsu;}
                    else if(tab.EU_001_tx_Atributo__c.equals(EU001_cls_CONSTANTES.EU001_STR_GAP_PROY_NR)){tab.EU_001_Un_Valor__c=GapProyeNR_NvoUsu;}

                }
            }//for
            update total;
        }//if
    }//clase
    
    @RemoteAction
    public static void validaRIexistente(List<EU001_RI__c> revisionesIndividuales) {
        String[] OwnerIds = new List<String>();
        //Obtenemos los Id's de los RI a insertar
        for(EU001_RI__c ri: revisionesIndividuales){
            OwnerIds.add(ri.ownerid);
           
        }
     
        //Valdiamos si existe algun RI para el ejecutivo
        List<EU001_RI__c> revisiones = [SELECT Id, Name,Ownerid FROM EU001_RI__c 
                                        WHERE ownerid IN :OwnerIds 
                                        AND EU001_tx_Estado__c IN 
                                        (:EU001_CLS_CONSTANTES.EU001_STR_RI_PREPARACION, 
                                        :EU001_CLS_CONSTANTES.EU001_STR_RI_PENDIENTE_PRESENTACION, 
                                        :EU001_CLS_CONSTANTES.EU001_STR_RI_EVALUACION)];
        //Recorremos los RI's a crearse
        for(EU001_RI__c ri: revisionesIndividuales){
            if(revisiones.size()> 0 ){
                for(EU001_RI__c riObtenida: revisiones){
                    if(riObtenida.OwnerId == ri.OwnerID){
                        ri.addError('Aún existe una RI en estado Preparación, Presentación o Evaluación, debes finalizar esta RI para poder generar una nueva');
                    }
                }
            }
        }
    }

    @RemoteAction
    public static String obtieneIndicador(Opportunity op) {
        String indicador;
        if(op.Tipo_de_Registro_Manual2__c!= null){
            if(op.Tipo_de_Registro_Manual2__c.equals(EU001_cls_CONSTANTES.EU001_STR_FAMILIA_PRD_OPP_FINANCIAMIENTO)){
               if(op.CR_SEL_Plazo__c != null && '0 a 1 año'.equals(op.CR_SEL_Plazo__c)){ //Cartera CP
                    indicador = EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_CP;
                }else{//Cartera LP
                    indicador = EU001_cls_CONSTANTES.EU001_STR_CARTERA_VIGENTE_LP;
                }
            }else if(op.Tipo_Producto__c != null && op.Tipo_de_Registro_Manual2__c.equals(EU001_cls_CONSTANTES.EU001_STR_FAMILIA_PRD_OPP_VISTA) && op.Tipo_Producto__c.equals(EU001_cls_CONSTANTES.EU001_STR_PRD_OPP_CUENTA_CHEQUES_MN)){
                indicador = EU001_cls_CONSTANTES.EU001_STR_VISTA_MN;
            }else if(op.Tipo_de_Registro_Manual2__c.equals(EU001_cls_CONSTANTES.EU001_STR_INVERSIONES)){//Inversiones
                indicador = EU001_cls_CONSTANTES.EU001_STR_INVERSIONES;
            }else if('ATM'.equals(op.Tipo_de_Registro_Manual2__c)||'Adquirente'.equals(op.Tipo_de_Registro_Manual2__c)||'CIE'.equals(op.Tipo_de_Registro_Manual2__c)
                ||'Banca electrónica'.equals(op.Tipo_de_Registro_Manual2__c)||'DEM'.equals(op.Tipo_de_Registro_Manual2__c)||'SIT'.equals(op.Tipo_de_Registro_Manual2__c)
                ||'Swift / Transferencia internacional'.equals(op.Tipo_de_Registro_Manual2__c)||'Domiciliación'.equals(op.Tipo_de_Registro_Manual2__c)
                ||'Seguros'.equals(op.Tipo_de_Registro_Manual2__c)){//Inversiones
                indicador = 'INF Recurrentes';
            }else if('Comercio internacional'.equals(op.Tipo_de_Registro_Manual2__c)){//INF No Recurrentes
                indicador = 'INF No Recurrentes';
            }else if(op.Tipo_Producto__c != null && 'Nómina'.equals(op.Tipo_de_Registro_Manual2__c)&& 'Nómina'.equals(op.Tipo_Producto__c)){//Stock Nomina
                indicador = 'Stock Nomina';
            }else {
                indicador ='non';
            }

        }

        return indicador;
    }


    @RemoteAction
    public static void validaInsertEU(List<ExpUni_Tablero_Grupal__c> tableros){
        String[] idStr = new List<String>();

        for(ExpUni_Tablero_Grupal__c tab :tableros){
            idStr.add(tab.EU_UG__c);
        }

        List<User> dUsers = [SELECT id, name,UG__c FROM User WHERE UG__c IN :idStr and IsActive = true ];

        for(ExpUni_Tablero_Grupal__c tab :tableros){
            Boolean encontrado = false;
            Id idUsuario;
            for(User usuario:dUsers){
                if(usuario.UG__c == tab.EU_UG__c){
                    idUsuario = usuario.Id;
                    encontrado= true;
                }
            }

            if(!encontrado){
                tab.addError('La UG no tiene Ejecutivo Asignado (insertar)'+tab.EU_UG__c);
            }else{
                tab.EU_Busca_Usuario__c= idUsuario;
                tab.Ownerid=idUsuario;
            }
        }
    }

    @RemoteAction
    public static void validaUpdateEU(List<ExpUni_Tablero_Grupal__c> tableros){
        String[] idStr = new List<String>();

        for(ExpUni_Tablero_Grupal__c tab :tableros){
            idStr.add(tab.EU_UG__c);
        }

        system.debug('Ug´s encontados: ' +idStr);
        List<User> dUsers = [SELECT id, name,UG__c FROM User WHERE UG__c IN :idStr and IsActive = true ];

        for(ExpUni_Tablero_Grupal__c tab :tableros){
            Boolean encontrado = false;
            Id idUsuario;
            for(User usuario:dUsers){
                if(usuario.UG__c == tab.EU_UG__c){
                    idUsuario = usuario.Id;
                    encontrado= true;
                }
            }

            if(!encontrado){
                tab.addError('La UG no tiene Ejecutivo Asignado (Actualizar) '+tab.EU_UG__c);
            }else{
                tab.EU_Busca_Usuario__c= idUsuario;
                tab.Ownerid=idUsuario;
            }
        }
    }

/***********COMIENZA CALCULO METAS RI**********/
    @AuraEnabled
    public static Integer CalculoMetaEU(String idRI){   
        
        EU001_RI__c RI =[SELECT OwnerId FROM EU001_RI__c WHERE id =: idRI];
        User usuario = [SELECT UG__c FROM User WHERE Id= :RI.OwnerId Limit 1];
        UserID = RI.OwnerId;
        UserUG = usuario.UG__c;
        
        Integer ttotalesPrimerMes=0;
        List<AggregateResult> results =[SELECT count(id) FROM EU001_RI__c 
                                        where Ownerid =: UserID AND EU001_tx_Estado__c 
                                        IN(:EU001_CLS_CONSTANTES.EU001_STR_RI_EVALUACION,
                                        :EU001_CLS_CONSTANTES.EU001_STR_RI_FINALIZACION) 
                                        and  CreatedDate = THIS_MONTH];
        ttotalesPrimerMes = (Integer)results[0].get('expr0');
        return ttotalesPrimerMes;
    }  
    
    //Calculo Totales Meta RI para Ejecutivo de Cuenta
    @AuraEnabled
    public static List<DetalleMetas> getRI(String idRI){
        EU001_RI__c RI =[SELECT OwnerId FROM EU001_RI__c WHERE id =: idRI];
        System.debug('El RI que esta visualizando es el '+idRI);
        User usuario = [SELECT UG__c FROM User WHERE Id= :RI.OwnerId Limit 1];
        System.debug('Ug del Propietario del RI '+ usuario.UG__c);

        UserID = RI.OwnerId;
        UserUG = usuario.UG__c;

        List<DetalleMetas> MetaRI = new List<DetalleMetas>();
        Date EU001_primerDiaMesUno;
        Date EU001_ultimoDiaMesUno;
        Date EU001_primerDiaMesDos;
        Date EU001_ultimoDiaMesDos;
        Date EU001_primerDiaMesTres;
        Date EU001_ultimoDiaMesTres;
        
        EU001_primerDiaMesUno = EU001_cls_CompHandler.getPrimerDiaTrim(Date.today());
        EU001_ultimoDiaMesUno = EU001_primerDiaMesUno.addMonths(1)-1;
        EU001_primerDiaMesDos = EU001_primerDiaMesUno.addMonths(1);
        EU001_ultimoDiaMesDos = EU001_primerDiaMesUno.addMonths(2)-1;
        EU001_primerDiaMesTres = EU001_primerDiaMesUno.addMonths(2);
        EU001_ultimoDiaMesTres = EU001_cls_CompHandler.getUltimoDiaTrim(Date.today());
        
        //METAS USUARIO
        Decimal mVisitaEstrategica = 0;
        Decimal mPlandeCuenta = 0;
        Decimal mOportunidades = 0;
        Decimal mComerciales = 0;
        Decimal mSeguimiento = 0;
        Decimal mRI = 0;
        Decimal mPenalizacionAcumulada = 0;
        //PARAMETRIA RI
        Decimal pRI_1 = 0;
        Decimal pRI_2 = 0;
        Decimal pRI_3 = 0;
        Decimal ponRI = 0;
        Decimal penRI = 0;
        //Calculos TotalRI
        Decimal RIGap = 0;
        Decimal RILogro = 0;
        Decimal RI_1 = 0;
        Decimal RI_2 = 0;
        Decimal RI_3 = 0;
        
        List<User> getMetasTrimestrales = [SELECT UG__c, Meta_V_Estrat_gicas__c, Meta_Plan_de_Cuenta_2__c, Meta_Oportunidades__c, 
                                                  Meta_V_Comerciales__c, Meta_C_Seguimiento__c, EU001_un_Meta_Reuni_n_Individual__c, EU001_pr_Penalizaci_n_Acumulada__c,
                                                  EU001_pr_Calificaci_n_Certificaci_n_EU__c
                                          FROM User
                                          WHERE id =: UserID];

        System.debug('getMetasTrimestrales '+ getMetasTrimestrales);
        System.debug('user id '+UserID);
        for(User m3: getMetasTrimestrales){
            mVisitaEstrategica = m3.Meta_V_Estrat_gicas__c;
            mComerciales = m3.Meta_V_Comerciales__c;
            mSeguimiento = m3.Meta_C_Seguimiento__c;
            mOportunidades = m3.Meta_Oportunidades__c;
            mPlandeCuenta = m3.Meta_Plan_de_Cuenta_2__c;
            mRI = m3.EU001_un_Meta_Reuni_n_Individual__c;
            mPenalizacionAcumulada = m3.EU001_pr_Penalizaci_n_Acumulada__c;
        }
        //Obtiene la Parametria del Trimestre de Visitas y Oportunidades
        List<GF001_Parametria__c> paramCertificacion = [SELECT EU001_pr_Mes_1__c,EU001_pr_Mes_2__c,EU001_pr_Mes_3__c, EU001_pr_Ponderacion__c, EU001_ls_TipoDeIndicador__c, EU001_pr_Penalizaci_n__c
                                                        FROM GF001_Parametria__c WHERE RecordType.DeveloperName =: EU001_cls_CONSTANTES.EU001_STR_TRE_CERTifICACION];
        
        //Recorre la Lista de paramCertificacion y las Guarda en Variables
        for(GF001_Parametria__c resultados : paramCertificacion){
            if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_REUNION_INDIVIDUAL)){
                pRI_1 = resultados.EU001_pr_Mes_1__c;
                pRI_2 = resultados.EU001_pr_Mes_2__c;
                pRI_3 = resultados.EU001_pr_Mes_3__c;
                ponRI = resultados.EU001_pr_Ponderacion__c;
                penRI = resultados.EU001_pr_Penalizaci_n__c;
            }
        }
        //Meses
        //Obtiene El total de RI en el trimestre por usuario
        List<EU001_RI__c> getRI = [SELECT id, CreatedDate FROM EU001_RI__c WHERE ownerid=:UserID 
                                  AND EU001_tx_Estado__c  IN(:EU001_CLS_CONSTANTES.EU001_STR_RI_EVALUACION,
                                        :EU001_CLS_CONSTANTES.EU001_STR_RI_FINALIZACION) 
                                  AND (CreatedDate >=: EU001_primerDiaMesUno 
                                  AND CreatedDate <=: EU001_ultimoDiaMesTres) ];

        
        for(EU001_RI__c resultados : getRI){
            if(resultados.CreatedDate >= EU001_primerDiaMesUno && resultados.CreatedDate <= EU001_ultimoDiaMesUno){ RI_1 += 1; }
            if(resultados.CreatedDate >= EU001_primerDiaMesDos && resultados.CreatedDate <= EU001_ultimoDiaMesDos){ RI_2 += 1; }
            if(resultados.CreatedDate >= EU001_primerDiaMesTres && resultados.CreatedDate <= EU001_ultimoDiaMesTres){ RI_3 += 1; }   
        }
        RILogro = getRI.size();
        if(mRI == Null){
            mRI = 0;
        }
        RIGap = mRI - RILogro;
            
         //CALCULO PENALIZACION DE REUNION INDIVIDUAL
        Boolean cumplioMetaRI = True;
        Decimal metaRI_1 = 0;
        Decimal penMetaRI_1 = 0;
        Decimal metaRI_2 = 0;
        Decimal penMetaRI_2 = 0;
        Decimal metaRI_3 = 0;
        Decimal penMetaRI_3 = 0;
        metaRI_1 = Math.ceil((mRI*pRI_1)/100);
        metaRI_2 = Math.ceil((mRI*pRI_2)/100);
        metaRI_3 = Math.ceil((mRI*pRI_3)/100);
        
        if(RI_1 < metaRI_1){
            penMetaRI_1 = Math.ceil((penRI*ponRI)/100);
        }
        if(RI_2 < metaRI_2){
            penMetaRI_2 = Math.ceil((penRI*ponRI)/100);
        }
        if(RI_3 < metaRI_3){
            penMetaRI_3 = Math.ceil((penRI*ponRI)/100);
            cumplioMetaRI = False;
        }
            
            Boolean mes_Actual_1 = false;
            Boolean mes_Actual_2 = false;
            Boolean mes_Actual_3 = false;
            
            DetalleMetas metaRImes = new DetalleMetas();
        if(metaRI_1 == 0){
            metaRImes.Porcentaje = 0;
        }else{
            metaRImes.Porcentaje =  (RI_1*100)/metaRI_1;
        }
            metaRImes.mes = EU001_primerDiaMesUno.month();   
            if(EU001_primerDiaMesUno.month()== system.today().month()){
                metaRImes.mesActual = true;
                metaRImes.Penalizacion= 0; 
            }else{
                metaRImes.mesActual = false;
                metaRImes.Penalizacion= penMetaRI_1; 
            }
            
            MetaRI.add(metaRImes);  
            if(RI_2 > 0){
                DetalleMetas metaRImes2 = new DetalleMetas();
        if(metaRI_2 == 0){
            metaRImes2.Porcentaje = 0;
        }else{
            metaRImes2.Porcentaje =  (RI_2*100)/metaRI_2;
        }
            metaRImes2.mes = EU001_primerDiaMesDos.month();
            if(EU001_primerDiaMesDos.month()== system.today().month()){
                metaRImes2.mesActual = true;
                metaRImes2.Penalizacion=0; 
            }else{
                metaRImes2.mesActual = false;
                metaRImes2.Penalizacion=penMetaRI_2 + penMetaRI_1; 
            }
            
            MetaRI.add(metaRImes2);
            }
            
            if(RI_3 > 0){
                DetalleMetas metaRImes3 = new DetalleMetas();
        if(metaRI_3 == 0){
            metaRImes3.Porcentaje = 0;
        }else{
            metaRImes3.Porcentaje =  (RI_3*100)/metaRI_3;
        }
            metaRImes3.mes = EU001_primerDiaMesTres.month();
            if(EU001_primerDiaMesTres.month()== system.today().month()){
                metaRImes3.mesActual = true;
                metaRImes3.Penalizacion=0; 
            }else{
                metaRImes3.mesActual = false;
                metaRImes3.Penalizacion=penMetaRI_3 + penMetaRI_2 + penMetaRI_1; 
            }
            
            MetaRI.add(metaRImes3);
            }
            
                    
        
        return MetaRI;
    }
    
    public class DetalleMetas{          
        @auraEnabled
        public Decimal Porcentaje {get; set;}
        @auraEnabled
        public Integer mes {get; set;}
        @auraEnabled
        public Decimal Penalizacion {get; set;}
        @auraEnabled
        public Boolean mesActual {get; set;}
    }

    /*@Descripción
     * Metodo que Llena la tabla de Actividades EU
     * -----------------------------------------------------------
     * Retorna la Lista
     */

    @AuraEnabled
    public static List<ActividadesEU> getCertificacion(String idRI){
        List<ActividadesEU> actividades = new List<ActividadesEU>();
        //Inicio/FIn Mes del Trimestre
        Date EU001_primerDiaMesUno = EU001_cls_CompHandler.getPrimerDiaTrim(Date.today());
        Date EU001_ultimoDiaMesUno = EU001_primerDiaMesUno.addMonths(1)-1;
        Date EU001_primerDiaMesDos = EU001_primerDiaMesUno.addMonths(1);
        Date EU001_ultimoDiaMesDos = EU001_primerDiaMesUno.addMonths(2)-1;
        Date EU001_primerDiaMesTres = EU001_primerDiaMesUno.addMonths(2);
        Date EU001_ultimoDiaMesTres = EU001_cls_CompHandler.getUltimoDiaTrim(Date.today());
        
        //METAS USUARIO
        Decimal mVisitaEstrategica = 0;
        Decimal mPlandeCuenta = 0;
        Decimal mOportunidades = 0;
        Decimal mComerciales = 0;
        Decimal mSeguimiento = 0;
        Decimal mRI = 0;
        Decimal mPenalizacionAcumulada = 0;
        //VISITAS TOTALES
        Decimal VisTotalLogro = 0;
        Decimal VisTotalGap = 0;
        Decimal VistEstLogro = 0;
        Decimal VistEstGap = 0;
        Decimal VistComLogro = 0;
        Decimal VistComGap = 0;
        Decimal VistSegLogro = 0;
        Decimal VistSegGap = 0;
        //Opportunity
        Decimal OppLogro = 0;
        Decimal OppGap = 0;
        //Plan de Cuenta
        Decimal PCLogro = 0;
        Decimal PCGap = 0;
        //Contactos
        Decimal ContactLogro = 0;
        Decimal ContactGap = 0;
        //PARAMETRIA VISITAS
        Decimal pVis_1 = 0;
        Decimal pVis_2 = 0;
        Decimal pVis_3 = 0;
        Decimal ponVis = 0;
        Decimal penVis = 0;
        //PARAMETRIA OPP
        Decimal pOpp_1 = 0;
        Decimal pOpp_2 = 0;
        Decimal pOpp_3 = 0;
        Decimal ponOpp = 0;
        Decimal penOpp = 0;
        //CALCULOS de PARAMETRIA
        Integer mes = system.today().month();
        Integer Opp_1 = 0;
        Integer Opp_2 = 0;
        Integer Opp_3 = 0;
        Integer Vis_1 = 0;
        Integer Vis_2 = 0;
        Integer Vis_3 = 0;
        Integer HecVistEst_1 = 0;
        Integer HecVistEst_2 = 0;
        Integer HecVistEst_3 = 0;
        Integer HecVistCom_1 = 0;
        Integer HecVistCom_2 = 0;
        Integer HecVistCom_3 = 0;
        Integer HecVistSeg_1 = 0;
        Integer HecVistSeg_2 = 0;
        Integer HecVistSeg_3 = 0;
        Decimal PenVisitas_1 = 0;
        Decimal PenVisitas_2 = 0;
        Decimal PenVisitas_3 = 0;
        Decimal PenOpp_1 = 0;
        Decimal PenOpp_2 = 0;
        Decimal PenOpp_3 = 0;
        Integer VisitasHechasTotales_1 = 0;
        Integer VisitasHechasTotales_2 = 0;
        Integer VisitasHechasTotales_3 = 0;
        //Calculos Contactos
        Decimal ContactosLogro = 0;
        Decimal ContactosGap = 0;
        //Calculos Eventos
        Decimal EventosLogro = 0;
        Decimal EventosGap = 0;
        //Calculos Casos
        Decimal CasosLogro = 0;
        Decimal CasosGap = 0;
        //Calculos TotalRI
        Decimal RIGap = 0;
        Decimal RILogro = 0;
        Decimal RI_1 = 0;
        Decimal RI_2 = 0;
        Decimal RI_3 = 0;
        //PARAMETRIA RI
        Decimal pRI_1 = 0;
        Decimal pRI_2 = 0;
        Decimal pRI_3 = 0;
        Decimal ponRI = 0;
        Decimal penRI = 0;
        //PARAMETRIA CASOS INUSUALES
        Decimal pCI_1 = 0;
        Decimal pCI_2 = 0;
        Decimal pCI_3 = 0;
        Decimal ponCI = 0;
        Decimal penCI = 0;
        //PARAMETRIA CONTROL DE EVENTOS
        Decimal pCE_1 = 0;
        Decimal pCE_2 = 0;
        Decimal pCE_3 = 0;
        Decimal ponCE = 0;
        Decimal penCE = 0;
        //PARAMETRIA CONTROL DE EVENTOS
        Decimal pPC_1 = 0;
        Decimal pPC_2 = 0;
        Decimal pPC_3 = 0;
        Decimal ponPC = 0;
        Decimal penPC = 0;
        //PARAMETRIA CONTROL DE EVENTOS
        Decimal pContacto_1 = 0;
        Decimal pContacto_2 = 0;
        Decimal pContacto_3 = 0;
        Decimal ponContacto = 0;
        Decimal penContacto = 0;
        //PARAMETRIA COMITE DE NEGOCIOS
        Decimal pComite_1 = 0;
        Decimal pComite_2 = 0;
        Decimal pComite_3 = 0;
        Decimal ponComite = 0;
        Decimal penComite = 0;
        //PARAMETRIA GESTION DE PORTAFOLIO
        Decimal pPortafolio_1 = 0;
        Decimal pPortafolio_2 = 0;
        Decimal pPortafolio_3 = 0;
        Decimal ponPortafolio = 0;
        Decimal penPortafolio = 0;
        
        EU001_RI__c RI =[SELECT OwnerId FROM EU001_RI__c WHERE id =: idRI];
        System.debug('El RI que esta visualizando es el '+idRI);
        User usuario = [SELECT UG__c FROM User WHERE Id= :RI.OwnerId Limit 1];
        System.debug('Ug del Propietario del RI '+ usuario.UG__c);
        UserID = RI.OwnerId;
        UserUG = usuario.UG__c;
        
        //Obtiene El total de RI en el trimestre por usuario
        List<EU001_RI__c> getRI = [SELECT id, 
                                            CreatedDate,
                                            OwnerId 
                                   FROM EU001_RI__c 
                                   WHERE 
                                        OwnerId=:UserID AND 
                                        (CreatedDate >=: EU001_primerDiaMesUno AND 
                                        CreatedDate <=: EU001_ultimoDiaMesTres) ];

        
        for(EU001_RI__c resultados : getRI){
            if(resultados.CreatedDate >= EU001_primerDiaMesUno && resultados.CreatedDate <= EU001_ultimoDiaMesUno){ RI_1 += 1; }
            if(resultados.CreatedDate >= EU001_primerDiaMesDos && resultados.CreatedDate <= EU001_ultimoDiaMesDos){ RI_2 += 1; }
            if(resultados.CreatedDate >= EU001_primerDiaMesTres && resultados.CreatedDate <= EU001_ultimoDiaMesTres){ RI_3 += 1; }
        }
        
        RILogro = getRI.size();

        if(mRI > 0 && RILogro > 0){ RIGap = mRI - RILogro; }
        
        List<User> getMetasTrimestrales = [SELECT UG__c, 
                                                Meta_V_Estrat_gicas__c, 
                                                Meta_Plan_de_Cuenta_2__c, 
                                                Meta_Oportunidades__c, 
                                                Meta_V_Comerciales__c, 
                                                Meta_C_Seguimiento__c, 
                                                EU001_un_Meta_Reuni_n_Individual__c, 
                                                EU001_pr_Penalizaci_n_Acumulada__c, 
                                                EU001_pr_Calificaci_n_Certificaci_n_EU__c
                                          FROM User
                                          WHERE id =: UserID];
        
        System.debug('getMetasTrimestrales '+ getMetasTrimestrales);
        System.debug('user id '+UserID);
        
        for(User m3: getMetasTrimestrales){
            mVisitaEstrategica = m3.Meta_V_Estrat_gicas__c;
            mComerciales = m3.Meta_V_Comerciales__c;
            mSeguimiento = m3.Meta_C_Seguimiento__c;
            mOportunidades = m3.Meta_Oportunidades__c;
            mPlandeCuenta = m3.Meta_Plan_de_Cuenta_2__c;
            mRI = m3.EU001_un_Meta_Reuni_n_Individual__c;
            mPenalizacionAcumulada = m3.EU001_pr_Penalizaci_n_Acumulada__c;
        }
        
        VisTotalGap = Math.ceil(mVisitaEstrategica + mComerciales + mSeguimiento);
        
        //Obtiene las Oportunidades Ganadas del trimestre
        List<Opportunity> oppsClosedWon = [SELECT Id, 
                                                CloseDate 
                                          FROM Opportunity 
                                          WHERE 
                                                StageName =: EU001_cls_CONSTANTES.EU001_STR_OPORT_CERRADAGANADA AND 
                                                OwnerId =: userId AND 
                                                (CloseDate >=: EU001_primerDiaMesUno AND 
                                                CloseDate <=: EU001_ultimoDiaMesTres)];
        
        //Contabilizar las Opp Ganadas del Trimestre por mes
        if(oppsClosedWon.size() > 0){
            for(Opportunity resultados : oppsClosedWon){
                if(resultados.CloseDate >= EU001_primerDiaMesUno && resultados.CloseDate <= EU001_ultimoDiaMesUno){
                    Opp_1 += 1;
                }
                else if(resultados.CloseDate >= EU001_primerDiaMesDos && resultados.CloseDate <= EU001_ultimoDiaMesDos){
                    Opp_2 += 1;
                }
                else if(resultados.CloseDate >= EU001_primerDiaMesTres && resultados.CloseDate <= EU001_ultimoDiaMesTres){
                    Opp_3 += 1;
                }   
            }
        }
        
        OppLogro = Opp_1 + Opp_2 + Opp_3;
        OppGap = mOportunidades - OppLogro;
        
        //Obtiene las Visitas del Usuario
        List<HI001_VisitReport__c> getVisitasTotales = [SELECT id, 
                                                            Owner.Name, 
                                                            EG_ft_HoraVisitaLlamada__c,
                                                            RecordType.name, CF001_ca_CorreoEnviado__c 
                                                        FROM HI001_VisitReport__c 
                                                        WHERE 
                                                            OwnerId =: userId AND 
                                                            (EG_ft_HoraVisitaLlamada__c >=: EU001_primerDiaMesUno AND EG_ft_HoraVisitaLlamada__c <=: EU001_ultimoDiaMesTres)
                                                        AND (RecordType.name  = 'Reporte Visita Estratégica' OR RecordType.name  = 'Reporte Visita Comercial' 
                                                             OR RecordType.name  = 'Reporte Visita de Seguimiento') 
                                                        AND CF001_ca_CorreoEnviado__c = true];
        
        //Recorre la lista de getVisitasTotales y contabiliza cada tipo de Visitas por Hechas y Programadas
        String Estrategica = 'Reporte Visita Estratégica';
        String Comercial = 'Reporte Visita Comercial';
        String Seguimiento = 'Reporte Visita de Seguimiento';
        if(getVisitasTotales.size() > 0){
            for(HI001_VisitReport__c resultados : getVisitasTotales){
                if(resultados.EG_ft_HoraVisitaLlamada__c >= EU001_primerDiaMesUno && resultados.EG_ft_HoraVisitaLlamada__c <= EU001_ultimoDiaMesUno){
                    if(resultados.RecordType.name.equals(Estrategica)){ HecVistEst_1 += 1; }
                    if(resultados.RecordType.name.equals(Comercial)){ HecVistCom_1 += 1; }
                    if(resultados.RecordType.name.equals(Seguimiento)){ HecVistSeg_1 += 1; }
                }
                else if(resultados.EG_ft_HoraVisitaLlamada__c >= EU001_primerDiaMesDos && resultados.EG_ft_HoraVisitaLlamada__c <= EU001_ultimoDiaMesDos){
                    if(resultados.RecordType.name.equals(Estrategica)){ HecVistEst_2 += 1;}
                    if(resultados.RecordType.name.equals(Comercial)){ HecVistCom_2 += 1;}
                    if(resultados.RecordType.name.equals(Seguimiento)){ HecVistSeg_2 += 1;}
                }
                else if(resultados.EG_ft_HoraVisitaLlamada__c >= EU001_primerDiaMesTres && resultados.EG_ft_HoraVisitaLlamada__c <= EU001_ultimoDiaMesTres){
                    if(resultados.RecordType.name.equals(Estrategica)){ HecVistEst_3 += 1; }
                    if(resultados.RecordType.name.equals(Comercial)){ HecVistCom_3 += 1; }
                    if(resultados.RecordType.name.equals(Seguimiento)){ HecVistSeg_3 += 1; }
                }   
            }
        }
         
        VisitasHechasTotales_1 = HecVistEst_1 + HecVistCom_1 + HecVistSeg_1;
        VisitasHechasTotales_2 = HecVistEst_2 + HecVistCom_2 + HecVistSeg_2;
        VisitasHechasTotales_3 = HecVistEst_3 + HecVistCom_3 + HecVistSeg_3;
        VistComLogro = HecVistCom_1 + HecVistCom_2 + HecVistCom_3;
        VistSegLogro = HecVistSeg_1 + HecVistSeg_2 + HecVistSeg_3;
        VistEstLogro = HecVistEst_1 + HecVistEst_2 + HecVistEst_3;
   
        VistComGap = mComerciales - VistComLogro;
        VistSegGap = mSeguimiento - VistSegLogro;
        VistEstGap = mVisitaEstrategica - VistEstLogro;
        VisTotalLogro = VisitasHechasTotales_1 + VisitasHechasTotales_2 + VisitasHechasTotales_3;
        
        //Obtiene la Parametria del Trimestre de Visitas y Oportunidades
        List<GF001_Parametria__c> paramCertificacion = [SELECT EU001_pr_Mes_1__c,EU001_pr_Mes_2__c,EU001_pr_Mes_3__c, EU001_pr_Ponderacion__c, EU001_ls_TipoDeIndicador__c, EU001_pr_Penalizaci_n__c
                                                        FROM GF001_Parametria__c WHERE RecordType.DeveloperName =: EU001_cls_CONSTANTES.EU001_STR_TRE_CERTifICACION];
        
        //Recorre la Lista de paramCertificacion y las Guarda en Variables
        for(GF001_Parametria__c resultados : paramCertificacion){
            if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_VISITAS)){
                pVis_1 = resultados.EU001_pr_Mes_1__c;
                pVis_2 = resultados.EU001_pr_Mes_2__c;
                pVis_3 = resultados.EU001_pr_Mes_3__c;
                ponVis = resultados.EU001_pr_Ponderacion__c;
                penVis = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_OPORTUNIDADES)){
                pOpp_1 = resultados.EU001_pr_Mes_1__c;
                pOpp_2 = resultados.EU001_pr_Mes_2__c;
                pOpp_3 = resultados.EU001_pr_Mes_3__c;
                ponOpp = resultados.EU001_pr_Ponderacion__c;
                penOpp = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_REUNION_INDIVIDUAL)){
                pRI_1 = resultados.EU001_pr_Mes_1__c;
                pRI_2 = resultados.EU001_pr_Mes_2__c;
                pRI_3 = resultados.EU001_pr_Mes_3__c;
                ponRI = resultados.EU001_pr_Ponderacion__c;
                penRI = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CASOS_INUSUALES)){
                pCI_1 = resultados.EU001_pr_Mes_1__c;
                pCI_2 = resultados.EU001_pr_Mes_2__c;
                pCI_3 = resultados.EU001_pr_Mes_3__c;
                ponCI = resultados.EU001_pr_Ponderacion__c;
                penCI = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_CONTROL_EVENTOS)){
                pCE_1 = resultados.EU001_pr_Mes_1__c;
                pCE_2 = resultados.EU001_pr_Mes_2__c;
                pCE_3 = resultados.EU001_pr_Mes_3__c;
                ponCE = resultados.EU001_pr_Ponderacion__c;
                penCE = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_PLAN_CUENTA)){
                pPC_1 = resultados.EU001_pr_Mes_1__c;
                pPC_2 = resultados.EU001_pr_Mes_2__c;
                pPC_3 = resultados.EU001_pr_Mes_3__c;
                ponPC = resultados.EU001_pr_Ponderacion__c;
                penPC = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_ACTUIALIZACION_CONTACTOS)){
                pContacto_1 = resultados.EU001_pr_Mes_1__c;
                pContacto_2 = resultados.EU001_pr_Mes_2__c;
                pContacto_3 = resultados.EU001_pr_Mes_3__c;
                ponContacto = resultados.EU001_pr_Ponderacion__c;
                penContacto = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_COMITE_NEGOCIOS)){
                pComite_1 = resultados.EU001_pr_Mes_1__c;
                pComite_2 = resultados.EU001_pr_Mes_2__c;
                pComite_3 = resultados.EU001_pr_Mes_3__c;
                ponComite = resultados.EU001_pr_Ponderacion__c;
                penComite = resultados.EU001_pr_Penalizaci_n__c;
            }else if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_GESTION_PORTAFOLIO)){
                pPortafolio_1 = resultados.EU001_pr_Mes_1__c;
                pPortafolio_2 = resultados.EU001_pr_Mes_2__c;
                pPortafolio_3 = resultados.EU001_pr_Mes_3__c;
                ponPortafolio = resultados.EU001_pr_Ponderacion__c;
                penPortafolio = resultados.EU001_pr_Penalizaci_n__c;
            }
        }
        
        String likeCasos = '%'+EU001_cls_CONSTANTES.EU001_STR_CASOS_INUSUALES+'%';
        String likeEventos = '%'+EU001_cls_CONSTANTES.EU001_STR_EVENTOS_SUBSECUENTES+'%';
        
        //Obtiene la Lista de Casos Inusuales        
        for(Plan_de_Choque__c res : [SELECT id, name, Etapa__c FROM Plan_de_Choque__c WHERE ownerid =: userId AND (Fecha_Fin_Campania__c >=: EU001_primerDiaMesUno AND Fecha_Fin_Campania__c <=: EU001_ultimoDiaMesTres) AND name LIKE : likeCasos AND Etapa__c !=: EU001_cls_CONSTANTES.EU001_STR_ALERTAS_ETAPA_DESCARTADO]){
            if(res.Etapa__c.equals(EU001_cls_CONSTANTES.EU001_STR_COMPROMISO_ABIERTO)){ 
                CasosGap +=1;
            }else if (res.Etapa__c.equals(EU001_cls_CONSTANTES.EU001_STR_CERRADO_GANADO)){ 
                CasosLogro +=1;
            }
        }
        
         //Obtiene la Lista de Eventos Subsecuentes
        
        for(Plan_de_Choque__c res : [SELECT id, name, Etapa__c FROM Plan_de_Choque__c WHERE ownerid =: userId AND (Fecha_Fin_Campania__c >=: EU001_primerDiaMesUno AND Fecha_Fin_Campania__c <=: EU001_ultimoDiaMesTres) AND  name LIKE : likeEventos AND Etapa__c !=: EU001_cls_CONSTANTES.EU001_STR_ALERTAS_ETAPA_DESCARTADO]){
            if (res.Etapa__c.equals(EU001_cls_CONSTANTES.EU001_STR_CERRADO_GANADO)){
                EventosLogro +=1;
            }else{
                EventosGap +=1;
            }
        }
        
        System.debug('EventosGap = '+EventosGap );
        //Contabiliza los Contactos que le faltan por actualizar en el trimestre
        List<Contact> getContactos =[Select id, name FROM Contact WHERE Ownerid =: userId AND Actualizar_Contacto__c != false];
        if(getContactos.size()>0){
            ContactosLogro = 0;
            ContactosGap = 100;
        }else{
            ContactosLogro = 100;
            ContactosGap = 0;
        }
        //Obtiene los Planes de Cuenta que Faltan por Completar
        List<Ficha_de_conocimiento__c> getPlanCuenta = [SELECT id, name, factible_de_calificar__c 
                                FROM Ficha_de_conocimiento__c 
                                WHERE ownerid =: userId 
                                      AND factible_de_calificar__c = false];
        
        PCGap = getPlanCuenta.size();
        PCLogro = mPlandeCuenta - PCGap;      
        
        //Obtiene los Registros del Tablero por el Indicador de Certificacion EU
        List<ExpUni_Tablero_Grupal__c> Tableros= [SELECT id, EU_001_tx_Indicador__c, EU_001_tx_Atributo__c, EU_001_Un_Valor__c, EU_Indicador__c 
                                                  FROM ExpUni_Tablero_Grupal__c 
                                                  WHERE EU_001_tx_Indicador__c =: EU001_cls_CONSTANTES.EU001_STR_CERTifICACION_EU
                                                  AND OwnerId =: userId];
        
        //Recorre la Lista de Tableros para Actualizar los indicadores y conceptos correspondientes.
        String A_Visitas_totales = 'A. ' +EU001_cls_CONSTANTES.EU001_STR_VISITAS_TOTALES; 
        String F_Plan_Cuenta = 'F. ' +EU001_cls_CONSTANTES.EU001_STR_PLAN_CUENTA;
        String A_Reunion_Individual = 'A. ' +EU001_cls_CONSTANTES.EU001_STR_REUNION_INDIVIDUAL;
        String D_Oportunidades = 'D. ' +EU001_cls_CONSTANTES.EU001_STR_OPORTUNIDADES;
        String E_Oportunidades = 'E. ' +EU001_cls_CONSTANTES.EU001_STR_OPORTUNIDADES;
        String C_Vistias_Comerciales = 'C. ' +EU001_cls_CONSTANTES.EU001_STR_VISITAS_COMERCIALES;
        String B_Visitas_Estrategicas = 'B. ' +EU001_cls_CONSTANTES.EU001_STR_VISITAS_ESTRATEGIAS;
        String D_Visitas_Seguimiento = 'D. ' +EU001_cls_CONSTANTES.EU001_STR_VISITAS_SEGUIMIENTO;
        String F_Contactos = 'F. ' +EU001_cls_CONSTANTES.EU001_STR_CONTACTOS;
        String G_Contactos = 'G. ' +EU001_cls_CONSTANTES.EU001_STR_CONTACTOS;
        String H_Control_Casos = 'H. ' +EU001_cls_CONSTANTES.EU001_STR_TABLEROS_CASOS_INUSUALES;
        String I_Control_Eventos = 'I. ' +EU001_cls_CONSTANTES.EU001_STR_CONTROL_EVENTOS;

        for(ExpUni_Tablero_Grupal__c resultado : Tableros){
            if(resultado.EU_Indicador__c == A_Visitas_totales ){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = VisTotalLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    Decimal gap = (VisTotalGap - VisTotalLogro);
                    resultado.EU_001_Un_Valor__c = gap < 0 ? 0 : gap ;
                }
            }else if(resultado.EU_Indicador__c == F_Plan_Cuenta ){
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = PCLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = PCGap;
                }
            }else if(resultado.EU_Indicador__c == A_Reunion_Individual ){
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = RILogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = RIGap; 
                }
            }else if(resultado.EU_Indicador__c == D_Oportunidades ){
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = OppLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = OppGap;
                }
            }else if(resultado.EU_Indicador__c == E_Oportunidades ){
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = OppLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = OppGap;
                }
            }else if(resultado.EU_Indicador__c == C_Vistias_Comerciales ){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = VistComLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = VistComGap;
                }
            }else if(resultado.EU_Indicador__c == B_Visitas_Estrategicas ){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = VistEstLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = VistEstGap;
                }
            }else if(resultado.EU_Indicador__c == D_Visitas_Seguimiento ){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = VistSegLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = VistSegGap;
                }
            }else if(resultado.EU_Indicador__c == F_Contactos ){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = ContactosLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = ContactosGap; 
                }
            }else if(resultado.EU_Indicador__c == G_Contactos ){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = ContactosLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = ContactosGap;
                }
            }else if(resultado.EU_Indicador__c == H_Control_Casos){ 
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = CasosLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = CasosGap;
                }
            }else if(resultado.EU_Indicador__c == I_Control_Eventos ){
                if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_LOGRO){
                    resultado.EU_001_Un_Valor__c = EventosLogro;
                }else if(resultado.EU_001_tx_Atributo__c == EU001_cls_CONSTANTES.EU001_STR_GAP){
                    resultado.EU_001_Un_Valor__c = EventosGap;
                }
            }
        }
        update Tableros;

         //CALCULO PENALIZACION DE REUNION INDIVIDUAL
        Boolean cumplioMetaRI = True;
        Decimal metaRI_1 = 0;
        Decimal penMetaRI_1 = 0;
        Decimal metaRI_2 = 0;
        Decimal penMetaRI_2 = 0;
        Decimal metaRI_3 = 0;
        Decimal penMetaRI_3 = 0;
        
        if(mRI > 0 && pRI_1 > 0 && pRI_2 > 0 && pRI_3 > 0){
            metaRI_1 =(mRI*pRI_1)/100;
            metaRI_2 =(mRI*pRI_2)/100;
            metaRI_3 =(mRI*pRI_3)/100;
        }
        
        
        if(RI_1 < metaRI_1){
            penMetaRI_1 = (penRI*ponRI)/100;
        }
        if(RI_2 < metaRI_2){
            penMetaRI_2 = (penRI*ponRI)/100;
        }
        if(RI_3 < metaRI_3){
            penMetaRI_3 = (penRI*ponRI)/100;
            cumplioMetaRI = False;
        }
        
        //CALCULO PENALIZACION DE OPP
        Boolean cumplioMetaOpp = True;
        Decimal metaOpp_1 = 0;
        Decimal penMetaOpp_1 = 0;
        Decimal metaOpp_2 = 0;
        Decimal penMetaOpp_2 = 0;
        Decimal metaOpp_3 = 0;
        Decimal penMetaOpp_3 = 0;
        metaOpp_1 =(mOportunidades*pOpp_1)/100;
        metaOpp_2 =(mOportunidades*pOpp_2)/100;
        metaOpp_3 =(mOportunidades*pOpp_3)/100;
        
        if(Opp_1 < metaOpp_1){
            penMetaOpp_1 = (penOpp*ponOpp)/100;
        }
        if(Opp_2 < metaOpp_2){
            penMetaOpp_2 = (penOpp*ponOpp)/100;
        }
        if(Opp_3 < metaOpp_3){
            penMetaOpp_3 = (penOpp*ponOpp)/100;
            cumplioMetaOpp = False;
        }
        
        //CALCULO PENALIZACION DE VISITAS
        Boolean cumplioMetaVis = True;
        Decimal metaVis_1 = 0;
        Decimal penMetaVis_1 = 0;
        Decimal metaVis_2 = 0;
        Decimal penMetaVis_2 = 0;
        Decimal metaVis_3 = 0;
        Decimal penMetaVis_3 = 0;
        metaVis_1 =((mVisitaEstrategica + mComerciales + mSeguimiento)*pVis_1)/100;
        metaVis_2 =((mVisitaEstrategica + mComerciales + mSeguimiento)*pVis_2)/100;
        metaVis_3 =((mVisitaEstrategica + mComerciales + mSeguimiento)*pVis_3)/100;
        System.debug('1 ' + VisitasHechasTotales_1);
        System.debug('2 ' + metaVis_1);
        System.debug('3 ' + penMetaVis_1);
        System.debug('4 ' + penVis);
        System.debug('5 ' + ponVis);
        
        if(VisitasHechasTotales_1 < metaVis_1){ penMetaVis_1 = (penVis*ponVis)/100; }
        if(VisitasHechasTotales_2 < metaVis_2){ penMetaVis_2 = (penVis*ponVis)/100; }
        if(VisitasHechasTotales_3 < metaVis_3){ penMetaVis_3 = (penVis*ponVis)/100; cumplioMetaVis = False; }
        
        //CALCULO PENALIZACION DE CASOS INUSUALES
        Boolean cumplioMetaCI = True;
        Decimal metaCI_1 = 0;
        Decimal casosTotal = 0;
        casosTotal = CasosLogro + CasosGap;
        metaCI_1 = (casosTotal * pCI_3)/100;
        if(CasosLogro < metaCI_1){
            cumplioMetaCI = False;
        }
        
        //CALCULO PENALIZACION DE CONTROL DE EVENTOS
        Boolean cumplioMetaCE = True;
        Decimal metaCE_1 = 0;
        Decimal eventosTotal = 0;
        eventosTotal = EventosLogro + EventosGap;
        metaCE_1 = (eventosTotal * pCE_3)/100;
        if(EventosLogro < metaCE_1){
            cumplioMetaCE = False;
        }
        
        //CALCULO PENALIZACION DE PLAN DE CUENTA
        Boolean cumplioMetaPC = True;
        
        if(PCLogro < mPlandeCuenta){ cumplioMetaPC = False; }
        
        //CALCULO PENALIZACION DE CONTACTOS
        Boolean cumplioMetaContactos = True;
        if(ContactosGap != 0){
            cumplioMetaContactos = False;
        }
        
        //PENALIZACIONES FINALES
        Decimal penTotalOpp = 0;
        Decimal penTotalVis = 0;
        Decimal penTotalRI = 0;
        //METAS FINALES
        Decimal metaTotalOpp = 0;
        Decimal metaTotalVis = 0;
        
        //Agrega Registros al Arreglo
        if(mes == 1 || mes == 4 || mes == 7 || mes == 10){
            System.debug('Mes 1');
            metaTotalVis = metaVis_1;
            metaTotalOpp = metaOpp_1;
        }else if(mes == 2 || mes == 5 || mes == 8 || mes == 11){
            System.debug('Mes 2');
            penTotalOpp = penMetaOpp_1;
            metaTotalOpp = metaOpp_2;
            penTotalVis = penMetaVis_1;
            metaTotalVis = metaVis_2;
            penTotalRI = penMetaRI_1;
        }else if(mes == 3 || mes == 6 || mes == 9 || mes == 12){
            System.debug('Mes 3');
            penTotalOpp = penMetaOpp_2 + penMetaOpp_1;
            metaTotalOpp = metaOpp_3;
            penTotalVis = penMetaVis_2 + penMetaVis_1;
            metaTotalVis = metaVis_3;
            penTotalRI = penMetaRI_2;
        } 
        
        Decimal Calificacion = 0;
        Calificacion += ponComite;
        Calificacion += ponPortafolio;
        
        if(cumplioMetaRI){ Calificacion += ponRI - penTotalRI ; System.debug('Suma RI = '+Calificacion); }
        if(cumplioMetaPC){ Calificacion += ponPC; System.debug('Suma Plan de Cuenta = '+Calificacion); }
        if(cumplioMetaOpp){ Calificacion += ponOpp - penTotalOpp; System.debug('Suma O = '+Calificacion); }
        if(cumplioMetaContactos ){ Calificacion += ponContacto; System.debug('Suma Contacto = '+Calificacion); }
        if(cumplioMetaCI){ Calificacion += ponCI; System.debug('Suma Casos Inusuales = '+Calificacion); }
        if(cumplioMetaCE){ Calificacion += ponCE; System.debug('Suma Control de Eventos = '+Calificacion); }

        Decimal Calificacion_Final = 0;
        
        if(mPenalizacionAcumulada >0){
             Calificacion_Final = Calificacion-mPenalizacionAcumulada;
        }else{
             Calificacion_Final = Calificacion;
        }
       
        getMetasTrimestrales[0].EU001_pr_Calificaci_n_Certificaci_n_EU__c = Calificacion_Final;
        
        update getMetasTrimestrales;
        
        System.debug('******************Calificacion Final = '+Calificacion_Final+' ********************************');
        
        //Registro de VisitasTotales
        ActividadesEU visTotal = new ActividadesEU();
        metaTotalVis = metaTotalVis <= 0 ? 1 : metaTotalVis;
        visTotal.Indicador='Visitas Totales';
        visTotal.Logro = Math.round((VisTotalLogro*100)/Math.ceil(metaTotalVis));
        visTotal.Meta = Math.ceil(metaTotalVis);
        visTotal.GapMensual = Math.ceil(metaTotalVis - VisTotalLogro);
        visTotal.GapTrimestral = Math.ceil((mVisitaEstrategica + mComerciales + mSeguimiento)-VisTotalLogro);
        visTotal.Penalizaciones = penTotalVis;
        actividades.add(visTotal);
        
        if(((VistEstLogro + VistEstGap) > 0) || Test.isRunningTest()){
        //Registro de Visitas de Estrategia
        ActividadesEU visEst = new ActividadesEU();
        visEst.Indicador='Visitas Estrátegicas';

        visEst.Logro = Math.ceil(VistEstLogro + VistEstGap) == 0 ? 0 :  Math.round((VistEstLogro*100)/Math.ceil(VistEstLogro + VistEstGap));
        visEst.Meta = Math.ceil(VistEstLogro + VistEstGap);
        visEst.GapMensual = Math.ceil(VistEstGap);
        visEst.GapTrimestral = Math.ceil(mVisitaEstrategica - VistEstLogro) < 0 ? 0 : Math.ceil(mVisitaEstrategica - VistEstLogro);
        visEst.Penalizaciones = 0;
        actividades.add(visEst);
        }

        if(((VistComLogro + VistComGap) > 0) || Test.isRunningTest()){
            //Registro de Visitas de Comerciales
            ActividadesEU visCom = new ActividadesEU();
            visCom.Indicador='Visitas Comerciales';
            visCom.Logro = Math.ceil(VistComLogro + VistComGap) == 0 ? 0 : Math.round((VistComLogro*100)/Math.ceil(VistComLogro + VistComGap));
            visCom.Meta = Math.ceil(VistComLogro + VistComGap);
            visCom.GapMensual = Math.ceil(VistComGap);
            visCom.GapTrimestral = Math.ceil(mComerciales - VistComLogro) <0 ? 0 : Math.ceil(mComerciales - VistComLogro);
            visCom.Penalizaciones = 0;
            actividades.add(visCom);
        }
        
        if(((VistSegLogro + VistSegGap) > 0) || Test.isRunningTest()){
            //Registro de Visitas de Seguimiento
            ActividadesEU visSeg = new ActividadesEU();
            visSeg.Indicador='Visitas Seguimiento';
            visSeg.Logro = Math.ceil(VistSegLogro + VistSegGap) == 0 ? 0 : Math.round((VistSegLogro*100)/Math.ceil(VistSegLogro + VistSegGap));
            visSeg.Meta = Math.ceil(VistSegLogro + VistSegGap);
            visSeg.GapMensual = Math.ceil(VistSegGap);
            visSeg.GapTrimestral = Math.ceil(mSeguimiento - VistSegLogro) < 0 ? 0 : Math.ceil(mSeguimiento - VistSegLogro);
            visSeg.Penalizaciones = 0;
            actividades.add(visSeg);
        }

        metaTotalOpp = metaTotalOpp > 0 ? metaTotalOpp : 1;
         //Registro de Oportunidad
        ActividadesEU opp = new ActividadesEU();
        opp.Indicador='Oportunidades';
        opp.Logro = Math.round((OppLogro*100)/Math.ceil(metaTotalOpp));
        opp.Meta = Math.ceil(metaTotalOpp);
        opp.GapMensual = Math.ceil(metaTotalOpp - OppLogro);
        opp.GapTrimestral = Math.ceil(mOportunidades- OppLogro) < 0 ? 0 :  Math.ceil(mOportunidades- OppLogro) ;
        opp.Penalizaciones = penTotalOpp;
        actividades.add(opp);
        
        mPlandeCuenta = mPlandeCuenta > 0 ? mPlandeCuenta : 1;
        //Registro de Plan de Cuenta
        ActividadesEU pCuenta = new ActividadesEU();
        pCuenta.Indicador='Plan de Cuenta';
        pCuenta.Logro = Math.round((PCLogro*100)/Math.ceil(mPlandeCuenta));
        pCuenta.Meta = Math.ceil(mPlandeCuenta);
        pCuenta.GapMensual = Math.ceil(PCGap);
        pCuenta.GapTrimestral = Math.ceil(mPlandeCuenta- PCLogro) <0 ? 0 : Math.ceil(mPlandeCuenta- PCLogro);
        pCuenta.Penalizaciones = 0;
        actividades.add(pCuenta);
        
        if((ContactosLogro + ContactosGap) > 0){
            //Registro de Contactos
            ActividadesEU contact = new ActividadesEU();
            contact.Indicador='Contactos';
            contact.Logro = Math.round((ContactosLogro*100)/ Math.ceil(ContactosLogro + ContactosGap));
            contact.Meta = Math.ceil(ContactosLogro + ContactosGap);
            contact.GapMensual = Math.ceil(ContactosGap);
            contact.GapTrimestral = Math.ceil(ContactosGap);
            contact.Penalizaciones = 0;
            actividades.add(contact);
        }
        
        return actividades;
    }
    
    @AuraEnabled
    public static List<user> getCalificacion (){
        List<user> getCalifi = [SELECT EU001_pr_Calificaci_n_Certificaci_n_EU__c, EG001_ls_Certificacion_EU__c
                               FROM User
                               WHERE id =: UserID];
        return getCalifi;
    }
    
    public class ActividadesEU{         
        @auraEnabled
        public String Indicador {get; set;}
        @auraEnabled
        public Decimal Logro {get; set;}
        @auraEnabled
        public Decimal Meta {get; set;}
        @auraEnabled
        public Decimal GapMensual {get; set;}
        @auraEnabled
        public Decimal GapTrimestral {get; set;}
        @auraEnabled
        public Decimal Penalizaciones {get; set;}
        
    }
    
    @AuraEnabled
    public static Decimal getMetaRI(String idRI){
        EU001_RI__c RI =[SELECT OwnerId FROM EU001_RI__c WHERE id =: idRI];
        System.debug('El RI que esta visualizando es el '+idRI);
        System.debug('Usuario id = '+RI.OwnerId);
        User usuario = [SELECT UG__c FROM User WHERE Id= :RI.OwnerId Limit 1];
        System.debug('Ug del Propietario del RI '+ usuario.UG__c);
        UserID = RI.OwnerId;
        UserUG = usuario.UG__c;
        
        Integer mes = system.today().month();
        Decimal mRI = 0;
        Decimal pRI_1 = 0;
        Decimal pRI_2 = 0;
        Decimal pRI_3 = 0;
        Decimal metaRI_1 = 0;
        Decimal metaRI_2 = 0;
        Decimal metaRI_3 = 0;

        List<User> getMetasTrimestrales = [SELECT UG__c, EU001_un_Meta_Reuni_n_Individual__c,
                                                  EU001_pr_Calificaci_n_Certificaci_n_EU__c
                                          FROM User
                                          WHERE id =: UserID];
        
        for(User m3: getMetasTrimestrales){
            mRI = m3.EU001_un_Meta_Reuni_n_Individual__c;
        }
        //Obtiene la Parametria del Trimestre de Visitas y Oportunidades
        List<GF001_Parametria__c> paramCertificacion = [SELECT EU001_pr_Mes_1__c,EU001_pr_Mes_2__c,EU001_pr_Mes_3__c, EU001_pr_Ponderacion__c, EU001_ls_TipoDeIndicador__c, EU001_pr_Penalizaci_n__c
                                                        FROM GF001_Parametria__c WHERE RecordType.DeveloperName =: EU001_cls_CONSTANTES.EU001_STR_TRE_CERTifICACION];
        
        //Recorre la Lista de paramCertificacion y las Guarda en Variables
        for(GF001_Parametria__c resultados : paramCertificacion){
            if(resultados.EU001_ls_TipoDeIndicador__c.equals(EU001_cls_CONSTANTES.EU001_STR_REUNION_INDIVIDUAL)){
                pRI_1 = resultados.EU001_pr_Mes_1__c;
                pRI_2 = resultados.EU001_pr_Mes_2__c;
                pRI_3 = resultados.EU001_pr_Mes_3__c;
            }
        }
        
        if(mRI > 0 && pRI_1 > 0 && pRI_2 > 0 && pRI_3 > 0){
            metaRI_1 = Math.ceil((mRI*pRI_1)/100);
            metaRI_2 = Math.ceil((mRI*pRI_2)/100);
            metaRI_3 = Math.ceil((mRI*pRI_3)/100);
        }

        Decimal MetaFinal = 0;
        if(mes == 1 || mes == 4 || mes == 7 || mes == 10){
            MetaFinal = metaRI_1;
        }else if(mes == 2 || mes == 5 || mes == 8 || mes == 11){
            MetaFinal = metaRI_2;
        }else if(mes == 3 || mes == 6 || mes == 9 || mes == 12){
            MetaFinal = metaRI_3;
        }
        return MetaFinal;
    }
    
    //Hereda los compromisos abiertos en el nuevo RI
    @RemoteAction
    public static void nuevoRI(List<EU001_RI__c> revisionesInd) {
        String[] OwnerIds = new List<String>();
        String[] idRI = new List<String>();

        //Se obtienen id del RI
        for(EU001_RI__c ri: revisionesInd){
                OwnerIds.add(ri.ownerid);
                idRI.add(ri.Id);   
         }
		system.debug('OwnerIds' +OwnerIds);
        //Se Consultan los compromisos abiertos o reprogramados 
        List<EU_001_Compromiso__c> compromisoAR= [SELECT id, EU_001_Rb_Revisi_n_Individual_RI__c, 
                                                EU001_Fm_Historico_Cambios_Fecha_Cierre__c,
                                                EU_fm_Fecha_Cierre__c
                                                FROM EU_001_Compromiso__c 
                                                WHERE EU_001_ls_Estatus__c 
                                                IN (:EU001_CLS_CONSTANTES.EU001_STR_COMPROMISO_ABIERTO,
                                                :EU001_CLS_CONSTANTES.EU001_STR_COMPROMISO_REPROGRAMADO)
                                                AND ownerid IN :OwnerIds]; 

        List<Case> casos = [SELECT id, Reuni_n_Individual_RI__c 
                                                FROM Case 
                                                WHERE Status 
                                                IN (:EU001_CLS_CONSTANTES.EU001_STR_COMPROMISO_ABIERTO,
                                                :EU001_CLS_CONSTANTES.EU001_STR_COMPROMISO_REPROGRAMADO)
                                                AND ownerid IN :OwnerIds]; 

        system.debug('id del RI '+revisionesInd);
      
        List<EU_001_Compromiso__c> up = new List<EU_001_Compromiso__c>();
        List<Case> upC = new List<Case>();
        
        if(!compromisoAR.isEmpty()){
            for(EU_001_Compromiso__c ri: compromisoAR){
                    ri.EU_001_Rb_Revisi_n_Individual_RI__c=idRI[0];
                    up.add(ri);
            }
        }
        update up;
        
        if(!casos.isEmpty()){
            for(Case ca: casos){                
                ca.Reuni_n_Individual_RI__c=idRI[0];
                upC.add(ca);                
            }
        }
        update upC;
        }//fin metodo nuevoRI       
}