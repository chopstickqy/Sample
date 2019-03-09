import { Component, OnInit } from '@angular/core';
declare let Swiper: any;
@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {
  selectIndex: number = undefined;
  mySwiper: any;
  dataList: any[] = [
    {
      id: 1,
      name: '安徽省立医院医院医院医院医院医院医院',
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
      id: 2,
      name: '安徽省立医院医院医院医院医院医院医院',
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
      id: 3,
      name: '安徽省立医院医院医院医院医院医院医院',
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
      id: 4,
      name: '安徽省立医院医院医院医院医院医院医院',
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
      id: 5,
      name: '安徽省立医院医院医院医院医院医院医院',
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
      id: 6,
      name: '安徽省立医院医院医院医院医院医院医院',
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
      id: 7,
      name: '安徽省立医院医院医院医院医院医院医院',
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
    }]
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
