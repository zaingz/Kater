!function(e){"use strict";var t=e.HTMLCanvasElement&&e.HTMLCanvasElement.prototype,i=e.Blob&&function(){try{return Boolean(new Blob)}catch(e){return!1}}(),a=i&&e.Uint8Array&&function(){try{return 100===new Blob([new Uint8Array(100)]).size}catch(e){return!1}}(),n=e.BlobBuilder||e.WebKitBlobBuilder||e.MozBlobBuilder||e.MSBlobBuilder,r=(i||n)&&e.atob&&e.ArrayBuffer&&e.Uint8Array&&function(e){var t,r,o,s,l,d;for(t=e.split(",")[0].indexOf("base64")>=0?atob(e.split(",")[1]):decodeURIComponent(e.split(",")[1]),r=new ArrayBuffer(t.length),o=new Uint8Array(r),s=0;s<t.length;s+=1)o[s]=t.charCodeAt(s);return l=e.split(",")[0].split(":")[1].split(";")[0],i?new Blob([a?o:r],{type:l}):(d=new n,d.append(r),d.getBlob(l))};e.HTMLCanvasElement&&!t.toBlob&&(t.mozGetAsFile?t.toBlob=function(e,i,a){e(a&&t.toDataURL&&r?r(this.toDataURL(i,a)):this.mozGetAsFile("blob",i))}:t.toDataURL&&r&&(t.toBlob=function(e,t,i){e(r(this.toDataURL(t,i)))})),"function"==typeof define&&define.amd?define(function(){return r}):e.dataURLtoBlob=r}(this),function(e){"use strict";var t=function(e,i,a){var n,r,o=document.createElement("img");if(o.onerror=i,o.onload=function(){!r||a&&a.noRevoke||t.revokeObjectURL(r),i&&i(t.scale(o,a))},t.isInstanceOf("Blob",e)||t.isInstanceOf("File",e))n=r=t.createObjectURL(e),o._type=e.type;else{if("string"!=typeof e)return!1;n=e,a&&a.crossOrigin&&(o.crossOrigin=a.crossOrigin)}return n?(o.src=n,o):t.readFile(e,function(e){var t=e.target;t&&t.result?o.src=t.result:i&&i(e)})},i=window.createObjectURL&&window||window.URL&&URL.revokeObjectURL&&URL||window.webkitURL&&webkitURL;t.isInstanceOf=function(e,t){return Object.prototype.toString.call(t)==="[object "+e+"]"},t.transformCoordinates=function(e,t){var i=e.getContext("2d"),a=e.width,n=e.height;switch(t>4&&(e.width=n,e.height=a),t){case 2:i.translate(a,0),i.scale(-1,1);break;case 3:i.translate(a,n),i.rotate(Math.PI);break;case 4:i.translate(0,n),i.scale(1,-1);break;case 5:i.rotate(.5*Math.PI),i.scale(1,-1);break;case 6:i.rotate(.5*Math.PI),i.translate(0,-n);break;case 7:i.rotate(.5*Math.PI),i.translate(a,-n),i.scale(-1,1);break;case 8:i.rotate(-.5*Math.PI),i.translate(-a,0)}},t.renderImageToCanvas=function(e,t,i,a,n,r,o,s,l,d){return e.getContext("2d").drawImage(t,i,a,n,r,o,s,l,d),e},t.scale=function(e,i){i=i||{};var a,n,r,o,s,l,d,c=document.createElement("canvas"),u=e.getContext||(i.canvas||i.crop||i.orientation)&&c.getContext,f=e.width,g=e.height,p=f,m=g,h=0,b=0,y=0,v=0;return u&&i.orientation>4?(a=i.maxHeight,n=i.maxWidth,r=i.minHeight,o=i.minWidth):(a=i.maxWidth,n=i.maxHeight,r=i.minWidth,o=i.minHeight),u&&a&&n&&i.crop?(s=a,l=n,a/n>f/g?(m=n*f/a,b=(g-m)/2):(p=a*g/n,h=(f-p)/2)):(s=f,l=g,d=Math.max((r||s)/s,(o||l)/l),d>1&&(s=Math.ceil(s*d),l=Math.ceil(l*d)),d=Math.min((a||s)/s,(n||l)/l),1>d&&(s=Math.ceil(s*d),l=Math.ceil(l*d))),u?(c.width=s,c.height=l,t.transformCoordinates(c,i.orientation),t.renderImageToCanvas(c,e,h,b,p,m,y,v,s,l)):(e.width=s,e.height=l,e)},t.createObjectURL=function(e){return i?i.createObjectURL(e):!1},t.revokeObjectURL=function(e){return i?i.revokeObjectURL(e):!1},t.readFile=function(e,t,i){if(window.FileReader){var a=new FileReader;if(a.onload=a.onerror=t,i=i||"readAsDataURL",a[i])return a[i](e),a}return!1},"function"==typeof define&&define.amd?define(function(){return t}):e.loadImage=t}(this),function(e){"use strict";"function"==typeof define&&define.amd?define(["load-image"],e):e(window.loadImage)}(function(e){"use strict";if(window.navigator&&window.navigator.platform&&/iP(hone|od|ad)/.test(window.navigator.platform)){var t=e.renderImageToCanvas;e.detectSubsampling=function(e){var t,i;return e.width*e.height>1048576?(t=document.createElement("canvas"),t.width=t.height=1,i=t.getContext("2d"),i.drawImage(e,-e.width+1,0),0===i.getImageData(0,0,1,1).data[3]):!1},e.detectVerticalSquash=function(e,t){var i,a,n,r,o,s=document.createElement("canvas"),l=s.getContext("2d");for(s.width=1,s.height=t,l.drawImage(e,0,0),i=l.getImageData(0,0,1,t).data,a=0,n=t,r=t;r>a;)o=i[4*(r-1)+3],0===o?n=r:a=r,r=n+a>>1;return r/t||1},e.renderImageToCanvas=function(i,a,n,r,o,s,l,d,c,u){if("image/jpeg"===a._type){var f,g,p,m,h=i.getContext("2d"),b=document.createElement("canvas"),y=1024,v=b.getContext("2d");if(b.width=y,b.height=y,h.save(),f=e.detectSubsampling(a),f&&(o/=2,s/=2),g=e.detectVerticalSquash(a,s),f&&1!==g){for(c=Math.ceil(y*c/o),u=Math.ceil(y*u/s/g),d=0,m=0;s>m;){for(l=0,p=0;o>p;)v.clearRect(0,0,y,y),v.drawImage(a,n,r,o,s,-p,-m,o,s),h.drawImage(b,0,0,y,y,l,d,c,u),p+=y,l+=c;m+=y,d+=u}return h.restore(),i}}return t(i,a,n,r,o,s,l,d,c,u)}}}),function(e){"use strict";"function"==typeof define&&define.amd?define(["load-image"],e):e(window.loadImage)}(function(e){"use strict";var t=window.Blob&&(Blob.prototype.slice||Blob.prototype.webkitSlice||Blob.prototype.mozSlice);e.blobSlice=t&&function(){var e=this.slice||this.webkitSlice||this.mozSlice;return e.apply(this,arguments)},e.metaDataParsers={jpeg:{65505:[]}},e.parseMetaData=function(t,i,a){a=a||{};var n=this,r={},o=!(window.DataView&&t&&t.size>=12&&"image/jpeg"===t.type&&e.blobSlice);(o||!e.readFile(e.blobSlice.call(t,0,131072),function(t){var o,s,l,d,c=t.target.result,u=new DataView(c),f=2,g=u.byteLength-4,p=f;if(65496===u.getUint16(0)){for(;g>f&&(o=u.getUint16(f),o>=65504&&65519>=o||65534===o);)if(s=u.getUint16(f+2)+2,f+s>u.byteLength)console.log("Invalid meta data: Invalid segment size.");else{if(l=e.metaDataParsers.jpeg[o])for(d=0;l.length>d;d+=1)l[d].call(n,u,f,s,r,a);f+=s,p=f}!a.disableImageHead&&p>6&&(r.imageHead=c.slice?c.slice(0,p):new Uint8Array(c).subarray(0,p))}else console.log("Invalid JPEG file: Missing JPEG marker.");i(r)},"readAsArrayBuffer"))&&i(r)}}),function(e){"use strict";"function"==typeof define&&define.amd?define(["load-image","load-image-meta"],e):e(window.loadImage)}(function(e){"use strict";e.ExifMap=function(){return this},e.ExifMap.prototype.map={Orientation:274},e.ExifMap.prototype.get=function(e){return this[e]||this[this.map[e]]},e.getExifThumbnail=function(e,t,i){var a,n,r;if(!i||t+i>e.byteLength)return void console.log("Invalid Exif data: Invalid thumbnail data.");for(a=[],n=0;i>n;n+=1)r=e.getUint8(t+n),a.push((16>r?"0":"")+r.toString(16));return"data:image/jpeg,%"+a.join("%")},e.exifTagTypes={1:{getValue:function(e,t){return e.getUint8(t)},size:1},2:{getValue:function(e,t){return String.fromCharCode(e.getUint8(t))},size:1,ascii:!0},3:{getValue:function(e,t,i){return e.getUint16(t,i)},size:2},4:{getValue:function(e,t,i){return e.getUint32(t,i)},size:4},5:{getValue:function(e,t,i){return e.getUint32(t,i)/e.getUint32(t+4,i)},size:8},9:{getValue:function(e,t,i){return e.getInt32(t,i)},size:4},10:{getValue:function(e,t,i){return e.getInt32(t,i)/e.getInt32(t+4,i)},size:8}},e.exifTagTypes[7]=e.exifTagTypes[1],e.getExifValue=function(t,i,a,n,r,o){var s,l,d,c,u,f,g=e.exifTagTypes[n];if(!g)return void console.log("Invalid Exif data: Invalid tag type.");if(s=g.size*r,l=s>4?i+t.getUint32(a+8,o):a+8,l+s>t.byteLength)return void console.log("Invalid Exif data: Invalid data offset.");if(1===r)return g.getValue(t,l,o);for(d=[],c=0;r>c;c+=1)d[c]=g.getValue(t,l+c*g.size,o);if(g.ascii){for(u="",c=0;d.length>c&&(f=d[c],"\x00"!==f);c+=1)u+=f;return u}return d},e.parseExifTag=function(t,i,a,n,r){var o=t.getUint16(a,n);r.exif[o]=e.getExifValue(t,i,a,t.getUint16(a+2,n),t.getUint32(a+4,n),n)},e.parseExifTags=function(e,t,i,a,n){var r,o,s;if(i+6>e.byteLength)return void console.log("Invalid Exif data: Invalid directory offset.");if(r=e.getUint16(i,a),o=i+2+12*r,o+4>e.byteLength)return void console.log("Invalid Exif data: Invalid directory size.");for(s=0;r>s;s+=1)this.parseExifTag(e,t,i+2+12*s,a,n);return e.getUint32(o,a)},e.parseExifData=function(t,i,a,n,r){if(!r.disableExif){var o,s,l,d=i+10;if(1165519206===t.getUint32(i+4)){if(d+8>t.byteLength)return void console.log("Invalid Exif data: Invalid segment size.");if(0!==t.getUint16(i+8))return void console.log("Invalid Exif data: Missing byte alignment offset.");switch(t.getUint16(d)){case 18761:o=!0;break;case 19789:o=!1;break;default:return void console.log("Invalid Exif data: Invalid byte alignment marker.")}if(42!==t.getUint16(d+2,o))return void console.log("Invalid Exif data: Missing TIFF marker.");s=t.getUint32(d+4,o),n.exif=new e.ExifMap,s=e.parseExifTags(t,d,d+s,o,n),s&&!r.disableExifThumbnail&&(l={exif:{}},s=e.parseExifTags(t,d,d+s,o,l),l.exif[513]&&(n.exif.Thumbnail=e.getExifThumbnail(t,d+l.exif[513],l.exif[514]))),n.exif[34665]&&!r.disableExifSub&&e.parseExifTags(t,d,d+n.exif[34665],o,n),n.exif[34853]&&!r.disableExifGps&&e.parseExifTags(t,d,d+n.exif[34853],o,n)}}},e.metaDataParsers.jpeg[65505].push(e.parseExifData)}),function(e){"use strict";"function"==typeof define&&define.amd?define(["load-image","load-image-exif"],e):e(window.loadImage)}(function(e){"use strict";var t,i,a;e.ExifMap.prototype.tags={256:"ImageWidth",257:"ImageHeight",34665:"ExifIFDPointer",34853:"GPSInfoIFDPointer",40965:"InteroperabilityIFDPointer",258:"BitsPerSample",259:"Compression",262:"PhotometricInterpretation",274:"Orientation",277:"SamplesPerPixel",284:"PlanarConfiguration",530:"YCbCrSubSampling",531:"YCbCrPositioning",282:"XResolution",283:"YResolution",296:"ResolutionUnit",273:"StripOffsets",278:"RowsPerStrip",279:"StripByteCounts",513:"JPEGInterchangeFormat",514:"JPEGInterchangeFormatLength",301:"TransferFunction",318:"WhitePoint",319:"PrimaryChromaticities",529:"YCbCrCoefficients",532:"ReferenceBlackWhite",306:"DateTime",270:"ImageDescription",271:"Make",272:"Model",305:"Software",315:"Artist",33432:"Copyright",36864:"ExifVersion",40960:"FlashpixVersion",40961:"ColorSpace",40962:"PixelXDimension",40963:"PixelYDimension",37121:"ComponentsConfiguration",37122:"CompressedBitsPerPixel",37500:"MakerNote",37510:"UserComment",40964:"RelatedSoundFile",36867:"DateTimeOriginal",36868:"DateTimeDigitized",37520:"SubsecTime",37521:"SubsecTimeOriginal",37522:"SubsecTimeDigitized",33434:"ExposureTime",33437:"FNumber",34850:"ExposureProgram",34852:"SpectralSensitivity",34855:"ISOSpeedRatings",34856:"OECF",37377:"ShutterSpeedValue",37378:"ApertureValue",37379:"BrightnessValue",37380:"ExposureBias",37381:"MaxApertureValue",37382:"SubjectDistance",37383:"MeteringMode",37384:"LightSource",37385:"Flash",37396:"SubjectArea",37386:"FocalLength",41483:"FlashEnergy",41484:"SpatialFrequencyResponse",41486:"FocalPlaneXResolution",41487:"FocalPlaneYResolution",41488:"FocalPlaneResolutionUnit",41492:"SubjectLocation",41493:"ExposureIndex",41495:"SensingMethod",41728:"FileSource",41729:"SceneType",41730:"CFAPattern",41985:"CustomRendered",41986:"ExposureMode",41987:"WhiteBalance",41988:"DigitalZoomRation",41989:"FocalLengthIn35mmFilm",41990:"SceneCaptureType",41991:"GainControl",41992:"Contrast",41993:"Saturation",41994:"Sharpness",41995:"DeviceSettingDescription",41996:"SubjectDistanceRange",42016:"ImageUniqueID",0:"GPSVersionID",1:"GPSLatitudeRef",2:"GPSLatitude",3:"GPSLongitudeRef",4:"GPSLongitude",5:"GPSAltitudeRef",6:"GPSAltitude",7:"GPSTimeStamp",8:"GPSSatellites",9:"GPSStatus",10:"GPSMeasureMode",11:"GPSDOP",12:"GPSSpeedRef",13:"GPSSpeed",14:"GPSTrackRef",15:"GPSTrack",16:"GPSImgDirectionRef",17:"GPSImgDirection",18:"GPSMapDatum",19:"GPSDestLatitudeRef",20:"GPSDestLatitude",21:"GPSDestLongitudeRef",22:"GPSDestLongitude",23:"GPSDestBearingRef",24:"GPSDestBearing",25:"GPSDestDistanceRef",26:"GPSDestDistance",27:"GPSProcessingMethod",28:"GPSAreaInformation",29:"GPSDateStamp",30:"GPSDifferential"},e.ExifMap.prototype.stringValues={ExposureProgram:{0:"Undefined",1:"Manual",2:"Normal program",3:"Aperture priority",4:"Shutter priority",5:"Creative program",6:"Action program",7:"Portrait mode",8:"Landscape mode"},MeteringMode:{0:"Unknown",1:"Average",2:"CenterWeightedAverage",3:"Spot",4:"MultiSpot",5:"Pattern",6:"Partial",255:"Other"},LightSource:{0:"Unknown",1:"Daylight",2:"Fluorescent",3:"Tungsten (incandescent light)",4:"Flash",9:"Fine weather",10:"Cloudy weather",11:"Shade",12:"Daylight fluorescent (D 5700 - 7100K)",13:"Day white fluorescent (N 4600 - 5400K)",14:"Cool white fluorescent (W 3900 - 4500K)",15:"White fluorescent (WW 3200 - 3700K)",17:"Standard light A",18:"Standard light B",19:"Standard light C",20:"D55",21:"D65",22:"D75",23:"D50",24:"ISO studio tungsten",255:"Other"},Flash:{0:"Flash did not fire",1:"Flash fired",5:"Strobe return light not detected",7:"Strobe return light detected",9:"Flash fired, compulsory flash mode",13:"Flash fired, compulsory flash mode, return light not detected",15:"Flash fired, compulsory flash mode, return light detected",16:"Flash did not fire, compulsory flash mode",24:"Flash did not fire, auto mode",25:"Flash fired, auto mode",29:"Flash fired, auto mode, return light not detected",31:"Flash fired, auto mode, return light detected",32:"No flash function",65:"Flash fired, red-eye reduction mode",69:"Flash fired, red-eye reduction mode, return light not detected",71:"Flash fired, red-eye reduction mode, return light detected",73:"Flash fired, compulsory flash mode, red-eye reduction mode",77:"Flash fired, compulsory flash mode, red-eye reduction mode, return light not detected",79:"Flash fired, compulsory flash mode, red-eye reduction mode, return light detected",89:"Flash fired, auto mode, red-eye reduction mode",93:"Flash fired, auto mode, return light not detected, red-eye reduction mode",95:"Flash fired, auto mode, return light detected, red-eye reduction mode"},SensingMethod:{1:"Undefined",2:"One-chip color area sensor",3:"Two-chip color area sensor",4:"Three-chip color area sensor",5:"Color sequential area sensor",7:"Trilinear sensor",8:"Color sequential linear sensor"},SceneCaptureType:{0:"Standard",1:"Landscape",2:"Portrait",3:"Night scene"},SceneType:{1:"Directly photographed"},CustomRendered:{0:"Normal process",1:"Custom process"},WhiteBalance:{0:"Auto white balance",1:"Manual white balance"},GainControl:{0:"None",1:"Low gain up",2:"High gain up",3:"Low gain down",4:"High gain down"},Contrast:{0:"Normal",1:"Soft",2:"Hard"},Saturation:{0:"Normal",1:"Low saturation",2:"High saturation"},Sharpness:{0:"Normal",1:"Soft",2:"Hard"},SubjectDistanceRange:{0:"Unknown",1:"Macro",2:"Close view",3:"Distant view"},FileSource:{3:"DSC"},ComponentsConfiguration:{0:"",1:"Y",2:"Cb",3:"Cr",4:"R",5:"G",6:"B"},Orientation:{1:"top-left",2:"top-right",3:"bottom-right",4:"bottom-left",5:"left-top",6:"right-top",7:"right-bottom",8:"left-bottom"}},e.ExifMap.prototype.getText=function(e){var t=this.get(e);switch(e){case"LightSource":case"Flash":case"MeteringMode":case"ExposureProgram":case"SensingMethod":case"SceneCaptureType":case"SceneType":case"CustomRendered":case"WhiteBalance":case"GainControl":case"Contrast":case"Saturation":case"Sharpness":case"SubjectDistanceRange":case"FileSource":case"Orientation":return this.stringValues[e][t];case"ExifVersion":case"FlashpixVersion":return String.fromCharCode(t[0],t[1],t[2],t[3]);case"ComponentsConfiguration":return this.stringValues[e][t[0]]+this.stringValues[e][t[1]]+this.stringValues[e][t[2]]+this.stringValues[e][t[3]];case"GPSVersionID":return t[0]+"."+t[1]+"."+t[2]+"."+t[3]}return t+""},t=e.ExifMap.prototype.tags,i=e.ExifMap.prototype.map;for(a in t)t.hasOwnProperty(a)&&(i[t[a]]=a);e.ExifMap.prototype.getAll=function(){var e,i,a={};for(e in this)this.hasOwnProperty(e)&&(i=t[e],i&&(a[i]=this.getText(i)));return a}}),/*
 * jQuery File Upload Processing Plugin 1.3.0
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2012, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","./jquery.fileupload"],e):e(window.jQuery)}(function(e){"use strict";var t=e.blueimp.fileupload.prototype.options.add;e.widget("blueimp.fileupload",e.blueimp.fileupload,{options:{processQueue:[],add:function(i,a){var n=e(this);a.process(function(){return n.fileupload("process",a)}),t.call(this,i,a)}},processActions:{},_processFile:function(t,i){var a=this,n=e.Deferred().resolveWith(a,[t]),r=n.promise();return this._trigger("process",null,t),e.each(t.processQueue,function(t,n){var o=function(t){return i.errorThrown?e.Deferred().rejectWith(a,[i]).promise():a.processActions[n.action].call(a,t,n)};r=r.pipe(o,n.always&&o)}),r.done(function(){a._trigger("processdone",null,t),a._trigger("processalways",null,t)}).fail(function(){a._trigger("processfail",null,t),a._trigger("processalways",null,t)}),r},_transformProcessQueue:function(t){var i=[];e.each(t.processQueue,function(){var a={},n=this.action,r=this.prefix===!0?n:this.prefix;e.each(this,function(i,n){a[i]="string"===e.type(n)&&"@"===n.charAt(0)?t[n.slice(1)||(r?r+i.charAt(0).toUpperCase()+i.slice(1):i)]:n}),i.push(a)}),t.processQueue=i},processing:function(){return this._processing},process:function(t){var i=this,a=e.extend({},this.options,t);return a.processQueue&&a.processQueue.length&&(this._transformProcessQueue(a),0===this._processing&&this._trigger("processstart"),e.each(t.files,function(n){var r=n?e.extend({},a):a,o=function(){return t.errorThrown?e.Deferred().rejectWith(i,[t]).promise():i._processFile(r,t)};r.index=n,i._processing+=1,i._processingQueue=i._processingQueue.pipe(o,o).always(function(){i._processing-=1,0===i._processing&&i._trigger("processstop")})})),this._processingQueue},_create:function(){this._super(),this._processing=0,this._processingQueue=e.Deferred().resolveWith(this).promise()}})}),/*
 * jQuery File Upload Image Preview & Resize Plugin 1.7.2
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2013, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","load-image","load-image-meta","load-image-exif","load-image-ios","canvas-to-blob","./jquery.fileupload-process"],e):e(window.jQuery,window.loadImage)}(function(e,t){"use strict";e.blueimp.fileupload.prototype.options.processQueue.unshift({action:"loadImageMetaData",disableImageHead:"@",disableExif:"@",disableExifThumbnail:"@",disableExifSub:"@",disableExifGps:"@",disabled:"@disableImageMetaDataLoad"},{action:"loadImage",prefix:!0,fileTypes:"@",maxFileSize:"@",noRevoke:"@",disabled:"@disableImageLoad"},{action:"resizeImage",prefix:"image",maxWidth:"@",maxHeight:"@",minWidth:"@",minHeight:"@",crop:"@",orientation:"@",forceResize:"@",disabled:"@disableImageResize"},{action:"saveImage",quality:"@imageQuality",type:"@imageType",disabled:"@disableImageResize"},{action:"saveImageMetaData",disabled:"@disableImageMetaDataSave"},{action:"resizeImage",prefix:"preview",maxWidth:"@",maxHeight:"@",minWidth:"@",minHeight:"@",crop:"@",orientation:"@",thumbnail:"@",canvas:"@",disabled:"@disableImagePreview"},{action:"setImage",name:"@imagePreviewName",disabled:"@disableImagePreview"},{action:"deleteImageReferences",disabled:"@disableImageReferencesDeletion"}),e.widget("blueimp.fileupload",e.blueimp.fileupload,{options:{loadImageFileTypes:/^image\/(gif|jpeg|png|svg\+xml)$/,loadImageMaxFileSize:1e7,imageMaxWidth:1920,imageMaxHeight:1080,imageOrientation:!1,imageCrop:!1,disableImageResize:!0,previewMaxWidth:80,previewMaxHeight:80,previewOrientation:!0,previewThumbnail:!0,previewCrop:!1,previewCanvas:!0},processActions:{loadImage:function(i,a){if(a.disabled)return i;var n=this,r=i.files[i.index],o=e.Deferred();return"number"===e.type(a.maxFileSize)&&r.size>a.maxFileSize||a.fileTypes&&!a.fileTypes.test(r.type)||!t(r,function(e){e.src&&(i.img=e),o.resolveWith(n,[i])},a)?i:o.promise()},resizeImage:function(i,a){if(a.disabled||!i.canvas&&!i.img)return i;a=e.extend({canvas:!0},a);var n,r=this,o=e.Deferred(),s=a.canvas&&i.canvas||i.img,l=function(e){e&&(e.width!==s.width||e.height!==s.height||a.forceResize)&&(i[e.getContext?"canvas":"img"]=e),i.preview=e,o.resolveWith(r,[i])};if(i.exif){if(a.orientation===!0&&(a.orientation=i.exif.get("Orientation")),a.thumbnail&&(n=i.exif.get("Thumbnail")))return t(n,l,a),o.promise();i.orientation?delete a.orientation:i.orientation=a.orientation}return s?(l(t.scale(s,a)),o.promise()):i},saveImage:function(t,i){if(!t.canvas||i.disabled)return t;var a=this,n=t.files[t.index],r=e.Deferred();return t.canvas.toBlob?(t.canvas.toBlob(function(e){e.name||(n.type===e.type?e.name=n.name:n.name&&(e.name=n.name.replace(/\..+$/,"."+e.type.substr(6)))),n.type!==e.type&&delete t.imageHead,t.files[t.index]=e,r.resolveWith(a,[t])},i.type||n.type,i.quality),r.promise()):t},loadImageMetaData:function(i,a){if(a.disabled)return i;var n=this,r=e.Deferred();return t.parseMetaData(i.files[i.index],function(t){e.extend(i,t),r.resolveWith(n,[i])},a),r.promise()},saveImageMetaData:function(e,t){if(!(e.imageHead&&e.canvas&&e.canvas.toBlob)||t.disabled)return e;var i=e.files[e.index],a=new Blob([e.imageHead,this._blobSlice.call(i,20)],{type:i.type});return a.name=i.name,e.files[e.index]=a,e},setImage:function(e,t){return e.preview&&!t.disabled&&(e.files[e.index][t.name||"preview"]=e.preview),e},deleteImageReferences:function(e,t){return t.disabled||(delete e.img,delete e.canvas,delete e.preview,delete e.imageHead),e}}})}),/*
 * jQuery File Upload Validation Plugin 1.1.2
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2013, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","./jquery.fileupload-process"],e):e(window.jQuery)}(function(e){"use strict";e.blueimp.fileupload.prototype.options.processQueue.push({action:"validate",always:!0,acceptFileTypes:"@",maxFileSize:"@",minFileSize:"@",maxNumberOfFiles:"@",disabled:"@disableValidation"}),e.widget("blueimp.fileupload",e.blueimp.fileupload,{options:{getNumberOfFiles:e.noop,messages:{maxNumberOfFiles:"Maximum number of files exceeded",acceptFileTypes:"File type not allowed",maxFileSize:"File is too large",minFileSize:"File is too small"}},processActions:{validate:function(t,i){if(i.disabled)return t;var a,n=e.Deferred(),r=this.options,o=t.files[t.index];return(i.minFileSize||i.maxFileSize)&&(a=o.size),"number"===e.type(i.maxNumberOfFiles)&&(r.getNumberOfFiles()||0)+t.files.length>i.maxNumberOfFiles?o.error=r.i18n("maxNumberOfFiles"):!i.acceptFileTypes||i.acceptFileTypes.test(o.type)||i.acceptFileTypes.test(o.name)?a>i.maxFileSize?o.error=r.i18n("maxFileSize"):"number"===e.type(a)&&a<i.minFileSize?o.error=r.i18n("minFileSize"):delete o.error:o.error=r.i18n("acceptFileTypes"),o.error||t.files.error?(t.files.error=!0,n.rejectWith(this,[t])):n.resolveWith(this,[t]),n.promise()}}})});