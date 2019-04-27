$(function () {

    $("#jqGrid").jqGrid({
        // url: baseURL + 'produce/capacity/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            {label: '序号', name: 'id', index: 'id', formatter: "Integer", width: 50, key: true},
            {label: '生产设施编号', name: 'produceId', index: 'produceId', width: 200},
            {label: '排放口编号', name: 'dischargeId', index: 'dischargeId', width: 200},
            {label: '排放口名称', name: 'dischargeName', index: 'dischargeName', width: 200},
            {label: '污染物种类', name: 'fomiteClass', index: 'fomiteClass', width: 200},
            {label: '名称', name: 'firstName', index: 'firstName', width: 200},
            {label: '浓度限值(mg/Nm³)', name: 'concentration', index: 'concentration', width: 200},
            {label: '速率限值(kg/h)', name: 'rate', index: 'rate', width: 200},
            {label: '环境影响评价批复要求(mg/Nm ³)', name: 'demand', index: 'demand', width: 200},
            {label: '承诺更加严格排放限值(mg/Nm³)', name: 'limits', index: 'limits', width: 200},
            {label: '其他信息', name: 'info', index: 'info', width: 200}
        ],
        shrinkToFit: false,
        autoScroll: true,
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
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "scroll" });
        }
    });
    $("#jqGrid").jqGrid('setGroupHeaders', {
        useColSpanStyle: true,
        groupHeaders: [
            {startColumnName: 'firstName', numberOfColumns: 3, titleText: '国家或地方污染物排放标准'}
        ]
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        tempId: null,
        info: {},
        myInfoData: [
            {
                "id": 1,
                "produceId": 1,
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "fomiteClass": "正材牌垃圾塑料袋",
                "firstName": "200.00",
                "concentration": "10.00",
                "rate": "210.00",
                "demand": '32',
                "limits": '32',
                "info": "12"
            }, {
                "id": 2,
                "produceId": 1,
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "fomiteClass": "正材牌垃圾塑料袋",
                "firstName": "200.00",
                "concentration": "10.00",
                "rate": "210.00",
                "demand": '32',
                "limits": '32',
                "info": "12"
            }, {
                "id": 3,
                "produceId": 1,
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "fomiteClass": "正材牌垃圾塑料袋",
                "firstName": "200.00",
                "concentration": "10.00",
                "rate": "210.00",
                "demand": '32',
                "limits": '32',
                "info": "12"
            }
        ]
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
            console.log("jiba")
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
                /*
                                "id": vm.info.id,
                */
                "produceId": vm.info.produceId,
                "dischargeId": vm.info.dischargeId,
                "dischargeName": vm.info.dischargeName,
                "fomiteClass": vm.info.fomiteClass,
                "firstName": vm.info.firstName,
                "concentration": vm.info.concentration,
                "rate": vm.info.rate,
                "demand": vm.info.demand,
                "limits": vm.info.limits,
                "info": vm.info.info
            };
            if (vm.info.id == null) {
                item.id = vm.myInfoData.length + 1;
                vm.myInfoData.push(item)
            } else {
                item.id = vm.info.id;
                //删掉选中的
                vm.myInfoData.splice(vm.tempId - 1, 1);
                //将修改后插入刚刚删除的位置
                vm.myInfoData.splice(vm.tempId - 1, 0, item);
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
                vm.myInfoData.splice(Ids[i] - 1, 1);
            }
            vm.reload()

            /*var lock = false;
            layer.confirm('确定要删除选中的记录？', {
                btn: ['确定','取消'] //按钮
            }, function(){
               if(!lock) {
                    lock = true;
                    $.ajax({
                        type: "POST",
                        url: baseURL + "produce/capacity/delete",
                        contentType: "application/json",
                        data: JSON.stringify(Ids),
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
             });*/
        },
        getInfo: function (infoId) {

            vm.info = vm.myInfoData[infoId];
            /*$.get(baseURL + "produce/capacity/info/"+infoId, function(r){
                vm.info = r.info;

                console.log("请求地址为：" + baseURL + "produce/capacity/info/"+infoId);
                console.log(r.info)
            });*/
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