CREATE SCHEMA IF NOT EXISTS uwc;
USE uwc;

CREATE TABLE account
(
    id           INT AUTO_INCREMENT,
    email        VARCHAR(100) UNIQUE,
    password     VARCHAR(100) NOT NULL,
    name         VARCHAR(256) NOT NULL,
    phone        CHAR(10)     NOT NULL,
    refreshToken VARCHAR(256),
    PRIMARY KEY (id)
);

CREATE TABLE worker
(
    id         INT AUTO_INCREMENT,
    fCollector BOOLEAN,
    fJanitor   BOOLEAN,
    PRIMARY KEY (id)
);

CREATE TABLE backofficer
(
    id INT AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE vehicle
(
    id              INT AUTO_INCREMENT,
    carNumber       VARCHAR(6) UNIQUE,
    type            ENUM ('TRUCK', 'TROLLER') NOT NULL,
    status          ENUM ('GOOD', 'BROKEN')   NOT NULL,
    weight          FLOAT                     NOT NULL,
    fuelConsumption FLOAT                     NOT NULL,
    capacity        FLOAT                     NOT NULL,
    backofficerId   INT,
    PRIMARY KEY (id)
);

CREATE TABLE task
(
    id            INT AUTO_INCREMENT,
    createTime    DATETIME                          NOT NULL,
    workingTime   DATETIME,
    status        ENUM ('WAITING', 'DOING', 'DONE') NOT NULL,
    acceptTime    DATETIME,
    doneTime      DATETIME,
    backofficerId INT,
    workerId      INT,
    routeId       INT,
    PRIMARY KEY (id)
);

CREATE TABLE route
(
    id        INT AUTO_INCREMENT,
    vehicleId INT,
    PRIMARY KEY (id)
);

CREATE TABLE road
(
    id         INT AUTO_INCREMENT,
    routeId    INT,
    startPoint VARCHAR(10) NOT NULL,
    endPoint   VARCHAR(10) NOT NULL,
    distance   FLOAT       NOT NULL,
    roadName   VARCHAR(20),
    PRIMARY KEY (id, routeId)
);

CREATE TABLE mcp
(
    id            INT AUTO_INCREMENT,
    totalCapacity FLOAT                                      NOT NULL,
    inUse         FLOAT,
    status        ENUM ('ONLINE', 'DISCONNECTED', 'OFFLINE') NOT NULL,
    address       VARCHAR(100)                               NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE mcpInRoute
(
    routeId INT,
    mcpId INT,
    PRIMARY KEY (routeId, mcpId)
);

CREATE TABLE manage
(
    backofficerId INT,
    workerId INT,
    PRIMARY KEY (backofficerId, workerId)
);

######## init data ###########
insert into account (id, email, password, name, phone, refreshToken) values (1, 'asilcox0@state.gov', 'xRAWZv5PLN', 'Arne Silcox', '4121478255', null);
insert into account (id, email, password, name, phone, refreshToken) values (2, 'bdealey1@java.com', '7QKq8U', 'Bernardine Dealey', '2427946209', null);
insert into account (id, email, password, name, phone, refreshToken) values (3, 'sferrant2@walmart.com', 'IyB0Yfulk', 'Saunderson Ferrant', '8444986307', null);
insert into account (id, email, password, name, phone, refreshToken) values (4, 'jworboy3@princeton.edu', 'hyMeza', 'Janette Worboy', '5018247340', null);
insert into account (id, email, password, name, phone, refreshToken) values (5, 'hmarvin4@uol.com.br', 'NY7iGE', 'Hally Marvin', '1077129681', null);
insert into account (id, email, password, name, phone, refreshToken) values (6, 'pstorch5@chron.com', 'YWk0tXVSGLMo', 'Perrine Storch', '7194375348', null);
insert into account (id, email, password, name, phone, refreshToken) values (7, 'qsherrard6@hao123.com', 'DGUOMHysve', 'Quinton Sherrard', '2429036977', null);
insert into account (id, email, password, name, phone, refreshToken) values (8, 'bfullerd7@fotki.com', 'v9VfkJ1g3zPM', 'Bradan Fullerd', '6093401168', null);
insert into account (id, email, password, name, phone, refreshToken) values (9, 'dyackiminie8@php.net', 'YSPX63', 'Daveta Yackiminie', '2945617940', null);
insert into account (id, email, password, name, phone, refreshToken) values (10, 'kdanson9@pen.io', 'k0Uetda', 'Kathryn Danson', '4189991643', null);
insert into account (id, email, password, name, phone, refreshToken) values (11, 'lwoodroffa@usgs.gov', 'hQsureMJl', 'Lenci Woodroff', '1901199128', null);
insert into account (id, email, password, name, phone, refreshToken) values (12, 'pkuhnhardtb@salon.com', 'AgrE6fnhK', 'Peri Kuhnhardt', '8243010875', null);
insert into account (id, email, password, name, phone, refreshToken) values (13, 'mesgatec@state.gov', 'LD5PxXy', 'Mirilla Esgate', '4701730896', null);
insert into account (id, email, password, name, phone, refreshToken) values (14, 'rolivettad@lulu.com', 'Ilf1F1B', 'Rees Olivetta', '2827605368', null);
insert into account (id, email, password, name, phone, refreshToken) values (15, 'hivanaeve@boston.com', 'P9wpmcx5', 'Hermon Ivanaev', '2442302461', null);
insert into account (id, email, password, name, phone, refreshToken) values (16, 'gdominellif@deliciousdays.com', 'TGcxzK', 'Giacomo Dominelli', '9149209246', null);
insert into account (id, email, password, name, phone, refreshToken) values (17, 'acudbyg@japanpost.jp', 'Qr0OS3jI', 'Artair Cudby', '6352824105', null);
insert into account (id, email, password, name, phone, refreshToken) values (18, 'acrinkleyh@webeden.co.uk', 'yzVWRcqMH', 'Abe Crinkley', '9923745218', null);
insert into account (id, email, password, name, phone, refreshToken) values (19, 'bfreezeri@skyrock.com', 'Vv3S6266', 'Blinny Freezer', '3309331269', null);
insert into account (id, email, password, name, phone, refreshToken) values (20, 'cstickellsj@posterous.com', '4QRHOpPAVOBs', 'Carlos Stickells', '5127310255', null);
insert into account (id, email, password, name, phone, refreshToken) values (21, 'jtembridgek@unesco.org', 'pS1F8RrIP5Gv', 'Jacobo Tembridge', '8929730154', null);
insert into account (id, email, password, name, phone, refreshToken) values (22, 'gmartinekl@walmart.com', 'dft403mp', 'Gibby Martinek', '9172866216', null);
insert into account (id, email, password, name, phone, refreshToken) values (23, 'nebertsm@dailymail.co.uk', '1YVwHyeSamQ', 'Netta Eberts', '9917590229', null);
insert into account (id, email, password, name, phone, refreshToken) values (24, 'rpalfreymann@bizjournals.com', 'DPGgiD', 'Rolph Palfreyman', '6343248306', null);
insert into account (id, email, password, name, phone, refreshToken) values (25, 'erubanenkoo@indiegogo.com', 'ORRiADAb', 'Elladine Rubanenko', '8679974618', null);
insert into account (id, email, password, name, phone, refreshToken) values (26, 'jagnewp@edublogs.org', 'wN8xfRfbJ', 'Jdavie Agnew', '7377355978', null);
insert into account (id, email, password, name, phone, refreshToken) values (27, 'moscannillq@list-manage.com', '7X4XWV2Z23', 'Moira O''Scannill', '1245494125', null);
insert into account (id, email, password, name, phone, refreshToken) values (28, 'ibulmanr@prnewswire.com', '1Li8nKJgPhqq', 'Imogen Bulman', '9781427410', null);
insert into account (id, email, password, name, phone, refreshToken) values (29, 'cestes@pen.io', 'ob8AoyQT', 'Christoffer Este', '1364015781', null);
insert into account (id, email, password, name, phone, refreshToken) values (30, 'rseemmondst@issuu.com', '4Ei3ZkR', 'Rania Seemmonds', '6137530448', null);
insert into account (id, email, password, name, phone, refreshToken) values (31, 'gbraunsu@discuz.net', '2lLbn6kWD', 'Glenna Brauns', '8866194074', null);
insert into account (id, email, password, name, phone, refreshToken) values (32, 'aregglerv@army.mil', 'wmQNH5J3Wx', 'Ardenia Reggler', '8188710222', null);
insert into account (id, email, password, name, phone, refreshToken) values (33, 'wgiacoppow@ovh.net', '2autWBTx', 'Willy Giacoppo', '1239806736', null);
insert into account (id, email, password, name, phone, refreshToken) values (34, 'kplunketx@utexas.edu', '7lBi8pUE', 'Kristan Plunket', '6056719445', null);
insert into account (id, email, password, name, phone, refreshToken) values (35, 'dmaudetty@pinterest.com', 'NWrltUOyr', 'Doy Maudett', '1725384710', null);
insert into account (id, email, password, name, phone, refreshToken) values (36, 'lsoitouxz@google.ca', '13YRKccDJGc8', 'Lindon Soitoux', '6703933759', null);
insert into account (id, email, password, name, phone, refreshToken) values (37, 'clowdiane10@businessweek.com', 'LrWtbtp', 'Carin Lowdiane', '4541063789', null);
insert into account (id, email, password, name, phone, refreshToken) values (38, 'scadge11@imageshack.us', 'csGDPnIJDYhm', 'Shara Cadge', '9136438381', null);
insert into account (id, email, password, name, phone, refreshToken) values (39, 'bboldero12@bloomberg.com', 'Y34S4TV', 'Belle Boldero', '2642289218', null);
insert into account (id, email, password, name, phone, refreshToken) values (40, 'bdell13@blinklist.com', 'F7WAIW', 'Benita Dell', '3036703998', null);
insert into account (id, email, password, name, phone, refreshToken) values (41, 'xmaccallester14@1und1.de', 'B0Uvu4eF7CZ', 'Xerxes MacCallester', '4197072915', null);
insert into account (id, email, password, name, phone, refreshToken) values (42, 'bferby15@addtoany.com', 'hDJUYOjvuX', 'Barry Ferby', '2495589874', null);
insert into account (id, email, password, name, phone, refreshToken) values (43, 'phousego16@theguardian.com', 'KtwIQYNBYPlT', 'Papageno Housego', '2084229319', null);
insert into account (id, email, password, name, phone, refreshToken) values (44, 'skocher17@friendfeed.com', '0wLrUq9qN671', 'Stacy Kocher', '4679482623', null);
insert into account (id, email, password, name, phone, refreshToken) values (45, 'urowlstone18@shop-pro.jp', 'UDN5s62jFq1', 'Udell Rowlstone', '9086546730', null);
insert into account (id, email, password, name, phone, refreshToken) values (46, 'bdall19@rediff.com', 'QzjvtuG', 'Bendite Dall', '6433979423', null);
insert into account (id, email, password, name, phone, refreshToken) values (47, 'rbarnwill1a@myspace.com', 'diLU6X1', 'Rudyard Barnwill', '8326829496', null);
insert into account (id, email, password, name, phone, refreshToken) values (48, 'rtefft1b@archive.org', 'jpe6Qyb44D8', 'Roxi Tefft', '4418963508', null);
insert into account (id, email, password, name, phone, refreshToken) values (49, 'rbartos1c@liveinternet.ru', 'PZ4R3572qL', 'Rachael Bartos', '4102611484', null);
insert into account (id, email, password, name, phone, refreshToken) values (50, 'aportingale1d@hostgator.com', '5yYi7rSe', 'Aveline Portingale', '4955037410', null);


insert into backofficer (id) values (46);
insert into backofficer (id) values (47);
insert into backofficer (id) values (48);
insert into backofficer (id) values (49);
insert into backofficer (id) values (50);


insert into manage (backofficerId, workerId) values (46, 4);
insert into manage (backofficerId, workerId) values (50, 18);
insert into manage (backofficerId, workerId) values (50, 20);
insert into manage (backofficerId, workerId) values (46, 25);
insert into manage (backofficerId, workerId) values (47, 28);
insert into manage (backofficerId, workerId) values (49, 31);
insert into manage (backofficerId, workerId) values (50, 30);
insert into manage (backofficerId, workerId) values (48, 21);
insert into manage (backofficerId, workerId) values (46, 3);
insert into manage (backofficerId, workerId) values (48, 1);
insert into manage (backofficerId, workerId) values (47, 23);
insert into manage (backofficerId, workerId) values (47, 9);
insert into manage (backofficerId, workerId) values (49, 9);
insert into manage (backofficerId, workerId) values (50, 15);
insert into manage (backofficerId, workerId) values (49, 34);
insert into manage (backofficerId, workerId) values (46, 30);
insert into manage (backofficerId, workerId) values (49, 29);
insert into manage (backofficerId, workerId) values (50, 7);
insert into manage (backofficerId, workerId) values (50, 25);
insert into manage (backofficerId, workerId) values (48, 39);
insert into manage (backofficerId, workerId) values (50, 13);
insert into manage (backofficerId, workerId) values (47, 24);
insert into manage (backofficerId, workerId) values (47, 29);
insert into manage (backofficerId, workerId) values (46, 38);
insert into manage (backofficerId, workerId) values (47, 3);
insert into manage (backofficerId, workerId) values (46, 23);
insert into manage (backofficerId, workerId) values (49, 4);
insert into manage (backofficerId, workerId) values (50, 12);
insert into manage (backofficerId, workerId) values (50, 39);
insert into manage (backofficerId, workerId) values (50, 38);
insert into manage (backofficerId, workerId) values (48, 10);
insert into manage (backofficerId, workerId) values (48, 12);
insert into manage (backofficerId, workerId) values (46, 13);
insert into manage (backofficerId, workerId) values (49, 2);
insert into manage (backofficerId, workerId) values (47, 25);
insert into manage (backofficerId, workerId) values (50, 14);
insert into manage (backofficerId, workerId) values (49, 32);
insert into manage (backofficerId, workerId) values (48, 18);
insert into manage (backofficerId, workerId) values (47, 8);
insert into manage (backofficerId, workerId) values (49, 13);
insert into manage (backofficerId, workerId) values (46, 19);
insert into manage (backofficerId, workerId) values (48, 23);
insert into manage (backofficerId, workerId) values (46, 32);
insert into manage (backofficerId, workerId) values (49, 6);
insert into manage (backofficerId, workerId) values (48, 22);
insert into manage (backofficerId, workerId) values (47, 6);
insert into manage (backofficerId, workerId) values (47, 37);
insert into manage (backofficerId, workerId) values (49, 14);
insert into manage (backofficerId, workerId) values (47, 30);
insert into manage (backofficerId, workerId) values (47, 40);
insert into manage (backofficerId, workerId) values (47, 22);
insert into manage (backofficerId, workerId) values (47, 26);
insert into manage (backofficerId, workerId) values (48, 42);
insert into manage (backofficerId, workerId) values (49, 35);
insert into manage (backofficerId, workerId) values (48, 26);
insert into manage (backofficerId, workerId) values (46, 10);
insert into manage (backofficerId, workerId) values (46, 22);
insert into manage (backofficerId, workerId) values (49, 37);
insert into manage (backofficerId, workerId) values (46, 27);
insert into manage (backofficerId, workerId) values (49, 23);
insert into manage (backofficerId, workerId) values (47, 11);
insert into manage (backofficerId, workerId) values (48, 15);
insert into manage (backofficerId, workerId) values (46, 44);
insert into manage (backofficerId, workerId) values (49, 27);
insert into manage (backofficerId, workerId) values (50, 42);
insert into manage (backofficerId, workerId) values (48, 4);
insert into manage (backofficerId, workerId) values (46, 42);
insert into manage (backofficerId, workerId) values (46, 40);
insert into manage (backofficerId, workerId) values (46, 28);
insert into manage (backofficerId, workerId) values (47, 34);
insert into manage (backofficerId, workerId) values (46, 9);
insert into manage (backofficerId, workerId) values (50, 33);
insert into manage (backofficerId, workerId) values (50, 44);
insert into manage (backofficerId, workerId) values (50, 37);
insert into manage (backofficerId, workerId) values (48, 43);
insert into manage (backofficerId, workerId) values (46, 8);
insert into manage (backofficerId, workerId) values (47, 19);


insert into mcp (id, totalCapacity, inUse, status, address) values (1, 11.06, 13.11, 'ONLINE', '7 Maryland Court');
insert into mcp (id, totalCapacity, inUse, status, address) values (2, 12.09, 18.45, 'DISCONNECTED', '15 Heath Plaza');
insert into mcp (id, totalCapacity, inUse, status, address) values (3, 14.71, 21.25, 'ONLINE', '9 Porter Point');
insert into mcp (id, totalCapacity, inUse, status, address) values (4, 28.16, 10.17, 'ONLINE', '931 Hagan Plaza');
insert into mcp (id, totalCapacity, inUse, status, address) values (5, 14.69, 17.74, 'DISCONNECTED', '057 Red Cloud Circle');
insert into mcp (id, totalCapacity, inUse, status, address) values (6, 16.07, 27.42, 'ONLINE', '9591 Darwin Lane');
insert into mcp (id, totalCapacity, inUse, status, address) values (7, 19.5, 26.37, 'ONLINE', '2 Ronald Regan Plaza');
insert into mcp (id, totalCapacity, inUse, status, address) values (8, 21.38, 26.36, 'ONLINE', '1867 Mallard Point');
insert into mcp (id, totalCapacity, inUse, status, address) values (9, 26.39, 25.34, 'DISCONNECTED', '8347 Arrowood Pass');
insert into mcp (id, totalCapacity, inUse, status, address) values (10, 15.47, 11.87, 'ONLINE', '0249 Muir Plaza');
insert into mcp (id, totalCapacity, inUse, status, address) values (11, 16.94, 12.64, 'ONLINE', '60 Steensland Terrace');
insert into mcp (id, totalCapacity, inUse, status, address) values (12, 18.73, 25.98, 'ONLINE', '75192 Bartillon Park');
insert into mcp (id, totalCapacity, inUse, status, address) values (13, 25.77, 16.54, 'DISCONNECTED', '225 Linden Center');
insert into mcp (id, totalCapacity, inUse, status, address) values (14, 28.96, 12.36, 'ONLINE', '79 Saint Paul Street');
insert into mcp (id, totalCapacity, inUse, status, address) values (15, 16.78, 29.32, 'ONLINE', '053 Macpherson Drive');
insert into mcp (id, totalCapacity, inUse, status, address) values (16, 23.57, 26.86, 'ONLINE', '1776 Lien Pass');
insert into mcp (id, totalCapacity, inUse, status, address) values (17, 23.59, 20.22, 'ONLINE', '7069 Kinsman Road');
insert into mcp (id, totalCapacity, inUse, status, address) values (18, 14.91, 24.71, 'ONLINE', '61 Anhalt Hill');
insert into mcp (id, totalCapacity, inUse, status, address) values (19, 11.17, 12.94, 'ONLINE', '53 Grover Center');
insert into mcp (id, totalCapacity, inUse, status, address) values (20, 23.67, 16.4, 'ONLINE', '81 Hanson Pass');
insert into mcp (id, totalCapacity, inUse, status, address) values (21, 14.66, 18.43, 'ONLINE', '9 Westerfield Street');
insert into mcp (id, totalCapacity, inUse, status, address) values (22, 15.74, 29.88, 'ONLINE', '803 Maywood Junction');
insert into mcp (id, totalCapacity, inUse, status, address) values (23, 28.11, 15.92, 'ONLINE', '974 Derek Court');
insert into mcp (id, totalCapacity, inUse, status, address) values (24, 15.86, 23.05, 'ONLINE', '34 Bellgrove Pass');
insert into mcp (id, totalCapacity, inUse, status, address) values (25, 22.08, 15.64, 'ONLINE', '506 Portage Parkway');
insert into mcp (id, totalCapacity, inUse, status, address) values (26, 23.75, 29.29, 'ONLINE', '731 Carey Alley');
insert into mcp (id, totalCapacity, inUse, status, address) values (27, 17.59, 14.43, 'ONLINE', '72 Novick Alley');
insert into mcp (id, totalCapacity, inUse, status, address) values (28, 13.17, 26.56, 'ONLINE', '953 Hollow Ridge Center');
insert into mcp (id, totalCapacity, inUse, status, address) values (29, 23.11, 14.85, 'ONLINE', '9 Carpenter Crossing');
insert into mcp (id, totalCapacity, inUse, status, address) values (30, 11.9, 16.21, 'ONLINE', '1 Derek Hill');
insert into mcp (id, totalCapacity, inUse, status, address) values (31, 24.79, 16.05, 'ONLINE', '1377 Novick Plaza');
insert into mcp (id, totalCapacity, inUse, status, address) values (32, 13.89, 18.26, 'ONLINE', '90 Linden Alley');
insert into mcp (id, totalCapacity, inUse, status, address) values (33, 27.52, 27.75, 'ONLINE', '67412 Buell Road');
insert into mcp (id, totalCapacity, inUse, status, address) values (34, 19.8, 15.41, 'OFFLINE', '4 6th Center');
insert into mcp (id, totalCapacity, inUse, status, address) values (35, 15.4, 16.77, 'DISCONNECTED', '73453 Kinsman Junction');
insert into mcp (id, totalCapacity, inUse, status, address) values (36, 13.8, 10.87, 'ONLINE', '263 Ludington Place');
insert into mcp (id, totalCapacity, inUse, status, address) values (37, 16.18, 27.69, 'OFFLINE', '7276 Bartillon Junction');
insert into mcp (id, totalCapacity, inUse, status, address) values (38, 23.92, 13.46, 'OFFLINE', '98 Transport Circle');
insert into mcp (id, totalCapacity, inUse, status, address) values (39, 27.43, 27.6, 'DISCONNECTED', '2543 Bunting Place');
insert into mcp (id, totalCapacity, inUse, status, address) values (40, 12.19, 28.95, 'OFFLINE', '02359 Shopko Avenue');
insert into mcp (id, totalCapacity, inUse, status, address) values (41, 20.37, 20.36, 'DISCONNECTED', '7136 Petterle Street');
insert into mcp (id, totalCapacity, inUse, status, address) values (42, 17.19, 17.69, 'OFFLINE', '983 Debs Hill');
insert into mcp (id, totalCapacity, inUse, status, address) values (43, 11.57, 24.76, 'ONLINE', '462 Sherman Circle');
insert into mcp (id, totalCapacity, inUse, status, address) values (44, 16.54, 27.95, 'DISCONNECTED', '89869 Jenifer Drive');
insert into mcp (id, totalCapacity, inUse, status, address) values (45, 10.47, 22.37, 'OFFLINE', '293 Gerald Trail');
insert into mcp (id, totalCapacity, inUse, status, address) values (46, 11.42, 16.97, 'ONLINE', '6506 Green Road');
insert into mcp (id, totalCapacity, inUse, status, address) values (47, 24.7, 18.58, 'ONLINE', '5 Delladonna Court');
insert into mcp (id, totalCapacity, inUse, status, address) values (48, 17.01, 21.9, 'OFFLINE', '526 Nancy Crossing');
insert into mcp (id, totalCapacity, inUse, status, address) values (49, 18.06, 29.0, 'OFFLINE', '6 Blackbird Lane');
insert into mcp (id, totalCapacity, inUse, status, address) values (50, 24.5, 13.97, 'DISCONNECTED', '760 Upham Avenue');


insert into mcpInRoute (routeId, mcpId) values (7, 17);
insert into mcpInRoute (routeId, mcpId) values (20, 50);
insert into mcpInRoute (routeId, mcpId) values (3, 3);
insert into mcpInRoute (routeId, mcpId) values (11, 20);
insert into mcpInRoute (routeId, mcpId) values (18, 49);
insert into mcpInRoute (routeId, mcpId) values (9, 9);
insert into mcpInRoute (routeId, mcpId) values (15, 29);
insert into mcpInRoute (routeId, mcpId) values (1, 5);
insert into mcpInRoute (routeId, mcpId) values (13, 25);
insert into mcpInRoute (routeId, mcpId) values (13, 7);
insert into mcpInRoute (routeId, mcpId) values (2, 45);
insert into mcpInRoute (routeId, mcpId) values (13, 18);
insert into mcpInRoute (routeId, mcpId) values (17, 32);
insert into mcpInRoute (routeId, mcpId) values (13, 28);
insert into mcpInRoute (routeId, mcpId) values (10, 40);
insert into mcpInRoute (routeId, mcpId) values (4, 25);
insert into mcpInRoute (routeId, mcpId) values (5, 24);
insert into mcpInRoute (routeId, mcpId) values (1, 16);
insert into mcpInRoute (routeId, mcpId) values (19, 42);
insert into mcpInRoute (routeId, mcpId) values (20, 11);
insert into mcpInRoute (routeId, mcpId) values (10, 14);
insert into mcpInRoute (routeId, mcpId) values (15, 9);
insert into mcpInRoute (routeId, mcpId) values (3, 21);
insert into mcpInRoute (routeId, mcpId) values (1, 48);
insert into mcpInRoute (routeId, mcpId) values (11, 15);
insert into mcpInRoute (routeId, mcpId) values (16, 36);
insert into mcpInRoute (routeId, mcpId) values (9, 19);
insert into mcpInRoute (routeId, mcpId) values (11, 34);
insert into mcpInRoute (routeId, mcpId) values (5, 33);
insert into mcpInRoute (routeId, mcpId) values (20, 10);
insert into mcpInRoute (routeId, mcpId) values (15, 47);
insert into mcpInRoute (routeId, mcpId) values (10, 39);
insert into mcpInRoute (routeId, mcpId) values (19, 38);
insert into mcpInRoute (routeId, mcpId) values (9, 40);
insert into mcpInRoute (routeId, mcpId) values (11, 7);
insert into mcpInRoute (routeId, mcpId) values (9, 5);
insert into mcpInRoute (routeId, mcpId) values (14, 25);
insert into mcpInRoute (routeId, mcpId) values (13, 27);
insert into mcpInRoute (routeId, mcpId) values (12, 19);
insert into mcpInRoute (routeId, mcpId) values (7, 36);
insert into mcpInRoute (routeId, mcpId) values (14, 18);
insert into mcpInRoute (routeId, mcpId) values (10, 34);
insert into mcpInRoute (routeId, mcpId) values (16, 21);
insert into mcpInRoute (routeId, mcpId) values (1, 43);
insert into mcpInRoute (routeId, mcpId) values (11, 25);
insert into mcpInRoute (routeId, mcpId) values (14, 47);
insert into mcpInRoute (routeId, mcpId) values (7, 41);
insert into mcpInRoute (routeId, mcpId) values (12, 25);
insert into mcpInRoute (routeId, mcpId) values (5, 42);
insert into mcpInRoute (routeId, mcpId) values (5, 10);
insert into mcpInRoute (routeId, mcpId) values (4, 26);
insert into mcpInRoute (routeId, mcpId) values (6, 45);
insert into mcpInRoute (routeId, mcpId) values (4, 50);
insert into mcpInRoute (routeId, mcpId) values (9, 17);
insert into mcpInRoute (routeId, mcpId) values (8, 24);
insert into mcpInRoute (routeId, mcpId) values (2, 27);
insert into mcpInRoute (routeId, mcpId) values (5, 25);
insert into mcpInRoute (routeId, mcpId) values (16, 11);
insert into mcpInRoute (routeId, mcpId) values (5, 38);
insert into mcpInRoute (routeId, mcpId) values (14, 16);
insert into mcpInRoute (routeId, mcpId) values (19, 34);
insert into mcpInRoute (routeId, mcpId) values (18, 3);
insert into mcpInRoute (routeId, mcpId) values (12, 2);
insert into mcpInRoute (routeId, mcpId) values (5, 13);
insert into mcpInRoute (routeId, mcpId) values (16, 16);
insert into mcpInRoute (routeId, mcpId) values (14, 39);
insert into mcpInRoute (routeId, mcpId) values (2, 36);
insert into mcpInRoute (routeId, mcpId) values (2, 38);
insert into mcpInRoute (routeId, mcpId) values (9, 33);
insert into mcpInRoute (routeId, mcpId) values (19, 18);
insert into mcpInRoute (routeId, mcpId) values (14, 13);
insert into mcpInRoute (routeId, mcpId) values (19, 27);
insert into mcpInRoute (routeId, mcpId) values (2, 25);
insert into mcpInRoute (routeId, mcpId) values (10, 11);
insert into mcpInRoute (routeId, mcpId) values (4, 18);
insert into mcpInRoute (routeId, mcpId) values (13, 16);
insert into mcpInRoute (routeId, mcpId) values (10, 45);
insert into mcpInRoute (routeId, mcpId) values (7, 21);
insert into mcpInRoute (routeId, mcpId) values (1, 31);
insert into mcpInRoute (routeId, mcpId) values (7, 19);
insert into mcpInRoute (routeId, mcpId) values (9, 34);
insert into mcpInRoute (routeId, mcpId) values (9, 30);
insert into mcpInRoute (routeId, mcpId) values (5, 7);
insert into mcpInRoute (routeId, mcpId) values (16, 17);
insert into mcpInRoute (routeId, mcpId) values (13, 38);
insert into mcpInRoute (routeId, mcpId) values (5, 23);
insert into mcpInRoute (routeId, mcpId) values (5, 49);
insert into mcpInRoute (routeId, mcpId) values (19, 9);
insert into mcpInRoute (routeId, mcpId) values (17, 42);
insert into mcpInRoute (routeId, mcpId) values (19, 13);
insert into mcpInRoute (routeId, mcpId) values (9, 42);
insert into mcpInRoute (routeId, mcpId) values (16, 38);
insert into mcpInRoute (routeId, mcpId) values (8, 42);
insert into mcpInRoute (routeId, mcpId) values (16, 18);
insert into mcpInRoute (routeId, mcpId) values (4, 45);


insert into road (id, routeId, distance, roadName) values (1, 18, 16.67, 'Fiddleleaf Hawksbeard');
insert into road (id, routeId, distance, roadName) values (2, 6, 28.51, 'Texas Bristlegrass');
insert into road (id, routeId, distance, roadName) values (3, 7, 26.71, 'Grand Fringed Gentian');
insert into road (id, routeId, distance, roadName) values (4, 15, 27.82, 'Heufler''s Cracked Lichen');
insert into road (id, routeId, distance, roadName) values (5, 13, 7.16, 'Acuminate Pleuridium Moss');
insert into road (id, routeId, distance, roadName) values (6, 4, 18.83, 'Eggyolk Lichen');
insert into road (id, routeId, distance, roadName) values (7, 14, 14.79, 'Polytrichum Moss');
insert into road (id, routeId, distance, roadName) values (8, 12, 14.36, 'Inyo Beardtongue');
insert into road (id, routeId, distance, roadName) values (9, 19, 5.64, 'Fewflower Hairsedge');
insert into road (id, routeId, distance, roadName) values (10, 2, 6.88, 'Cape Sundew');
insert into road (id, routeId, distance, roadName) values (11, 2, 2.31, 'Havaas'' Navel Lichen');
insert into road (id, routeId, distance, roadName) values (12, 20, 26.86, 'Neofuscelia Lichen');
insert into road (id, routeId, distance, roadName) values (13, 11, 21.54, 'Ctenidium Moss');
insert into road (id, routeId, distance, roadName) values (14, 6, 26.6, 'Oceanspray');
insert into road (id, routeId, distance, roadName) values (15, 16, 23.81, 'Roundleaf Buckwheat');
insert into road (id, routeId, distance, roadName) values (16, 7, 3.68, 'Southern Dawnflower');
insert into road (id, routeId, distance, roadName) values (17, 19, 28.67, 'Deane''s Wirelettuce');
insert into road (id, routeId, distance, roadName) values (18, 13, 9.54, 'Kidneyshape Dot Lichen');
insert into road (id, routeId, distance, roadName) values (19, 15, 28.12, 'Manzanilla Horseweed');
insert into road (id, routeId, distance, roadName) values (20, 3, 21.23, 'Silk-cotton Tree');
insert into road (id, routeId, distance, roadName) values (21, 7, 12.33, 'Graceful Necklace Fern');
insert into road (id, routeId, distance, roadName) values (22, 15, 27.44, 'Arid Tansyaster');
insert into road (id, routeId, distance, roadName) values (23, 16, 23.64, 'Sierra Lewisia');
insert into road (id, routeId, distance, roadName) values (24, 20, 17.69, 'American Eelgrass');
insert into road (id, routeId, distance, roadName) values (25, 11, 27.28, 'Hoover''s Manzanita');
insert into road (id, routeId, distance, roadName) values (26, 9, 26.87, 'Snowrose');
insert into road (id, routeId, distance, roadName) values (27, 1, 18.38, 'Hedgemustard');
insert into road (id, routeId, distance, roadName) values (28, 9, 5.43, 'Yellow Pincushion');
insert into road (id, routeId, distance, roadName) values (29, 3, 9.92, 'Silvery Everlasting');
insert into road (id, routeId, distance, roadName) values (30, 4, 13.56, 'Eastern Featherbells');
insert into road (id, routeId, distance, roadName) values (31, 18, 11.24, 'Prairie Milkvine');
insert into road (id, routeId, distance, roadName) values (32, 4, 16.96, 'Bear River Fleabane');
insert into road (id, routeId, distance, roadName) values (33, 17, 24.81, 'Foxtail Prairie Clover');
insert into road (id, routeId, distance, roadName) values (34, 8, 19.41, 'Armenia Tephromela Lichen');
insert into road (id, routeId, distance, roadName) values (35, 13, 15.48, 'Sierra False Bindweed');
insert into road (id, routeId, distance, roadName) values (36, 18, 6.03, 'Necklacepod');
insert into road (id, routeId, distance, roadName) values (37, 6, 17.99, 'Andean Walnut');
insert into road (id, routeId, distance, roadName) values (38, 13, 9.1, 'Gregg''s Ash');
insert into road (id, routeId, distance, roadName) values (39, 10, 14.63, 'Pink Funnel Lily');
insert into road (id, routeId, distance, roadName) values (40, 16, 3.53, 'Allen Verbena');
insert into road (id, routeId, distance, roadName) values (41, 11, 13.67, 'Tanoak');
insert into road (id, routeId, distance, roadName) values (42, 16, 29.97, 'Pink Campion');
insert into road (id, routeId, distance, roadName) values (43, 8, 7.88, 'Whipple''s Claopodium Moss');
insert into road (id, routeId, distance, roadName) values (44, 17, 22.67, 'Western Oat');
insert into road (id, routeId, distance, roadName) values (45, 3, 21.46, 'Picabo Milkvetch');
insert into road (id, routeId, distance, roadName) values (46, 15, 16.54, 'Slash Pine');
insert into road (id, routeId, distance, roadName) values (47, 2, 3.82, 'Maui Sedge');
insert into road (id, routeId, distance, roadName) values (48, 9, 7.29, 'Sandloving Monkeyflower');
insert into road (id, routeId, distance, roadName) values (49, 18, 21.44, 'Ridgetop Schiedea');
insert into road (id, routeId, distance, roadName) values (50, 2, 1.49, 'Pancratium');
insert into road (id, routeId, distance, roadName) values (51, 9, 1.27, 'Howell''s Mariposa Lily');
insert into road (id, routeId, distance, roadName) values (52, 3, 7.22, 'Bahiagrass');
insert into road (id, routeId, distance, roadName) values (53, 6, 25.83, 'Crownscale');
insert into road (id, routeId, distance, roadName) values (54, 3, 27.9, 'Shortspur Seablush');
insert into road (id, routeId, distance, roadName) values (55, 7, 1.44, 'Bristlegrass');
insert into road (id, routeId, distance, roadName) values (56, 15, 6.26, 'Drummond''s Pohlia Moss');
insert into road (id, routeId, distance, roadName) values (57, 1, 9.21, 'Ground Rose');
insert into road (id, routeId, distance, roadName) values (58, 20, 26.36, 'Suksdorf''s Milkvetch');
insert into road (id, routeId, distance, roadName) values (59, 14, 20.43, 'Japanese Yam');
insert into road (id, routeId, distance, roadName) values (60, 2, 22.59, 'Tropical Fanleaf');
insert into road (id, routeId, distance, roadName) values (61, 18, 3.15, 'Fineleaf Hymenopappus');
insert into road (id, routeId, distance, roadName) values (62, 7, 4.38, 'Alpine Beard Lichen');
insert into road (id, routeId, distance, roadName) values (63, 3, 22.16, 'Small Skullcap');
insert into road (id, routeId, distance, roadName) values (64, 7, 1.27, 'Ragweed Sagebrush');
insert into road (id, routeId, distance, roadName) values (65, 9, 28.26, 'Key West Heliotrope');
insert into road (id, routeId, distance, roadName) values (66, 3, 15.7, 'Coastal Sneezeweed');
insert into road (id, routeId, distance, roadName) values (67, 4, 2.66, 'Penthorum');
insert into road (id, routeId, distance, roadName) values (68, 20, 17.48, 'Tall Blazing Star');
insert into road (id, routeId, distance, roadName) values (69, 19, 16.85, 'Dwarf Crownbeard');
insert into road (id, routeId, distance, roadName) values (70, 3, 18.56, 'Kaibab Bladderpod');
insert into road (id, routeId, distance, roadName) values (71, 11, 17.09, 'Blue Huckleberry');
insert into road (id, routeId, distance, roadName) values (72, 6, 7.62, 'Achiotillo');
insert into road (id, routeId, distance, roadName) values (73, 15, 16.83, 'Wart Lichen');
insert into road (id, routeId, distance, roadName) values (74, 3, 27.68, 'Lemonyellow False Goldenaster');
insert into road (id, routeId, distance, roadName) values (75, 11, 15.17, 'Hybrid Hawthorn');
insert into road (id, routeId, distance, roadName) values (76, 10, 25.98, 'Prairie Rose');
insert into road (id, routeId, distance, roadName) values (77, 14, 15.05, 'Palmer''s Bluestar');
insert into road (id, routeId, distance, roadName) values (78, 1, 9.67, 'Evergreen Sumac');
insert into road (id, routeId, distance, roadName) values (79, 14, 25.97, 'Spreading Minerslettuce');
insert into road (id, routeId, distance, roadName) values (80, 11, 13.02, 'Elderberry');
insert into road (id, routeId, distance, roadName) values (81, 8, 27.54, 'Polished Maidenhair');
insert into road (id, routeId, distance, roadName) values (82, 8, 15.3, 'Coffeetree');
insert into road (id, routeId, distance, roadName) values (83, 15, 29.0, 'Western Sedge');
insert into road (id, routeId, distance, roadName) values (84, 9, 17.17, 'Soldierbush');
insert into road (id, routeId, distance, roadName) values (85, 10, 3.83, 'Urban''s Lovegrass');
insert into road (id, routeId, distance, roadName) values (86, 5, 17.89, 'Mojave Seablite');
insert into road (id, routeId, distance, roadName) values (87, 15, 1.22, 'Golden Brodiaea');
insert into road (id, routeId, distance, roadName) values (88, 16, 1.74, 'Serpentine Sunflower');
insert into road (id, routeId, distance, roadName) values (89, 10, 14.37, 'Gypsoplaca Lichen');
insert into road (id, routeId, distance, roadName) values (90, 15, 22.14, 'Lousewort');
insert into road (id, routeId, distance, roadName) values (91, 4, 26.95, 'Clustered Yellowtops');
insert into road (id, routeId, distance, roadName) values (92, 17, 28.74, 'Short''s Aster');
insert into road (id, routeId, distance, roadName) values (93, 19, 28.06, 'Arctoparmelia Lichen');
insert into road (id, routeId, distance, roadName) values (94, 8, 25.83, 'Horsehair Lichen');
insert into road (id, routeId, distance, roadName) values (95, 15, 21.65, 'Pale Yellow Lupine');
insert into road (id, routeId, distance, roadName) values (96, 16, 16.72, 'Albizia');
insert into road (id, routeId, distance, roadName) values (97, 16, 6.88, 'Smoothleaf Beardtongue');
insert into road (id, routeId, distance, roadName) values (98, 2, 3.51, 'Griffin''s Bellflower');
insert into road (id, routeId, distance, roadName) values (99, 9, 18.99, 'Spleenwort');
insert into road (id, routeId, distance, roadName) values (100, 15, 15.76, 'Sappanwood');


insert into route (id, vehicleId) values (1, 32);
insert into route (id, vehicleId) values (2, 24);
insert into route (id, vehicleId) values (3, 42);
insert into route (id, vehicleId) values (4, 7);
insert into route (id, vehicleId) values (5, 44);
insert into route (id, vehicleId) values (6, 21);
insert into route (id, vehicleId) values (7, 18);
insert into route (id, vehicleId) values (8, 33);
insert into route (id, vehicleId) values (9, 26);
insert into route (id, vehicleId) values (10, 29);
insert into route (id, vehicleId) values (11, 6);
insert into route (id, vehicleId) values (12, 4);
insert into route (id, vehicleId) values (13, 4);
insert into route (id, vehicleId) values (14, 23);
insert into route (id, vehicleId) values (15, 31);
insert into route (id, vehicleId) values (16, 39);
insert into route (id, vehicleId) values (17, 19);
insert into route (id, vehicleId) values (18, 2);
insert into route (id, vehicleId) values (19, 42);
insert into route (id, vehicleId) values (20, 44);


insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (1, '7/4/2021', '5/6/2022', 'DONE', 48, 16, 1);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (2, '12/25/2021', '9/29/2022', 'DONE', 46, 8, 2);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (3, '8/23/2021', '4/9/2022', 'DONE', 46, 42, 3);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (4, '7/31/2021', '6/24/2022', 'WAITING', 50, 6, 4);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (5, '7/3/2021', '9/13/2022', 'DOING', 50, 1, 5);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (6, '12/8/2021', '9/22/2022', 'WAITING', 47, 2, 6);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (7, '6/17/2021', '5/28/2022', 'DONE', 46, 22, 7);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (8, '1/18/2022', '6/8/2022', 'DOING', 47, 36, 8);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (9, '8/18/2021', '6/6/2022', 'DOING', 48, 10, 9);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (10, '12/2/2021', '5/15/2022', 'DONE', 50, 7, 10);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (11, '10/1/2021', '5/9/2022', 'DONE', 48, 25, 11);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (12, '2/16/2022', '3/4/2022', 'WAITING', 49, 31, 12);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (13, '9/20/2021', '5/27/2022', 'DONE', 49, 2, 13);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (14, '9/15/2021', '9/16/2022', 'WAITING', 47, 37, 14);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (15, '10/29/2021', '6/4/2022', 'WAITING', 48, 9, 15);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (16, '6/19/2021', '11/16/2022', 'DONE', 46, 28, 16);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (17, '6/1/2021', '4/19/2022', 'WAITING', 46, 20, 17);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (18, '1/28/2022', '4/24/2022', 'WAITING', 47, 44, 18);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (19, '8/24/2021', '5/16/2022', 'WAITING', 50, 16, 19);
insert into task (id, createTime, workingTime, status, backofficerId, workerId, routeId) values (20, '10/13/2021', '10/20/2022', 'DONE', 47, 3, 20);


insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (1, '0781-7066', 'TRUCK', 'BROKEN', 11.68, 11.75, 24.41);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (2, '0904-6216', 'TROLLER', 'BROKEN', 18.24, 9.96, 22.64);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (3, '62584-639', 'TROLLER', 'GOOD', 19.74, 13.42, 18.82);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (4, '21695-126', 'TRUCK', 'GOOD', 14.69, 6.46, 25.54);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (5, '54868-6262', 'TRUCK', 'BROKEN', 16.13, 6.06, 29.52);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (6, '76077-400', 'TROLLER', 'BROKEN', 19.96, 5.15, 21.49);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (7, '67457-292', 'TROLLER', 'GOOD', 18.12, 7.4, 27.42);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (8, '0054-0264', 'TROLLER', 'BROKEN', 14.37, 12.02, 20.55);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (9, '57520-0438', 'TRUCK', 'BROKEN', 18.97, 8.94, 26.67);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (10, '44183-880', 'TROLLER', 'GOOD', 10.25, 5.98, 26.9);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (11, '16590-214', 'TROLLER', 'GOOD', 10.44, 6.43, 21.43);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (12, '49348-224', 'TRUCK', 'BROKEN', 14.17, 8.7, 18.24);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (13, '0135-0241', 'TRUCK', 'GOOD', 12.74, 12.5, 28.33);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (14, '36800-050', 'TROLLER', 'GOOD', 17.25, 14.68, 18.67);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (15, '0187-5140', 'TRUCK', 'BROKEN', 11.99, 9.66, 18.07);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (16, '57955-7024', 'TROLLER', 'BROKEN', 16.49, 10.52, 20.75);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (17, '43269-711', 'TROLLER', 'GOOD', 14.59, 7.82, 20.37);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (18, '0615-5548', 'TROLLER', 'BROKEN', 12.33, 10.66, 17.3);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (19, '0113-0306', 'TROLLER', 'GOOD', 14.08, 13.2, 28.02);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (20, '13107-077', 'TRUCK', 'GOOD', 12.94, 11.89, 20.74);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (21, '0378-4492', 'TRUCK', 'GOOD', 16.82, 7.31, 20.36);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (22, '58118-1064', 'TROLLER', 'BROKEN', 15.89, 11.35, 23.27);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (23, '68428-058', 'TRUCK', 'BROKEN', 12.85, 5.42, 25.14);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (24, '0003-0857', 'TRUCK', 'BROKEN', 13.86, 8.15, 25.92);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (26, '35356-056', 'TRUCK', 'GOOD', 10.24, 13.13, 21.94);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (27, '24987-436', 'TROLLER', 'BROKEN', 14.57, 12.47, 19.3);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (28, '61957-1042', 'TROLLER', 'GOOD', 14.55, 5.18, 19.45);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (29, '16729-023', 'TROLLER', 'GOOD', 15.83, 7.26, 19.88);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (31, '66336-094', 'TROLLER', 'GOOD', 14.23, 14.45, 19.3);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (32, '66975-351', 'TROLLER', 'GOOD', 16.33, 5.61, 25.2);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (33, '64942-1286', 'TROLLER', 'GOOD', 16.27, 9.43, 15.41);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (34, '0268-0871', 'TROLLER', 'BROKEN', 18.05, 8.01, 22.89);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (35, '0143-9682', 'TROLLER', 'BROKEN', 10.5, 10.81, 28.44);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (37, '54738-903', 'TROLLER', 'BROKEN', 11.51, 13.47, 26.41);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (38, '50021-144', 'TRUCK', 'BROKEN', 15.8, 5.63, 17.32);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (39, '49349-980', 'TROLLER', 'BROKEN', 11.28, 5.31, 19.08);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (41, '50452-221', 'TROLLER', 'GOOD', 14.18, 5.44, 28.2);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (42, '10481-3005', 'TRUCK', 'BROKEN', 17.26, 11.99, 20.61);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (43, '52272-001', 'TROLLER', 'BROKEN', 10.01, 13.73, 26.03);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (44, '65003-008', 'TROLLER', 'GOOD', 18.9, 5.15, 26.67);
insert into vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity) values (45, '29500-9083', 'TROLLER', 'BROKEN', 14.08, 9.09, 29.11);


insert into worker (id, fJanitor, fCollector) values (1, true, false);
insert into worker (id, fJanitor, fCollector) values (2, true, false);
insert into worker (id, fJanitor, fCollector) values (3, true, false);
insert into worker (id, fJanitor, fCollector) values (4, true, false);
insert into worker (id, fJanitor, fCollector) values (5, true, false);
insert into worker (id, fJanitor, fCollector) values (6, true, false);
insert into worker (id, fJanitor, fCollector) values (7, true, false);
insert into worker (id, fJanitor, fCollector) values (8, true, false);
insert into worker (id, fJanitor, fCollector) values (9, true, false);
insert into worker (id, fJanitor, fCollector) values (10, false, true);
insert into worker (id, fJanitor, fCollector) values (11, true, false);
insert into worker (id, fJanitor, fCollector) values (12, true, false);
insert into worker (id, fJanitor, fCollector) values (13, true, false);
insert into worker (id, fJanitor, fCollector) values (14, true, false);
insert into worker (id, fJanitor, fCollector) values (15, true, false);
insert into worker (id, fJanitor, fCollector) values (16, true, false);
insert into worker (id, fJanitor, fCollector) values (17, false, true);
insert into worker (id, fJanitor, fCollector) values (18, true, false);
insert into worker (id, fJanitor, fCollector) values (19, false, true);
insert into worker (id, fJanitor, fCollector) values (20, true, false);
insert into worker (id, fJanitor, fCollector) values (21, true, false);
insert into worker (id, fJanitor, fCollector) values (22, true, false);
insert into worker (id, fJanitor, fCollector) values (23, true, false);
insert into worker (id, fJanitor, fCollector) values (24, true, false);
insert into worker (id, fJanitor, fCollector) values (25, true, false);
insert into worker (id, fJanitor, fCollector) values (26, false, true);
insert into worker (id, fJanitor, fCollector) values (27, false, true);
insert into worker (id, fJanitor, fCollector) values (28, true, false);
insert into worker (id, fJanitor, fCollector) values (29, true, false);
insert into worker (id, fJanitor, fCollector) values (30, true, false);
insert into worker (id, fJanitor, fCollector) values (31, true, false);
insert into worker (id, fJanitor, fCollector) values (32, true, false);
insert into worker (id, fJanitor, fCollector) values (33, false, true);
insert into worker (id, fJanitor, fCollector) values (34, true, false);
insert into worker (id, fJanitor, fCollector) values (35, true, false);
insert into worker (id, fJanitor, fCollector) values (36, false, true);
insert into worker (id, fJanitor, fCollector) values (37, false, true);
insert into worker (id, fJanitor, fCollector) values (38, true, false);
insert into worker (id, fJanitor, fCollector) values (39, true, false);
insert into worker (id, fJanitor, fCollector) values (40, true, false);
insert into worker (id, fJanitor, fCollector) values (41, true, false);
insert into worker (id, fJanitor, fCollector) values (42, false, true);
insert into worker (id, fJanitor, fCollector) values (43, false, true);
insert into worker (id, fJanitor, fCollector) values (44, true, false);
insert into worker (id, fJanitor, fCollector) values (45, true, true);


###### add constraint #######
ALTER TABLE worker ADD CONSTRAINT workerHasAccount FOREIGN KEY (id) REFERENCES account(id);
ALTER TABLE backofficer ADD CONSTRAINT backofficerHasAccount FOREIGN KEY (id) REFERENCES account(id);

ALTER TABLE task ADD CONSTRAINT taskDoneBy FOREIGN KEY (workerId) REFERENCES worker(id);
ALTER TABLE task ADD CONSTRAINT taskCreateBy FOREIGN KEY (backofficerId) REFERENCES backofficer(id);
ALTER TABLE task ADD CONSTRAINT taskHasRoute FOREIGN KEY (routeId) REFERENCES route(id);

ALTER TABLE vehicle ADD CONSTRAINT vehicleManageBy FOREIGN KEY (backofficerId) REFERENCES backofficer(id);

ALTER TABLE manage ADD CONSTRAINT manager FOREIGN KEY (backofficerId) REFERENCES backofficer(id);
ALTER TABLE manage ADD CONSTRAINT managee FOREIGN KEY (workerId) REFERENCES worker(id);

ALTER TABLE road ADD CONSTRAINT roadBelongToRoute FOREIGN KEY (routeId) REFERENCES route(id);

ALTER TABLE route ADD CONSTRAINT routeUseVehicle FOREIGN KEY (vehicleId) REFERENCES vehicle(id);

ALTER TABLE mcpInRoute ADD CONSTRAINT FOREIGN KEY (routeId) REFERENCES route(id);
ALTER TABLE mcpInRoute ADD CONSTRAINT FOREIGN KEY (mcpId) REFERENCES mcp(id);