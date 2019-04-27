$(function () {
    $("#jqGrid").jqGrid({
        datatype: "local",
        data: vm.mydata,
        width: "100%",
        colNames: ['序号', '生产设施编号', '排放口编号','排放口名称' ,'污染物种类', '申请许可排放浓度限值(mg/Nm³)', '申请许可排放速率限值(kg/h)', '第一年', '第二年', '第三年', '申请特殊排放浓度限值(mg/Nm³)', '申请特殊时段许可排放量限值'],
        colModel: [
            {name: 'id', index: 'id', width: 50, key: true},
            {name: 'productionNum', index: 'productionNum', width: 100},
            {name: 'dischargePortNum', index: 'dischargePortNum', width: 100},
            {name: 'dischargePortName', index: 'dischargePortName', width: 100},

            {name: 'pollutantSpecies', index: 'pollutantSpecies', width: 100},
            {name: 'afpeConcentration', index: 'afpeConcentration', width: 220},
            {name: 'afpeRate', index: 'afpeRate', width: 200},
            {name: 'afpeAmount', index: 'afpeAmount', width: 100},
            {name: 'secondYears', index: 'secondYears', width: 100},
            {name: 'threeYears', index: 'threeYears', width: 100},
            {name: 'afseConcentration', index: 'afseConcentration', width: 250},
            {name: 'afseAmount', index: 'afseAmount', width: 250}
        ],
        shrinkToFit: false,
        caption: "大气污染物有组织排放信息表(主要排放表)",
        viewrecords: true,
        height: 385,
        rowNum: 200,
        rowList: [10, 30, 50],
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
            // //隐藏grid底部滚动条
            // $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
    $("#jqGrid").jqGrid('setGroupHeaders', {
        useColSpanStyle: true,
        groupHeaders: [
            {startColumnName: 'afpeAmount', numberOfColumns: 3, titleText: '申请年许可排放量限值(t/a)'}
        ]
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        student: {},
        items: [],
        mydata :[
            {
                id: "1",
                productionNum: "GT-1365",
                dischargePortNum: "2",
                pollutantSpecies: "塑料",
                dischargePortName:'水管',

                afpeConcentration: "0.26",
                afpeRate: "3",
                afpeAmount: "20",
                secondYears: "10",
                threeYears: "10",
                afseConcentration: '23',
                afseAmount: '10'
            },
            {
                id: "2",
                productionNum: "AS",
                dischargePortNum: "",
                dischargePortName:'水管',

                pollutantSpecies: "",
                afpeConcentration: "",
                afpeRate: "",
                afpeAmount: "",
                secondYears: "",
                threeYears: "",
                afseConcentration: '',
                afseAmount: ''
            },
            {
                id: "3",
                productionNum: "SD",
                dischargePortNum: "",
                dischargePortName:'水管',

                pollutantSpecies: "",
                afpeConcentration: "",
                afpeRate: "",
                afpeAmount: "",
                secondYears: "",
                threeYears: "",
                afseConcentration: '',
                afseAmount: ''
            },
            {
                id: "4",
                productionNum: "DF",
                dischargePortNum: "",
                dischargePortName:'水管',

                pollutantSpecies: "",
                afpeConcentration: "",
                afpeRate: "",
                afpeAmount: "",
                secondYears: "",
                threeYears: "",
                afseConcentration: '',
                afseAmount: ''
            }
        ],
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.student = {};
            //console.log(vm.student)
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";
            vm.tempId = id[0];
            vm.getInfo(id[0] - 1)
        },
        saveOrUpdate(event) {
            console.log(vm.student);
            let item = {productionNum:vm.student.productionNum,dischargePortNum:vm.student.dischargePortNu
                ,dischargePortName:vm.student.dischargePortName
                ,pollutantSpecies:vm.student.pollutantSpecies,afpeConcentration:vm.student.afpeConcentration
            ,afpeRate:vm.student.afpeRate,afpeAmount:vm.student.afpeAmount,secondYears:vm.student.secondYears
            ,threeYears:vm.student.threeYears,afseConcentration:vm.student.afseConcentration,afseAmount:vm.student.afseAmount};

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
            // $('#btnSaveOrUpdate').button('loading').delay(1000).queue(function () {
            //     $.ajax({
            //         type: "POST",
            //         url: baseURL + url,
            //         contentType: "application/json",
            //         data: JSON.stringify(vm.student),
            //         success: function (r){
            //             if (r.code === 0) {
            //                 layer.msg("操作成功", {icon: 1});
            //                 vm.reload();
            //                 $('#btnSaveOrUpdate').button('reset');
            //                 $('#btnSaveOrUpdate').dequeue();
            //             } else {
            //                 layer.alert(r.msg);
            //                 $('#btnSaveOrUpdate').button('reset');
            //                 $('#btnSaveOrUpdate').dequeue();
            //             }
            //         }
            //     });
            // });

        },
        del: function (index) {
             //console.log(index);
            // this.mydata = this.mydata.filter(index,1);
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
        getInfo(infoid) {
            vm.student = vm.mydata[infoid];

            // $.get(baseURL + "sys/student/info/" + id, function (r) {
            //             console.log(r)
                //vm.student = r.student;
            // });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },

    }
});
