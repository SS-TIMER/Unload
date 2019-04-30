/* 数组有数据，首页为 main,无则为 main1 */
//生成菜单
var menuItem = Vue.extend({
    name: 'menu-item',
    props:{item:{}},
    template:[
        '<li>',
        '	<a style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap" v-if="item.type === 0 && item.name!=\'系统管理\' && item.name!=\'排污许可证\'" href="javascript:;">',
        '		<i v-if="item.icon != null" :class="item.icon"></i>',
        '		<span>{{item.name}}</span>',
        '		<i class="fa fa-angle-left pull-right"></i>',
        '	</a>',
        '	<ul v-if="item.type === 0 && item.name!=\'系统管理\'&& item.name!=\'排污许可证\'" class="treeview-menu">',
        '		<menu-item :item="item" v-for="item in item.list"></menu-item>',
        '	</ul>',

        '	<a style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap" v-if="item.type === 1 && item.parentId === 0 && item.name!=\'系统管理\'&& item.name!=\'排污许可证\'" :href="\'#\'+item.url">',
        '		<i v-if="item.icon != null" :class="item.icon"></i>',
        '		<span>{{item.name}}</span>',
        '	</a>',

        '	<a :title="item.name" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap" v-if="item.type === 1 && item.parentId != 0  && item.name!=\'系统管理\' && item.name!=\'排污许可证\'" :href="\'#\'+item.url"><i v-if="item.icon != null" :class="item.icon"></i><i v-else class="fa fa-circle-o"></i> {{item.name}}</a>',
        '</li>'
    ].join('')
});
// // 判断 首页
// $(document).ready(function(){
// 	//do something
//     var headerId=GetRequest();
//
//
// 	// if (vm.myData.length == 0) {
// 	// 	$('#iframe').attr("src","main1.html");
// 	// }
//
// });



function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = decodeURIComponent(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
//iframe自适应
$(window).on('resize', function() {
	var $content = $('.content');
	$content.height($(this).height() - 154);
	$content.find('iframe').each(function() {
		$(this).height($content.height());
	});
	console.log("$content.height : "+ $content.height())
}).resize();

//注册菜单组件
Vue.component('menuItem',menuItem);

var vm = new Vue({
	el:'#rrapp',
	data:{
		user:{},
		menuList:{},
		main:"main.html",
		password:'',
		newPassword:'',
        navTitle:"首页",
		myData:[]
	},
	methods: {
		getMenuList: function (event) {
			$.getJSON("sys/menu/nav?_"+$.now(), function(r){
				vm.menuList = r.menuList;
			});
		},
		getUser: function(){
			$.getJSON("sys/user/info?_"+$.now(), function(r){
				vm.user = r.user;
			});
		},
		updatePassword: function(){
			layer.open({
				type: 1,
				skin: 'AdminLTE',
				title: "修改密码",
				area: ['850px', '270px'],
				shadeClose: false,
				content: jQuery("#passwordLayer"),
				btn: ['修改','取消'],
				btn1: function (index) {
					var data = "password="+vm.password+"&newPassword="+vm.newPassword;
					$.ajax({
						type: "POST",
					    url: "sys/user/password",
					    data: data,
					    dataType: "json",
					    success: function(result){
							if(result.code == 0){
								layer.close(index);
								layer.alert('修改成功', function(index){
									location.reload();
								});
							}else{
								layer.alert(result.msg);
							}
						}
					});
	            }
			});
		},
        donate: function () {
            layer.open({
                type: 2,
                title: false,
                area: ['806px', '467px'],
                closeBtn: 1,
                shadeClose: false,
                content: ['http://cdn.renren.io/donate1.jpg', 'no']
            });
        }
	},
	created: function(){
        var bas=JSON.parse(sessionStorage.getItem('basicinfo'))
        console.log(bas)
        if(bas&&bas.length>0)
        {
            this.main='main.html';
        }
        else
        {
            this.main='main1.html';
        }
		this.getMenuList();
		this.getUser();
	},
	updated: function(){
		//路由
		var router = new Router();
		routerList(router, vm.menuList);
		router.start();
		// if ($('#sidebar-menu').children().length != 1){
		// 	// 隐藏掉最后一个菜单
		// 	$("#sidebar-menu li:last-child").hide();
		// 	console.log("执行了隐藏,子元素个数为：" + $('#sidebar-menu').children().length);
		// }
	}
});

function routerList(router, menuList){
	for(var key in menuList){
		var menu = menuList[key];
		if(menu.type == 0){
			routerList(router, menu.list);
		}else if(menu.type == 1){
			router.add('#'+menu.url, function() {
				var url = window.location.hash  ;
				
				//替换iframe的url
			    vm.main = url.replace('#', '');
			    
			    //导航菜单展开
			    $(".treeview-menu li").removeClass("active");
			    $("a[href='"+url+"']").parents("li").addClass("active");
			    
			    vm.navTitle = $("a[href='"+url+"']").text();
			});
		}
	}
}
