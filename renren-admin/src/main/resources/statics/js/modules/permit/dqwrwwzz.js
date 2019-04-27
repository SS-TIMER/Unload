$(function () {
    //console.log(vm.mydata)

    $("#jqGrid").jqGrid({
        datatype: "local",
        data: vm.mydata,
        width: "100%",
        colNames:['序号', '生产设施编号/无组织排放编号','产污环节','主要污染防治措施','污染物种类','名称','浓度限值(mg/Nm³)',  '第一年','第二年','第三年','申请特殊时段许可排放量限值'],
        colModel: [
            { name: 'id', index: 'id', width: 50, key: true },
            { name: 'sNumber', index: 'sNumber', width: 200 },
            { name: 'pollutionProducingLink', index: 'pollutionProducingLink', width: 100},
            {name:'majorPollutionControlMeasures',index:'majorPollutionControlMeasures',width:150},
            { name: 'pollutantSpecies', index: 'pollutantSpecies', width: 150 },
            {name:'name',index:'name',width:150},
            { name: 'concentrationLimits', index: 'concentrationLimits', width: 150 },
            { name: 'afpeAmount', index: 'afpeAmount', width: 100 },
            { name: 'secondYears', index: 'secondYears', width: 100 },
            { name: 'threeYears', index: 'threeYears', width: 100 },
            { name: 'afseAmount', index: 'afseAmount', width: 250 }
        ],
        shrinkToFit: false,
        caption: "大气污染物无组织排放信息表",
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
            {startColumnName:'name', numberOfColumns: 2, titleText: '国家或地方污染物排放标准'},
            {startColumnName:'afpeAmount', numberOfColumns: 3, titleText: '申请年许可排放量限值(t/a)'}
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
        mydata :[
            {
                id: "1",
                sNumber: "GT-1365",
                pollutionProducingLink: "2",
                majorPollutionControlMeasures: "塑料",
                pollutantSpecies: "0.26",
                name: "3",
                concentrationLimits: "20",
                afpeAmount: "10",
                secondYears: "10",
                threeYears: '23',
                afseAmount: '10'
            },
            {
                id: "2",
                sNumber: "2",
                pollutionProducingLink: "2",
                majorPollutionControlMeasures: "塑料",
                pollutantSpecies: "0.26",
                name: "3",
                concentrationLimits: "20",
                afpeAmount: "10",
                secondYears: "10",
                threeYears: '23',
                afseAmount: '10'
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
                sNumber:vm.student.sNumber
                ,pollutionProducingLink:vm.student.pollutionProducingLink
                ,majorPollutionControlMeasures:vm.student.majorPollutionControlMeasures
                ,pollutantSpecies:vm.student.pollutantSpecies
                ,name:vm.student.name
                ,concentrationLimits:vm.student.concentrationLimits
                ,afpeAmount:vm.student.afpeAmount
                ,secondYears:vm.student.secondYears
                ,threeYears:vm.student.threeYears
                ,afseAmount:vm.student.afseAmount
            };
            if (vm.student.id == null) {
                item.id = vm.mydata.length + 1;
                //console.log("add")
                vm.mydata.push(item)
            } else {
                //console.log("edit")
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
