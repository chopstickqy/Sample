import { Component, OnInit } from '@angular/core';
declare let Swiper: any;
@Component({
    selector: 'app-expression',
    templateUrl: './expression.component.html',
    styleUrls: ['./expression.component.css']
})
export class ExpressionComponent implements OnInit {
    selectIndex:number = undefined;
    mySwiper:any;
    mySwiperBanner:any;
    dataList:any[] = [{
        id:1,
        name:'安徽省立医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    },{
        id:2,
        name:'中南大学湘雅医学院 附属第二人民医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    },{
        id:3,
        name:'华中科技大学同济 医学院附属同济医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    },{
        id:4,
        name:'华中科技大学同济医学院附属协和医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    },{
        id:5,
        name:'武汉大学人民医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    },{
        id:6,
        name:'安徽医科大学附属第一医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    },{
        id:7,
        name:'武汉大学中南医院',
        level:'A',
        score:'13,768',
        rate1:'10.9%',
        rate2:'107.5%',
        compete:[{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        },{
            product:'Total',
            price:2.7,
            share:"13.6%",
            change:"12.0%",
            add:"123.6%",
            EI:106
        }]
    }];
    rateOptions = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        grid: {
            x: 40,
            x2:45,
            y2:45
        },
        legend: {
            data:['指标','实绩','进行率']
        },
        xAxis: [
            {
                type: 'category',
                data: ['TargetH1','1804','1805','1806','1807','1808','1809'],
                axisLabel: {
                    interval:0,
                    rotate:45
                },
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '销售（千）',
                min: 0,
                max: 2000,
                interval: 500,
                axisLabel: {
                    formatter: '{value}'
                }
            },
            {
                type: 'value',
                name: '进行率',
                min: 0,
                max: 150,
                interval: 50,
                axisLabel: {
                    formatter: '{value} %'
                }
            }
        ],
        series: [
            {
                name:'指标',
                type:'bar',
                data:[1560, 0, 0, 0, 0, 0, 0],
                itemStyle:{
                    normal:{
                        color:'#eabd0f'
                    }
                }
            },
            {
                name:'实绩',
                type:'bar',
                data:[0, 300, 454, 755, 905, 1230, 1520],
                itemStyle:{
                    normal:{
                        color:'#1bd0a1'
                    }
                }
            },
            {
                name:'进行率',
                type:'line',
                yAxisIndex: 1,
                data:[0, 14, 29, 45, 60, 77, 96]
            }
        ]
    };
    option2 = {
        color: ['#03D3B0'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : ['11/1', '11/2', '11/3', '11/4', '11/5', '11/6', '11/7', '11/8', '11/9', '11/10', '11/11', '11/12', '11/13'],
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'直接访问',
                type:'bar',
                barWidth: '60%',
                data:[22, 18, 20, 18, 22, 18, 28, 24, 19, 19, 24, 38, 25]
            }
        ]
    };
    slides = [
        'https://via.placeholder.com/300x200/FF5733/ffffff',
        'https://via.placeholder.com/300x200/C70039/ffffff',
        'https://via.placeholder.com/300x200/900C3F/ffffff'
    ];
    docOptions = {
        // tooltip: {
        //   trigger: 'item',
        //   formatter: "{a} <br/>{b} : {c} ({d}%)"
        // },
        color: ['#1cd0a1', '#d6dcdf'],
        series: [
            {
                name: 'ABC医生覆盖率',
                type: 'pie',
                radius: ['45%', '70%'],
                itemStyle: {
                    normal: {
                        label: {
                            show: false
                        },
                        labelLine: {
                            show: false
                        }
                    },
                },
                data: [
                    { value: 80, name: '医生覆盖' },
                    { value: 20, name: '未覆盖' },
                ]
            }
        ]
    };
    performance = {
        grid: {
            top:'20%',
            left: '1%',
            right: '1%',
            bottom: '1%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: ['1804', '1805', '1806', '1807', '1808', '1809'],
            axisLabel: {
                color: '#8ba1a1',
            },
            axisLine: {
                lineStyle: {
                    color: '#bbb'
                }
            },
        },
        yAxis: {
            type: 'value',
            name: '实绩（千)',
            nameTextStyle: {
                color: '#808686'
            },
            interval: 20,
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#bbb'
                }
            },
            axisLabel: {
                color: '#8ba1a1',
            }
        },
        series: [{
            data: [33, 25, 24, 35, 28, 31],
            type: 'line',
            itemStyle: {
                normal: {
                    color: '#1bd0a1'
                }
            }
        }]
    };
    shareOptions = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            textStyle: { color: '#4e6870' },
            itemHeight: 4,
            itemWidth: 14,
            itemGap: 20,
            padding:[0,20],
            bottom: 0,
            data: [
                { name: '整体市场', icon: 'rect' ,width:50},
                { name: 'ACN产品', icon: 'rect' },
                { name: '竞品A', icon: 'rect' },
                { name: '竞品B', icon: 'rect' },
                { name: '竞品C', icon: 'rect' },
                { name: '竞品D', icon: 'rect' }
            ],
        },
        grid: {
            left: 0,
            right: 0,
            top: 35,
            bottom: 80
        },
        xAxis: [
            {
                type: 'category',
                data: ['', '1804', '1805', '1806', '1807', '1808', '1809', ''],
                nameTextStyle: { color: '#8ba1a1' },
                lineStyle:{
                    type:'dashed'
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        width: 2,
                        color: '#bbbbbb',
                    }
                },
                axisTick: { show: false },
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '                            医院潜力（千）',
                nameLocation: 'end',
                nameTextStyle: { color: '#8ba1a1' },
                offset: 4,
                axisLine: { show: false },
                axisTick: { show: false },
                axisLabel: {
                    show: true,
                    color: '#8ba1a1',
                    formatter: function (value, index) {
                        return value ? value : ''
                    },
                    inside: true
                },
                minInterval: 500,
            },
            {
                type: 'value',
                name: '份额           ',
                nameTextStyle: { color: '#8ba1a1' },
                offset: 4,
                position: 'right',
                axisLine: { show: false },
                axisTick: { show: false },
                axisLabel: {
                    color: '#8ba1a1',
                    formatter: function (value, index) {
                        return value ? value + ' %' : ''
                    },
                    inside: true
                },
                minInterval: 10,
            }
        ],
        series: [
            {
                name: '整体市场',
                type: 'bar',
                itemStyle: {
                    color: '#03d3b0'
                },
                data: [0, 1100, 900, 1000, 1050, 1200, 1300, 0]
            },
            {
                name: 'ACN产品',
                type: 'line',
                yAxisIndex: 1,
                symbolSize: 1,
                itemStyle: {
                    color: '#f65569',
                    borderColor: '#f65569'
                },
                lineStyle: {
                    color: '#f65569',
                },
                label: {
                    color: '#8ba1a1',
                    show: true,
                    formatter: '{c} %'
                },
                data: ['', 27.4, 26.0, 25.0, 25.5, 26.0, 27.0, '']
            },
            {
                name: '竞品A',
                type: 'line',
                yAxisIndex: 1,
                symbolSize: 1,
                itemStyle: {
                    color: '#f3896e',
                    borderColor: '#f3896e'
                },
                lineStyle: {
                    color: '#f3896e',
                },
                data: ['', 25, 23, 21, 24, 22, 23, '']
            },
            {
                name: '竞品B',
                type: 'line',
                yAxisIndex: 1,
                symbolSize: 1,
                itemStyle: {
                    color: '#5897ff',
                    borderColor: '#5897ff'
                },
                lineStyle: {
                    color: '#5897ff',
                },
                data: ['', 18, 18, 17, 17, 19, 19, '']
            },
            {
                name: '竞品C',
                type: 'line',
                yAxisIndex: 1,
                symbolSize: 1,
                itemStyle: {
                    color: '#9e79fa',
                    borderColor: '#9e79fa'
                },
                lineStyle: {
                    color: '#9e79fa',
                },
                data: ['', 11, 11, 12, 11, 9, 10, '']
            }, {
                name: '竞品D',
                type: 'line',
                yAxisIndex: 1,
                symbolSize: 1,
                itemStyle: {
                    color: '#f8c31c',
                    borderColor: '#f8c31c'
                },
                lineStyle: {
                    color: '#f8c31c',
                },
                data: ['', 8, 10, 11, 10, 8, 7, '']
            }
        ]
    };
    constructor() { }

    ngOnInit() {
        this.mySwiperBanner = new Swiper('.swiper-container1', {
            slidesPerView: 'auto',
            freeMode: true,
            observer:true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents:true,//修改swiper的父元素时，自动初始化swiper
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
        });
    }
    selectDetail(i: number): void {
        if (this.selectIndex === undefined) {
            this.selectIndex = i;
            this.dataList.splice(i + 1, 0, [])
        } else {
            if (this.dataList[i].length == 0) {
                return
            } else if (this.selectIndex === i) {
                this.selectIndex = undefined;
                this.dataList.splice(i + 1, 1)
            } else {
                this.dataList.splice(this.selectIndex + 1, 1)
                if (this.selectIndex < i) {
                    this.dataList.splice(i, 0, [])
                    this.selectIndex = i - 1;
                } else {
                    this.dataList.splice(i + 1, 0, [])
                    this.selectIndex = i;
                }
            }
        }
        setTimeout(() => {
            this.initSwiper();
        }, 20);
    }
    initSwiper() {
        this.mySwiper = new Swiper('.swiper-container', {
            slidesPerView: 'auto',
            // freeMode: true,
            observer: true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents: true,//修改swiper的父元素时，自动初始化swiper
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
        });
    }
}
