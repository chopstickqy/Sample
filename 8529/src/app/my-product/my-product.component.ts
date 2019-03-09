import {
    Component,
    OnInit
} from '@angular/core';
import G2 from '@antv/g2/build/g2';
declare let Swiper: any;
@Component({
    selector: 'app-my-product',
    templateUrl: './my-product.component.html',
    styleUrls: ['./my-product.component.less']
})
export class MyProductComponent implements OnInit {
    selectIndex: number = undefined;
    mySwiper: any;
    mySwiperBanner: any;
    dataList: any[] = [{
        name: '安徽省立医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }]
    }, {
        name: '中南大学湘雅医学院附属第二人民医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }]
    }, {
        name: '华中科技大学同济医学院附属同济医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }]
    }, {
        name: '中南大学湘雅医学院附属第三人民医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }]
    }, {
        name: '中国人民解放军武汉总医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }]
    }, {
        name: '南昌大学第一附属医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }]
    }, {
        name: '江西省人民医院',
        selected: false,
        level: 'A',
        score: '13,768',
        rate1: '10.9%',
        rate2: '107.5%',
        compete: [{
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
        }, {
            product: 'Total',
            price: 2.7,
            share: "13.6%",
            change: "12.0%",
            add: "123.6%",
            EI: 106
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
            x2: 45,
            y2: 45
        },
        legend: {
            data: ['指标', '实绩', '进行率']
        },
        xAxis: [{
            type: 'category',
            data: ['TargetH1', '1804', '1805', '1806', '1807', '1808', '1809'],
            axisLabel: {
                interval: 0,
                rotate: 45
            },
            axisPointer: {
                type: 'shadow'
            }
        }],
        yAxis: [{
                type: 'value',
                name: '销售（千）',
                min: 0,
                max: 2000,
                interval: 500,
                axisLabel: {
                    color: '#8ba1a1',
                    formatter: '{value}'
                },  
                axisLine: {
                    show: false
                }
            },
            {
                type: 'value',
                name: '进行率',
                min: 0,
                max: 150,
                interval: 50,
                axisLabel: {
                    color: '#8ba1a1',
                    formatter: '{value} %'
                },
                axisLine: {
                    show: false
                }
            }
        ],
        series: [{
                name: '指标',
                type: 'bar',
                data: [1560, 0, 0, 0, 0, 0, 0],
                itemStyle: {
                    normal: {
                        color: '#eabd0f'
                    }
                }
            },
            {
                name: '实绩',
                type: 'bar',
                data: [0, 300, 454, 755, 905, 1230, 1520],
                itemStyle: {
                    normal: {
                        color: '#1bd0a1'
                    }
                }
            },
            {
                name: '进行率',
                type: 'line',
                yAxisIndex: 1,
                data: [0, 14, 29, 45, 60, 77, 96]
            }
        ]
    };
    option2 = {
        color: ['#03D3B0'],
  
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            data: ['11/1', '11/2', '11/3', '11/4', '11/5', '11/6', '11/7', '11/8', '11/9', '11/10', '11/11', '11/12', '11/13'],
            axisTick: {
                alignWithLabel: true
            },
            axisLabel: {
                color: '#8ba1a1',
      
            },
        }],
        yAxis: [{
            type: 'value',
            axisLabel: {
                color: '#8ba1a1',
            
            },
            axisLine: {
                show: false
            }
        },],
        series: [{
            type: 'bar',
            barWidth: '60%',
            data: [22, 18, 20, 18, 22, 18, 28, 24, 19, 19, 24, 38, 25],
            markPoint: 'circle'
        }]
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
    }


