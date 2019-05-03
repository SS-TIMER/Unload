$(function () {

    $("#jqGrid").jqGrid({
        //url: baseURL + 'sys/goods/list',
        datatype: "local",
        data: vm.myInfoData,
        width: "100%",
        colModel: [
            { label: '序号', name: 'id', index: 'id',width: 50, key: true },
            { label: '种类', name: 'type', index: 'type',width: 50 },
            { label: '名称', name: 'name', index: 'name',width: 100 },
            { label: '年设计使用量计量单位', name: 'unit', index: 'unit',width: 120 },
            { label: '年设计使用量', name: 'sum', index: 'sum',width: 100 },

            { label: '有毒有害成分', name: 'bad', index: 'bad',width: 80 },
            { label: '成分占比(%)', name: 'what', index: 'what',width: 80 },
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
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
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

        optt:[],
        opttt:[],

        type:["请选择","原料","辅料"],
        item2:[["请选择"],["请选择","其他","块矿","烧结矿","焦炭","球团矿","铁精粉"],["请选择","生石灰","石灰石","膨润土","萤石","轻烧白云石"]],
        item3:[["请选择","万t/a"]],
        item4:[["请选择"],["请选择","其他","氟元素","氯元素","硫元素","钒元素","铬元素","锌元素"]],
        myInfoData: [
            {
                "id": 1,
                "type": "化学用品",
                "name": "重水",
                "unit": "吨",
                "sum": "1000",
                /*ParamName*/
                "bad": "--",
                "what": "--",
                "otherInfo": "无毒化学用品"
            },
            {
                "id": 2,
                "type": "化学用品",
                "name": "重水",
                "unit": "吨",
                "sum": "1000",
                /*ParamName*/
                "bad": "--",
                "what": "--",
                "otherInfo": "无毒化学用品"
            },
            {
                "id": 3,
                "type": "化学用品",
                "name": "重水",
                "unit": "吨",
                "sum": "1000",
                /*ParamName*/
                "bad": "--",
                "what": "--",
                "otherInfo": "无毒化学用品"
            },
            {
                "id": 4,
                "type": "化学用品",
                "name": "重水",
                "unit": "吨",
                "sum": "1000",
                /*ParamName*/
                "bad": "--",
                "what": "--",
                "otherInfo": "无毒化学用品"
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
            // vm.getInfo(goodsId)
        },
        saveOrUpdate: function (event) {
            var item = {
                // "id":vm.myInfoData.length + 1,
                "type": vm.info.type,
                "name": vm.info.name,
                "unit": vm.info.unit,
                "sum": vm.info.sum,
                /*ParamName*/
                "bad": vm.info.bad,
                "what": vm.info.what,
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
/*
*  1 2 级联
* */
function changeWndNum(val) {
    vm.optt=[];
    for (var x = 0; x < vm.type.length; x++) {
        if (vm.type[x] == val.value){
            console.log(vm.type[x]);
            for(var i=0;i<vm.item2[x].length;i++)
            {
                vm.optt.push(vm.item2[x][i])
            }
        }
    }
}