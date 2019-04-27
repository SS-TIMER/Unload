$(function () {

    $("#jqGrid").jqGrid({
        // url: baseURL + 'produce/capacity/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            {label: '序号', name: 'id', index: 'id', formatter: "Integer", width: 50, key: true},
            {label: '申请表名称', name: 'name', index: 'name', width: 150},
            {label: '行业类型', name: 'type', index: 'technologyName', width: 100},
            {label: '创建人', name: 'author', index: 'facName', width: 100},
            {label: '创建时间', name: 'createTime', index: 'facId', width: 140},
        ],
        shrinkToFit: true,
        autoScroll: false,
        width: "100%",
        altRows: true,
        altclass: "differ",
        viewrecords: true,
        height: "100%",
        rowNum: 15,
        rowList: [10, 15, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,

        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "scroll" });
        }
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        tempId: null,
        info: {},

    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.info = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";
            vm.tempId = id[0];
            vm.getInfo(id[0] - 1)
        },
        saveOrUpdate: function (event) {
            var item = {
                // "id":vm.myInfoData.length + 1,
                "name": vm.info.name,
                "type": vm.info.type,
                "author": vm.info.author,
                "createTime": vm.info.createTime
            };
            if (vm.info.id == null) {
                item.id = vm.myInfoData.length + 1;
                vm.myInfoData.push(item)
            } else {
                item.id = vm.info.id;
                //删掉选中的
                vm.myInfoData.splice(vm.tempId -1, 1);
                //将修改后插入刚刚删除的位置
                vm.myInfoData.splice(vm.tempId -1, 0,item);
            }
            vm.reload();
            /*$('#btnSaveOrUpdate').button('loading').delay(1000).queue(function() {
                var url = vm.info.id == null ? "produce/capacity/save" : "produce/capacity/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.info),
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
            });*/
        },
        del: function (event) {
            var Ids = getSelectedRows();
            if (Ids == null) {
                return;
            }
            for (var i = 0; i < Ids.length; i++) {
                console.log(Ids[i]);
                iframe_vm.myInfoData.splice(Ids[i] - 1, 1);
            }
            iframe_vm.reload()
        },
        getInfo: function (infoId) {
            vm.info = vm.myInfoData[infoId];
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        }
    }
});