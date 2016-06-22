Table table;
String [] headers;
String [][] topicScores;

void setup(){
  size( 800, 800 ); 
  
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
}

void draw(){
  
}