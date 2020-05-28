//---------------------------
//----- INSTRUCCIONES -------
//---------------------------
class PWindow3 extends PApplet {
  PWindow3() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    surface.setTitle("");
  }

  int nargu, lastid, posy;
  int instruancho;
  int x=0, y=0;
  char nota = 'C'; 
  int octava =4;
  String px, py, ancho, alto, pxt3, pyt3, valor1, valor2, condicional;
  int r, g, b=56, rf=250, gf, bf, gray, grayf=50;
  String c, instru;
  JSONObject objeto;
  int argumentos= 1000000;
  int activado=-1;
  int nvaragu1, nvaragu2, nvaragu3, nvaragu4, nvaragu5, nvaragu6;
  PImage logo;
  PFont myFont;
  int logox=0, logo2x=1000;
  boolean keyif=false, mousebif=false;

  void settings() {

    leelinea(lineaclik);
    instru = line;
    if (idlee==0)instru = objetoactual.getString("comentario");
    nargu = nargumentos;
    lastid =idlee;
    if (opening==true)lastid=1;
    if (seleidio==true)lastid=1;
    if (agregarvar==true)lastid=-9;
    if (selectvarini ==true)lastid=-9;
    if (config==true)lastid=-9;
    objeto = objetoactual;
    if(lastid==-1) size(ventatamx, 550, JAVA2D); else{ 
      size(ventatamx, 330);
      if(lastid==98|| lastid==102||lastid==115) size(ventatamx, 400);
      else
      if (lastid==0 || lastid==110 ) size(1024, 150); 
      else
      if (proyecto == true) size(500, 150);
      else
      if (opening==true)size(ventatamx, 550, JAVA2D);
    }
  }

  void setup() {
    surface.setResizable(true); 
    background(150);
    logo = loadImage(codefolder+"/logos.png");
    fill(255);
    textSize(18);
    instruancho= int(textWidth(""+instru));
    if (id==0) c = objeto.getString("comentario");
    
    textFont(createFont("Arial Unicode MS",17));

  }

  void draw() {
    background(0);
    posy= mouseY-mouseY % 20;
    if (lastid == 102 || lastid == 115 || lastid == 98)colorselector();
    if (lastid == 114) positam();
    if (lastid == 101) positam();
    if (lastid == 0) coment();
    if (agregarvar== true) variable();
    if (selectvarini == true) variableini();
    if (lastid == 110) nota();
    if (lastid == 108) linea();
    if (lastid == 100) sonido();
    if (lastid == 51) triangulo();
    if (lastid == 109 || lastid == 118 ) imagen();
    if (lastid == 116) texto();
    if (lastid == 117) tamtexto();
    if (lastid == 97) aleatorio();
    if (lastid == 61) aleatorio();
    if (lastid == 62) aleatorio();
    if (lastid == 63) aleatorio();
    if (lastid == 105) condicion();
    if (lastid == -1) instruccion();
    if (opening==true) splash();
    if (seleidio==true) idioma();
    if ( proyecto == true) proyecto();
    if (config==true)config();
    if (lastid == -102 || lastid == -115) {
      background(200);
      fill(80);
      if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
      else text(""+idiomaactual.get(str(lastid)), 10, 20);
    }
  }

  void mousePressed() {

    // Seleccionar idioma
    if (seleidio==true) {

      // boton idioma Español
      if (posy==40) {
        idiomagui = loadJSONObject(codefolder+"/lang/Esp/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Esp/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Esp/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "0";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Frances
      if (posy==60) {
        idiomagui = loadJSONObject(codefolder+"/lang/Fr/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Fr/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Fr/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "1";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }

      // boton idioma Hindi
      if (posy==80) {
        idiomagui = loadJSONObject(codefolder+"/lang/Hi/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Hi/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Hi/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "2";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Japones
      if (posy==100) {
        idiomagui = loadJSONObject(codefolder+"/lang/Jp/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Jp/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Jp/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "3";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Italiano
      if (posy==120) {
        idiomagui = loadJSONObject(codefolder+"/lang/Ita/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Ita/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Ita/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "4";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Chino
      if (posy==140) {
        idiomagui = loadJSONObject(codefolder+"/lang/Ch/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Ch/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Ch/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "5";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Portugues
      if (posy==160) {
        idiomagui = loadJSONObject(codefolder+"/lang/Prt/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Prt/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Prt/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "6";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Ingles
      if (posy==180) {
        idiomagui = loadJSONObject(codefolder+"/lang/Eng/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Eng/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Eng/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "7";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Nuevo
      if (posy==200) {
        idiomagui = loadJSONObject(codefolder+"/lang/Newlang/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Newlang/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Newlang/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "8";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }      


      seleidio=false;
      exit();
      surface.setVisible(false);
    }
    
    
    
    // boton var color
    if (lastid == 102 || lastid == 115 || lastid == 98){

      if (mouseX>280 && mouseX <312 && mouseY > 10 && mouseY <30) {
        variables = new PWindow4();
      }
    }    
    

    ///////////////////////
    // agregar instrucción
    ///////////////////////

    if (lastid==-1) {
      px="";
      py="";
      ancho="";
      alto="";
      pxt3 ="";
      pyt3 ="";
      valor1 ="";
      valor2 ="";
      condicional ="";
      temp ="";

      if (posy==20) { // opcion comentario
        lastid=0;
        instru="";             
      }
      if (posy==60) { // opcion linea
        lastid=108;
      }
      if (posy==80) { // opcion triangulo
        lastid=51;
      }
      if (posy==100) { // opcion rectangulo
        lastid=114;
      }
      if (posy==120) { // opcion elipse
        lastid=101;
      }
      if (posy==140) { // opcion texto
        lastid=116;
      }
      if (posy==160) { // opcion imagen
        lastid=109;
      }
      if (posy==200) { // opcion fondo
        lastid=98;
      }
      if (posy==220) { // opcion colorlinea
        lastid=115;
      }
      if (posy==240) { // opcion relleno
        lastid=102;
      }
      if (posy==260) { // opcion sinrelleno
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "sinrelleno");
        renuevaobjeto.setInt("id", -102);
        //linea = "noFill();";
        linea = "c.fillStyle = 'rgba(0, 0, 0, 0)';";
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
      if (posy==280) { // opcion sinlinea
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "sinlinea");
        renuevaobjeto.setInt("id", -115);
        //linea = "noStroke();";
        linea = "c.strokeStyle = 'rgba(0, 0, 0, 0)';";
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
      if (posy==300) { // opcion tamtexto
        lastid=117;
      }
      if (posy==340) { // opcion tocanota
        lastid=110;
      }
      if (posy==360) { // opcion sonido
        lastid=100;
      }
      //if (posy==380) { // opcion video
      //  lastid=118;
      //}
      if (posy==420) { // opcion if
        lastid=105;
      }    
      if (posy==460) { // opcion asignar
        lastid=61;
      }
      if (posy==480) { // opcion sumar
        lastid=62;
      }
      if (posy==500) { // opcion restar
        lastid=63;
      }
      if (posy==520) { // opcion aleatorio
        lastid=97;
      }
    } // Fin agregar instrucción

    ///////////////////////////////////////////    

    if (positam==true) { 
      if (posy== 40)  argumentos= 1000001; // casilla x
      if (posy== 80)  argumentos= 1000010; // casilla y
      if (posy== 120) argumentos= 1000100; // casilla ancho
      if (posy== 160) argumentos= 1001000; // casilla alto
      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }


      ///* // botones  Var ARGUMENTO 1
      if (posy== 40 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 40 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }

      ///* // botón Var ARGUMENTO 2
      if (posy== 80 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar2=true; 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 80 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        py = "";
      }

      ///* // botón Var ARGUMENTO 3
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar3=true;
        lastargu=3;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar3=true; 
          varclicked=false;
        } else arguvar3=false;
      } 

      ///* // botón  # ARGUMENTO 3
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar3=false;
        lastargu=3;
        ancho = "";
      }

      ///* // botón Var ARGUMENTO 4
      if (posy== 160 && mouseX>293 && mouseX<325) {
        arguvar4=true;
        lastargu=4;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar4=true; 
          varclicked=false;
        } else arguvar4=false;
      } 

      ///* // botón  # ARGUMENTO 4
      if (posy== 160 && mouseX>272 && mouseX<287) {
        arguvar4=false;
        lastargu=4;
        alto = "";
      }

      // boton aplicar cuadrado y elipse
      if (lastid!= 108 && lastid!= 109 && posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==114) {
          renuevaobjeto.setString("instruccion", "rectangulo");
          //linea = "rect( "+px+", "+py+", "+ancho+", "+alto+" );";
          
          //linea = " c.beginPath();\n c.strokeRect("+px+", "+py+", "+ancho+", "+alto+");\n c.stroke();\n c.closePath();\n";
          //linea = " c.strokeRect("+px+", "+py+", "+ancho+", "+alto+");\n  c.stroke();\n";
          linea = " c.fillRect("+px+", "+py+", "+ancho+", "+alto+");\n c.strokeRect("+px+", "+py+", "+ancho+", "+alto+");\n";
        }
        if (lastid==101) {
          renuevaobjeto.setString("instruccion", "elipse");
          //linea = "ellipse( "+px+", "+py+", "+ancho+", "+alto+" );";
          // ellipse(x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise)
          //c.ellipse(100, 100, 10, 15, 0, 0, Math.PI*2);
    
          linea = "c.beginPath();\n c.ellipse("+px+", "+py+", "+ancho+", "+alto+", 0, 0, Math.PI*2);\n c.fill();\n c.closePath();\n";  
          
        }
        renuevaobjeto.setInt("id", lastid);

        if (arguvar1==false) renuevaobjeto.setInt("px", int(px));

        if (arguvar1==true) renuevaobjeto.setString("pxv", px);


        if (arguvar2==false) renuevaobjeto.setInt("py", int(py));

        if (arguvar2==true) renuevaobjeto.setString("pyv", py);


        if (arguvar3==false) renuevaobjeto.setInt("tx", int(ancho));

        if (arguvar3==true) renuevaobjeto.setString("txv", ancho);


        if (arguvar4==false) renuevaobjeto.setInt("ty", int(alto));

        if (arguvar4==true) renuevaobjeto.setString("tyv", alto);

        renuevaobjeto.setString("js", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin positam

    /////////////////////////////////////////////

    // boton aplicar linea
    if (lastid== 108 && posy== 220 && mouseX>170 && mouseX<260) {
      JSONObject renuevaobjeto = new JSONObject();
      String linea ="";
      //linea = "line( "+px+", "+py+", "+ancho+", "+alto+" );";
      linea = "c.beginPath();\n c.moveTo("+px+", "+py+");\n c.lineTo("+ancho+", "+alto+");\n c.stroke();"; 
      if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
      if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
      if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
      renuevaobjeto.setString("instruccion", "linea");
      renuevaobjeto.setInt("id", lastid);
      if (arguvar1==false)renuevaobjeto.setInt("pxt1", int(px));
      if (arguvar1==true)renuevaobjeto.setString("pxt1v", px);

      if (arguvar2==false)renuevaobjeto.setInt("pyt1", int(py));
      if (arguvar2==true)renuevaobjeto.setString("pyt1v", py);

      if (arguvar3==false)renuevaobjeto.setInt("pxt2", int(ancho));
      if (arguvar3==true)renuevaobjeto.setString("pxt2v", ancho);

      if (arguvar4==false)renuevaobjeto.setInt("pyt2", int(alto));
      if (arguvar4==true)renuevaobjeto.setString("pyt2v", alto);

      renuevaobjeto.setString("js", linea);

      if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
      if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
      if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
      ventana=false;
      exit();
      surface.setVisible(false);
    }


    //////////////////////////////////////////////////

    if (condicion==true) { 
      if (posy== 40)  argumentos= 1000001; // casilla argumento 1
      if (posy== 120 && keyif==false && mousebif==false) argumentos= 1000010; // casilla argumento 2

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }


      ///* // botones  Var ARGUMENTO 1
      if (posy== 40 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 40 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        valor1 = "";
      }

      // condicional.equals("=") 
      if ( posy== 80 && mouseX>170 && mouseX<185) {
        condicional = "=";
      } 

      // condicional.equals("<")
      if ( posy== 80 && mouseX>190 && mouseX<205) {
        condicional = "<";
      } 

      // condicional.equals(">")
      if ( posy== 80 && mouseX>210 && mouseX<225) {
        condicional = ">";
      } 

      // condicional.equals("!=")
      if ( posy== 80 && mouseX>230 && mouseX<255) {
        condicional = "!=";
      } 

      ///* // botón Var ARGUMENTO 2
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        mousebif = false;
        keyif = false;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar2=true; 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        valor2 = "";
        mousebif = false;
        keyif = false;
      }

      // boton mouseButton
      if (posy== 120 && mouseX>352 && mouseX<368) {
        arguvar2=false;
        mousebif = true;
        keyif = false;
        if (mouseButton == LEFT) valor2 = "0";
        if (mouseButton == CENTER) valor2 = "1";
        if (mouseButton == RIGHT) valor2 = "2";
      }

      // boton Caracter
      if (posy== 120 && mouseX>331 && mouseX<346) {
        arguvar2=false;
        argumentos= 1000100;
        valor2 = "";
        keyif = true;
      }

      // boton aplicar CONDICION
      if (lastid!= 109 && posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "si");

        linea = "if( "+valor1+" ";
        if (condicional.equals("=")) linea = linea+"=="; 
        else linea = linea+condicional;
        linea = linea+" "+valor2+" ){";

        renuevaobjeto.setInt("id", lastid);
        if (arguvar1==false)renuevaobjeto.setInt("valor1", int(valor1));
        if (arguvar1==true)renuevaobjeto.setString("valor1v", valor1);

        renuevaobjeto.setString("condicion", condicional);

        if (arguvar2==false)renuevaobjeto.setString("valor2", valor2);
        if (arguvar2==true)renuevaobjeto.setString("valor2v", valor2);
        //if (keyif == true)renuevaobjeto.setInt("valor2", int(valor2.charAt(0)));
        if (keyif == true)renuevaobjeto.setString("valor2", valor2);

        if (objeto.getInt("id") != -1) {
          renuevaobjeto.setBoolean("visible", objeto.getBoolean("visible"));
        } else {
          renuevaobjeto.setBoolean("visible", true);
        }

        renuevaobjeto.setString("js", linea);
        println(renuevaobjeto);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin condicion

    ///////////////////////////////////////////////////////////////////////////



    if (lastid == 97 || lastid == 61 || lastid == 62 || lastid == 63) {  // ALEATORIO

      if (posy== 80 )  argumentos= 1000010; // casilla y


      ///* // botones  Var ARGUMENTO 1
      if (posy== 40 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar ALEATORIO
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if(lastid == 97) renuevaobjeto.setString("instruccion", "aleatorio");
        if(lastid == 61) renuevaobjeto.setString("instruccion", "asignar");
        if(lastid == 62) renuevaobjeto.setString("instruccion", "sumar");
        if(lastid == 63) renuevaobjeto.setString("instruccion", "restar");

        //if(lastid == 97) linea = ""+px+" = random("+py+");";
        if(lastid == 97) linea = ""+px+" = Math.random() *"+py+";";
        
        if(lastid == 61) linea = ""+px+" = "+py+";";
        if(lastid == 62) linea = ""+px+" = "+px+" + "+py+";";
        if(lastid == 63) linea = ""+px+" = "+px+" - "+py+";";

        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("variable", px);
        if(lastid == 97) renuevaobjeto.setInt("vmaximo", int(py));
        if(lastid == 61 || lastid == 62 || lastid == 63) renuevaobjeto.setString("valor", py);

        renuevaobjeto.setString("js", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin aleatorio

    ///////////////////////////////////////////////////////////////////////////

    if (lastid == 109 || lastid == 118) {  // IMAGEN || VIDEO
 
      if (posy== 40)  eligearchivo(); // casilla nombre
      if (arguvar1==false && posy== 80 )  argumentos= 1000001; // casilla x
      if (arguvar2==false && posy== 120 )  argumentos= 1000010; // casilla y


      ///* // botones  Var ARGUMENTO 1
      if (posy== 80 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;

      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 80 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }


      ///* // botones  Var ARGUMENTO 2
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        py = "";
      }

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //if (lastid == 109)linea = "PImage ima = loadImage("+'\"'+linea+temp+'\"'+"); image( ima, "+px+", "+py+" );";
        
        if (lastid == 109)linea = "var image = new Image();\n   image.src = 'data/"+temp+"';\n   c.drawImage(image, "+px+", "+py+");\n";
      
        if (lastid == 118)linea = "\nif(inivideo==false){\nmovie = new Movie(this, \""+temp+"\" ); \nmovie.jump(0.0); \nmovie.play(); \ninivideo=true; \n} \nimage(movie, "+px+", "+py+");";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid == 109) renuevaobjeto.setString("instruccion", "imagen");
        if (lastid == 118) renuevaobjeto.setString("instruccion", "video");
        renuevaobjeto.setInt("id", lastid);
        if (arguvar1==false)renuevaobjeto.setInt("px", int(px));
        if (arguvar1==true)renuevaobjeto.setString("pxv", px);
        if (arguvar2==false)renuevaobjeto.setInt("py", int(py));
        if (arguvar2==true)renuevaobjeto.setString("pyv", py);
        renuevaobjeto.setString("nombre", temp);

        renuevaobjeto.setString("js", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin imagen || video

    ///////////////////////////////////////////////////////////////////////////
    
   ////////// 
   // TEXTO
   //////////
   
    if (lastid == 116) {  // TEXTO
      if (posy== 40)  arguvar0=true; // casilla nombre
      if (arguvar1==false && posy== 80 ) { 
        arguvar0=false; 
        argumentos= 1000001;
      } // casilla x
      if (arguvar2==false && posy== 120 ) { 
        arguvar0=false; 
        argumentos= 1000010;
      } // casilla y


      ///* // botones  Var ARGUMENTO 1
      if (posy== 80 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 80 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }


      ///* // botones  Var ARGUMENTO 2
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        py = "";
      }

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //linea = "text( \""+temp+"\", "+px+", "+py+" );";
        linea = "c.fillText(\""+temp+"\","+px+", "+py+");";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "texto");
        renuevaobjeto.setInt("id", lastid);
        if (arguvar1==false)renuevaobjeto.setInt("px", int(px));
        if (arguvar1==true)renuevaobjeto.setString("pxv", px);
        if (arguvar2==false)renuevaobjeto.setInt("py", int(py));
        if (arguvar2==true)renuevaobjeto.setString("pyv", py);
        renuevaobjeto.setString("texto", temp);
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin TEXTO    

    if (lastid==100) { // sound
      if ( posy== 80 && mouseX>300 && mouseX<390) {
        eligearchivo();
      }
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";

        //linea = "AudioPlayer cancion = canal.loadFile( \""+temp+"\", 2048);\ncancion.rewind(); \ncancion.play();";
        linea = " var audio = new Audio('data/"+temp+"');\n audio.play();";

        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "sonido");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("nombre", temp);
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    } // fin sound

    // cerrar splash al abrir Meta_Javascript
    if (opening==true && s>20) {
      mainwindow=true;
      codewin=true;
      opening=false;
      surface.setVisible(false);
      exit();
      
    }

    if (seleidio==true) {

      seleidio=false;
      surface.setVisible(false);
      exit();
      
    }
  } // fin mousePressed

  void keyPressed() {


    if (lastid == 114||lastid == 101 || lastid == 108 || lastid == 51|| lastid == 109 || lastid == 118) { // positam
      if (argumentos == 1000001)px=typeint(px);
      if (argumentos == 1000010)py=typeint(py);
      if (argumentos == 1000100)ancho=typeint(ancho);
      if (argumentos == 1001000)alto=typeint(alto);
    }
    if (lastid == 105) { // positam
      if (argumentos == 1000001)valor1=typeint(valor1);
      if (argumentos == 1000010)valor2=typeint(valor2);
      if (argumentos == 1000100)valor2="'"+str(key).toUpperCase()+"'";
    }
    if (lastid == 116) { // texto
      if (argumentos == 1000001)px=typeint(px);
      if (argumentos == 1000010)py=typeint(py);
      if (arguvar0==true) temp = typetext(temp);
    }
    if (lastid == 51) {
      if (argumentos == 1010000)pxt3=typeint(pxt3);
      if (argumentos == 1100000)pyt3=typeint(pyt3);
    }
    if (lastid == 0) instru = typetext(instru); // comentario
    if (agregarvar ==true) temp = typetext(temp); // variable
    if (selectvarini == true) temp = typefloat(temp); // valor para inializar la variable seleccionada
    if (proyecto == true) proyectonombre = typetext(proyectonombre); // nombre proyecto
    if (lastid == 117) temp=typeint(temp); // tamtexto
    if (lastid == 97 || lastid == 61 || lastid == 62 || lastid == 63) py=typefloat(py); // tamtexto

  }

  //--------------
  //    IDIOMA
  //--------------

  void idioma() {

    background(0);
    posy= mouseY-mouseY % 20;
    y= ((posy-40)/20)+1;
    fill(120);
    if (posy>20 && posy< 460)rect(0, posy, width, 20);

    text("Meta_Javascript", 10, 17);
    fill(255);
    textLeading(20);
    text("Español", 20, 57);
    text("Française", 20, 77);

    /*
     //pushStyle();
     //textFont(createFont("Arial Unicode MS",18));
     //text("ᓀᐦᐃᔭᐃ", 20, 97); // cree
     //popStyle();
     */
     
     
     pushStyle();
     textFont(createFont("Arial Unicode MS",18));
     text("हिन्दी", 20, 97); // hindi
     popStyle();
     
     pushStyle();
     textFont(createFont("Arial Unicode MS",18));
     text("日本人", 20, 117); // japones
     popStyle();
     text("Italiano", 20, 137); 
     pushStyle();
     textFont(createFont("Arial Unicode MS",18));
     text("中文", 20, 157); // chino
     popStyle();
     
     text("Português", 20, 177); 
     text("English", 20, 197);
     text(idiomagui.getString("Nuevo")+" "+idiomagui.getString("Idioma"), 20, 217);

  }

  //--------------
  //    SPLASH
  //--------------

  void splash() {
    surface.setTitle("META_JAVASCRIPT Version Alpha 1.0");
    if (s<99)s = millis() / 100;
    fill(0, 0, 255);
    if (s>89)fill(0, 255, 0);
    rect(200, 390, s, 5); // barra de carga

    image(logo, logox, 60);
    image(logo, logo2x, 60);
    textAlign(CENTER, CENTER);
    fill(255);
    text("META_JAVASCRIPT Version Alpha 1.0", 255, 340);
    fill(120);
    text("Fork of META_PROCESSING", 255, 360);
    //text("Developed using Processing 3.4", 255, 360);
    text("(ɔ) 2020  Jose David Cuartas, GPL v.3\nHiteclab, http://hiteclab.libertadores.edu.co/\nFundación Universitaria Los Libertadores, Colombia", 255, 440);
    text("Contact us: hiteclab@libertadores.edu.co", 255, 520);
    if (logox>-1000)logox--; 
    else logox=1000;
    if (logo2x>-1000)logo2x--; 
    else logo2x=1000;
  }

  //--------------
  // INSTRUCCION
  //--------------

  void instruccion() {
    background(0);

    posy= mouseY-mouseY % 20;
    y= ((posy-40)/20)+1;
    fill(120);
    if (posy>0 && posy!=40 && posy!=180 && posy!=320 && posy!=400 )rect(0, posy, width, 20);

    // Documentar
    fill(120);
    text(idiomagui.getString("Documentar"), 10, 17);
    fill(255);
    text(""+idiomaactual.get(str(0)), 40, 37); // 0 es el id de comentario

    fill(120);
    text(idiomagui.getString("Gráficos"), 10, 57);
    textLeading(20);
    fill(255);
    text(""+idiomaactual.get(str(108))+"\n"+idiomaactual.get(str(51))+"\n"+idiomaactual.get(str(114))+"\n"+idiomaactual.get(str(101))+"\n"+idiomaactual.get(str(116))+"\n"+idiomaactual.get(str(109)), 40, 77);
    fill(120);
    text(idiomagui.getString("Propiedades"), 10, 197);
    fill(255);
    text(""+idiomaactual.get(str(98))+"\n"+idiomaactual.get(str(115))+"\n"+idiomaactual.get(str(102))+"\n"+idiomaactual.get(str(-102))+"\n"+idiomaactual.get(str(-115))+"\n"+idiomaactual.get(str(117)), 40, 217);
    fill(120);
    text(idiomagui.getString("Multimedia"), 10, 337);
    fill(255);
    text(""+idiomaactual.get(str(110))+"\n"+idiomaactual.get(str(100))+"\n", 40, 357);
    fill(120);
    text(idiomagui.getString("Estructuras"), 10, 417);

    fill(255);
    text(""+idiomaactual.get(str(105)), 40, 437);

    fill(120);
    text(idiomagui.getString("Matemáticas"), 10, 457);

    fill(255);
    text(""+idiomaactual.get(str(61)), 40, 477);
    text(""+idiomaactual.get(str(62)), 40, 497);
    text(""+idiomaactual.get(str(63)), 40, 517);
    text(""+idiomaactual.get(str(97)), 40, 537);
  }

  //--------------
  //   CONDICIÓN
  //--------------

  void condicion() {
    background(200);

    if (varclicked==true && lastargu==1) {
      valor1 = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }


    if (varclicked==true && lastargu==2) {
      valor2 = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }      

    if (condicion==false) {

      condicional= ""+objeto.get("condicion");

      if (objeto.isNull("valor1") == false) valor1= ""+objeto.get("valor1");
      if (objeto.isNull("valor1v") == false) { 
        valor1= ""+objeto.get("valor1v"); 
        arguvar1=true;
      }
      if (objeto.isNull("valor2") == false) valor2= ""+objeto.get("valor2");
      if (objeto.isNull("valor2v") == false) { 
        valor2= ""+objeto.get("valor2v"); 
        arguvar2=true;
      }
      condicion=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);

    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var
    
    fill(255);
    if (posy== 40 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 40, 15, 20); // cuadro #
    



    // botones  # y Var ARGUMENTO 3
    fill(255);
    if (arguvar2 == true || posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if ((arguvar2 == false && mousebif == false && keyif == false) || posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #
    

    // boton Caracter
    fill(255);
    if (keyif ==true || posy== 120 && mouseX>331 && mouseX<346)fill(80);
    rect(331, 120, 15, 20); // cuadro Caracter
    fill(0);
    text("C", 332, 137);

    // boton mouseButton
    fill(255);
    if (mousebif == true || posy== 120 && mouseX>352 && mouseX<368)fill(80);
    rect(352, 120, 16, 20); // cuadro mouseButton
    rect(352, 120, 16, 8);
    rect(358, 120, 4, 8);


    
    fill(0);
    text(idiomagui.getString("Valor")+" 1: ", 30, 55);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(valor1+"|", 170, 57);
    }
    fill(255);
    text(valor1, 170, 57); // muestra valor x

    fill(255);
    rect(169, 80, 15, 20); // rect >
    fill(0);
    text("=", 170, 95);
    if (condicional.equals("=") || posy== 80 && mouseX>170 && mouseX<185) {
      fill(80);
      rect(169, 80, 15, 20); // rect >
      fill(0);
      text("=", 170, 95);
    }

    fill(255);
    rect(189, 80, 15, 20); // rect <
    fill(0);
    text("<", 190, 95);
    if (condicional.equals("<") || posy== 80 && mouseX>190 && mouseX<205) {
      fill(80);
      rect(189, 80, 15, 20); // rect <
      fill(0);
      text("<", 190, 95);
    }

    fill(255);
    rect(209, 80, 15, 20); // rect =
    fill(0);
    text(">", 210, 95);
    if (condicional.equals(">") || posy== 80 && mouseX>210 && mouseX<225) {
      fill(80);
      rect(209, 80, 15, 20); // rect =
      fill(0);
      text(">", 210, 95);
    }

    fill(255);
    rect(229, 80, 25, 20); // rect =
    fill(0);
    text("!=", 231, 95);
    if (condicional.equals("!=") || posy== 80 && mouseX>230 && mouseX<255) {
      fill(80);
      rect(229, 80, 25, 20); // rect =
      fill(0);
      text("!=", 231, 95);
    }


    fill(0);
    text(idiomagui.getString("Valor")+" 2:", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(valor2+"|", 170, 137);
    }
    fill(255);
    text(valor2, 170, 137);






    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 55);
    text("#   Vr", 272, 135);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin CONDICIÓN


  //----------
  //  TAMTEXTO
  //-----------

  void tamtexto() {
    if (texto==false) {

      if (objeto.isNull("tamtexto") == false)temp= ""+objeto.get("tamtexto"); 
      else temp = "";
      texto=true;
    }

    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //linea = "textSize( "+temp+" );";
        linea = "c.font = '"+temp+"px sans-serif';";
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "tamtexto");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("tamtexto", temp);
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }
    background(200);

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);
    text(idiomagui.getString("Tamaño"), 30, 55);
    rect(168, 40, 100, 20); // area de texto tamaño
    fill(255);
    text(temp+"|", 170, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }

  //--------------
  //   ALEATORIO
  //--------------

  void aleatorio() {
    background(200);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }

    if (aleatorio==false) {
      if (objeto.isNull("variable") == false) px= ""+objeto.get("variable"); 
      else px="";
      arguvar1=true;
      if (lastid== 97 && objeto.isNull("vmaximo") == false) py= ""+objeto.get("vmaximo"); else
      if (lastid== 61 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); else
      if (lastid== 62 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); else
      if (lastid== 63 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); 
      else py="";
      aleatorio=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var

    //*/
    fill(0);
    text(idiomagui.getString("Variable")+": ", 30, 55);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);
    if(lastid == 97)text(idiomagui.getString("Valor")+" "+idiomagui.getString("Máximo")+":", 30, 95);
    if(lastid == 61)text(idiomaactual.getString(str(61))+" "+idiomagui.getString("Valor")+":", 30, 95);
    if(lastid == 62)text(idiomaactual.getString(str(62))+" "+idiomagui.getString("Valor")+":", 30, 95);
    if(lastid == 63)text(idiomaactual.getString(str(63))+" "+idiomagui.getString("Valor")+":", 30, 95);
    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);





    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("Vr", 294, 55);



    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin ALEATORIO

  //--------------
  //   POSITAM
  //--------------

  void positam() {
    background(200);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }
    if (varclicked==true && lastargu==3) {
      ancho = varenterasnom.get(nvarselec); 
      arguvar3=true; 
      varclicked=false;
    }      
    if (varclicked==true && lastargu==4) {
      alto = varenterasnom.get(nvarselec); 
      arguvar4=true; 
      varclicked=false;
    }      

    if (positam==false) {
      if (objeto.isNull("px") == false) px= ""+objeto.get("px");
      if (objeto.isNull("pxv") == false) { 
        px= ""+objeto.get("pxv"); 
        arguvar1=true;
      }
      if (objeto.isNull("py") == false) py= ""+objeto.get("py");
      if (objeto.isNull("pyv") == false) { 
        py= ""+objeto.get("pyv"); 
        arguvar2=true;
      }
      if (objeto.isNull("tx") == false) ancho= ""+objeto.get("tx");
      if (objeto.isNull("txv") == false) { 
        ancho= ""+objeto.get("txv");
        arguvar3=true;
      }
      if (objeto.isNull("ty") == false) alto= ""+objeto.get("ty");
      if (objeto.isNull("tyv") == false) { 
        alto= ""+objeto.get("tyv");
        arguvar4=true;
      }
      positam=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var
    fill(255);
    if (posy== 40 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 40, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 3
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 4
    fill(255);
    if (posy== 160 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 160, 32, 20); // cuadro var
    fill(255);
    if (posy== 160 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 160, 15, 20); // cuadro #

    fill(0);
    text(idiomagui.getString("Posición")+" X: ", 30, 55);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);
    text(idiomagui.getString("Posición")+" Y:", 30, 95);
    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);

    fill(0);
    text(idiomagui.getString("Ancho")+":", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(ancho+"|", 170, 137);
    }
    fill(255);
    text(ancho, 170, 137);


    fill(0);
    text(idiomagui.getString("Alto")+":", 30, 175);
    rect(168, 160, 100, 20);  // area de texto
    if (posy== 160||argumentos== 1001000) {
      fill(80);
      rect(168, 160, 100, 20);
      fill(0);
      text(alto+"|", 170, 177);
    }
    fill(255);
    text(alto, 170, 177);



    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 55);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);
    text("#   Vr", 272, 175);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin POSITAM


  //-------------------
  //   IMAGEN || VIDEO
  //-------------------

  void imagen() {
    background(200);
    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }


    if (imagen==false) {
      if (objeto.isNull("px") == false) px= ""+objeto.get("px");
      if (objeto.isNull("pxv") == false) { 
        px= ""+objeto.get("pxv"); 
        arguvar1=true;
      }
      if (objeto.isNull("py") == false) py= ""+objeto.get("py");
      if (objeto.isNull("pyv") == false) { 
        py= ""+objeto.get("pyv"); 
        arguvar2=true;
      }
      if (objeto.isNull("nombre") == false) temp= ""+objeto.get("nombre");
      imagen=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);



    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);


    fill(0);
    if (lastid==109)text(idiomagui.getString("Imagen")+":", 30, 55);
    if (lastid==118)text(idiomaactual.get("118")+":", 30, 55);
    rect(168, 40, width, 20);  // area de texto
    if (posy== 40||argumentos== 1000100) {
      fill(80);
      rect(168, 40, width, 20);
      fill(0);
      text(temp, 170, 57);
    }
    fill(255);
    text(temp, 170, 57);
    fill(0);

    text(idiomagui.getString("Posición")+" X: ", 30, 95);
    rect(168, 80, 100, 20);  // area de texto valor
    if (posy== 80||argumentos== 1000001) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(px+"|", 170, 97);
    }
    fill(255);
    text(px, 170, 97); // muestra valor x
    fill(0);

    text(idiomagui.getString("Posición")+" Y:", 30, 135);
    rect(168, 120, 100, 20); // area de texto
    if (posy== 120||argumentos== 1000010) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(py+"|", 170, 137);
    }
    fill(255);
    text(py, 170, 137);
    fill(0);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin IMAGEN

  //--------------
  //   TEXTO
  //--------------

  void texto() {
    background(200);
    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }


    if (texto==false) {
      if (objeto.isNull("px") == false) px= ""+objeto.get("px");
      if (objeto.isNull("pxv") == false) { 
        px= ""+objeto.get("pxv"); 
        arguvar1=true;
      }
      if (objeto.isNull("py") == false) py= ""+objeto.get("py");
      if (objeto.isNull("pyv") == false) { 
        py= ""+objeto.get("pyv"); 
        arguvar2=true;
      }
      if (objeto.isNull("texto") == false) temp= ""+objeto.get("texto");
      texto=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);



    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);


    fill(0);
    text(idiomagui.getString("Texto")+":", 30, 55);
    rect(168, 40, width, 20);  // area de texto
    if (posy== 40||arguvar0==true) {
      fill(80);
      rect(168, 40, width, 20);
      fill(0);
      text(temp+"|", 170, 57);
    }
    fill(255);
    text(temp, 170, 57);
    fill(0);

    text(idiomagui.getString("Posición")+" X: ", 30, 95);
    rect(168, 80, 100, 20);  // area de texto valor
    if (posy== 80||argumentos== 1000001) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(px+"|", 170, 97);
    }
    fill(255);
    text(px, 170, 97); // muestra valor x
    fill(0);

    text(idiomagui.getString("Posición")+" Y:", 30, 135);
    rect(168, 120, 100, 20); // area de texto
    if (posy== 120||argumentos== 1000010) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(py+"|", 170, 137);
    }
    fill(255);
    text(py, 170, 137);
    fill(0);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin TEXTO

  //--------
  //  NOTA
  //--------

  void nota() {

    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //linea = "nota.playNote( \""+nota+str(octava)+"\" );";
        
        linea = "playTone(\""+nota+str(octava)+"\", \"sine\", 0.3);";
        
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "tocanota");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("nota", ""+nota+str(octava));
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }

    x = mouseX-mouseX % 20;

    background(200);
    if (mousePressed==true) {
      if (x==100) nota='C';
      if (x==120)nota='D';
      if (x==140)nota='E';
      if (x==160)nota='F';
      if (x==180)nota='G';
      if (x==200)nota='A';
      if (x==220)nota='B';

      if (x==320)octava = 0;
      if (x==340)octava = 1;
      if (x==360)octava = 2;
      if (x==380)octava = 3;
      if (x==400)octava = 4;
      if (x==420)octava = 5;
      if (x==440)octava = 6;
      if (x==460)octava = 7;
      if (x==480)octava = 8;
      if (x==500)octava = 9;
    }

    if (posy==40) {
      fill(80);
      if (x==100)rect(100, 40, 20, 20);
      if (x==120)rect(120, 40, 20, 20); 
      if (x==140)rect(140, 40, 20, 20);
      if (x==160)rect(160, 40, 20, 20);
      if (x==180)rect(180, 40, 20, 20);
      if (x==200)rect(200, 40, 20, 20); 
      if (x==220)rect(220, 40, 20, 20);

      if (x==320)rect(320, 40, 20, 20);
      if (x==340)rect(340, 40, 20, 20);
      if (x==360)rect(360, 40, 20, 20);
      if (x==380)rect(380, 40, 20, 20);
      if (x==400)rect(400, 40, 20, 20);
      if (x==420)rect(420, 40, 20, 20);
      if (x==440)rect(440, 40, 20, 20);
      if (x==460)rect(460, 40, 20, 20);
      if (x==480)rect(480, 40, 20, 20);
      if (x==500)rect(500, 40, 20, 20);
    }

    fill(0);
    if (nota=='C')rect(100, 40, 20, 20);
    if (nota=='D')rect(120, 40, 20, 20); 
    if (nota=='E')rect(140, 40, 20, 20);
    if (nota=='F')rect(160, 40, 20, 20);
    if (nota=='G')rect(180, 40, 20, 20);
    if (nota=='A')rect(200, 40, 20, 20); 
    if (nota=='B')rect(220, 40, 20, 20);

    if (octava==0)rect(320, 40, 20, 20);
    if (octava==1)rect(340, 40, 20, 20);
    if (octava==2)rect(360, 40, 20, 20);
    if (octava==3)rect(380, 40, 20, 20);
    if (octava==4)rect(400, 40, 20, 20);
    if (octava==5)rect(420, 40, 20, 20);
    if (octava==6)rect(440, 40, 20, 20);
    if (octava==7)rect(460, 40, 20, 20);
    if (octava==8)rect(480, 40, 20, 20);
    if (octava==9)rect(500, 40, 20, 20);

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    
    fill(128);
    text(idiomagui.getString("Nota")+":", 30, 58);
    text(idiomagui.getString("Octava")+":", 250, 58);

    fill(255);
    text("C",104,58);
    text("D",124, 58); 
    text("E",144, 58);
    text("F",164, 58);
    text("G",184, 58);
    text("A",204, 58); 
    text("B",224, 58);
    
    text("0",324, 58);
    text("1",344, 58);
    text("2",364, 58);
    text("3",384, 58);
    text("4",404, 58);
    text("5",424, 58);
    text("6",444, 58);
    text("7",464, 58);
    text("8",484, 58);
    text("9",504, 58);
    


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }

  //----------
  //  SONIDO
  //-----------

  void sonido() {

    if (positam==false) {
      if (objeto.isNull("nombre") == false)temp = objeto.getString("nombre"); 
      else temp="";
      positam=true;
    }

    background(200);
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(temp, 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);

    fill(20);
    rect(300, 80, 120, 20);
    if (posy== 80 && mouseX>300 && mouseX<420) {
      fill(100);
      rect(300, 80, 120, 20);
    }
    fill(255);
    text(idiomagui.getString("Seleccionar"), 305, 95);
    stroke(0);
  } // fin sonido

  //----------
  //  Configuración 
  //-----------

  void config() {


    if (mousePressed== true) {
      
      /*
      // boton pantalla
      if (posy== 80 && mouseX>41 && mouseX<131) {
        fullscreen=true;
        configuration.getJSONObject(0).setBoolean("pantallacompleta", true);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/configuracion.json");
        exit();
        surface.setVisible(false);
      }
      // boton ventana
      if (posy== 80 && mouseX>170 && mouseX<260) {
        fullscreen=false;
        configuration.getJSONObject(0).setBoolean("pantallacompleta", false);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/configuracion.json");
        exit();
        surface.setVisible(false);
      }
      */
      
      // boton Website Github
      if (posy== 140 && mouseX>41 && mouseX<131) {
        link("https://github.com/hiteclab/Meta_Javascript/releases");
        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Configuración"), 10, 20); //else text(idiomagui.getString("Variable"), 10, 20);
    //text(idiomagui.getString("Tamaño")+" sketch: " , 50, 55);

/*
    // muestra boton Pantalla
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Pantalla"), 50, 95);

    // muestra boton Ventana
    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Ventana"), 180, 95);
    stroke(0);
    */
    
    // muestra boton Website Github
    fill(80);
    String[] actualver = loadStrings(codefolder+"/version.txt");
    text(idiomagui.getString("Nuevo")+" Meta_Javascript: "+newver[0], 50, 125);
    noStroke();
    fill(20);
    rect(41, 140, 90, 20);
    if (posy== 140 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 140, 90, 20);
    }
    fill(255);
    text("Website", 50, 155);
    
    
  }
  


  //----------
  //  COMENT 
  //-----------

  void coment() {


    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        //agregarvar = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = "//"+instru;
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("comentario", instru);
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Comentario"), 10, 20); //else text(idiomagui.getString("Variable"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(instru+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }


  //----------
  //  VARIABLE 
  //-----------

  void variable() {


    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        agregarvar = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        varenterasnom.append(temp);
        agregarvar = false;
        
        JSONObject obj = new JSONObject();
        obj.setString("valorinicial", "0");
        obj.setInt("tipo", 0);
        obj.setString("nombre", temp);
        cargavars.append(obj);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");
        
        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Variable"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(temp+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }


  //----------
  //  VARIABLE INI 
  //-----------

  void variableini() {
    
    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        selectvarini = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        selectvarini = false;
        
        JSONObject obj = new JSONObject();
        obj.setString("valorinicial", temp);
        obj.setInt("tipo", 0);
        obj.setString("nombre", varenterasnom.get(nvarselec));
        cargavars.setJSONObject(nvarselec-7, obj);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");
        
        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Valor")+" "+idiomagui.getString("Variable")+": "+varenterasnom.get(nvarselec), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    //fill(0,0,255);
    fill(255);
    text(temp+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }


  //----------
  //  PROYECTO 
  //-----------

  void proyecto() {
    
    agregarvar= false;
    selectvarini = false;
    opening=false;
    seleidio=false;
    config=false;
    
    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {        
        
        saveJSONArray(cargacodigo, sketchfolder+"/"+proyectonombre+"/"+proyectonombre+".json");
        saveJSONArray(cargamouse, sketchfolder+"/"+proyectonombre+"/raton.json");
        saveJSONArray(cargateclado, sketchfolder+"/"+proyectonombre+"/teclado.json");
        
        configuration.getJSONObject(1).setInt("cuadros",velocidad);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");
        saveJSONArray(configuration, sketchfolder+"/"+proyectonombre+"/configuracion.json");
        byte[] data = {  }; saveBytes(sketchfolder+"/"+proyectonombre+"/data/data.txt", data); // crea carpeta data en el proyecto

        String[] last = new String[1];
        last = expand(last, 1);
        last[0] =  proyectonombre;
        saveStrings(sketchfolder+"/lastopen.txt", last );
        updatewindowname=true;

        String[] command4 = {"/bin/bash", "-c", "cp "+codefolder+"/simpleTones.js "+sketchfolder+proyectonombre};
        Process p4= exec(command4);


        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Proyecto"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(proyectonombre+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }



  //--------------
  //   LINEA
  //--------------

  void linea() {
    background(200);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }
    if (varclicked==true && lastargu==3) {
      ancho = varenterasnom.get(nvarselec); 
      arguvar3=true; 
      varclicked=false;
    }      
    if (varclicked==true && lastargu==4) {
      alto = varenterasnom.get(nvarselec); 
      arguvar4=true; 
      varclicked=false;
    }  

    if (positam==false) {
      if (objeto.isNull("pxt1") == false) px= ""+objeto.get("pxt1");
      if (objeto.isNull("pxt1v") == false) { 
        px= ""+objeto.get("pxt1v"); 
        arguvar1=true;
      }
      if (objeto.isNull("pyt1") == false) py= ""+objeto.get("pyt1");
      if (objeto.isNull("pyt1v") == false) { 
        py= ""+objeto.get("pyt1v"); 
        arguvar2=true;
      }
      if (objeto.isNull("pxt2") == false) ancho= ""+objeto.get("pxt2");
      if (objeto.isNull("pxt2v") == false) { 
        ancho= ""+objeto.get("pxt2v");
        arguvar3=true;
      }
      if (objeto.isNull("pyt2") == false) alto= ""+objeto.get("pyt2");
      if (objeto.isNull("pyt2v") == false) { 
        alto= ""+objeto.get("pyt2v");
        arguvar4=true;
      }
      positam=true;
    }

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var
    fill(255);
    if (posy== 40 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 40, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 3
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 4
    fill(255);
    if (posy== 160 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 160, 32, 20); // cuadro var
    fill(255);
    if (posy== 160 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 160, 15, 20); // cuadro #

    fill(0);

    text(idiomagui.getString("Posición")+"1 X: ", 30, 55);

    rect(168, 40, 100, 20);  // area de texto valor

    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);

    text(idiomagui.getString("Posición")+"1 Y:", 30, 95);

    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);
    fill(0);


    text(idiomagui.getString("Posición")+"2 X:", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(ancho+"|", 170, 137);
    }
    fill(255);
    text(ancho, 170, 137);
    fill(0);


    text(idiomagui.getString("Posición")+"2 Y:", 30, 175);
    rect(168, 160, 100, 20);  // area de texto
    if (posy== 160||argumentos== 1001000) {
      fill(80);
      rect(168, 160, 100, 20);
      fill(0);
      text(alto+"|", 170, 177);
    }
    fill(255);
    text(alto, 170, 177);


    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 55);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);
    text("#   Vr", 272, 175);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin linea



  //--------------
  //   TREIANGULO
  //--------------

  void triangulo() {
    background(200);
    if (positam==false) {
      if (objeto.isNull("pxt1") == false) px= ""+objeto.get("pxt1");
      if (objeto.isNull("pyt1") == false) py= ""+objeto.get("pyt1");
      if (objeto.isNull("pxt2") == false) ancho= ""+objeto.get("pxt2");
      if (objeto.isNull("pyt2") == false) alto= ""+objeto.get("pyt2");
      if (objeto.isNull("pxt3") == false) pxt3= ""+objeto.get("pxt3");
      if (objeto.isNull("pyt3") == false) pyt3= ""+objeto.get("pyt3");
      positam=true;
    }


    if (mousePressed==true) { 
      if (posy== 40)  argumentos= 1000001; // casilla x
      if (posy== 80)  argumentos= 1000010; // casilla y
      if (posy== 120) argumentos= 1000100; // casilla ancho
      if (posy== 160) argumentos= 1001000; // casilla alto
      if (posy== 200) argumentos= 1010000; // casilla alto
      if (posy== 240) argumentos= 1100000; // casilla altoF
      // boton cancelar
      if (posy== 300 && mouseX>41 && mouseX<131) {
        ventana=false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 300 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //linea = "triangle( "+px+", "+py+", "+ancho+", "+alto+", "+pxt3+", "+pyt3+" );";
        linea = "c.beginPath();\n c.moveTo("+px+","+py+");\n c.lineTo("+ancho+","+alto+");\n c.lineTo("+pxt3+","+pyt3+");\n c.fill();\n c.moveTo("+px+","+py+");\n c.lineTo("+ancho+","+alto+");\n c.lineTo("+pxt3+","+pyt3+");\n c.closePath();\n c.stroke();\n";
        
        
        
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "triangulo");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("pxt1", int(px));
        renuevaobjeto.setInt("pyt1", int(py));
        renuevaobjeto.setInt("pxt2", int(ancho));
        renuevaobjeto.setInt("pyt2", int(alto));
        renuevaobjeto.setInt("pxt3", int(pxt3));
        renuevaobjeto.setInt("pyt3", int(pyt3));
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    }

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);

    text(idiomagui.getString("Posición")+"1 X: ", 30, 55);

    rect(168, 40, 100, 20);  // area de texto valor

    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);

    text(idiomagui.getString("Posición")+"1 Y:", 30, 95);

    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);
    fill(0);

    text(idiomagui.getString("Posición")+"2 X:", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(ancho+"|", 170, 137);
    }
    fill(255);
    text(ancho, 170, 137);
    fill(0);

    text(idiomagui.getString("Posición")+"2 Y:", 30, 175);
    rect(168, 160, 100, 20);  // area de texto
    if (posy== 160||argumentos== 1001000) {
      fill(80);
      rect(168, 160, 100, 20);
      fill(0);
      text(alto+"|", 170, 177);
    }
    fill(255);
    text(alto, 170, 177);
    fill(0);

    text(idiomagui.getString("Posición")+"3 X:", 30, 215);
    rect(168, 200, 100, 20);  // area de texto
    if (posy== 200||argumentos== 1010000) {
      fill(80);
      rect(168, 200, 100, 20);
      fill(0);
      text(pxt3+"|", 170, 217);
    }
    fill(255);
    text(pxt3, 170, 217);
    fill(0);

    text(idiomagui.getString("Posición")+"3 Y:", 30, 255);
    rect(168, 240, 100, 20);  // area de texto
    if (posy== 240||argumentos== 1100000) {
      fill(80);
      rect(168, 240, 100, 20);
      fill(0);
      text(pyt3+"|", 170, 257);
    }
    fill(255);
    text(pyt3, 170, 257);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 300, 90, 20);
    if (posy== 300 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 300, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 315);

    fill(20);
    rect(170, 300, 90, 20);
    if (posy== 300 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 300, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 315);
    stroke(0);
  }  // fin triangulo


  //--------------
  // COLORSELECTOR
  //--------------

  void colorselector() {    
    
    if (varclicked==true) { 
      variablecolor=""+varenterasnom.get(nvarselec);
      varclicked=false;
    }
    
    background(200);
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else { 
      text(""+idiomaactual.get(str(lastid)), 10, 20); 
      instruancho= int(textWidth(" "+idiomaactual.get(str(lastid))));
    }
    if (objeto.isNull("color") == false) fill(objeto.getInt("color"));
    if (objeto.isNull("colorh") == false) fill(unhex(objeto.getString("colorh")));

    rect(instruancho+10, 5, 10, 20);
    noStroke();

    if (mousePressed== true) {
      if (mouseX>9 && mouseX<266 && mouseY>39 && mouseY<296) {
        rf=r;
        gf=g;
        bf=b;
      }
      if (mouseX>9 && mouseX<266 && mouseY>295 && mouseY <316) b=mouseX-10;

      if (mouseX>9 && mouseX<266 && mouseY>340) {
        grayf= mouseX-10;
      }

      // boton seleccioar color
      if (mouseX>280 && mouseX <380 && mouseY > 160 && mouseY <180) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //if (lastid==102) linea = "fill( #"+c+" );";
        if (lastid==102) linea = "c.fillStyle = \"#"+c+"\";";
        
        //if (lastid==98) linea = "background( #"+c+" );";
        if (lastid==98) linea = " lastfill = c.fillStyle;\n c.fillStyle = '#"+c+"';\n c.fillRect(0,0,cw.width, cw.height);\n c.fillStyle = lastfill;";
        
        //if (lastid==115) linea = "stroke( #"+c+" );";        
        if (lastid==115) linea = "c.strokeStyle = \"#"+c+"\";";
        
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==102)renuevaobjeto.setString("instruccion", "relleno");
        if (lastid==98)renuevaobjeto.setString("instruccion", "fondo");
        if (lastid==115)renuevaobjeto.setString("instruccion", "colorlinea");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("colorh", "FF"+c);
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }

      // boton seleccionar gris
      if (mouseX>280 && mouseX <380 && mouseY > 373 && mouseY <478) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        
        color graycolor = color(grayf, grayf, grayf);
        println(hex(graycolor,6));
        
        //if (lastid==102) linea = "fill( "+grayf+" );";
        if (lastid==102) linea = "c.fillStyle = \"#"+hex(graycolor,6)+"\";";
        
        //if (lastid==98) linea = "background( "+grayf+" );";
        if (lastid==98) linea = " lastfill = c.fillStyle;\n c.fillStyle = '#"+hex(graycolor,6)+"';\n c.fillRect(0,0,cw.width, cw.height);\n c.fillStyle = lastfill;";
        
        //if (lastid==115) linea = "stroke( "+grayf+" );"; 
        if (lastid==115) linea = "c.strokeStyle = \"#"+hex(graycolor,6)+"\";";
        
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==102)renuevaobjeto.setString("instruccion", "relleno");
        if (lastid==98)renuevaobjeto.setString("instruccion", "fondo");
        if (lastid==115)renuevaobjeto.setString("instruccion", "colorlinea");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("color", grayf);
        renuevaobjeto.setString("js", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
      
      
      // bonton aplicar var
      if (mouseX>280 && mouseX <395 && mouseY > 39 && mouseY <59) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        //if (lastid==102) linea = "fill( "+variablecolor+" );";
        if (lastid==102) linea = "c.fillStyle = 'rgba('+"+variablecolor+"+', '+"+variablecolor+"+', '+"+variablecolor+"+', 1)';";

        
        //if (lastid==98) linea = "background( "+variablecolor+" );";
        //'rgba('+fondo+', '+fondo+', '+fondo+', 1)'
        if (lastid==98) linea = " lastfill = c.fillStyle;\n c.fillStyle = 'rgba('+"+variablecolor+"+', '+"+variablecolor+"+', '+"+variablecolor+"+', 1)';\n c.fillRect(0,0,cw.width, cw.height);\n c.fillStyle = lastfill;";

        //if (lastid==115) linea = "stroke( "+variablecolor+" );"; 
        if (lastid==115) linea = "c.strokeStyle = 'rgba('+"+variablecolor+"+', '+"+variablecolor+"+', '+"+variablecolor+"+', 1)';";

        
        
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==102)renuevaobjeto.setString("instruccion", "relleno");
        if (lastid==98)renuevaobjeto.setString("instruccion", "fondo");
        if (lastid==115)renuevaobjeto.setString("instruccion", "colorlinea");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("colorv", variablecolor);
        variablecolor="";
 
        renuevaobjeto.setString("js", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
      
      
    }

    // genera matriz de colores
    for (r=40; r<296; r++) {
      for (g=10; g<266; g++) {
        fill(r-40, g-10, b);
        rect(g, r, 1, 1);
      }
    }





    if (mouseX>9 && mouseX<266) g=mouseX-10;
    if (mouseY<296) r=mouseY-40;
    fill(r, g, b);

    if (mouseX>9 && mouseX<266 && mouseY>39 && mouseY<296) {
      stroke(0);
      rect(mouseX, mouseY-10, 10, 10);
    }


    // cuadrado color final
    fill(rf, gf, bf);
    noStroke();
    rect(280, 130, 20, 20);

    // cuadrado color gris
    fill(grayf);
    stroke(0);
    rect(280, 340, 20, 20);
    noStroke();



    // barra selector color
    fill(128);
    rect(10, 296, 255, 20);

    // indicador barra color
    fill(0);
    rect(b+10, 296, 5, 20);

    // barra selector de grises
    for (gray=10; gray<266; gray++) {
      fill(gray-10);
      rect(gray, 340, 1, 20);
    }

    // idicador barra grises
    fill(128);
    rect(grayf+10, 340, 5, 20);

    fill(80);  
    text("Gris: "+grayf, 310, 355);

    c=hex(rf, 2)+hex(gf, 2)+hex(bf, 2);
    text("#FF"+c, 310, 140);

    // boton aplicar var
    fill(80);
    rect(280, 39, 115, 20);

    // boton color
    fill(80);
    rect(280, 160, 115, 20);

    // boton gris
    fill(80);
    rect(280, 373, 115, 20);
 
    // boton variable
    fill(255);
    rect(280, 10, 32, 20);
    
    // resalta var
    if (mouseX>280 && mouseX <312 && mouseY > 10 && mouseY <30) {
      fill(128);
      rect(280, 10, 32, 20);
    }
    

    fill(0);
    text("Vr", 287, 25);


    // resalta boton aplicar var
    if (mouseX>280 && mouseX <395 && mouseY > 39 && mouseY <59) {
      fill(220);
      rect(280, 39, 115, 20);
    }


    // resalta boton color
    if (mouseX>280 && mouseX <395 && mouseY > 160 && mouseY <180) {
      fill(220);
      rect(280, 160, 115, 20);
    }

    // resalta boton gris
    if (mouseX>280 && mouseX <395 && mouseY > 373 && mouseY <478) {
      fill(220);
      rect(280, 373, 115, 20);
    }

    fill(255);

    // boton seleccionar var
    text(idiomagui.getString("Seleccionar"), 282, 54);
    // boton seleccionar color
    text(idiomagui.getString("Seleccionar"), 282, 175);
    // boton seleccionar gris
    text(idiomagui.getString("Seleccionar"), 282, 390);
  } // fin color selector


  //-------------------
  //   INICIO  TYPELIB
  //-------------------

  String typetext(String datos) {

    if (key==BACKSPACE) { 

      if (datos.length() > 0) {
        datos= datos.substring(0, datos.length()-1);
      }
    } else {
      if (key != CODED)datos= datos+key;
    }

    return datos;
  }

  char typechar(char dato) {

    if (key==BACKSPACE) { 

      dato = ' ';
    } else {
      dato= key;
    }

    return dato;
  }

  String typeint(String datos) {
    if (datos.length() == 0 && key == '-' ) {
      datos= "-";
    } else
      if (key==BACKSPACE) { 

        if (datos.length() > 0) {
          datos= datos.substring(0, datos.length()-1);
        }
      } else {
        if (key == '0' || key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' )
          datos= datos+key;
      }

    return datos;
  }

  String typefloat(String datos) {

    if (key==BACKSPACE) { 

      if (datos.length() > 0) {
        datos= datos.substring(0, datos.length()-1);
      }
    } else {
      if (key == '0' || key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9'||key == '.')
        datos= datos+key;
    }

    return datos;
  }




  void exit()
  {
    // cerrar splash al abrir Meta_Javascript
    if (s>50 && opening==true) {
      mainwindow=true;
      codewin=true;
      opening=false;
      surface.setVisible(false);
    }
    mainwindow=true;
    codewin=true;
    seleidio=false;
    ventana=false;
    imagen=false;
    positam=false;
    condicion=false;
    texto=false;
    aleatorio=false;
    opening=false;
    dispose();
    wininstru = null;
    agregarvar = false;
    proyecto=false;
    arguvar0=false;
    arguvar1=false;
    arguvar2=false;
    arguvar3=false;
    arguvar4=false;
    arguvar5=false;
    arguvar6=false; // variables para saber si un argumento usa un valor (false) o una varible (true)
    selectvarini = false;
    config=false;
  }

}