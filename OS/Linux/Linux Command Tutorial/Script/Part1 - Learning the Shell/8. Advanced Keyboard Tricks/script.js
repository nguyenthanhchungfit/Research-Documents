var listRows =  $("#tableMonitor").children().eq(1).children();
for(let i = 0; i < listRows.length; i++){
    var row = listRows[i];
    var serverCol = row.children().eq(1);
    var listIp = serverCol.children().eq(0).children();
    for(let j = 0; j < listIp.length; j++){
        ip = listIp[j].children().eq(0).text();
        if(ip != undefined && ip != ""){
            console.log(ip);
        }
    }
}