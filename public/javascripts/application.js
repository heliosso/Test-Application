// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaultsv
function assignTaskLists(user_id){
	var check = "";
	var index = 0;
	var tasklist = new Array();
	check = document.getElementsByClassName('check');
	for(var i=0; i<check.length;i++){
		if(check[i].checked){
			tasklist[index] = check[i].value;
			index = index + 1;
		}
			
	}
	if(index > 0){
		window.location = '/assign_task_list?user_id='+user_id+'&task_list='+tasklist;
	}else{
		alert("select a Task List");
	}
}

function taskCompleted(user_id,task_id,task_list_id){
	var newajx = new Ajax.Request('/user_tasks/change_task_status?user_id='+user_id+'&task_id='+task_id, {
	                         method: 'get',
					  		 asynchronous: true,
					  		 evalScripts: false,
					  		 onComplete: function(request){
							   window.location = '/user_tasks/list?user_id='+user_id+'&task_list='+task_list_id;
							 }
				  });
}