function [  ] = scale_Photoshop_layers( shiftx, shifty, percentwidth, percentheight )
% Robert F Cooper 10-20-2014
%   This function scales the selected photoshop layers by a percentage

script = ['var idTrnf = charIDToTypeID( "Trnf" ); '...
'    var desc11 = new ActionDescriptor(); '...
'    var idnull = charIDToTypeID( "null" ); '...
'        var ref9 = new ActionReference();'...
'        var idLyr = charIDToTypeID( "Lyr " );'...
'        var idOrdn = charIDToTypeID( "Ordn" );'...
'        var idTrgt = charIDToTypeID( "Trgt" );'...
'        ref9.putEnumerated( idLyr, idOrdn, idTrgt );'...
'    desc11.putReference( idnull, ref9 );'...
'    var idFTcs = charIDToTypeID( "FTcs" );'...
'    var idQCSt = charIDToTypeID( "QCSt" );'...
'    var idQcsa = charIDToTypeID( "Qcsa" );'...
'    desc11.putEnumerated( idFTcs, idQCSt, idQcsa );'...
'    var idOfst = charIDToTypeID( "Ofst" );'...
'        var desc12 = new ActionDescriptor();'...
'        var idHrzn = charIDToTypeID( "Hrzn" );'...
'        var idPxl = charIDToTypeID( "#Pxl" );'...
'        desc12.putUnitDouble( idHrzn, idPxl, ' num2str(shiftx) ' );'...
'        var idVrtc = charIDToTypeID( "Vrtc" );'...
'        var idPxl = charIDToTypeID( "#Pxl" );'...
'        desc12.putUnitDouble( idVrtc, idPxl, ' num2str(shifty) ' );'...
'    var idOfst = charIDToTypeID( "Ofst" );'...
'    desc11.putObject( idOfst, idOfst, desc12 );'...
'    var idWdth = charIDToTypeID( "Wdth" );'...
'    var idPrc = charIDToTypeID( "#Prc" );'...
'    desc11.putUnitDouble( idWdth, idPrc, ' num2str(percentwidth) ' );'...
'    var idHght = charIDToTypeID( "Hght" );'...
'    var idPrc = charIDToTypeID( "#Prc" );'...
'    desc11.putUnitDouble( idHght, idPrc, ' num2str(percentheight) ' );'...
'    var idLnkd = charIDToTypeID( "Lnkd" );'...
'    desc11.putBoolean( idLnkd, true );'...
'    var idIntr = charIDToTypeID( "Intr" );'...
'    var idIntp = charIDToTypeID( "Intp" );'...
'    var idBcbc = charIDToTypeID( "Bcbc" );'...
'    desc11.putEnumerated( idIntr, idIntp, idBcbc );'...
'executeAction( idTrnf, desc11, DialogModes.NO ); ' ];

psjavascript(script);

end

