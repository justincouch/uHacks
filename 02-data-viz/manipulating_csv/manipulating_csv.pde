Table o_table = loadTable("data.csv");
Table new_table = new Table();

String [] responses = { "No Opinion", "No Interest", "Eh", "Very Interested" };

new_table.addColumn("Topic");

for ( int i=0; i<responses.length; i++ ){
  new_table.addColumn(responses[i]);
}
new_table.addColumn("Total");

int colCount = o_table.getColumnCount();

String [] columnNames = new String[ colCount ];
TableRow row0 = o_table.getRow(0);
printArray(row0.getString(0));

for( int i=0; i<colCount; i++ ){
  columnNames[i] = row0.getString(i);
  if ( i!=0 && i<15 ){
    String[] res = o_table.getStringColumn(i);
    int[] resCount = {0,0,0,0};
    for ( int j=1; j<res.length; j++ ){
      println(res[j]);
      for ( int k=0; k<responses.length; k++ ){
        if ( res[j].equals(responses[k]) ){
          resCount[k]+=1;
        }
      }
      if( res[j].equals("") ){
        resCount[0]+=1;
      }
    }
    columnNames[i] = columnNames[i].replace("Topics [", "");
    columnNames[i] = columnNames[i].replace("]", "");
    columnNames[i] = columnNames[i].trim();
    TableRow newRow = new_table.addRow();
    newRow.setString("Topic", columnNames[i]);
    newRow.setInt(responses[0], resCount[0]);
    newRow.setInt(responses[1], resCount[1]);
    newRow.setInt(responses[2], resCount[2]);
    newRow.setInt(responses[3], resCount[3]);
    newRow.setInt("Total", (resCount[0]+resCount[1]+resCount[2]+resCount[3]));
  }
}



printArray(columnNames);

saveTable(new_table, "data/new_data.csv");