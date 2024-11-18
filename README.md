# okx-open
欧易-okx的开源项目，基于ruoyi-vue-plus开发，封装了okx的api，方便大家使用。

前端项目地址：

开发环境：
    jdk17
    springboot3.1 

主要功能：主要用于okx平台，交易员交易监控，okx公开带单的人，都可以监控，数据库配置就行
    ruoyi的管理平台功能
    引入钉钉机器人做提醒，后续可以自己更改别的机器人
    okx：
        主要交易员的开仓、平仓监控提醒
        开单、跟单功能
        货币价格的定时推送

api 介绍
    AccountApi   账户相关
    MarketApi    撮合交易/行情相关
    PublicApi    公共数据
    SystemApi    status
    TradeApi     撮合交易/交易、策略交易
    CopyTradingApi   跟单

注意事项：
    需要自己更改项目配置，获取自己的okx平台api的密钥，部署在国内服务器需要开启代理

功能截图：
    
管理平台的也搭建好了，自己启动查看