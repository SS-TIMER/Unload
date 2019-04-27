$(function () {
    $("#jqGrid").jqGrid({
        datatype: "local",
        data: vm.mydata,
        width: "100%",
        colNames:['序号', '污染物种类', '第一年','第二年','第三年','第一年','第二年','第三年','第一年','第二年','第三年','第一年','第二年','第三年','第一年','第二年','第三年'],
        colModel: [
            { name: 'id', index: 'id', width: 50, key: true },
            { name: 'pollutantSpecies', index: 'pollutantSpecies', width: 100 },
            { name: 'oe', index: 'oe', width: 100 },
            { name: 'oeO', index: 'oeO', width: 100 },
            { name: 'oeT', index: 'oeT', width: 100 },
            { name: 'ue', index: 'ue', width: 100 },
            { name: 'ueO', index: 'ueO', width: 100 },
            { name: 'ueT', index: 'ueT', width: 100 },
            { name: 'total', index: 'total', width: 100 },
            { name: 'totalO', index: 'totalO', width: 100 },
            { name: 'totalT', index: 'totalT', width: 100 },
            { name: 'Aggregate', index: 'Aggregate', width: 100 },
            { name: 'AggregateO', index: 'AggregateO', width: 100 },
            { name: 'AggregateT', index: 'AggregateT', width: 100 },
            { name: 'Permissive ', index: 'Permissive ', width: 100 },
            { name: 'PermissiveO ', index: 'PermissiveO ', width: 100 },
            { name: 'PermissiveT ', index: 'PermissiveT ', width: 100 },
        ],
        shrinkToFit: false,
        caption: "大气排放总许可量信息表",
        viewrecords: true,
        height: 385,
        rowNum: 200,
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
            // //隐藏grid底部滚动条
            // $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
    $("#jqGrid").jqGrid('setGroupHeaders', {
        useColSpanStyle: true,
        groupHeaders:[
            {startColumnName:'oe', numberOfColumns: 3, titleText: '全厂有组织排放总计(t/a)'},
            {startColumnName:'ue',numberOfColumns:3,titleText:'全厂无组织排放总计(t/a)'},
            {startColumnName:'total',numberOfColumns:3,titleText:'全厂总计(t/a)'},
            {startColumnName:'Aggregate',numberOfColumns:3,titleText:'总量指标(t/a)'},
            {startColumnName:'Permissive ',numberOfColumns:3,titleText:'排放总许可量(t/a)'},
        ]
    });




});

var vm = new Vue({
    el:'#rrapp',
    data:{

        showList: true,
        title: null,
        student: {},
        items: [],
        mydata:[
            {
                id:'1',
                pollutantSpecies:'1',
                oe:'1',
                oeO:'2',
                oeT:'3',
                ue:'1',
                ueO:'2',
                ueT:'3',
                total:'1',
                totalO:'2',
                totalT:'3',
                Aggregate:'1',
                AggregateO:'2',
                AggregateT:'3',
                Permissive:'1',
                PermissiveO:'2',
                PermissiveT:'3'
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
            vm.student = {};
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
        },
        saveOrUpdate: function (event) {
            let item = {
                pollutantSpecies:vm.student.pollutantSpecies
                ,oe:vm.student.oe,oeO:vm.student.oeO,oeT:vm.student.oeT
                ,ue:vm.student.ue,ueO:vm.student.ueO,ueT:vm.student.ueT
                ,total:vm.student.total,totalO:vm.student.totalO,totalT:vm.student.totalT
                ,Aggregate:vm.student.Aggregate,AggregateO:vm.student.AggregateO,AggregateT:vm.student.AggregateT
                ,Permissive:vm.student.Permissive,PermissiveO:vm.student.PermissiveO,PermissiveT:vm.student.PermissiveT
            };

            if (vm.student.id == null) {
                item.id = vm.mydata.length + 1;
                console.log("add")
                vm.mydata.push(item)
            } else {
                console.log("edit")
                item.id = vm.student.id;
                //删掉选中的
                vm.mydata.splice(vm.tempId -1, 1);
                //将修改后插入刚刚删除的位置
                vm.mydata.splice(vm.tempId -1, 0,item);
            }
            vm.reload();
        },
        del: function (event) {
            var goodsIds = getSelectedRows();
            if(goodsIds == null){
                return ;
            }else{
                layer.msg("删除")
            }
            for (var i = 0; i < goodsIds.length; i++) {
                // console.log(goodsIds[i]);
                vm.mydata.splice(goodsIds[i] - 1, 1);
            }
            vm.reload()
        },
        getInfo: function(id){
            vm.student = vm.mydata[id];
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        },

    }
});
