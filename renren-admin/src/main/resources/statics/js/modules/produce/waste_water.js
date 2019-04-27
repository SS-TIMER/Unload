$(function () {
    /*var mydata = [];
    for (var i = 1; i <= 15; i++) {
        var item = {
            "id":i,
            "name":"生活污水",
            "deviceId":"20190417",
            "technology":"物联网",
            "wasteName": "狗松",
            "intro":"Test",
            "price":"Test",
            "num":"Test"}
        mydata.push(item)
    }*/

    $("#jqGrid").jqGrid({
        //url: baseURL + 'sys/goods/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            { label: '序号', name: 'id', index: 'id',width: 50, key: true },
            { label: '废水类别', name: 'waterType', index: 'waterType',width: 100 },
            { label: '污染物种类', name: 'wasteName', index: 'wasteName',width: 100 },

            { label: '污染治理设施编号', name: 'fixDevId', index: 'fixDevId',width: 150 },
            { label: '污染治理设施名称', name: 'fixDevName', index: 'fixDevName' ,width: 150},
            { label: '污染治理设施工艺', name: 'fixDevTechno', index: 'fixDevTechno',width: 150 },
            { label: '是否为可行技术', name: 'isOk', index: 'isOk',width: 100 },
            { label: '污染物治理设施其他信息', name: 'fixDevOtherInfo', index: 'fixDevOtherInfo',width: 80 },

            { label: '排放去向', name: 'outWhere', index: 'outWhere',width: 80 },
            { label: '排放方式', name: 'outMode', index: 'outMode',width: 100 },
            { label: '排放规律', name: 'outTime', index: 'outTime',width: 140 },
            { label: '排放口编号', name: 'outId', index: 'outId',width: 100 },
            { label: '排放口名称', name: 'outName', index: 'outName',width: 100 },
            { label: '排放口设置是否符合要求', name: 'outOk', index: 'outOk',width: 100 },
            { label: '排放口类型', name: 'outType', index: 'outType',width: 100 },
            { label: '其他信息', name: 'otherInfo', index: 'otherInfo',width: 100 }
        ],
        shrinkToFit:false,
        autoScroll: true,
        altRows: true,
        altclass: "differ",
        viewrecords: true,
        height: "100%",
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
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "scroll" });
        }
    });
    $("#jqGrid").jqGrid('setGroupHeaders', {
        useColSpanStyle: true,
        groupHeaders:[
            {startColumnName:'fixDevId', numberOfColumns:5, titleText: '污染治理设施'}
        ]
    });
});

var vm = new Vue({
    el:'#rrapp',
    data:{
        showList: true,
        title: null,
        tempId: null,
        info: {},
        myInfoData: [
            {
                "id": 1,
                "waterType": "生活污水",
                "wasteName": "水质污染",
                /**/
                "fixDevId": "14123412342",
                "fixDevName": "三号沉淀池",
                "fixDevTechno": "化学沉淀",
                "isOk": "可行",
                "fixDevOtherInfo": "利用化学反应，去除有毒物质",

                "outWhere": "河流",
                "outMode": "直接排放",
                "outTime": "每天一次",
                "outId": "20190101",
                "outName": "一号废水管道",
                "outOk": "符合",
                "outType": "管道",
                "otherInfo": "保护水源，治理污水"
            },
            {
                "id": 2,
                "waterType": "生活污水",
                "wasteName": "水质污染",
                /**/
                "fixDevId": "14123412342",
                "fixDevName": "三号沉淀池",
                "fixDevTechno": "化学沉淀",
                "isOk": "可行",
                "fixDevOtherInfo": "利用化学反应，去除有毒物质",

                "outWhere": "河流",
                "outMode": "直接排放",
                "outTime": "每天一次",
                "outId": "20190101",
                "outName": "一号废水管道",
                "outOk": "符合",
                "outType": "管道",
                "otherInfo": "保护水源，治理污水"
            },
            {
                "id": 3,
                "waterType": "生活污水",
                "wasteName": "水质污染",
                /**/
                "fixDevId": "14123412342",
                "fixDevName": "三号沉淀池",
                "fixDevTechno": "化学沉淀",
                "isOk": "可行",
                "fixDevOtherInfo": "利用化学反应，去除有毒物质",

                "outWhere": "河流",
                "outMode": "直接排放",
                "outTime": "每天一次",
                "outId": "20190101",
                "outName": "一号废水管道",
                "outOk": "符合",
                "outType": "管道",
                "otherInfo": "保护水源，治理污水"
            },
            {
                "id": 4,
                "waterType": "生活污水",
                "wasteName": "水质污染",
                /**/
                "fixDevId": "14123412342",
                "fixDevName": "三号沉淀池",
                "fixDevTechno": "化学沉淀",
                "isOk": "可行",
                "fixDevOtherInfo": "利用化学反应，去除有毒物质",

                "outWhere": "河流",
                "outMode": "直接排放",
                "outTime": "每天一次",
                "outId": "20190101",
                "outName": "一号废水管道",
                "outOk": "符合",
                "outType": "管道",
                "otherInfo": "保护水源，治理污水"
            }
        ]
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            vm.goods = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if(id == null){
                return ;
            }
            vm.showList = false;
            vm.title = "修改";
            vm.tempId = id[0];
            vm.getInfo(id[0] - 1)
            //vm.getInfo(goodsId)
        },
        saveOrUpdate: function (event) {
            var item = {
                // "id":vm.myInfoData.length + 1,
                "waterType": vm.info.waterType,
                "wasteName": vm.info.wasteName,
                /**/
                "fixDevId": vm.info.fixDevId,
                "fixDevName": vm.info.fixDevName,
                "fixDevTechno": vm.info.fixDevTechno,
                "isOk": vm.info.isOk,
                "fixDevOtherInfo": vm.info.fixDevOtherInfo,

                "outWhere": vm.info.outWhere,
                "outMode": vm.info.outMode,
                "outTime": vm.info.outTime,
                "outName": vm.info.outName,
                "outOk": vm.info.outOk,
                "outType": vm.info.outType,
                "otherInfo": vm.info.otherInfo
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
                var url = vm.goods.goodsId == null ? "sys/goods/save" : "sys/goods/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.goods),
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
            if(Ids == null){
                return ;
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
                        url: baseURL + "sys/goods/delete",
                        contentType: "application/json",
                        data: JSON.stringify(goodsIds),
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
        getInfo: function(infoId){
            vm.info = vm.myInfoData[infoId];
            /*$.get(baseURL + "sys/goods/info/"+goodsId, function(r){
                vm.goods = r.goods;
            });*/
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        }
    }
});