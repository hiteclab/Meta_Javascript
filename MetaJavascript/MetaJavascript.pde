// META_JAVASCRIPT Version Alpha 1.0
// (ɔ) 2020  Jose David Cuartas, GPL v.3
// Hiteclab, http://hiteclab.libertadores.edu.co/
// Fundación Universitaria Los Libertadores, Colombia
// Proyecto deribado de META_PROCESING Creado usando:
// Processing 3.4 GNU GPL Version 3 The Processing Foundation

// PENDIENTE:
// botones subir y bajar lineas de código
// agregar CRL+Z o desacer borrar línea
//import java.io.*;

PWindow3 wininstru;
PWindow4 variables;

int wide=0;
int funcion=0;
JSONArray cargacodigo, cargavars, cargamouse, cargateclado, configuration;
int linea=1, tlineas=1, lineaanterior=0, linearaton=1, lineaclik=0; // linea es la linea actual, tlineas es el total de líneas a ejecutar
int lineamouse=1, tlineasmouse=1;
int lineateclado=1, tlineasteclado=1;
int nargumentos;
int widthline;
int lineasi, silineas, sinolineas; 
int lineapara, valorini, valorfinal, incremento, paralineas;
int id, idlee;
int i=0;
int idioma=0;
int velocidad;
int codetab=0; // bandera de la pestaña abierta. [ 0 = Principal] [ 1 = raton] [ 2 = teclado ]
int ventatamx, ventatamy;
int pixelsintru, pixelsparam;
StringList varenterasnom, varstringnom, varstringval;
IntList varenterasval;
JSONObject objeto, objetoml, prototipoinstru;
JSONObject objetoactual;
JSONObject idiomaactual, espanol, idiomagui, frances, francesgui, ingles, cree, japones;
int px=0, py=0, tx=0, ty=0, pxt1=0, pyt1=0, pxt2=0, pyt2=0, pxt3=0, pyt3=0;
ArrayList<PImage> images = new ArrayList<PImage>();
String line, temp; // se usa para guarda el texto de cada linea de código
boolean si = false, para = false, video = false, pausa=false, paso=true, ejecuta=false, reinicia = false, inicio=true;
boolean siprincipal =false, siraton=false, siteclado=false;
boolean ventana=false;
boolean imagen=false; // bandera funcion imagen en Ventanas
boolean texto=false; // bandera funcion texto en Ventanas
boolean condicion=false; // bandera funcion condicion en Ventanas
boolean aleatorio=false; // bandera funcion aleatorio en Ventanas
boolean positam=false; // bandera funcion positam en Ventanas
boolean seleidio=false; // bandera funcion seleccion de idioma
String codefolder, sketchfolder;
boolean varibleswin=false;
color resalta=#323232; // 50 escala de grises
int nvarselec; // guarda el numero de la variable seleccionada
boolean arguvar1=false, arguvar2=false, arguvar3=false, arguvar4=false, arguvar5=false, arguvar6=false; // variables para saber si un argumento usa un valor (false) o una varible (true)  
int lastargu;
boolean arguvar0=false; // para casilla de texto en funcion texto
boolean opening=true;
boolean varclicked=false; // bandera para saber cuando se seleciona una variable en la ventana de variables
boolean runwindow=false;
boolean onetime=true;
boolean codewin=false;
boolean salir=false; // bandera para salir del programa al presionar el boton salir
boolean proyecto=false; // bandera para seleccionar nombre del proyecto al presionar boton nuevo
String proyectonombre="";
PImage iconos; // varialble que contiene la imagen con los iconos de la la interfaz
int s; // contador segundos splash
boolean mainwindow=false;
boolean agregarvar=false;
boolean eliminavar=false;
boolean updatewindowname=false;
String metafolder;
String variablecolor;
boolean selectvarini=false; // bandera para saber que la variable se seleccionó para definir su valor inicial
boolean existe = false; // bandera de existencia de archivo lastopen
boolean existeproyecto=false; // bandera de existencia de proyecto
boolean config=false; // bandera para abrir configuración
boolean fullscreen=false;
String[] newver = new String[1];



  int y, posy;
  boolean ctrlPressed;
  boolean libminim = false, libvideo = false;
  color fondo =  #000000, fondobarrasup = #323232, fondoresalta= #141414, fondotabsresalta= #323232, fondotabs = #000000, fondobarrainf = #505050; 
  /*
Grayscale  =   RGB
   80         = FF505050
   50         = FF323232
   0          = FF000000
   128        = FF808080
   20         = FF141414
   */

  void settings() {
       size(700, 800, JAVA2D);

  }

  void setup() {
    surface.setResizable(true); 
    if(mainwindow==false) surface.setVisible(false); // oculta la ventana de ejecución de código para mostrar al abri MetaJavascript solo el splah

    textFont(createFont("Arial Unicode MS",17));
    configuracion();
    
    // abre el splash
    wininstru = new PWindow3();
  }

  void draw() {
    // muesta la ventana de código al cerrar el splash 
    if (onetime==true && codewin==true) {
      surface.setVisible(true); 
      onetime=false;
      surface.setTitle(proyectonombre);
    }
    
    // actualiza el nombre de la ventana cada vez que se abre un nuevo proyecto
   if (updatewindowname==true) {
      surface.setTitle(proyectonombre);
      updatewindowname=false;
    }    
    
    background(fondo); //0

    // resalta línea en la que se hizo click
    fill(fondoresalta); // 20
    noStroke();
    rect(0, 22+20*(lineaclik+1), width, 20);
    stroke(128);

    // se calcula la linea que esta señalando el raton
    textSize(18);

    posy= mouseY-mouseY % 20;
    
    y= ((posy-40)/20)+1;


    // barra inferior
    fill(fondotabs); // 0
    stroke(128);
    rect(0, height-71, 270, height ); // Pestaña Teclado
    rect(0, height-71, 180, height ); // Pestaña Ratón
    rect(0, height-71, 100, height ); // Pestaña codigo Principal
    fill(fondotabsresalta); // 50
    if (codetab==0 || mouseX<100 && mouseY > height-71 && mouseY < height)rect(0, height-71, 100, height ); // Resalta pestaña Código Principal
    if (codetab==1 || mouseX > 100 && mouseX < 180 && mouseY > height-71 && mouseY < height)rect(100, height-71, 80, height ); // Resalta pestaña Raton
    if (codetab==2 || mouseX > 180 && mouseX < 270 && mouseY > height-71 && mouseY < height)rect(180, height-71, 90, height ); // Resalta pestaña Teclado
    fill(128);
    text(idiomagui.getString("Principal"), 10, height-51);
    text(idiomagui.getString("Ratón"), 110, height-51);
    text(idiomagui.getString("Teclado"), 190, height-51);
    fill(fondobarrainf); //80
    rect(0, height-45, width, height ); // 30
    // fin barra inferior
    
        
        
    // barra superior    
    pushStyle();

    fill(fondobarrasup); // 0
    stroke(80);
    strokeWeight(2);
    rect(0, 0, width, 40);
    stroke(255);
    strokeJoin(ROUND);
    noFill();
    strokeWeight(2);

    triangle(20, 10, 20, 30, 40, 20); // boton ejecutar
    
    rect(245, 10, 20, 24); // boton variable

    
 
      // reslata boton variables
    if (mouseX>245 && mouseX<265 && mouseY>10 && mouseY<34) {
      fill(128);
      stroke(255);
      rect(245, 10, 20, 24); // boton variable
      fill(255); 
      text(idiomagui.getString("Variables"),15, height-22);
    }
    
    fill(255);
    text("V",249,29); 
    
     // reslata boton + variable
    if (mouseX>270 && mouseX<282 && mouseY>10 && mouseY<20) {
      fill(50);
      stroke(255);
      rect(270, 10, 10, 10);
      fill(255); 
      text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Variable"),15, height-22);
    }
    // resalta boton - variable
    if (mouseX>270 && mouseX<282 && mouseY>25 && mouseY<35) {
      fill(50);
      stroke(255);
      rect(270, 25, 10, 10);
      fill(255); 
      text(idiomagui.getString("Eliminar")+" "+idiomagui.getString("Variable"),15, height-22);
    }
    
    text("+",268,22);
    text("-",272,35);
    
    noStroke();
    
    // resalta ejecutar
    if (mouseX>20 && mouseX<40 && mouseY>10 && mouseY<30) {
      fill(128);
      triangle(20, 10, 20, 30, 40, 20); // boton ejecutar
      fill(255); 
      text(idiomagui.getString("Ejecutar"),15, height-22);
    }
    

    // resalta boton capeta data
    if (mouseX>300 && mouseX<325 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(300, 10, 26, 25);
      fill(255);
      text("Data",15, height-22);
    }

    // resalta boton Nuevo
    if (mouseX>350 && mouseX<375 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(350, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Nuevo"),15, height-22);
    }    


    // resalta boton Abrir
    if (mouseX>400 && mouseX<425 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(400, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Abrir"),15, height-22);
    }    

    // resalta boton guardar
    if (mouseX>450 && mouseX<475 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(450, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Guardar"),15, height-22);
    }


    // resalta boton exportar
    if (mouseX>500 && mouseX<525 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(500, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Exportar"),15, height-22);
    }

    // resalta boton idioma
    if (mouseX>600 && mouseX<625 && mouseY>10 && mouseY<30) { 
      fill(128); 
      noStroke();
      rect(600, 10, 25, 25); 
      fill(255); 
      text(idiomagui.getString("Idioma"),15, height-22);
    }

    // resalta boton Configuración
    if (mouseX>650 && mouseX<675 && mouseY>10 && mouseY<30) { 
      fill(128); 
      noStroke();
      rect(650, 10, 25, 25); 
      fill(255); 
      text(idiomagui.getString("Configuración"),15, height-22);
    }



    image(iconos, 0, 10);


    popStyle();
  // fin barra superior
    
    

    if (y>0 && y <=tlineas) {

      linearaton=y; 

      JSONObject objeto;
      objeto = new JSONObject();

      // aquí se carga la instruccion a la que apunta el raton y se carga el id de dicha instrucción
      if (codetab==0) objeto = cargacodigo.getJSONObject(linearaton-1);
      if (codetab==1) objeto = cargamouse.getJSONObject(linearaton-1);
      if (codetab==2) objeto = cargateclado.getJSONObject(linearaton-1);
      int id = objeto.getInt("id");
      fill(50);

      // se calcula el tamaño en pixels de la linea
      leelinea(linearaton-1);
      widthline = int(textWidth(""+line));

      // resalta linea que apunta el mouse solo hasta el final de la línea
      rect(0, 22+20*y, widthline+40, 20);

      // muestra boton agregar línea
      if (mouseX>widthline+50 && mouseX<widthline+70) {
        noStroke();

        if (id==105 || objeto.isNull("si") == false || objeto.isNull("sino") == false) {
          fill(0, 0, 255); 
          quad(widthline+50, (33+20*y), widthline+60, (33+20*y)+10, widthline+70, (33+20*y), widthline+60, (33+20*y)-10);
          fill(255);
          if (id==105 || objeto.isNull("si") == false ) text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Si"),15, height-22);
          else if (objeto.isNull("sino") == false) text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Sino"),15, height-22);
        } else {
          fill(#1BF50C);
          ellipse(widthline+60, 33+20*y, 20, 20);
          fill(255);
          text(idiomagui.getString("Agregar"),15, height-22);
        }

        fill(0);
        text("+", widthline+53, 37+20*y);
        stroke(128);
      }

      // muestra boton agregar sino dede linea si
      if (mouseX>widthline+140 && mouseX<widthline+160) {
        if (objeto.isNull("si") == false ) { 
          fill(#FFEC12); 
          quad(widthline+140, (33+20*y), widthline+150, (33+20*y)+10, widthline+160, (33+20*y), widthline+150, (33+20*y)-10);
        }
        fill(255);
        if( objetoml.isNull("si") == false || objetoml.isNull("sino") == false){
          text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Sino"),15, height-22);  
          fill(0);
          text("+", widthline+143, 37+20*y);
          stroke(128);
        }
      }



      // muestra boton eliminar línea
      if (mouseX>widthline+80 && mouseX<widthline+100) {

        fill(255, 0, 0);
        line(40, 33+20*y, widthline+85, 33+20*y);
        noStroke();
        ellipse(widthline+90, 33+20*y, 20, 20);
        fill(0);
        text("-", widthline+85, 37+20*y);
        stroke(128);
        fill(255);
        text(idiomagui.getString("Eliminar"),15, height-22);
      }   

      // muesta boton agregar línea fuera del if
      if (mouseX>widthline+110 && mouseX<widthline+130) {
        if (objeto.isNull("si") == false || objeto.isNull("sino") == false) {
          fill(#1BF50C);
          ellipse(widthline+120, 33+20*y, 20, 20);
          fill(0);
          text("+", widthline+113, 37+20*y);
          fill(255);
          text(idiomagui.getString("Agregar"),15, height-22);
        }
      }

      // Muestra prototipo de la instrucción en la barra inferior
      fill(255);
      if (mouseX<widthline+40)text(prototipoinstru.getString(str(id)),15, height-22);
    }

    // Resalta linea en ejecucion al presionar boton parar
    if (lineaanterior!=0) { 
      fill(resalta);
      rect(40, 22+(20*lineaanterior), width, 20);
    }
    numera();

    if (codetab==0) {
      tlineas = cargacodigo.size(); 
      for (int i=0; i< tlineas; i++) {
        objetoml = cargacodigo.getJSONObject(i);

        muestralinea(i);
      }
    }

    if (codetab==1) {
      tlineasmouse = cargamouse.size();
      tlineas = tlineasmouse;
      for (int i=0; i< tlineasmouse; i++) {
        objetoml = cargamouse.getJSONObject(i);

        muestralinea(i);
      }
    }

    if (codetab==2) {
      tlineasteclado = cargateclado.size(); 
      tlineas = tlineasteclado;
      for (int i=0; i< tlineasteclado; i++) {
        objetoml = cargateclado.getJSONObject(i);

        muestralinea(i);
      }
    }

  }
  void keyPressed() {
    if (keyCode==ESC)exit();
  }

  void mousePressed() {

    
    // Boton pestaña: Principal   // bandera de la pestaña abierta. [ 0 = Principal] [ 1 = raton] [ 2 = teclado ]
    if (mouseX<100 && mouseY > height-71 && mouseY < height) {
      codetab=0; // Resalta pestaña Código Principal
      tlineas = cargacodigo.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
    }
    // Boton pestaña: Raton
    if (mouseX > 100 && mouseX < 180 && mouseY > height-71 && mouseY < height) {
      codetab=1; // Resalta pestaña Raton
      tlineas = cargamouse.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      lineamouse=1; 
      tlineasmouse=1;
    }
    // Boton pestaña: Teclado
    if (mouseX > 180 && mouseX < 270 && mouseY > height-71 && mouseY < height) {
      codetab=2; // Resalta pestaña Teclado
      tlineas = cargateclado.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      lineateclado=1; 
      tlineasteclado=1;
    }


     // boton variables
    if (mouseX>245 && mouseX<265 && mouseY>10 && mouseY<34) {
      selectvarini = true;  
      variables = new PWindow4();
        
    }

     // agregar + variable
    if (mouseX>270 && mouseX<282 && mouseY>10 && mouseY<20) {
      agregarvar = true;
      temp="";
      wininstru = new PWindow3();
    
    }

    // eliminar - variable
    if (mouseX>270 && mouseX<282 && mouseY>25 && mouseY<35) {
      eliminavar=true;
      variables = new PWindow4();
    }
    
    
    
    // boton ejecuta
    if (mouseX>20 && mouseX<40 && mouseY>10 && mouseY<30) {
      println("Ejecuta");
      fill(0,255,0);
      triangle(20, 10, 20, 30, 40, 20); // boton ejecutar
      guardajs(1);
      
      
      
      
      String OS = System.getProperty("os.name").toLowerCase(); 
      
      if( OS.contains("linux") == true) {        
      link( "file:///"+sketchfolder+proyectonombre+"/"+proyectonombre+".html");
      } 
      
      if( OS.contains("windows") == true) {
        String URL;
        URL = sketchfolder+proyectonombre+"\\"+proyectonombre+".html";
        URL = URL.replace('\\', '/');
        link(URL);
      }  
      
      if( OS.contains("mac") == true) {
        /*
        //String commandToRun = "/usr/local/bin/processing-java --sketch="+sketchfolder+proyectonombre+" --force --run";
        String commandToRun = metafolder+"processing-java --sketch="+sketchfolder+proyectonombre+" --force --run";
        //String[] commandToRun = {"."+metafolder+"processing-java --sketch="+sketchfolder+proyectonombre+" --force --run"};
        println(commandToRun);
        File workingDir = new File(metafolder);   // where to do it - should be full path
        try {Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);} catch (Exception e) {}
        */
        link( "file:///"+sketchfolder+proyectonombre+"/"+proyectonombre+".html");
        
      }
      
      
    }
    

    // boton capeta data
    if (mouseX>300 && mouseX<325 && mouseY>10 && mouseY<30) {
      
      String OS = System.getProperty("os.name").toLowerCase(); 
      
      if( OS.contains("linux") == true) {
        String[] command = {"/bin/bash", "-c", "xdg-open "+sketchfolder+proyectonombre+"/data"}; 
        Process p= exec(command); // abre carpeta sketch
      } 
      
      if( OS.contains("windows") == true) {
        String[] command = { "cmd", "/c", "explorer" , sketchfolder+proyectonombre+"\\data"};
        Process p= exec(command); // abre carpeta sketch
      }  
      
      if( OS.contains("mac") == true) {
        launch("/System/Library/CoreServices/Finder.app", sketchfolder+proyectonombre+"/data");
      }
      
    }

    // boton Nuevo
    if (mouseX>350 && mouseX<375 && mouseY>10 && mouseY<30) {
      println("Nuevo proyecto");
      proyecto = true;
      

      cargavars = new JSONArray();

      wininstru = new PWindow3();

      JSONObject renuevaobjeto = new JSONObject();
      renuevaobjeto.setInt("id", -1);


      linea=1; 
      tlineas=1;
      lineamouse=1; 
      tlineasmouse=1;
      lineateclado=1; 
      tlineasteclado=1;
      reinicia=true;
      linea = 1;
      lineaanterior=0;
      pausa=false;
      paso=true;
      ejecuta=false; 
      inicio=true;
      runwindow=false;
      codetab=0;
       
      line=""+idiomaactual.get(str(-1));
      idlee=-1;


      cargacodigo = new JSONArray();
      cargamouse = new JSONArray();
      cargateclado = new JSONArray();

      varenterasnom = new StringList();
      creavariables();
      cargacodigo.setJSONObject(0, renuevaobjeto); 
      cargamouse.setJSONObject(0, renuevaobjeto);         
      cargateclado.setJSONObject(0, renuevaobjeto);

    

      
    }

    // boton Abrir
    if (mouseX>400 && mouseX<425 && mouseY>10 && mouseY<30) {

      elegircarpeta();
      
    }

    // Boton guardar
    if (mouseX>450 && mouseX<475 && mouseY>10 && mouseY<30) {
      saveJSONArray(cargacodigo, sketchfolder+proyectonombre+"/"+proyectonombre+".json");
      saveJSONArray(cargamouse, sketchfolder+proyectonombre+"/raton.json");
      saveJSONArray(cargateclado, sketchfolder+proyectonombre+"/teclado.json");
      
      configuration.getJSONObject(1).setInt("cuadros",velocidad);
      saveJSONArray(cargavars, sketchfolder+proyectonombre+"/variables.json");
      saveJSONArray(configuration, sketchfolder+proyectonombre+"/configuracion.json");
      byte[] data = {  }; saveBytes(sketchfolder+"/"+proyectonombre+"/data/data.txt", data); // crea carpeta data en el proyecto
      
    }

    // boton exportar
    if (mouseX>500 && mouseX<525 && mouseY>10 && mouseY<30) {
      println("Exporta");
      guardajs(1);
      
      String OS = System.getProperty("os.name").toLowerCase(); 
      
      if( OS.contains("linux") == true) {
        String[] command1 = {"/bin/bash", "-c", "mkdir "+sketchfolder+proyectonombre+"/web"};
        Process p1= exec(command1);
        String[] command2 = {"/bin/bash", "-c", "cp -R "+sketchfolder+proyectonombre+"/data "+sketchfolder+proyectonombre+"/web/data/"};
        Process p2= exec(command2);
        String[] command3 = {"/bin/bash", "-c", "cp "+sketchfolder+proyectonombre+"/"+proyectonombre+".html "+sketchfolder+proyectonombre+"/web/"};
        Process p3= exec(command3);
        String[] command4 = {"/bin/bash", "-c", "cp "+sketchfolder+proyectonombre+"/simpleTones.js "+sketchfolder+proyectonombre+"/web/"};
        Process p4= exec(command4);
      } 
      
      if( OS.contains("windows") == true) {
        
        String PATH;
        PATH = sketchfolder+proyectonombre;
        String[] command1 = {"cmd", "/c", "mkdir "+PATH+"\\web"};
        Process p1= exec(command1);
        String[] command2 = {"cmd", "/c", "Xcopy /I "+PATH+"\\data "+PATH+"\\web\\data"};
        Process p2= exec(command2);
        String[] command3 = {"cmd", "/c", "Xcopy /I "+PATH+"\\"+proyectonombre+".html "+PATH+"\\web"};
        Process p3= exec(command3);
        String[] command4 = {"cmd", "/c", "Xcopy /I "+PATH+"\\simpleTones.js "+PATH+"\\web"};
        Process p4= exec(command4);
      }  
      
      if( OS.contains("mac") == true) {
        
        String command1 = "mkdir "+sketchfolder+proyectonombre+"/web";
        File workingDir = new File("/");   
        try {Process p = Runtime.getRuntime().exec(command1, null, workingDir); int i = p.waitFor(); } catch (Exception e) {}
        String command2 = "cp -R "+sketchfolder+proyectonombre+"/data "+sketchfolder+proyectonombre+"/web/data";
        try {Process p = Runtime.getRuntime().exec(command2, null, workingDir); int i = p.waitFor();} catch (Exception e) {}
        String command3 = "cp "+sketchfolder+proyectonombre+"/"+proyectonombre+".html "+sketchfolder+proyectonombre+"/web";
        try {Process p = Runtime.getRuntime().exec(command3, null, workingDir);} catch (Exception e) {}
        String command4 = "cp "+sketchfolder+proyectonombre+"/simpleTones.js "+sketchfolder+proyectonombre+"/web";
        try {Process p = Runtime.getRuntime().exec(command4, null, workingDir);} catch (Exception e) {}        
      }
      
      
    } // fin boton exportar
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    // boton language
    if (mouseX>600 && mouseX<625 && mouseY>10 && mouseY<30) { 
      seleidio=true; 
      wininstru = new PWindow3();
    }

    // boton Configuración
    if (mouseX>650 && mouseX<675 && mouseY>10 && mouseY<30) {
      config=true;
      wininstru = new PWindow3();
      // consulta en internet la ultima versión publicada de Metrapocessing
      if(loadStrings("https://raw.githubusercontent.com/hiteclab/Meta_Javascript/master/MetaJavascript/data/version.txt") != null)newver = loadStrings("https://raw.githubusercontent.com/hiteclab/Meta_Javascript/master/MetaJavascript/data/version.txt"); else newver[0] = "";
  } // Fin boton Configuración



    ///////////////////////
    // Boton agregar línea
    ///////////////////////

    // Boton normal agergar línea

    if (mouseX>widthline+50 && mouseX<widthline+70 && mouseY>40 && mouseY< height-72) {

      // lee ide de la linea de código donde se hizo click para agregar nueva linea
      JSONObject objeto;
      objeto = new JSONObject();
      if (codetab==0) objeto = cargacodigo.getJSONObject(linearaton-1); 
      if (codetab==1) objeto = cargamouse.getJSONObject(linearaton-1); 
      if (codetab==2) objeto = cargateclado.getJSONObject(linearaton-1); 
      int idclick = objeto.getInt("id");
      // Fin lee ide de la linea de código donde se hizo click para agregar nueva linea

      JSONObject obj = new JSONObject();
      obj.setInt("id", -1);

      if (objeto.isNull("sino") == false) obj.setInt("sino", 1); // le agrega al nuevo objeto la propieda SINO en caso de agregarse una nueva línead desde un IF
      if (objeto.isNull("si") == false || idclick == 105 )obj.setInt("si", 1); // le agrega al nuevo objeto la propieda SI en caso de agregarse una nueva línead desde un IF

      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (linearaton==tlineas) {
          cargacodigo.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineasmouse) {
          cargamouse.append(obj);
          tlineasmouse++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineasmouse; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineasmouse++;
          cargamouse = temp;
        }
      }

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineasteclado) {
          cargateclado.append(obj);
          tlineasteclado++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineasteclado; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineasteclado++;
          cargateclado = temp;
        }
      }
    }


    // boton verde agergar línea en SI y SINO
    if( objetoml.isNull("si") == false || objetoml.isNull("sino") == false) if( y<=tlineas && mouseX>widthline+110 && mouseX<widthline+130 && mouseY>40 && mouseY< height-72) {
      JSONObject obj = new JSONObject();
      obj.setInt("id", -1);


      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (linearaton==tlineas) {
          cargacodigo.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineas) {
          cargamouse.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineas++;
          cargamouse = temp;
        }
      } // fin raton

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineas) {
          cargateclado.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineas++;
          cargateclado = temp;
        }
      } // fin teclado
    } // fin agregar verde en SI y SINO



    // boton agregar sino dede linea si
    if( objetoml.isNull("si") == false || objetoml.isNull("sino") == false) if (mouseY>40 && mouseY< height-72 && mouseY<width && y<=tlineas && mouseX>widthline+140 && mouseX<widthline+160) {

      JSONObject obj = new JSONObject();
      obj.setInt("id", -1);
      obj.setInt("sino", 1);


      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (linearaton==tlineas) {
          cargacodigo.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineas) {
          cargamouse.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineas++;
          cargamouse = temp;
        }
      } // fin raton

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineas) {
          cargateclado.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineas++;
          cargateclado = temp;
        }
      } // fin teclado
    }


    ////////////////////////
    // boton eliminar línea
    /////////////////////////

    if (mouseX>widthline+80 && mouseX<widthline+100 && mouseY>40 && mouseY< height-72) {
      if (linearaton>1 || tlineas>1) {
        // pestaña principal
        if (codetab==0) { 
          cargacodigo.remove(linearaton-1);
          tlineas--;
        }
        // pestaña raton
        if (codetab==1) { 
          cargamouse.remove(linearaton-1);
          tlineasmouse--;
        }
        // pestaña teclado
        if (codetab==2) { 
          cargateclado.remove(linearaton-1); 
          tlineasteclado--;
        }
        tlineas--;
      } else {

        linea=1; 
        tlineas=1;
        lineaanterior=0;
        JSONObject renuevaobjeto = new JSONObject();
        renuevaobjeto.setInt("id", -1);
        if (codetab==0) cargacodigo.setJSONObject(0, renuevaobjeto);
        if (codetab==1) cargamouse.setJSONObject(0, renuevaobjeto);
        if (codetab==2) cargateclado.setJSONObject(0, renuevaobjeto);

      }
    }


    // Abre la ventana de la instrucción en la que se hizo click con el boton izquierdo
    if (y < tlineas+1 && ventana==false && mouseButton==LEFT && mouseY>40 && mouseY< height-56 && mouseX < widthline+40) {
      ventana=true;
      lineaclik = linearaton-1;
      ventatamx = 550;
      wininstru = new PWindow3();
    }

  } // fin mousePressed

  void numera() {
    fill(180);
    for (int i=0; i<tlineas; i++ ) text(i+1, 5, 60+(20*i));
  }



  //---------------------
  //  INICIO MUESTRALINEA 
  //----------------------
  void muestralinea(int i) {

    int id = objetoml.getInt("id");
    int widthlinenow;

    leelinea(i);
    widthlinenow = int(textWidth(""+line));
    pushStyle();
    fill(255);
    if (id==0 || id==99) fill(0, 0, 255);
    if (id==102||id==115||id==98) {
      if (objetoml.isNull("color") == false) {
        fill(objetoml.getInt("color"));
        rect(widthlinenow+37, 22+20*(i+1), 10, 20);
        fill(255);
      } else 
      if (objetoml.isNull("colorh") == false) {
        fill(unhex(objetoml.getString("colorh")));
        rect(widthlinenow+37, 22+20*(i+1), 10, 20);
        fill(255);
      } else 
      if (objetoml.isNull("colorv") == false) {
        fill(255);
        rect(widthlinenow+37, 22+20*(i+1), 10, 20);
        fill(255);
      }
    } // id 102

    text(line, 40, 60+(20*i));
    fill(#F5AB0A);
    if (objetoml.isNull("instruccion") == false) {

      if (objetoml.isNull("si") == false) {

          text("    "+idiomaactual.get(str(id)), 40, 60+(20*i));


      } else if (objetoml.isNull("sino") == false) {

          fill(255); 
          text(""+idiomagui.get("Sino"), 40, 60+(20*i)); 
          fill(#F5AB0A);  
          text(""+idiomaactual.get(str(id)), 40+textWidth("           "), 60+(20*i));


      } else {
        if (objetoml.isNull("encapsulado") == true) {
          text(""+idiomaactual.get(str(id)), 40, 60+(20*i)); 
        } else { 
          text("    "+idiomaactual.get(str(id)), 40, 60+(20*i)); 
        }
      }
    }

    popStyle();
  } // fin muestralinea

  void exit()
  {
     wininstru=null;
     variables=null;
     System.exit(0);
    dispose();
  }
  
  //////////////////
  ///  GUARDA JS
  //////////////////
  
  void guardajs(int modo){
  
      if (codetab!=0) codetab =0;
      tlineas = cargacodigo.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      libminim = false; 
      libvideo = false;

      String[] texto, textof, lib, setup, teclapresionada, ratonpresionado;

      // EXPORTAR KEYPRESSED()
      teclapresionada = new String[1];
      teclapresionada = expand(teclapresionada,1);
      teclapresionada [0]="";
      texto = new String[1];
      textof = new String[1]; 
      texto = expand(texto,1);
      texto[0]="";
      textof[0]="";
      textof = expand(textof, 1);
      for (int i=1; i-1<tlineasteclado; i++) {
        if (cargateclado.getJSONObject(i-1).isNull("js") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";


          if (cargateclado.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; 
          if (cargateclado.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        ";

          if (cargateclado.getJSONObject(i-1).isNull("sino") == false && i>2 && cargateclado.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargateclado.getJSONObject(i-1).getString("js"); 
          if (cargateclado.getJSONObject(i-1).isNull("si") == false && i<tlineasteclado && cargateclado.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargateclado.getJSONObject(i-1).isNull("sino") == false && i<tlineasteclado && cargateclado.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          if (cargateclado.getJSONObject(i-1).isNull("si") == false && i==tlineasteclado )texto [i-1] = texto [i-1]+"\n    }";
          if (cargateclado.getJSONObject(i-1).isNull("sino") == false && i==tlineasteclado )texto [i-1] = texto [i-1]+"\n        }";
          if (cargateclado.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }
        }// fin if
      } // fin for      
      
      
      
      textof [0] = "document.onkeydown = function(e){\n var keycode = event.which || event.keyCode;\n tecla = String.fromCharCode(keycode)";
      
      textof = concat(textof, texto);
      
      textof = expand(textof, textof.length+1);
      textof [textof.length-1]="\n};";
      

      //textof = expand(textof, textof.length+1);
      //textof [textof.length-1]= "\n};"; // cierra la función keyPressed()
      teclapresionada = textof;
      //println(teclapresionada[0]);
      
      //if(modo==0)saveStrings(codefolder+"/temp/teclado.pde", textof);
      //if(modo==1)saveStrings(sketchfolder+proyectonombre+"/teclado.pde", textof);

      // EXPORTAR MOUSEPRESSED()
      ratonpresionado = new String[1];
      ratonpresionado = expand(ratonpresionado,1);
      ratonpresionado [0]="";
      texto = new String[1];
      textof = new String[1]; 
      textof = expand(textof, 1);
      texto = expand(texto,1);
      texto[0]="";
      textof[0]="";
      for (int i=1; i-1<tlineasmouse; i++) {
        if (cargamouse.getJSONObject(i-1).isNull("js") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";


          if (cargamouse.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; //else texto [i-1] ="";
          if (cargamouse.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        "; //else texto [i-1] ="";

          if (cargamouse.getJSONObject(i-1).isNull("sino") == false && i>2 && cargamouse.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargamouse.getJSONObject(i-1).getString("js"); 
          if (cargamouse.getJSONObject(i-1).isNull("si") == false && i<tlineasmouse && cargamouse.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargamouse.getJSONObject(i-1).isNull("sino") == false && i<tlineasmouse && cargamouse.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          if (cargamouse.getJSONObject(i-1).isNull("si") == false && i==tlineasmouse )texto [i-1] = texto [i-1]+"\n    }";
          if (cargamouse.getJSONObject(i-1).isNull("sino") == false && i==tlineasmouse )texto [i-1] = texto [i-1]+"\n        }";
          if (cargamouse.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }
        }// fin if
      } // fin for      
      textof [0] = " window.addEventListener('mousedown', e => {\n click = event.button;\n";
      textof = concat(textof, texto);

      //textof = expand(textof, textof.length+1);
      //textof [textof.length-1]= "\n});"; // cierra la función mousePressed()
      
    
  
      //textof [0] = textof [0] +"\n});"; // cierra la función mousePressed()
      
      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n});"; // cierra la función keyPressed()
      
      ratonpresionado = textof;

      //if(modo==0)saveStrings(codefolder+"/temp/mouse.pde", textof);
      //if(modo==1)saveStrings(sketchfolder+proyectonombre+"/mouse.pde", textof);





/*

    //textof [0] = textof [0]+"\n }\n</script>\n<style>\n#cw {\n    position: fixed;\n    z-index: -1;\n }\n\n body {\n        margin:0;\n        padding:0;\n        background-color:rgba(0,0,0,0.05);\n }\n";
    
    
      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n</script>\n<style>\n#cw {\n    position: fixed;\n    z-index: -1;\n }\n\n body {\n        margin:0;\n        padding:0;\n        background-color:rgba(168,168,168);\n }\n";
    
     
    //textof [0] = textof [0]+"</style>\n</head>\n<body>\n    <canvas id=\"cw\"></canvas>\n</body>\n</html>";
      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "</style>\n</head>\n<body>\n    <canvas id=\"cw\"></canvas>\n</body>\n</html>";


*/


























      // EXPORTAR DRAW()
      texto = new String[1];
      textof = new String[1];
      lib = new String[1];
      setup = new String[1];
      texto = expand(texto,1);
      texto[0]="";
      textof[0]="";
      setup = expand(setup, 1);
      lib = expand(lib, 1);
      lib[0]="";
      setup[0]="";
      

      for (int i=1; i-1<tlineas; i++) {
        if (cargacodigo.getJSONObject(i-1).isNull("js") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";


          if (cargacodigo.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; 
          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        "; 

          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false && i>2 && cargacodigo.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargacodigo.getJSONObject(i-1).getString("js"); 
          if (cargacodigo.getJSONObject(i-1).isNull("si") == false && i<tlineas && cargacodigo.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false && i<tlineas && cargacodigo.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          if (cargacodigo.getJSONObject(i-1).isNull("si") == false && i==tlineas )texto [i-1] = texto [i-1]+"\n    }";
          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false && i==tlineas )texto [i-1] = texto [i-1]+"\n        }";

          if (cargacodigo.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }
          //println(texto);
        }// fin if
      } // fin for
//println(texto[1]);
      

      
      
      //textof [0] = lib[0];
      textof [0] = "<!DOCTYPE html>\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n    <title>";
      textof [0] = textof [0] +proyectonombre;
      
      textof [0] = textof [0] +"</title>\n";
      
      if (libminim==true) textof [0] = textof [0] +"    <script src=\"simpleTones.js\" type=\"text/javascript\"></script>";  
      textof [0] = textof [0] +"<script>\n        var lastfill='white';\n        var cn ;\n        var c;\n        var m = { x: innerWidth/2, y: innerHeight/2 };\n";


    textof [0] =textof [0] +"\n var ";
    for (int i=0; i< varenterasnom.size(); i++) {
      if(i<7)fill(120); else fill(255);
      
      if(i< varenterasnom.size()-1){
          textof [0] =textof [0] +varenterasnom.get(i)+"=";
          if(i>7)textof [0] =textof [0] +cargavars.getJSONObject(i-7).getString("valorinicial"); else textof [0] =textof [0] +"0";
          textof [0] =textof [0] +","; 
        } else if(i>6) textof [0] =textof [0] +varenterasnom.get(i)+"="+cargavars.getJSONObject(i-7).getString("valorinicial")+";\n"; else textof [0] =textof [0] +varenterasnom.get(i)+"=0;";
              
    }
    
    textof = concat(textof, ratonpresionado);
    
    textof = concat(textof, teclapresionada);
    
   textof = expand(textof, textof.length+1);
      textof [textof.length-1]="ancho =innerWidth;\n alto =innerHeight;\n";

            
    textof = expand(textof, textof.length+1);
      textof [textof.length-1]="\n window.onmousemove = function (e)\n            {\n            m.x =e.clientX;\n            m.y = e.clientY;\n        ratonX = m.x;\n        ratonY = m.y;\n }\n\n\n";
    
    //textof [0] =textof [0] + teclapresionada;
    
    //textof [0] =textof [0] + ratonpresionado[0];
    



    textof = expand(textof, textof.length+1);
      textof [textof.length-1]="\n window.onload = function myfunction() {\n            cn = document.getElementById('cw');\n            c = cn.getContext('2d');\n            resize(); anim()\n        }\n";
    
    textof = expand(textof, textof.length+1);
      textof [textof.length-1]="\n window.onresize = function () {\n\n       resize();\n\n        }\n        function resize() {\n            cn.height = innerHeight;\n            cn.width = innerWidth;\n        ancho =innerWidth;\n            alto =innerHeight;\n }\n";
    
    textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n function anim() {\n            requestAnimationFrame(anim);\n            c.fillStyle = 'white';\n";

    //textof [0] =textof [0] + texto;
    
    //println(textof[0]);
    
    textof = concat(textof, texto);
    //println(textof[2]);

      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n}"; // cierra la función keyPressed()

    //textof [0] = textof [0]+"\n }\n</script>\n<style>\n#cw {\n    position: fixed;\n    z-index: -1;\n }\n\n body {\n        margin:0;\n        padding:0;\n        background-color:rgba(0,0,0,0.05);\n }\n";
    
    
      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n</script>\n<style>\n#cw {\n    position: fixed;\n    z-index: -1;\n }\n\n body {\n        margin:0;\n        padding:0;\n        background-color:rgba(168,168,168);\n }\n";
    
     
    //textof [0] = textof [0]+"</style>\n</head>\n<body>\n    <canvas id=\"cw\"></canvas>\n</body>\n</html>";
      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "</style>\n</head>\n<body>\n    <canvas id=\"cw\"></canvas>\n</body>\n</html>";
    //textof = concat(textof, lib);


      //if(modo==0) saveStrings(codefolder+"/temp/temp.pde", textof);
      if(modo==1) saveStrings(sketchfolder+proyectonombre+"/"+proyectonombre+".html", textof);
            
      // FIN EXPORTAR DRAW()
  
  
  }




void eligearchivo() {
  selectInput(idiomagui.getString("Archivo"), "fileSelected", dataFile(sketchfolder+proyectonombre+"/data/*.*" ));
}

void elegircarpeta() {
  File folderToStartFrom = new File( sketchfolder );
  selectFolder(idiomagui.getString("Proyecto"), "folderSelected", folderToStartFrom);
}

//------------------------
//   INICIO  fileSelected
//------------------------

void fileSelected(File selection) {
  if (selection != null) { 
    String loadPath = selection.getAbsolutePath();
    // divide en fragmentos la ruta y los guarda en vector de llamado "lista" - el ultimo fragmento es el nombre del archivo
    String OS = System.getProperty("os.name").toLowerCase(); 
    String[] lista = new String[1];
    if( OS.contains("linux") == true || OS.contains("mac") == true){
    lista = splitTokens(loadPath, "/"); 
    }
    if( OS.contains("windows") == true){
    lista = splitTokens(loadPath, "\\");
    }
    int nslash=(lista.length)-1; // determina la cantidad de slash en la ruta
    temp = lista[nslash]; //se guarda el nombre del archivo seleccionado
  }
}    


void folderSelected(File selection) {
  if (selection != null) {
    String ruta = selection.getAbsolutePath();
    
    String OS = System.getProperty("os.name").toLowerCase(); 
    String[] lista = new String[1];
    if( OS.contains("linux") == true || OS.contains("mac") == true){
      lista = splitTokens(ruta, "/"); 
    }
    if( OS.contains("windows") == true){
      lista = splitTokens(ruta, "\\"); 
    }
    int nslash=(lista.length)-1; // determina la cantidad de slash en la ruta
    ruta = lista[nslash]; //se guarda el nombre de la carpeta seleccionado
    proyectonombre= ruta;
    cargacodigo = loadJSONArray(sketchfolder+proyectonombre+"/"+proyectonombre+".json");
    cargamouse = loadJSONArray(sketchfolder+proyectonombre+"/"+"/raton.json");
    cargateclado = loadJSONArray(sketchfolder+proyectonombre+"/teclado.json");
    
    // esta parte actualiza el archivo lastopen.txt con el proyecto abierto
    String[] last = new String[1];
    last = expand(last, 1);
    last[0] =  proyectonombre;
    saveStrings(sketchfolder+"/lastopen.txt", last );
    
    // se cargan nuevamente las variables
    cargavars = loadJSONArray(sketchfolder+"/"+proyectonombre+"/variables.json");
    varenterasnom = new StringList();
    creavariables();
    surface.setTitle(proyectonombre);
  }
}


//---------------------
//  INICIO LEELINEA 
//----------------------

void leelinea(int i) {
  JSONObject objeto;
  objeto = new JSONObject();

  if (codetab==0) objeto = cargacodigo.getJSONObject(i); 
  if (codetab==1) objeto = cargamouse.getJSONObject(i); 
  if (codetab==2) objeto = cargateclado.getJSONObject(i); 
  objetoactual = objeto;

  int id = objeto.getInt("id");

  idlee=id;
  nargumentos = objeto.size()-2;

  if (id==-1) {
    line=""+idiomaactual.get(str(id));
  }  

  if (objeto.isNull("instruccion") == false) {
    line=""+idiomaactual.get(str(id));
  }
  // muestra comentario
  if (id==0) {
    line = "//"+objeto.get("comentario");
  } else 
  // muestra código encapsulado
  if (id==99) {
    line=""+idiomaactual.get(str(id))+objeto.get("capsula");
  } else 
  // muestra tocanota
  if (id==110) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("nota")+" ) ";
  } else
    // muestra fondo, colorlinea y relleno
    if (id==98 || id==115 || id==102) {
      if (objeto.isNull("color") == false) {
        line=""+idiomaactual.get(str(id))+" ( "+objeto.get("color")+" ) "; 
      } 
      if (objeto.isNull("colorh") == false) {
        line=""+idiomaactual.get(str(id))+" ( #"+objeto.get("colorh")+" ) ";
      }
      if (objeto.isNull("colorv") == false) {
        line=""+idiomaactual.get(str(id))+" ( "+objeto.get("colorv")+" ) ";
      }   
  
} else
      // muestra sonido
      if (id==100) {
        line=""+idiomaactual.get(str(id))+" ( "+objeto.get("nombre")+" ) ";
      } else
        // muestra linea
        if (id==108) { 
          line=""+idiomaactual.get(str(id));
          if (objeto.isNull("pxt1") == false) line = line+" ( "+objeto.get("pxt1")+" , "; 
          else line = line+" ( "+objeto.get("pxt1v")+" , ";
          if (objeto.isNull("pyt1") == false) line = line+objeto.get("pyt1")+" , "; 
          else line = line+objeto.get("pyt1v")+" , ";
          if (objeto.isNull("pxt2") == false) line = line+objeto.get("pxt2")+" , "; 
          else line = line+objeto.get("pxt2v")+" , ";
          if (objeto.isNull("pyt2") == false) line = line+objeto.get("pyt2")+" ) "; 
          else line = line+objeto.get("pyt2v")+" ) ";
        } else
          // muestra triangulo
          if (id==51) { 
            line=""+idiomaactual.get(str(id));
            if (objeto.isNull("pxt1") == false) line = line+" ( "+objeto.get("pxt1")+" , "; 
            else line = line+" ( "+objeto.get("pxt1v")+" , ";
            if (objeto.isNull("pyt1") == false) line = line+objeto.get("pyt1")+" , "; 
            else line = line+objeto.get("pyt1v")+" , ";
            if (objeto.isNull("pxt2") == false) line = line+objeto.get("pxt2")+" , "; 
            else line = line+objeto.get("pxt2v")+" , ";
            if (objeto.isNull("pyt2") == false) line = line+objeto.get("pyt2")+" , "; 
            else line = line+objeto.get("pyt2v")+" , ";
            if (objeto.isNull("pxt3") == false) line = line+objeto.get("pxt3")+" , "; 
            else line = line+objeto.get("pxt3v")+" , ";
            if (objeto.isNull("pyt3") == false) line = line+objeto.get("pyt3")+" ) "; 
            else line = line+objeto.get("pyt3v")+" ) ";
          } else
          
          
            // muestra asignar
            if (id==61) {
              line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
            } else
            
            // muestra sumar
            if (id==62) {
              line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
            } else
            
            
            // muestra restar
            if (id==63) {
              line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
            } else
            
            
            // muestra aleatorio
            if (id==97) {
              line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("vmaximo")+" )";
            } else



              // muestra imagen o video

              if (id==109 || id==118) {
                line=""+idiomaactual.get(str(id))+" ( "+objeto.get("nombre");

                if (objeto.isNull("px") == false) line = line+" , "+objeto.get("px")+" , "; 
                else line = line+" , "+objeto.get("pxv")+" , ";
                if (objeto.isNull("py") == false) line = line+objeto.get("py"); 
                else line = line+objeto.get("pyv");

                if (objeto.isNull("tx") == true && objeto.isNull("txv") == true)line = line+" )";

                if (objeto.isNull("tx") == false) line = line+" , "+objeto.get("tx")+" , ";
                if (objeto.isNull("txv") == false)line = line+" , "+objeto.get("txv")+" , ";

                if (objeto.isNull("ty") == false) line = line+objeto.get("ty")+" )"; 
                if (objeto.isNull("tyv") == false) line = line+objeto.get("tyv")+" )";
              } else


                // muestra tamtexto
                if (id==117) {
                  line=""+idiomaactual.get(str(id))+" ( "+objeto.get("tamtexto")+" )";
                } else
                  // muestra texto
                  if (id==116) {
                    line=""+idiomaactual.get(str(id));
                    if (objeto.isNull("texto") == false)line = line+" ( "+objeto.get("texto")+" , ";
                    if (objeto.isNull("textov") == false)line = line+" ( "+objeto.get("textov")+" , ";
                    if (objeto.isNull("px") == false) line = line+objeto.get("px")+" , "; 
                    else line = line+objeto.get("pxv")+" , ";
                    if (objeto.isNull("py") == false) line = line+objeto.get("py")+" )"; 
                    else line = line+objeto.get("pyv")+" )";
                  } else
                    // muestra rectangulo
                    if (id==114 || id==101) {
                      line=""+idiomaactual.get(str(id));
                      if (objeto.isNull("px") == false) line = line+" ( "+objeto.get("px")+" , "; 
                      else line = line+" ( "+objeto.get("pxv")+" , ";
                      if (objeto.isNull("py") == false) line = line+objeto.get("py")+" , "; 
                      else line = line+objeto.get("pyv")+" , ";
                      if (objeto.isNull("tx") == false) line = line+objeto.get("tx")+" , "; 
                      else line = line+objeto.get("txv")+" , ";
                      if (objeto.isNull("ty") == false) line = line+objeto.get("ty")+" )"; 
                      else line = line+objeto.get("tyv")+" )";
                    } else
                      // muestra SI
                      if (id==105) {
                        line=""+idiomaactual.get(str(id))+" ";

                        if (objeto.isNull("valor1") == false) line = line+" ( "+objeto.get("valor1"); 
                        else line = line+" ( "+objeto.get("valor1v");
                        line = line+" "+objeto.get("condicion")+" ";
                        if (objeto.isNull("valor2") == false) line = line+objeto.get("valor2")+" )"; 
                        else line = line+objeto.get("valor2v")+" )";
                      } else
                        // muestra PARA
                        if (id==111) {
                          line=""+idiomaactual.get(str(id))+" ";

                          if (objeto.isNull("valorini") == false) line = line+"( desde "+objeto.get("valorini")+" ; hasta ";
                          line = line+" paraciclo "+objeto.get("condicion")+" "; 
                          if (objeto.isNull("valorfinal") == false) line = line+objeto.get("valorfinal")+" ; "; 
                          else line = line+objeto.get("valorfinalv")+" ; ";
                          line = line+" incrementando "+objeto.get("incremento")+" )"; 
                        }

  if (objeto.isNull("si") == false)line="    "+line;
  if (objeto.isNull("sino") == false )line="           "+line;
  if (objeto.isNull("encapsulado") == false)line="    "+line;
} // fin leelinea