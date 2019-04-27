$(function () {

    $("#jqGrid").jqGrid({
        // url: baseURL + 'produce/capacity/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            {label: '序号', name: 'id', index: 'id', formatter: "Integer", width: 50, key: true},
            {label: '排放口编号', name: 'dischargeId', index: 'dischargeId', width: 200},
            {label: '排放口名称', name: 'dischargeName', index: 'dischargeName', width: 200},
            {label: '经度', name: 'longitude', index: 'longitude', width: 200},
            {label: '纬度', name: 'latitude', index: 'latitude', width: 200},
            {label: '排放去向', name: 'whereabouts', index: 'whereabouts', width: 200},
            {label: '排放规律', name: 'law', index: 'law', width: 200},
            {label: '间歇排放时段', name: 'timeInterval', index: 'timeInterval', width: 200},
            {label: '名称', name: 'firstName', index: 'firstName', width: 200},
            {label: '受纳水体功能目标', name: 'goal', index: 'goal', width: 200},
            {label: '经度', name: 'longitudes', index: 'longitudes', width: 200},
            {label: '纬度', name: 'latitudes', index: 'latitudes', width: 200},
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
            {startColumnName: 'longitude', numberOfColumns: 2, titleText: '排放口地理坐标'},
            {startColumnName: 'firstName', numberOfColumns: 2, titleText: '受纳自然水体信息'},
            {startColumnName: 'longitudes', numberOfColumns: 2, titleText: '汇入受纳自然水体处地理坐标'}
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
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "longitude": "200.00",
                "latitude": "10.00",
                "whereabouts": "210.00",
                "law": '32',
                "timeInterval": "12",
                "firstName": "12",
                "goal": "12",
                "longitudes": "12",
                "latitudes": "12",
                "info": "12",
            }, {
                "id": 2,
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "longitude": "200.00",
                "latitude": "10.00",
                "whereabouts": "210.00",
                "law": '32',
                "timeInterval": "12",
                "firstName": "12",
                "goal": "12",
                "longitudes": "12",
                "latitudes": "12",
                "info": "12",
            }, {
                "id": 3,
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "longitude": "200.00",
                "latitude": "10.00",
                "whereabouts": "210.00",
                "law": '32',
                "timeInterval": "12",
                "firstName": "12",
                "goal": "12",
                "longitudes": "12",
                "latitudes": "12",
                "info": "12",
            }, {
                "id": 4,
                "dischargeId": "2007-10-01",
                "dischargeName": "瓮安排污口",
                "longitude": "200.00",
                "latitude": "10.00",
                "whereabouts": "210.00",
                "law": '32',
                "timeInterval": "12",
                "firstName": "12",
                "goal": "12",
                "longitudes": "12",
                "latitudes": "12",
                "info": "12",
            },

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
                "dischargeId": vm.info.dischargeId,
                "dischargeName": vm.info.dischargeName,
                "longitude": vm.info.longitude,
                "latitude": vm.info.latitude,
                "whereabouts": vm.info.whereabouts,
                "law": vm.info.law,
                "timeInterval": vm.info.timeInterval,
                "firstName": vm.info.firstName,
                "goal": vm.info.goal,
                "longitudes": vm.info.longitudes,
                "latitudes": vm.info.latitudes,
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