    trendOption = {
        legend: {
            textStyle: { color: '#4e6870' },
            itemHeight: 4,
            itemWidth: 14,
            itemGap: 20,
            padding:[0,20],
            bottom:0,
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
            left: '12%',
            right: '12%',
            top: 35,
            bottom: 80
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
        yAxis: [{
                type: 'value',
                name: '医院潜力（千)',
                min: 0,
                max: 1500,
                interval: 500,
                axisLabel: {
                    color: '#8ba1a1'
                },
                axisLine: {
                    show: false
                }
            },
            {
                type: 'value',
                name: '份额',
                min: 0,
                max: 30,
                interval: 10,
                axisLabel: {
                    color: '#8ba1a1'
                },
                axisLine: {
                    show: false
                }
            }
        ],
        series: [{
                name: '整体市场',
                type: 'bar',
                data: [800, 985, 1032, 1200, 1150, 1265, ],
                itemStyle: {
                    color: '#1bd0a1'
                },
                barWidth: 20
            },
            {
                name: 'ACN产品',
                type: 'line',
                yAxisIndex: 1,
                data: [25, 26, 26, 22, 28, 23],
                itemStyle: {
                    color: '#f65569'
                }
            },
            {
                name: '竞品A',
                type: 'line',
                yAxisIndex: 1,
                data: [15, 23, 15, 13, 8, 12],
                itemStyle: {
                    color: '#f3896e'
                }
            },
            {
                name: '竞品B',
                type: 'line',
                yAxisIndex: 1,
                data: [14, 15, 13, 14, 15, 18],
                itemStyle: {
                    color: '#5897ff'
                }
            },
            {
                name: '竞品C',
                type: 'line',
                yAxisIndex: 1,
                data: [16, 12, 8, 11, 16, 12],
                itemStyle: {
                    color: '#9e79fa'
                }
            },
            {
                name: '竞品D',
                type: 'line',
                yAxisIndex: 1,
                data: [10, 15, 13, 18, 9, 12],
                itemStyle: {
                    color: '#f8c31c'
                }
            }
        ]
    };
    doctorOption = {
        series: [{
            name: '访问来源',
            type: 'pie',
            radius: ['50%', '70%'],
            data: [{
                value: 80,
                name: '访问情况'
            }, ]
        }]


    }
    slides = [
        'https://via.placeholder.com/300x200/FF5733/ffffff',
        'https://via.placeholder.com/300x200/C70039/ffffff',
        'https://via.placeholder.com/300x200/900C3F/ffffff'
    ];
    constructor() {

    }

    ngOnInit() {
        this.mySwiperBanner = new Swiper('.swiper-container1', {
            slidesPerView: 'auto',
            observer: true, //修改swiper自己或子元素时，自动初始化swiper
            observeParents: true, //修改swiper的父元素时，自动初始化swiper
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
        });
    }
    selectDetail(i: number): void {
        if (this.dataList[i].selected) {
            this.dataList.forEach((item: any) => {
                item.selected = false;
            });

        } else {

            this.dataList.forEach((item: any) => {
                item.selected = false;
            });
            this.dataList[i].selected = true;
            setTimeout(() => {
                this.initSwiper();
                this.drawBarChart();
            }, 20);
        }

    }
    initSwiper() {
        this.mySwiper = new Swiper('#detail-swiper', {
            // 如果需要分页器
            slidesPerView: 'auto',
            // freeMode: true,
            observer: true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents: true,//修改swiper的父元素时，自动初始化swiper
            pagination: {
                el: '.detail-page',
            },
        });
    }

    drawBarChart() {
        var data = [{
            type: '医生拜访情况',
            value: 80
        }];
        var chart = new G2.Chart({
            container: 'visit-circle',
            width: 100,
            height: 100,
            padding: 10
        });
        chart.source(data);
        chart.legend(false);
        chart.facet('rect', {
            fields: ['type'],
            padding: 0,
            showTitle: false,
            eachView: function eachView(view, facet) {
                var data = facet.data;
                var color = '#1bd0a1';

                data.push({
                    type: '其他',
                    value: 100 - data[0].value
                });
                view.source(data);
                view.coord('theta', {
                    radius: 1,
                    innerRadius: 0.7
                });
                view.intervalStack().position('value').color('type', [color, '#eceef1']).opacity(1);
            }
        });
        chart.render();
    }
}