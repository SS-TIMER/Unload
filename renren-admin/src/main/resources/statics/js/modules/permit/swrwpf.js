$(function () {
    $("#jqGrid").jqGrid({
        datatype: "local",
        data: vm.mydata,
        width: "100%",
        colNames:['序号','排放口编号','排放口名称','污染物种类', '申请排放浓度限值(mg/L)', '第一年','第二年','第三年','申请特殊时段许可排放量限值'],
        colModel: [
            { name: 'id', index: 'id', width: 50, key: true },
            { name: 'dischargePortNum', index: 'dischargePortNum', width: 100},
            {name:'dischargePortName',index:'dischargePortName',width:100},
            { name: 'pollutantSpecies', index: 'pollutantSpecies', width: 100 },
            { name: 'applicationForEmissionConcentrationLimits', index: 'applicationForEmissionConcentrationLimits', width: 220 },
            { name: 'afpeAmount', index: 'afpeAmount', width: 100 },
            { name: 'secondYears', index: 'secondYears', width: 100 },
            { name: 'threeYears', index: 'threeYears', width: 100 },
            { name: 'afseAmount', index: 'afseAmount', width: 250 }
        ],
        shrinkToFit: false,
        caption: "水污染物排放信息表(主要排放口)",
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
            {startColumnName:'afpeAmount', numberOfColumns: 3, titleText: '申请年排放量限值(t/a)'}
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
                dischargePortNum:'2',
                dischargePortName:'废水',
                pollutantSpecies:'污水',
                applicationForEmissionConcentrationLimits:'6',
                afpeAmount:'2',
                secondYears:'5',
                threeYears:'6',
                afseAmount:'20'
            },
            {
                id:'2',
                dischargePortNum:'2',
                dischargePortName:'废水',
                pollutantSpecies:'污水',
                applicationForEmissionConcentrationLimits:'6',
                afpeAmount:'2',
                secondYears:'5',
                threeYears:'6',
                afseAmount:'20'
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
                dischargePortNum:vm.student.dischargePortNum
                ,dischargePortName:vm.student.dischargePortName
                ,pollutantSpecies:vm.student.pollutantSpecies
                ,applicationForEmissionConcentrationLimits:vm.student.applicationForEmissionConcentrationLimits
                ,afpeAmount:vm.student.afpeAmount,secondYears:vm.student.secondYears
                ,threeYears:vm.student.threeYears,afseAmount:vm.student.afseAmount};

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
