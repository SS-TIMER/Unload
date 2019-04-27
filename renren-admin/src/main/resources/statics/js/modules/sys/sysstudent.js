$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/sysstudent/findAll',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '姓名', name: 'name', index: 'name', width: 80 },
			{ label: '性别',field: 'sex', name: 'sex', index: 'sex', width: 80,formatter:function (item, index) {
                    console.log(item);
                    if (item === 0){
                        return '女'
                    }
                    if (item === 1){
                        return '男'
                    }
                    // return '女';
                } },
			{ label: '地址', name: 'address', index: 'address', width: 80 },
			{ label: '年龄', name: 'age', index: 'age', width: 80 },
			{ label: '班级', name: 'className', index: 'className', width: 80 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		sysStudent: {},
        allClassTest: []
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
            /* 将班级数据读取，填入下拉框 */
            console.log("点击了新增按钮");
			vm.showList = false;
			vm.title = "新增";
			vm.sysStudent = {};

			vm.queryAllClass();

		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id);
            /* 将班级数据读取，填入下拉框 */
            console.log("点击了修改按钮");

		},
        /* 保存，修改 的【确定】 在这里！ */
		saveOrUpdate: function (event) {
		    $('#btnSaveOrUpdate').button('loading').delay(1000).queue(function() {
                var url = vm.sysStudent.id == null ? "sys/sysstudent/save" : "sys/sysstudent/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.sysStudent),
                    success: function(r){
                        if(r.code === 0){
                             layer.msg("操作成功", {icon: 1});
                             vm.reload();
                             $('#btnSaveOrUpdate').button('reset');
                             $('#btnSaveOrUpdate').dequeue();
                        }else{
                            layer.alert(r.msg);
                            $('#btnSaveOrUpdate').button('reset');
                            $('#btnSaveOrUpdate').dequeue();
                        }
                    }
                });
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			var lock = false;
            layer.confirm('确定要删除选中的记录？', {
                btn: ['确定','取消'] //按钮
            }, function(){
               if(!lock) {
                    lock = true;
		            $.ajax({
                        type: "POST",
                        url: baseURL + "sys/sysstudent/delete",
                        contentType: "application/json",
                        data: JSON.stringify(ids),
                        success: function(r){
                            if(r.code == 0){
                                layer.msg("操作成功", {icon: 1});
                                $("#jqGrid").trigger("reloadGrid");
                            }else{
                                layer.alert(r.msg);
                            }
                        }
				    });
			    }
             }, function(){
             });
		},
		getInfo: function(id){
			$.get(baseURL + "sys/sysstudent/info/"+id, function(r){
                vm.sysStudent = r.sysStudent;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{

                page:page
            }).trigger("reloadGrid");

		},
        queryAllClass:function () {
		    vm.allClassTest.length =0;
            $.get(baseURL + "sys/sysstudent/queryAllClass",function (datas) {
                /*console.log(data);*/
                for(var i=0;i<datas.length;i++) {
                    vm.allClassTest.push(datas[i]);
                }
            });
        }
	}
});