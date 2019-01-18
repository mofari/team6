/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
var myToolbar =  
               [     
                   { name: 'document', items : [ 'Source','-','DocProps','Preview','Print','-','Templates' ]  },
                   { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
                   { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
                   { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','Iframe' ] },
                           '/',
                   { name: 'styles', items : [ 'Font','FontSize' ] },
                   { name: 'colors', items : [ 'TextColor','BGColor' ] },
                   { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
                   { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
                   { name: 'links', items : [ 'Link','Unlink' ] },
                   { name: 'tools', items : [ 'Maximize','-','About' ] }
               ];

CKEDITOR.editorConfig = function( config )
{
// Define changes to default configuration here. For example:
// config.language = 'fr';
// config.uiColor = '#AADC6E';
config.height = 500;
config.toolbar = myToolbar;
//config.uiColor = '#9AB8F3';
config.uiColor = '#D3D3D3';
config.enterMode = CKEDITOR.ENTER_BR; //엔터키 태그 1:<p>, 2:<br>, 3:<div>
config.font_defaultLabel = 'Malgun Gothic'; //기본글씨
config.font_names = '굴림체/Gulim;돋움체/Dotum;맑은 고딕/Malgun Gothic;';
config.fontSize_defaultLabel = '14px';
config.fontSize_sizes = '14/14px;16/16px;20/20px;24/24px;28/28px;36/36px;48/48px;72/72px;';

config.filebrowserBrowseUrl = '../ckfinder/ckfinder.html';
config.filebrowserImageBrowseUrl = '../ckfinder/ckfinder.html?type=Images';
config.filebrowserFlashBrowseUrl = '../ckfinder/ckfinder.html?type=Flash';
config.filebrowserUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
config.filebrowserImageUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
config.filebrowserFlashUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'; 
};
 

