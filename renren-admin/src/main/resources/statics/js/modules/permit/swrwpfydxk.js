$(function () {

    $("#jqGrid").jqGrid({
        datatype: "local",
        data: vm.mydata,
        width: "100%",
        colNames:['序号', '污染物种类','年份', '1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月','合计(t/a)'],
        colModel: [
            { name: 'id', index: 'id', width: 50, key: true },
            { name: 'pollutantSpecies', index: 'pollutantSpecies', width: 100 },
            { name: 'year', index: 'year', width: 100 },
            { name: 'January', index: 'January', width: 100 },
            { name: 'February', index: 'February', width: 100 },
            { name: 'March', index: 'March', width: 100 },
            { name: 'April', index: 'April', width: 100 },
            { name: 'May', index: 'May', width: 100 },
            { name: 'June', index: 'June', width: 100 },
            { name: 'July', index: 'July', width: 100 },
            { name: 'August', index: 'August', width: 100 },
            { name: 'September', index: 'September', width: 100 },
            { name: 'October', index: 'October', width: 100 },
            { name: 'November', index: 'November', width: 100 },
            { name: 'December', index: 'December', width: 100 },
            { name: 'total', index: 'total', width: 100 },
        ],
        shrinkToFit: false,
        caption: "大气排放月度许可量信息表",
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
            {startColumnName:'January', numberOfColumns: 12, titleText: '申请月许可排放量限值(t/m)'},

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
                pollutantSpecies:'电池',
                year:'2',
                January:'2',
                February:'3',
                March:'5',
                April:'1',
                May:'6',
                June:'3',
                July:'0',
                August:'6',
                September:'5',
                October:'6',
                November:'8',
                December:'4',
                total:'20'
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
                ,year:vm.student.year
                ,January:vm.student.January,February:vm.student.February
                ,March:vm.student.March,April:vm.student.April,May:vm.student.May
                ,June:vm.student.June,July:vm.student.July,August:vm.student.August
                ,September:vm.student.September,October:vm.student.October,November:vm.student.November
                ,December:vm.student.December,total:vm.student.total
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
