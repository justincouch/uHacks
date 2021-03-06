Table table;
String [] headers;
String [] timestamps;
String [] arduinos;
int [] arduino_count = new int[4];
String [] projmap;
int [] projmap_count = new int[4];
String [] rpi;
int [] rpi_count = new int[4];
String [] sims;
int [] sims_count = new int[4];

int rowCount;
// 0 is no opinion, 1 is not interested, 2 is eh, 3 is very interested

color[] colors = { color(255,0,0), color(0,255,0), color(0,0,255), color(255,255,0) };

String[] choices = { "No Opinion", "No Interest", "Eh", "Very Interested" };

String [][] topicScores;

void setup(){
  size( 800, 800 ); 
  textAlign(CENTER);
  // load table
  table = loadTable( "data.csv", "header");
  
  String [] lines = loadStrings("data.csv");
  
  headers = lines[0].split("\",\"");

  for ( int i=0; i<headers.length; i++ ){
    String[] letters = headers[i].split("");
    headers[i].replace("\"", "");
    int quoteChk = headers[i].indexOf( "\"" );
    if ( quoteChk != -1 ){
      headers[i].replaceAll("\"","");
    }
  }
  
  rowCount = table.getRowCount();
  println(table.getRowCount() + " total rows in table"); 
  println(table.getColumnCount() + " total columns in table"); 
  
  

  for (TableRow row : table.rows()) {
    
    //String timestamp = row.getString(0);
    //String projMap = row.getString("Topics [Projection Mapping]");
    
    for ( int i=0; i<headers.length; i++ ){
      //print( i + "  " );
      print( headers[i] + " ::: " );
      print( row.getString(i) );
      println();
      if ( headers[i].indexOf("\"") == -1 ){
        //println( headers[i] + " : " + row.getString( headers[i] ) );
      }
    }
    
    println("");
    println("-------------------------");
  }
  
  timestamps = table.getStringColumn("Timestamp");
  arduinos = table.getStringColumn("Topics [Arduino ]");
  projmap = table.getStringColumn("Topics [Projection Mapping]");
  rpi = table.getStringColumn("Topics [Raspberry Pi]");
  sims = table.getStringColumn("Topics [Simulations (particles, forces, systems)]");
  
  printArray(timestamps);
  printArray(arduinos);
  
  for ( int i=0; i<rowCount; i++ ){
    if ( arduinos[i].equals("") ) arduino_count[0]++;
    if ( projmap[i].equals("") ) projmap_count[0]++;
    if ( rpi[i].equals("") ) rpi_count[0]++;
    if ( sims[i].equals("") ) sims_count[0]++;

    for ( int j=0; j<choices.length; j++ ){
      if ( arduinos[i].equals( choices[j] ) ) arduino_count[j]++;
      if ( projmap[i].equals( choices[j] ) ) projmap_count[j]++;
      if ( rpi[i].equals( choices[j] ) ) rpi_count[j]++;
      if ( sims[i].equals( choices[j] ) ) sims_count[j]++;
    }

    //if ( arduinos[i].equals("No Opinion") || arduinos[i].equals("") ) {
    //  arduino_count[0]++;
    //}
    //else if ( arduinos[i].equals("Not Interested") ) arduino_count[1]++;
    //else if ( arduinos[i].equals("Eh") ) {
    //  println( "arduino eh" ); 
    //  arduino_count[2]++;
    //}
    //else if ( arduinos[i].equals("Very Interested") ) arduino_count[3]++;
  }
  
  printArray( arduino_count );
  
  noStroke();
  
  pushMatrix();
  translate(100,100);
  for ( int i=0; i<choices.length; i++ ){
    fill(colors[i]);
    float ang = TWO_PI*arduino_count[i]/rowCount;
    println(ang);
    arc( 0, 0, 100, 100, 0, ang, PIE );
    rotate(ang);
  }
  fill(0);
  text( "Arduino", 0, 70 );
  popMatrix();
  
  pushMatrix();
  translate(210,100);
  for ( int i=0; i<choices.length; i++ ){
    fill(colors[i]);
    float ang = TWO_PI*projmap_count[i]/rowCount;
    println(ang);
    arc( 0, 0, 100, 100, 0, ang, PIE );
    rotate(ang);
  }
  fill(0);
  text( "Projection Mapping", 0, 70 );
  popMatrix();
  
  pushMatrix();
  translate(320,100);
  for ( int i=0; i<choices.length; i++ ){
    fill(colors[i]);
    float ang = TWO_PI*rpi_count[i]/rowCount;
    println(ang);
    arc( 0, 0, 100, 100, 0, ang, PIE );
    rotate(ang);
  }
  fill(0);
  text( "RPi", 0, 70 );
  popMatrix();
  
  pushMatrix();
  translate(430,100);
  for ( int i=0; i<choices.length; i++ ){
    fill(colors[i]);
    float ang = TWO_PI*sims_count[i]/rowCount;
    println(ang);
    arc( 0, 0, 100, 100, 0, ang, PIE );
    rotate(ang);
  }
  fill(0);
  text( "Simulations", 0, 70 );
  popMatrix();
  
  //arc( 100, 100, 100, 100, 0, TWO_PI*arduino_count[0]/rowCount, PIE );
}

void draw(){
  
}