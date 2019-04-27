$(function () {
   /* var mydata = [];
    for (var i = 1; i <= 15; i++) {
        var item = {"id":i,"name":"知晓","technology":"物联网","intro":"Test","price":"Test","num":"Test"}
        mydata.push(item)
    }
*/
    $("#jqGrid").jqGrid({
        //url: baseURL + 'sys/goods/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            { label: '序号', name: 'id', index: 'id',width: 50, key: true },
            { label: '燃料名称', name: 'name', index: 'name',width: 150 },
            { label: '灰分(%)', name: 'hui', index: 'hui',width: 100 },
            { label: '硫分(%)', name: 'liu', index: 'liu',width: 100 },
            { label: '挥发分(%)', name: 'huifa', index: 'huifa',width: 100 },

            { label: '热值(MJ/Kg/MJ/m^3)', name: 'hotValue', index: 'hotValue',width: 80 },
            { label: '年设计使用量(万t/a、万m^3/a)', name: 'sum', index: 'sum',width: 80 },
            { label: '其他信息', name: 'otherInfo', index: 'otherInfo' ,width: 80}
        ],
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
                "name": "无烟煤",
                "hui": "60%",
                "liu": "40%",
                "huifa": "30%",
                /*ParamName*/
                "htoValue": "600",
                "sum": "1000",
                "otherInfo": "优质无烟煤"
            },
            {
                "id": 2,
                "name": "无烟煤",
                "hui": "60%",
                "liu": "40%",
                "huifa": "30%",
                /*ParamName*/
                "htoValue": "600",
                "sum": "1000",
                "otherInfo": "优质无烟煤"
            },
            {
                "id": 3,
                "name": "无烟煤",
                "hui": "60%",
                "liu": "40%",
                "huifa": "30%",
                /*ParamName*/
                "htoValue": "600",
                "sum": "1000",
                "otherInfo": "优质无烟煤"
            },
            {
                "id": 4,
                "name": "无烟煤",
                "hui": "60%",
                "liu": "40%",
                "huifa": "30%",
                /*ParamName*/
                "hotValue": "600",
                "sum": "1000",
                "otherInfo": "优质无烟煤"
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
                "name": vm.info.name,
                "hui": vm.info.hui,
                "liu": vm.info.liu,
                "huifa": vm.info.huifa,
                /*ParamName*/
                "hotValue": vm.info.htoValue,
                "sum": vm.info.sum,
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
           /* $.get(baseURL + "sys/goods/info/"+goodsId, function(r){
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