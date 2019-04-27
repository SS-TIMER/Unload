function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0, index + 1);
    return result;
}
//生成菜单
var menuItem = Vue.extend({
    name: 'menu-item',
    props:{item:{},index:0},
    template:[
        '<div class="row row-new" :id="index">',
        ' <div class="col-sm-4">',
        '  <div>',
        ' <button class="btn btn-default" type="submit"  @click="info(index)">基本信息</button>',
        ' <button class="btn btn-default" type="submit" @click="edit(index)">编辑</button>',
        ' <button class="btn btn-default" type="submit" @click="shows(index)">查看</button>',
        '<button class="btn btn-default" type="submit" @click="del(index)">删除</button>',
        '</div>',
        '  <div class="content-big">',
        ' <div class="content-big_left" style="float: left">',
        '  <ul style="text-align: left;">',
               '<li><h6>申请表名称:</h6></li>',
               '<li><h6>行业类型：</h6></li>',
                '<li><h6>创建人:</h6></li>',
               '<li><h6>联系人:</h6></li>',
              '<li><h6>联系邮箱：</h6></li>',
        '<li><h6>创建时间：</h6></li>',
        '</ul>',
        '</div>',
        '<div class="content-big_right" style="float: left">',
        ' <ul style="text-align: left;">',
        '<li><h6>{{item.name1?item.name1:\'暂无\'}}</h6></li>',
        '<li><h6>{{item.name2?item.name2:\'暂无\'}}</h6></li>',
        '<li><h6>{{item.name3?item.name3:\'暂无\'}}</h6></li>',
        '<li><h6>{{item.name4?item.name4:\'暂无\'}}</h6></li>',
        '<li><h6>{{item.name5?item.name5:\'暂无\'}}</h6></li>',
        '<li><h6>{{item.name31?item.name31:\'暂无\'}}</h6></li>',
        '</ul>',
        '</div>',
        '</div>',
        '</div>',
        '</div>'
    ].join(''),
    methods: {
        info: function (item) {
            var bas=JSON.parse(sessionStorage.getItem('basicinfo'));
            window.sessionStorage.setItem('now_even', "show");
            window.sessionStorage.setItem('is', item);

            parent.window.location=getContextPath()+"/#modules/licence/found.html";
        },
        edit: function (item) {
            // 获取当前数据
            var bas=JSON.parse(sessionStorage.getItem('basicinfo'));
            var now_info = JSON.stringify(bas[item]);
            window.sessionStorage.setItem('now_even', "edit");
            window.sessionStorage.setItem('is', item);

            parent.window.location=getContextPath()+"/#modules/licence/basicinfo.html";
        },
        shows: function (item) {
            // 获取当前数据
            var bas=JSON.parse(sessionStorage.getItem('basicinfo'));
            var now_info = JSON.stringify(bas[item]);
            window.sessionStorage.setItem('now_even', "show");
            window.sessionStorage.setItem('is', item);

            parent.window.location=getContextPath()+"/#modules/licence/basicinfo.html";
        },
        del: function (item) {
            // 删除 basicinfo,再将新bas添加进 sessionStorage
            var bas=JSON.parse(sessionStorage.getItem('basicinfo'));
            bas.splice(item, 1);
            window.sessionStorage.setItem('basicinfo', JSON.stringify(bas));
            // 删除当前dom树
            $("#" + item).remove();
        }
    }
});
//注册菜单组件
Vue.component('menuItem',menuItem);

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        tempId: null,
        info: {},
        menuList:{},
    },
    methods: {
        reload: function () {
          console.log(1)
        },

    },
    mounted:function(){
        var basicinfo = JSON.parse(sessionStorage.getItem('basicinfo'));
        this.menuList = basicinfo;
    }
});