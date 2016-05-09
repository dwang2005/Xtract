function [ numungrp ] = ungroupLayers()
% function [ numungrp ] = ungroupLayers()
% Robert Cooper 05-22-2013
%
%     Copyright (C) 2014  Robert F Cooper
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
% Requires: Photoshop CS5 Extended, and an active connection to a running
% version of photoshop. Photoshop must be running before MATLAB starts!
%
% This function connects to a running copy of Photoshop CS5.1, and ungroups
% all of the groups in the image. This is done as a preprocessing step to
% speed up acquisition of all of the layers' bounds. If one DOESN'T do
% this, the DOM (Document Object Manager) takes FOREVER to recursively
% return the bounding information.

    ungroup = [ 'var unrolledcount = 0;' ...
    'var i=0;'...
    'while( i < app.activeDocument.layerSets.length ){' ...
    '    var layergroup = app.activeDocument.layerSets[i];' ...
    '    if( layergroup.visible ){' ...
    '       app.activeDocument.activeLayer = layergroup;'...
    '       ungroupLayerSet();' ...
    '       unrolledcount++;' ...
    '       i=0;'...
    '    }else{' ...
    '       i++;'...
    '    }'...
    '}' ...
    ''...
    'function ungroupLayerSet() {' ...
    '    var desc = new ActionDescriptor();' ...
    '    var ref = new ActionReference();' ...
    '    ref.putEnumerated( charIDToTypeID( "Lyr " ), charIDToTypeID( "Ordn" ), charIDToTypeID( "Trgt" ) );' ...
    '    desc.putReference( charIDToTypeID( "null" ), ref );' ...
    '    try {' ...
    '        executeAction( stringIDToTypeID( "ungroupLayersEvent" ), desc, DialogModes.NO );' ...
    '    } catch(e) {$.write(e)}' ...
    '}' ...
    'unrolledcount;' ];
    
disp('Before ungroup');
    tic;
    numungrp = psjavascript(ungroup);
    toc;
    disp('After ungroup');

end
