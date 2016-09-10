var gIsIE = navigator.appName.indexOf("Microsoft") != -1; 

String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

SQLContentEditor = {
	// 初始edit	
	initialize : function(dbtype, id){
		this.editor = CodeMirror.fromTextArea(document.getElementById(id), {
		    mode: dbtype == 'mysql' ? 'text/x-mysql' : dbtype == 'oracle' ? 'text/x-plsql' : dbtype=='sqlserver' ? 'text/x-mssql' :  'text/x-mariadb',
		    indentWithTabs: true,
		    smartIndent: true,
		    lineNumbers: true,
		    matchBrackets : true,
		    autofocus: true,
		    extraKeys: {"Ctrl": "autocomplete"},
		    hintOptions: {tables: {
		      users: {name: null, score: null, birthDate: null},
		      countries: {name: null, population: null, size: null}
		    }}
		  });
	},
	insert : function(text){
		return this.editor.replaceSelection(text);
	},
	setSQL : function(text) {
		return this.editor.setValue(text);
	},
	getContents : function() {
		return this.editor.getValue();
	},
	clear : function() {
		return this.editor.setValue('');
	},
	execCommand : function(comm) {
		if(comm=='Undo') {
			// 撤消
			
		} else if(comm=='Redo') {
			// 重复
		}
		//this.editor.execCommand(comm,false, false);
	},
	getHTML : function() {
		return this.editor.getValue();
	}
};