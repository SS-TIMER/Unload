$(function () {
    var basicinfo=JSON.parse(sessionStorage.getItem('basicinfo'));
    var is = JSON.parse(sessionStorage.getItem('is'));
    vm.name6 = basicinfo[is].name6;
    vm.name7 = basicinfo[is].name7;
    vm.name9 = basicinfo[is].name8;
    vm.name9 = basicinfo[is].name9;
    vm.name10 = basicinfo[is].name10;
    vm.name11 = basicinfo[is].name11;
    vm.name12 = basicinfo[is].name12;
    vm.name13 = basicinfo[is].name13;
    vm.name14 = basicinfo[is].name14;
    vm.name15 = basicinfo[is].name15;
    vm.name16 = basicinfo[is].name16;
    vm.name17 = basicinfo[is].name17;
    vm.name18 = basicinfo[is].name18;
    vm.name19 = basicinfo[is].name19;
    vm.name20 = basicinfo[is].name20;
    vm.name21 = basicinfo[is].name21;
    vm.name22 = basicinfo[is].name22;
    vm.name23 = basicinfo[is].name23;
    vm.name24 = basicinfo[is].name24;
    vm.name25 = basicinfo[is].name25;
    vm.name26 = basicinfo[is].name26;
    vm.name27 = basicinfo[is].name27;
    vm.name28 = basicinfo[is].name28;
    vm.name29 = basicinfo[is].name29;
    vm.name30 = basicinfo[is].name30;

    // 判断事件
    var now_even=sessionStorage.getItem('now_even');
    if (now_even == "edit"){
        console.log("现在事件为：" + "编辑");
        $("#h3_head").html("编辑");
        $("#re").click(function () {
            history.go(-1)
        })
    }else if (now_even == "show") {
        $("#h3_head").html("查看");
        console.log("现在事件为：" + "显示");
        $("input").attr("readOnly","true");
        $("#re").hide();
    }

});
function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0, index + 1);
    return result;
}
var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        tempId: null,
        name6:'',
        name7:'',
        name8:'',
        name9:'',
        name10:'',
        name11:'',
        name12:'',
        name13:'',
        name14:'',
        name15:'',
        name16:'',
        name17:'',
        name18:'',
        name19:'',
        name20:'',
        name21:'',
        name22:'',
        name23:'',
        name24:'',
        name25:'',
        name26:'',
        name27:'',
        name28:'',
        name29:'',
        name30:'',
        info: {}

    },
    mounted: function(){
        this.show();
    },
    methods: {

        query: function () {
            var basicinfo = JSON.parse(sessionStorage.getItem('basicinfo'));
            var is = sessionStorage.getItem('is');
            debugger;
            basicinfo[is].name6=vm.name6;
            basicinfo[is].name7=vm.name7;
            basicinfo[is].name8=vm.name9;
            basicinfo[is].name9=vm.name9;
            basicinfo[is].name10=vm.name10;
            basicinfo[is].name11=vm.name11;
            basicinfo[is].name12=vm.name12;
            basicinfo[is].name13=vm.name13;
            basicinfo[is].name14=vm.name14;
            basicinfo[is].name15=vm.name15;
            basicinfo[is].name16=vm.name16;
            basicinfo[is].name17=vm.name17;
            basicinfo[is].name18=vm.name18;
            basicinfo[is].name19=vm.name19;
            basicinfo[is].name20=vm.name20;
            basicinfo[is].name21=vm.name21;
            basicinfo[is].name22=vm.name22;
            basicinfo[is].name23=vm.name23;
            basicinfo[is].name24=vm.name24;
            basicinfo[is].name25=vm.name25;
            basicinfo[is].name26=vm.name26;
            basicinfo[is].name27=vm.name27;
            basicinfo[is].name28=vm.name28;
            basicinfo[is].name29=vm.name29;
            basicinfo[is].name30=vm.name30;
            basicinfo[is].name31= Vue.prototype.getNowFormatDate();
            debugger;
            sessionStorage.setItem('basicinfo', JSON.stringify(basicinfo));
            sessionStorage.setItem('bas', true);
            parent.window.location=getContextPath()+"/index.html?id=1";
        },
        show : function () {

        }
    }
});
Vue.prototype.getNowFormatDate = function() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
};