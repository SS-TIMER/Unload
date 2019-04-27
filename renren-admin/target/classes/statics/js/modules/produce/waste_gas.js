$(function () {
    /*var mydata = [];
    for (var i = 1; i <= 25; i++) {
        var item = {
            "id":i,
            "facId":"53000001",
            "facName":"重离子离心机",
            "processName":"核废料处理",
            "wasteType":"辐射污染物",
            "outType":"收集填埋",
            /!**!/
            "fixDevId":"73601001",
            "fixDevName":"南翔挖掘机",
            "fixDevTechno":"挖掘",
            "isOk":"可行",
            "fixOtherInfo":"2019年1月更换",

            "outId":"601001",
            "outName":"离子废料排放口2",
            "outIsOk":"符合",
            "outTypes":"挖掘",
            "otherInfo":"--",
        };
        mydata.push(item)
    }*/
    $("#jqGrid").jqGrid({
        //url: baseURL + 'sys/goods/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            { label: '序号', name: 'id', index: 'id',width: 50, key: true },
            { label: '生产设施编号', name: 'facId', index: 'facId',width: 150 },
            { label: '生产设施名称', name: 'facName', index: 'facName',width: 100 },
            { label: '对应产污环节名称', name: 'processName', index: 'processName',width: 150 },
            { label: '污染物种类', name: 'wasteType', index: 'wasteType',width: 100 },
            { label: '排放形式', name: 'outType', index: 'outType',width: 80 },

            { label: '污染治理设施编号', name: 'fixDevId', index: 'fixDevId',width: 150 },
            { label: '污染治理设施名称', name: 'fixDevName', index: 'fixDevName' ,width: 150},
            { label: '污染治理设施工艺', name: 'fixDevTechno', index: 'fixDevTechno',width: 150 },
            { label: '是否为可行技术', name: 'isOk', index: 'isOk',width: 130 },
            { label: '污染物治理设施其他信息', name: 'fixOtherInfo', index: 'fixOtherInfo',width: 150 },

            { label: '有组织排放口编号', name: 'outId', index: 'outId',width: 150 },
            { label: '有组织排放口名称', name: 'outName', index: 'outName',width: 150 },
            { label: '排放口设置是否符合要求', name: 'outIsOk', index: 'outIsOk',width: 140 },
            { label: '排放口类型', name: 'outTypes', index: 'outTypes',width: 100 },
            { label: '其他信息', name: 'otherInfo', index: 'otherInfo',width: 100 }
        ],
        shrinkToFit:false,
        autoScroll: true,
        altRows: true,
        altclass: "differ",
        viewrecords: true,

        height: "100%",
        rowNum: 15,
        rowList : [15,30,50],
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
                "facId": "53000001",
                "facName": "钢铁冶炼",
                "processName": "大气污染",
                "wasteType": "气体",
                "outType": "气体排放",
                /**/
                "fixDevId": "73601001",
                "fixDevName": "有害气体过滤",
                "fixDevTechno": "废气处理",
                "isOk": "可行",
                "fixOtherInfo": "很棒的治理设备",

                "outId": "601001",
                "outName": "一号废气排放口",
                "outIsOk": "符合",
                "outTypes": "气体排放口",
                "otherInfo": "治理污染，人人有责"
            },
            {
                "id": 2,
                "facId": "53000001",
                "facName": "钢铁冶炼",
                "processName": "大气污染",
                "wasteType": "气体",
                "outType": "气体排放",
                /**/
                "fixDevId": "73601001",
                "fixDevName": "有害气体过滤",
                "fixDevTechno": "废气处理",
                "isOk": "可行",
                "fixOtherInfo": "很棒的治理设备",

                "outId": "601001",
                "outName": "一号废气排放口",
                "outIsOk": "符合",
                "outTypes": "气体排放口",
                "otherInfo": "治理污染，人人有责"
            },
            {
                "id": 3,
                "facId": "53000001",
                "facName": "钢铁冶炼",
                "processName": "大气污染",
                "wasteType": "气体",
                "outType": "气体排放",
                /**/
                "fixDevId": "73601001",
                "fixDevName": "有害气体过滤",
                "fixDevTechno": "废气处理",
                "isOk": "可行",
                "fixOtherInfo": "很棒的治理设备",

                "outId": "601001",
                "outName": "一号废气排放口",
                "outIsOk": "符合",
                "outTypes": "气体排放口",
                "otherInfo": "治理污染，人人有责"
            },
            {
                "id": 4,
                "facId": "53000001",
                "facName": "钢铁冶炼",
                "processName": "大气污染",
                "wasteType": "气体",
                "outType": "气体排放",
                /**/
                "fixDevId": "73601001",
                "fixDevName": "有害气体过滤",
                "fixDevTechno": "废气处理",
                "isOk": "可行",
                "fixOtherInfo": "很棒的治理设备",

                "outId": "601001",
                "outName": "一号废气排放口",
                "outIsOk": "符合",
                "outTypes": "气体排放口",
                "otherInfo": "治理污染，人人有责"
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
                "facId": vm.info.facId,
                "facName": vm.info.facName,
                "processName": vm.info.processName,
                "wasteType": vm.info.wasteType,
                "outType": vm.info.outType,
                /**/
                "fixDevId": vm.info.fixDevId,
                "fixDevName": vm.info.fixDevName,
                "fixDevTechno": vm.info.fixDevTechno,
                "isOk": vm.info.isOk,
                "fixOtherInfo": vm.info.fixOtherInfo,

                "outId": vm.info.outId,
                "outName": vm.info.outName,
                "outIsOk": vm.info.outIsOk,
                "outTypes": vm.info.outTypes,
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