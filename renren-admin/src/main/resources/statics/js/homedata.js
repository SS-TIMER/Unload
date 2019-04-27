/* 数组有数据，首页为 main,无则为 main1 */
var iframe_vm = new Vue({
    el: '#iframe',
    user:{},
    menuList:{},
    main: "main.html",
    navTitle:"首页",
    data: {
        myInfoData: [
            {
                "id": 1,
                "name": "2019年水泥行业排污许可证申请",
                "type": "水泥行业",
                "author": "张三",
                "createTime": "2019年4月23日14时20分",
                /*ParamName*/
            },
            {
                "id": 2,
                "name": "2019年水泥行业排污许可证申请",
                "type": "水泥行业",
                "author": "王二",
                "createTime": "2019年4月23日14时20分",
                /*ParamName*/
            },
            {
                "id": 3,
                "name": "2019年水泥行业排污许可证申请",
                "type": "水泥行业",
                "author": "李四",
                "createTime": "2019年4月23日14时20分",
                /*ParamName*/
            },
            {
                "id": 4,
                "name": "2019年水泥行业排污许可证申请",
                "type": "水泥行业",
                "author": "张三",
                "createTime": "2019年4月23日14时20分",
                /*ParamName*/
            }
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
                "name": vm.info.name,
                "type": vm.info.type,
                "author": vm.info.author,
                "createTime": vm.info.createTime
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
        },
        del: function (event) {
            var Ids = getSelectedRows();
            if (Ids == null) {
                return;
            }
            for (var i = 0; i < Ids.length; i++) {
                console.log(Ids[i]);
                iframe_vm.myInfoData.splice(Ids[i] - 1, 1);
            }
            iframe_vm.reload()
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