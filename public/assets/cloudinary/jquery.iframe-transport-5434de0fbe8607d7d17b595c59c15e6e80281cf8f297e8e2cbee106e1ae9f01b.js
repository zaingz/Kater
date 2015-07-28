/*
 * jQuery Iframe Transport Plugin 1.8.2
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery"],e):e(window.jQuery)}(function(e){"use strict";var t=0;e.ajaxTransport("iframe",function(r){if(r.async){var n,a,o,i=r.initialIframeSrc||"javascript:false;";return{send:function(p,m){n=e('<form style="display:none;"></form>'),n.attr("accept-charset",r.formAcceptCharset),o=/\?/.test(r.url)?"&":"?","DELETE"===r.type?(r.url=r.url+o+"_method=DELETE",r.type="POST"):"PUT"===r.type?(r.url=r.url+o+"_method=PUT",r.type="POST"):"PATCH"===r.type&&(r.url=r.url+o+"_method=PATCH",r.type="POST"),t+=1,a=e('<iframe src="'+i+'" name="iframe-transport-'+t+'"></iframe>').bind("load",function(){var t,o=e.isArray(r.paramName)?r.paramName:[r.paramName];a.unbind("load").bind("load",function(){var t;try{if(t=a.contents(),!t.length||!t[0].firstChild)throw new Error}catch(r){t=void 0}m(200,"success",{iframe:t}),e('<iframe src="'+i+'"></iframe>').appendTo(n),window.setTimeout(function(){n.remove()},0)}),n.prop("target",a.prop("name")).prop("action",r.url).prop("method",r.type),r.formData&&e.each(r.formData,function(t,r){e('<input type="hidden"/>').prop("name",r.name).val(r.value).appendTo(n)}),r.fileInput&&r.fileInput.length&&"POST"===r.type&&(t=r.fileInput.clone(),r.fileInput.after(function(e){return t[e]}),r.paramName&&r.fileInput.each(function(t){e(this).prop("name",o[t]||r.paramName)}),n.append(r.fileInput).prop("enctype","multipart/form-data").prop("encoding","multipart/form-data"),r.fileInput.removeAttr("form")),n.submit(),t&&t.length&&r.fileInput.each(function(r,n){var a=e(t[r]);e(n).prop("name",a.prop("name")).attr("form",a.attr("form")),a.replaceWith(n)})}),n.append(a).appendTo(document.body)},abort:function(){a&&a.unbind("load").prop("src",i),n&&n.remove()}}}}),e.ajaxSetup({converters:{"iframe text":function(t){return t&&e(t[0].body).text()},"iframe json":function(t){return t&&e.parseJSON(e(t[0].body).text())},"iframe html":function(t){return t&&e(t[0].body).html()},"iframe xml":function(t){var r=t&&t[0];return r&&e.isXMLDoc(r)?r:e.parseXML(r.XMLDocument&&r.XMLDocument.xml||e(r.body).html())},"iframe script":function(t){return t&&e.globalEval(e(t[0].body).text())}}})});