$(function () {
    var basicinfo=JSON.parse(sessionStorage.getItem('basicinfo'));
    var is = JSON.parse(sessionStorage.getItem('is'));


    // 判断事件
    var now_even=sessionStorage.getItem('now_even');
    if (now_even == "show"){
        vm.name1 = basicinfo[is].name1;
        vm.name2 = basicinfo[is].name2;
        vm.name3 = basicinfo[is].name3;
        vm.name4 = basicinfo[is].name4;
        vm.name5 = basicinfo[is].name5;
        $("#h3_head").html("查看申请表");
        $("input").attr("readOnly","true");
        $("#go").attr("value","返回");
    }
});

//离开页面 清除 now_even
$(window).bind('beforeunload',function(){
        window.sessionStorage.setItem('now_even', " ");
    }
);

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
        name1:'',
        name2:'',
        name3:'',
        name4:'',
        name5:'',
        info: {}

    },
    methods: {
        query: function () {
            var now_even=sessionStorage.getItem('now_even');
            if (now_even == "show") {
                history.go(-1);
                window.sessionStorage.setItem('now_even', " ");
            }else {
                var item={
                    name1:vm.name1,
                    name2:vm.name2,
                    name3:vm.name3,
                    name4:vm.name4,
                    name5:vm.name5,
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
                    name31:''
                };
                var basicinfo =  sessionStorage.getItem('basicinfo')
                if(basicinfo!=null){
                    basicinfo =  JSON.parse(sessionStorage.getItem('basicinfo'))
                    console.log(basicinfo);
                }else{
                    basicinfo = [];
                }
                var is=0;

                if(basicinfo.length){
                    is= sessionStorage.setItem('is',basicinfo.length)
                }else{
                    is=  sessionStorage.setItem('is',0)
                }
                debugger;
                basicinfo.push(item);
                sessionStorage.setItem('basicinfo', JSON.stringify(basicinfo))
                parent.window.location=getContextPath()+"/#modules/licence/basicinfo.html";
            }

        }

    }
});