<#include "page/header.ftl"/>
<script type="text/javascript" src="${plugPath}echarts/echarts.min.js"></script>
<script type="text/javascript" src="${plugPath}handsontable/handsontable.full.js"></script>
<link rel="stylesheet" type="text/css" href="${plugPath}handsontable/main.css">
<link rel="stylesheet" type="text/css" href="${plugPath}handsontable/handsontable.full.css">
<div id="right_content">
  <div class='container'>
        <div class="panel panel-default" style="margin-bottom:20px;">
            <div class="panel-body">
				<div>
				   <a class="btn btn-danger" href="#"><i class="fa fa-trash-o fa-lg"></i> Delete</a>
				</div>
				<div id="charts1" style="width: 800px; height: 300px; margin: 0 auto"></div>
				<div id="charts2" style="width: 800px; height: 300px; margin: 0 auto"></div>
				<div id="charts3" style="width: 800px; height: 300px; margin: 0 auto"></div>
				<div id="hot" style="margin: 0 auto"></div>
			</div>
		</div>
	</div>
</div>
<#include "page/footer.ftl"/>
<script>
    var option = {
        title: {
            text: 'ECharts 数据统计折线图'
        },
        tooltip: {},
        xAxis: {
            data: ["Android", "IOS", "PC", "Ohter"]
        },
        yAxis: {},
        series: [{
            name: '访问量',
            type: 'line',
            data: [500, 200, 360, 100]
        }]
    };

    var option2 = {
        title: {
            text: 'ECharts 数据统计柱状图'
        },
        tooltip: {},
        xAxis: {
            data: ["Android", "IOS", "PC", "Ohter"]
        },
        yAxis: {},
        series: [{
            name: '访问量',
            type: 'bar',
            data: [500, 200, 360, 100]
        }]
    };

    var option3 = {
        title: {
            text: 'ECharts 数据统计饼图'
        },
        series: [{
            name: '访问量',
            type: 'pie',
            radius: '60%',
            data: [{
                value: 500,
                name: 'Android'
            }, {
                value: 200,
                name: 'IOS'
            }, {
                value: 360,
                name: 'PC'
            }, {
                value: 100,
                name: 'Ohter'
            }]
        }]
    };
    var myChart = echarts.init(document.getElementById('charts1'));
    var myChart2 = echarts.init(document.getElementById('charts2'));
    var myChart3 = echarts.init(document.getElementById('charts3'));

    myChart.setOption(option);
    myChart2.setOption(option2);
    myChart3.setOption(option3);
    var dataObject = [{
        shipmentId: 'FBA14NVPP9',
        referenceId: '4OPTUUWI',
        sku: 'KC0042',
        declareNameCn: '男装休闲裤',
        declareNameEn: 'Nike',
        brand: '耐克',
        material: '98%Cotton',
        purpose: '比赛服',
        customsCode: '6203499029',
        isCharged: '是',
        volt: null,
        milliampere: null,
        watt: null,
        num: 200,
        declareValue: 50.20,
        purchasingPrice: 320.12
    }];

    var hotElement = document.querySelector('#hot');
    var hotElementContainer = hotElement.parentNode;
    var hotSettings = {
        data: dataObject,
        columns: [{
            data: 'shipmentId',
            type: 'text'
        }, {
            data: 'referenceId',
            type: 'text'
        }, {
            data: 'sku',
            type: 'text'
        }, {
            data: 'declareNameEn',
            type: 'text'
        }, {
            data: 'declareNameCn',
            type: 'text'
        }, {
            data: 'brand',
            type: 'text'
        }, {
            data: 'material',
            type: 'text'
        }, {
            data: 'purpose',
            type: 'text'
        }, {
            data: 'customsCode',
            type: 'text'
        }, {
            data: 'isCharged',
            type: 'text'
        }, {
            data: 'volt',
            type: 'numeric',
            format: '0.00'
        }, {
            data: 'milliampere',
            type: 'numeric',
            format: '0.00'
        }, {
            data: 'watt',
            type: 'numeric',
            format: '0.00'
        }, {
            data: 'num',
            type: 'numeric',
            format: '0'
        }, {
            data: 'purchasingPrice',
            type: 'numeric',
            format: '0.00'
        }, {
            data: 'declareValue',
            type: 'numeric',
            format: '0.00'
        }],
        stretchH: 'all',
        autoWrapRow: true,
        height: 487,
        rowHeaders: true,
        colHeaders: [
            'Shippment ID',
            'Reference ID',
            'SKU',
            '英文品名',
            '中文品名',
            '品牌',
            '材质',
            '用途',
            '海关编码',
            '是否带电',
            '电压',
            '容量',
            '伏特',
            '个数',
            '采购单价(RMB)',
            '申报单价(RMB)'
        ]
    };
    var hot = new Handsontable(hotElement, hotSettings);
</script>