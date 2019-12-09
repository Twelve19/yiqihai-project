<!--创建数据库-->
create database yiqihai;

CREATE TABLE customer_info
(
    c_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '客户编号',
    c_number VARCHAR(50) UNIQUE NOT NULL COMMENT '账号',
    c_password VARCHAR(50)  COMMENT '密码',
    c_card VARCHAR(20)  COMMENT '身份证',
    c_driving VARCHAR(50)  COMMENT '驾驶证',
    c_phone VARCHAR(20)  COMMENT '手机号码',
    c_name VARCHAR(20)  COMMENT '姓名',
    c_sex VARCHAR(20) COMMENT '性别',
)COMMENT '用户信息表';

CREATE TABLE member
(
    m_id VARCHAR(30) PRIMARY KEY COMMENT '会员编号',
    m_integral DECIMAL DEFAULT (0) COMMENT '会员积分',
    m_grade INT DEFAULT (1) COMMENT '会员等级',
    m_creation DATETIME DEFAULT(GET_FORMAT(DATE)) COMMENT '创建时间',
    m_lastusetime DATETIME DEFAULT(GET_FORMAT(DATE)) COMMENT '上次使用时间',
    m_state TINYINT DEFAULT (0) COMMENT '状态'
)COMMENT '会员表';

CREATE TABLE car_info
(
    car_id VARCHAR(30) PRIMARY KEY  COMMENT '汽车编号',
    car_name VARCHAR(30) COMMENT '汽车名称',
    car_price DECIMAL COMMENT '汽车租金/天',
    car_color VARCHAR(20) COMMENT '汽车颜色',
    car_seattype VARCHAR(20) COMMENT '汽车座型',
    car_state INT COMMENT '汽车状态',
    car_image VARCHAR(200) COMMENT '汽车图片',
    car_number VARCHAR(30) COMMENT '车牌号',
    car_typeid INT COMMENT '汽车品牌编号'
)COMMENT '汽车信息表';

CREATE TABLE cartype
(
    car_typeid INT AUTO_INCREMENT PRIMARY KEY COMMENT '车型编号',
    car_brand varchar (30) COMMIT '品牌',
    car_typename VARCHAR(20) COMMENT '车型名称',
    car_typenumber VARCHAR(300) COMMENT '数量'
)COMMENT '汽车车型表';




CREATE TABLE collect
(
    collect_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '收藏编号',
    car_id VARCHAR(30) COMMENT '汽车编号',
    c_id INT COMMENT '客户编号',
    collect_creationtime DATETIME DEFAULT (GET_FORMAT(DATETIME)) COMMENT '收藏时间'
)COMMENT '收藏表';