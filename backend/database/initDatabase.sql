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
        carNumber       VARCHAR(15) UNIQUE,
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
        createTime    DATE                          NOT NULL,
        workingTime   DATE,
        status        ENUM ('WAITING', 'DOING', 'DONE') NOT NULL,
        acceptTime    DATE,
        doneTime      DATE,
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
        startPoint VARCHAR(10),-- NOT NULL,
        endPoint   VARCHAR(10),-- NOT NULL,
        distance   FLOAT NOT NULL,
        roadName   VARCHAR(100),
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
        mcpId   INT,
        PRIMARY KEY (routeId, mcpId)
    );

    CREATE TABLE manage
    (
        backofficerId INT,
        workerId      INT,
        PRIMARY KEY (backofficerId, workerId)
    );

    ######## init data ###########
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (1, 'asilcox0@state.gov', 'xRAWZv5PLN', 'Arne Silcox', '4121478255', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (2, 'bdealey1@java.com', '7QKq8U', 'Bernardine Dealey', '2427946209', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (3, 'sferrant2@walmart.com', 'IyB0Yfulk', 'Saunderson Ferrant', '8444986307', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (4, 'jworboy3@princeton.edu', 'hyMeza', 'Janette Worboy', '5018247340', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (5, 'hmarvin4@uol.com.br', 'NY7iGE', 'Hally Marvin', '1077129681', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (6, 'pstorch5@chron.com', 'YWk0tXVSGLMo', 'Perrine Storch', '7194375348', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (7, 'qsherrard6@hao123.com', 'DGUOMHysve', 'Quinton Sherrard', '2429036977', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (8, 'bfullerd7@fotki.com', 'v9VfkJ1g3zPM', 'Bradan Fullerd', '6093401168', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (9, 'dyackiminie8@php.net', 'YSPX63', 'Daveta Yackiminie', '2945617940', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (10, 'kdanson9@pen.io', 'k0Uetda', 'Kathryn Danson', '4189991643', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (11, 'lwoodroffa@usgs.gov', 'hQsureMJl', 'Lenci Woodroff', '1901199128', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (12, 'pkuhnhardtb@salon.com', 'AgrE6fnhK', 'Peri Kuhnhardt', '8243010875', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (13, 'mesgatec@state.gov', 'LD5PxXy', 'Mirilla Esgate', '4701730896', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (14, 'rolivettad@lulu.com', 'Ilf1F1B', 'Rees Olivetta', '2827605368', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (15, 'hivanaeve@boston.com', 'P9wpmcx5', 'Hermon Ivanaev', '2442302461', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (16, 'gdominellif@deliciousdays.com', 'TGcxzK', 'Giacomo Dominelli', '9149209246', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (17, 'acudbyg@japanpost.jp', 'Qr0OS3jI', 'Artair Cudby', '6352824105', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (18, 'acrinkleyh@webeden.co.uk', 'yzVWRcqMH', 'Abe Crinkley', '9923745218', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (19, 'bfreezeri@skyrock.com', 'Vv3S6266', 'Blinny Freezer', '3309331269', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (20, 'cstickellsj@posterous.com', '4QRHOpPAVOBs', 'Carlos Stickells', '5127310255', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (21, 'jtembridgek@unesco.org', 'pS1F8RrIP5Gv', 'Jacobo Tembridge', '8929730154', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (22, 'gmartinekl@walmart.com', 'dft403mp', 'Gibby Martinek', '9172866216', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (23, 'nebertsm@dailymail.co.uk', '1YVwHyeSamQ', 'Netta Eberts', '9917590229', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (24, 'rpalfreymann@bizjournals.com', 'DPGgiD', 'Rolph Palfreyman', '6343248306', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (25, 'erubanenkoo@indiegogo.com', 'ORRiADAb', 'Elladine Rubanenko', '8679974618', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (26, 'jagnewp@edublogs.org', 'wN8xfRfbJ', 'Jdavie Agnew', '7377355978', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (27, 'moscannillq@list-manage.com', '7X4XWV2Z23', 'Moira O''Scannill', '1245494125', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (28, 'ibulmanr@prnewswire.com', '1Li8nKJgPhqq', 'Imogen Bulman', '9781427410', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (29, 'cestes@pen.io', 'ob8AoyQT', 'Christoffer Este', '1364015781', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (30, 'rseemmondst@issuu.com', '4Ei3ZkR', 'Rania Seemmonds', '6137530448', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (31, 'gbraunsu@discuz.net', '2lLbn6kWD', 'Glenna Brauns', '8866194074', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (32, 'aregglerv@army.mil', 'wmQNH5J3Wx', 'Ardenia Reggler', '8188710222', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (33, 'wgiacoppow@ovh.net', '2autWBTx', 'Willy Giacoppo', '1239806736', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (34, 'kplunketx@utexas.edu', '7lBi8pUE', 'Kristan Plunket', '6056719445', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (35, 'dmaudetty@pinterest.com', 'NWrltUOyr', 'Doy Maudett', '1725384710', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (36, 'lsoitouxz@google.ca', '13YRKccDJGc8', 'Lindon Soitoux', '6703933759', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (37, 'clowdiane10@businessweek.com', 'LrWtbtp', 'Carin Lowdiane', '4541063789', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (38, 'scadge11@imageshack.us', 'csGDPnIJDYhm', 'Shara Cadge', '9136438381', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (39, 'bboldero12@bloomberg.com', 'Y34S4TV', 'Belle Boldero', '2642289218', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (40, 'bdell13@blinklist.com', 'F7WAIW', 'Benita Dell', '3036703998', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (41, 'xmaccallester14@1und1.de', 'B0Uvu4eF7CZ', 'Xerxes MacCallester', '4197072915', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (42, 'bferby15@addtoany.com', 'hDJUYOjvuX', 'Barry Ferby', '2495589874', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (43, 'phousego16@theguardian.com', 'KtwIQYNBYPlT', 'Papageno Housego', '2084229319', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (44, 'skocher17@friendfeed.com', '0wLrUq9qN671', 'Stacy Kocher', '4679482623', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (45, 'urowlstone18@shop-pro.jp', 'UDN5s62jFq1', 'Udell Rowlstone', '9086546730', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (46, 'bdall19@rediff.com', 'QzjvtuG', 'Bendite Dall', '6433979423', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (47, 'rbarnwill1a@myspace.com', 'diLU6X1', 'Rudyard Barnwill', '8326829496', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (48, 'rtefft1b@archive.org', 'jpe6Qyb44D8', 'Roxi Tefft', '4418963508', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (49, 'rbartos1c@liveinternet.ru', 'PZ4R3572qL', 'Rachael Bartos', '4102611484', NULL);
    INSERT INTO account (id, email, password, name, phone, refreshToken)
    VALUES (50, 'aportingale1d@hostgator.com', '5yYi7rSe', 'Aveline Portingale', '4955037410', NULL);


    INSERT INTO backofficer (id)
    VALUES (46);
    INSERT INTO backofficer (id)
    VALUES (47);
    INSERT INTO backofficer (id)
    VALUES (48);
    INSERT INTO backofficer (id)
    VALUES (49);
    INSERT INTO backofficer (id)
    VALUES (50);


    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 4);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 18);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 20);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 25);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 28);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 31);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 30);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 21);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 3);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 1);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 23);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 9);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 9);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 15);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 34);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 30);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 29);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 7);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 25);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 39);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 13);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 24);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 29);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 38);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 3);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 23);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 4);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 12);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 39);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 38);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 10);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 12);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 13);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 2);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 25);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 14);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 32);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 18);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 8);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 13);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 19);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 23);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 32);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 6);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 22);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 6);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 37);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 14);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 30);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 40);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 22);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 26);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 42);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 35);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 26);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 10);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 22);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 37);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 27);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 23);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 11);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 15);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 44);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (49, 27);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 42);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 4);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 42);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 40);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 28);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 34);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 9);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 33);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 44);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (50, 37);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (48, 43);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (46, 8);
    INSERT INTO manage (backofficerId, workerId)
    VALUES (47, 19);


    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (1, 11.06, 13.11, 'ONLINE', '7 Maryland Court');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (2, 12.09, 18.45, 'DISCONNECTED', '15 Heath Plaza');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (3, 14.71, 21.25, 'ONLINE', '9 Porter Point');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (4, 28.16, 10.17, 'ONLINE', '931 Hagan Plaza');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (5, 14.69, 17.74, 'DISCONNECTED', '057 Red Cloud Circle');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (6, 16.07, 27.42, 'ONLINE', '9591 Darwin Lane');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (7, 19.5, 26.37, 'ONLINE', '2 Ronald Regan Plaza');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (8, 21.38, 26.36, 'ONLINE', '1867 Mallard Point');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (9, 26.39, 25.34, 'DISCONNECTED', '8347 Arrowood Pass');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (10, 15.47, 11.87, 'ONLINE', '0249 Muir Plaza');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (11, 16.94, 12.64, 'ONLINE', '60 Steensland Terrace');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (12, 18.73, 25.98, 'ONLINE', '75192 Bartillon Park');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (13, 25.77, 16.54, 'DISCONNECTED', '225 Linden Center');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (14, 28.96, 12.36, 'ONLINE', '79 Saint Paul Street');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (15, 16.78, 29.32, 'ONLINE', '053 Macpherson Drive');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (16, 23.57, 26.86, 'ONLINE', '1776 Lien Pass');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (17, 23.59, 20.22, 'ONLINE', '7069 Kinsman Road');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (18, 14.91, 24.71, 'ONLINE', '61 Anhalt Hill');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (19, 11.17, 12.94, 'ONLINE', '53 Grover Center');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (20, 23.67, 16.4, 'ONLINE', '81 Hanson Pass');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (21, 14.66, 18.43, 'ONLINE', '9 Westerfield Street');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (22, 15.74, 29.88, 'ONLINE', '803 Maywood Junction');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (23, 28.11, 15.92, 'ONLINE', '974 Derek Court');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (24, 15.86, 23.05, 'ONLINE', '34 Bellgrove Pass');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (25, 22.08, 15.64, 'ONLINE', '506 Portage Parkway');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (26, 23.75, 29.29, 'ONLINE', '731 Carey Alley');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (27, 17.59, 14.43, 'ONLINE', '72 Novick Alley');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (28, 13.17, 26.56, 'ONLINE', '953 Hollow Ridge Center');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (29, 23.11, 14.85, 'ONLINE', '9 Carpenter Crossing');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (30, 11.9, 16.21, 'ONLINE', '1 Derek Hill');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (31, 24.79, 16.05, 'ONLINE', '1377 Novick Plaza');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (32, 13.89, 18.26, 'ONLINE', '90 Linden Alley');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (33, 27.52, 27.75, 'ONLINE', '67412 Buell Road');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (34, 19.8, 15.41, 'OFFLINE', '4 6th Center');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (35, 15.4, 16.77, 'DISCONNECTED', '73453 Kinsman Junction');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (36, 13.8, 10.87, 'ONLINE', '263 Ludington Place');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (37, 16.18, 27.69, 'OFFLINE', '7276 Bartillon Junction');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (38, 23.92, 13.46, 'OFFLINE', '98 Transport Circle');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (39, 27.43, 27.6, 'DISCONNECTED', '2543 Bunting Place');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (40, 12.19, 28.95, 'OFFLINE', '02359 Shopko Avenue');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (41, 20.37, 20.36, 'DISCONNECTED', '7136 Petterle Street');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (42, 17.19, 17.69, 'OFFLINE', '983 Debs Hill');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (43, 11.57, 24.76, 'ONLINE', '462 Sherman Circle');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (44, 16.54, 27.95, 'DISCONNECTED', '89869 Jenifer Drive');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (45, 10.47, 22.37, 'OFFLINE', '293 Gerald Trail');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (46, 11.42, 16.97, 'ONLINE', '6506 Green Road');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (47, 24.7, 18.58, 'ONLINE', '5 Delladonna Court');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (48, 17.01, 21.9, 'OFFLINE', '526 Nancy Crossing');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (49, 18.06, 29.0, 'OFFLINE', '6 Blackbird Lane');
    INSERT INTO mcp (id, totalCapacity, inUse, status, address)
    VALUES (50, 24.5, 13.97, 'DISCONNECTED', '760 Upham Avenue');


    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (7, 17);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (20, 50);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (3, 3);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (11, 20);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (18, 49);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 9);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (15, 29);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (1, 5);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 7);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (2, 45);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 18);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (17, 32);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 28);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (10, 40);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (4, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 24);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (1, 16);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 42);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (20, 11);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (10, 14);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (15, 9);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (3, 21);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (1, 48);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (11, 15);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 36);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 19);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (11, 34);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 33);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (20, 10);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (15, 47);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (10, 39);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 38);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 40);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (11, 7);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 5);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (14, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 27);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (12, 19);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (7, 36);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (14, 18);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (10, 34);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 21);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (1, 43);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (11, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (14, 47);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (7, 41);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (12, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 42);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 10);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (4, 26);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (6, 45);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (4, 50);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 17);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (8, 24);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (2, 27);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 11);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 38);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (14, 16);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 34);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (18, 3);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (12, 2);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 13);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 16);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (14, 39);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (2, 36);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (2, 38);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 33);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 18);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (14, 13);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 27);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (2, 25);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (10, 11);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (4, 18);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 16);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (10, 45);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (7, 21);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (1, 31);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (7, 19);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 34);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 30);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 7);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 17);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (13, 38);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 23);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (5, 49);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 9);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (17, 42);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (19, 13);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (9, 42);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 38);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (8, 42);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (16, 18);
    INSERT INTO mcpInRoute (routeId, mcpId)
    VALUES (4, 45);


    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (1, 18, 16.67, 'Fiddleleaf Hawksbeard');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (2, 6, 28.51, 'Texas Bristlegrass');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (3, 7, 26.71, 'Grand Fringed Gentian');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (4, 15, 27.82, 'Heufler''s Cracked Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (5, 13, 7.16, 'Acuminate Pleuridium Moss');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (6, 4, 18.83, 'Eggyolk Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (7, 14, 14.79, 'Polytrichum Moss');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (8, 12, 14.36, 'Inyo Beardtongue');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (9, 19, 5.64, 'Fewflower Hairsedge');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (10, 2, 6.88, 'Cape Sundew');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (11, 2, 2.31, 'Havaas'' Navel Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (12, 20, 26.86, 'Neofuscelia Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (13, 11, 21.54, 'Ctenidium Moss');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (14, 6, 26.6, 'Oceanspray');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (15, 16, 23.81, 'Roundleaf Buckwheat');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (16, 7, 3.68, 'Southern Dawnflower');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (17, 19, 28.67, 'Deane''s Wirelettuce');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (18, 13, 9.54, 'Kidneyshape Dot Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (19, 15, 28.12, 'Manzanilla Horseweed');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (20, 3, 21.23, 'Silk-cotton Tree');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (21, 7, 12.33, 'Graceful Necklace Fern');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (22, 15, 27.44, 'Arid Tansyaster');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (23, 16, 23.64, 'Sierra Lewisia');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (24, 20, 17.69, 'American Eelgrass');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (25, 11, 27.28, 'Hoover''s Manzanita');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (26, 9, 26.87, 'Snowrose');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (27, 1, 18.38, 'Hedgemustard');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (28, 9, 5.43, 'Yellow Pincushion');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (29, 3, 9.92, 'Silvery Everlasting');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (30, 4, 13.56, 'Eastern Featherbells');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (31, 18, 11.24, 'Prairie Milkvine');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (32, 4, 16.96, 'Bear River Fleabane');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (33, 17, 24.81, 'Foxtail Prairie Clover');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (34, 8, 19.41, 'Armenia Tephromela Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (35, 13, 15.48, 'Sierra False Bindweed');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (36, 18, 6.03, 'Necklacepod');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (37, 6, 17.99, 'Andean Walnut');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (38, 13, 9.1, 'Gregg''s Ash');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (39, 10, 14.63, 'Pink Funnel Lily');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (40, 16, 3.53, 'Allen Verbena');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (41, 11, 13.67, 'Tanoak');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (42, 16, 29.97, 'Pink Campion');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (43, 8, 7.88, 'Whipple''s Claopodium Moss');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (44, 17, 22.67, 'Western Oat');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (45, 3, 21.46, 'Picabo Milkvetch');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (46, 15, 16.54, 'Slash Pine');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (47, 2, 3.82, 'Maui Sedge');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (48, 9, 7.29, 'Sandloving Monkeyflower');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (49, 18, 21.44, 'Ridgetop Schiedea');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (50, 2, 1.49, 'Pancratium');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (51, 9, 1.27, 'Howell''s Mariposa Lily');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (52, 3, 7.22, 'Bahiagrass');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (53, 6, 25.83, 'Crownscale');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (54, 3, 27.9, 'Shortspur Seablush');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (55, 7, 1.44, 'Bristlegrass');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (56, 15, 6.26, 'Drummond''s Pohlia Moss');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (57, 1, 9.21, 'Ground Rose');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (58, 20, 26.36, 'Suksdorf''s Milkvetch');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (59, 14, 20.43, 'Japanese Yam');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (60, 2, 22.59, 'Tropical Fanleaf');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (61, 18, 3.15, 'Fineleaf Hymenopappus');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (62, 7, 4.38, 'Alpine Beard Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (63, 3, 22.16, 'Small Skullcap');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (64, 7, 1.27, 'Ragweed Sagebrush');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (65, 9, 28.26, 'Key West Heliotrope');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (66, 3, 15.7, 'Coastal Sneezeweed');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (67, 4, 2.66, 'Penthorum');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (68, 20, 17.48, 'Tall Blazing Star');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (69, 19, 16.85, 'Dwarf Crownbeard');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (70, 3, 18.56, 'Kaibab Bladderpod');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (71, 11, 17.09, 'Blue Huckleberry');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (72, 6, 7.62, 'Achiotillo');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (73, 15, 16.83, 'Wart Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (74, 3, 27.68, 'Lemonyellow False Goldenaster');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (75, 11, 15.17, 'Hybrid Hawthorn');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (76, 10, 25.98, 'Prairie Rose');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (77, 14, 15.05, 'Palmer''s Bluestar');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (78, 1, 9.67, 'Evergreen Sumac');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (79, 14, 25.97, 'Spreading Minerslettuce');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (80, 11, 13.02, 'Elderberry');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (81, 8, 27.54, 'Polished Maidenhair');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (82, 8, 15.3, 'Coffeetree');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (83, 15, 29.0, 'Western Sedge');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (84, 9, 17.17, 'Soldierbush');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (85, 10, 3.83, 'Urban''s Lovegrass');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (86, 5, 17.89, 'Mojave Seablite');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (87, 15, 1.22, 'Golden Brodiaea');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (88, 16, 1.74, 'Serpentine Sunflower');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (89, 10, 14.37, 'Gypsoplaca Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (90, 15, 22.14, 'Lousewort');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (91, 4, 26.95, 'Clustered Yellowtops');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (92, 17, 28.74, 'Short''s Aster');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (93, 19, 28.06, 'Arctoparmelia Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (94, 8, 25.83, 'Horsehair Lichen');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (95, 15, 21.65, 'Pale Yellow Lupine');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (96, 16, 16.72, 'Albizia');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (97, 16, 6.88, 'Smoothleaf Beardtongue');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (98, 2, 3.51, 'Griffin''s Bellflower');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (99, 9, 18.99, 'Spleenwort');
    INSERT INTO road (id, routeId, distance, roadName)
    VALUES (100, 15, 15.76, 'Sappanwood');


    INSERT INTO route (id, vehicleId)
    VALUES (1, 32);
    INSERT INTO route (id, vehicleId)
    VALUES (2, 24);
    INSERT INTO route (id, vehicleId)
    VALUES (3, 42);
    INSERT INTO route (id, vehicleId)
    VALUES (4, 7);
    INSERT INTO route (id, vehicleId)
    VALUES (5, 44);
    INSERT INTO route (id, vehicleId)
    VALUES (6, 21);
    INSERT INTO route (id, vehicleId)
    VALUES (7, 18);
    INSERT INTO route (id, vehicleId)
    VALUES (8, 33);
    INSERT INTO route (id, vehicleId)
    VALUES (9, 26);
    INSERT INTO route (id, vehicleId)
    VALUES (10, 29);
    INSERT INTO route (id, vehicleId)
    VALUES (11, 6);
    INSERT INTO route (id, vehicleId)
    VALUES (12, 4);
    INSERT INTO route (id, vehicleId)
    VALUES (13, 4);
    INSERT INTO route (id, vehicleId)
    VALUES (14, 23);
    INSERT INTO route (id, vehicleId)
    VALUES (15, 31);
    INSERT INTO route (id, vehicleId)
    VALUES (16, 39);
    INSERT INTO route (id, vehicleId)
    VALUES (17, 19);
    INSERT INTO route (id, vehicleId)
    VALUES (18, 2);
    INSERT INTO route (id, vehicleId)
    VALUES (19, 42);
    INSERT INTO route (id, vehicleId)
    VALUES (20, 44);


    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (1, STR_TO_DATE('7/4/2021', '%m/%d/%Y'), STR_TO_DATE('5/6/2022', '%m/%d/%Y'), 'DONE', 48, 16, 1);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (2, STR_TO_DATE('12/25/2021', '%m/%d/%Y'), STR_TO_DATE('9/29/2022', '%m/%d/%Y'), 'DONE', 46, 8, 2);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (3, STR_TO_DATE('8/23/2021', '%m/%d/%Y'), STR_TO_DATE('4/9/2022', '%m/%d/%Y'), 'DONE', 46, 42, 3);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (4, STR_TO_DATE('7/31/2021', '%m/%d/%Y'), STR_TO_DATE('6/24/2022', '%m/%d/%Y'), 'WAITING', 50, 6, 4);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (5, STR_TO_DATE('7/3/2021', '%m/%d/%Y'), STR_TO_DATE('9/13/2022', '%m/%d/%Y'), 'DOING', 50, 1, 5);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (6, STR_TO_DATE('12/8/2021', '%m/%d/%Y'), STR_TO_DATE('9/22/2022', '%m/%d/%Y'), 'WAITING', 47, 2, 6);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (7, STR_TO_DATE('6/17/2021', '%m/%d/%Y'), STR_TO_DATE('5/28/2022', '%m/%d/%Y'), 'DONE', 46, 22, 7);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (8, STR_TO_DATE('1/18/2022', '%m/%d/%Y'), STR_TO_DATE('6/8/2022', '%m/%d/%Y'), 'DOING', 47, 36, 8);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (9, STR_TO_DATE('8/18/2021', '%m/%d/%Y'), STR_TO_DATE('6/6/2022', '%m/%d/%Y'), 'DOING', 48, 10, 9);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (10, STR_TO_DATE('12/2/2021', '%m/%d/%Y'), STR_TO_DATE('5/15/2022', '%m/%d/%Y'), 'DONE', 50, 7, 10);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (11, STR_TO_DATE('10/1/2021', '%m/%d/%Y'), STR_TO_DATE('5/9/2022', '%m/%d/%Y'), 'DONE', 48, 25, 11);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (12, STR_TO_DATE('2/16/2022', '%m/%d/%Y'), STR_TO_DATE('3/4/2022', '%m/%d/%Y'), 'WAITING', 49, 31, 12);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (13, STR_TO_DATE('9/20/2021', '%m/%d/%Y'), STR_TO_DATE('5/27/2022', '%m/%d/%Y'), 'DONE', 49, 2, 13);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (14, STR_TO_DATE('9/15/2021', '%m/%d/%Y'), STR_TO_DATE('9/16/2022', '%m/%d/%Y'), 'WAITING', 47, 37, 14);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (15, STR_TO_DATE('10/29/2021', '%m/%d/%Y'), STR_TO_DATE('6/4/2022', '%m/%d/%Y'), 'WAITING', 48, 9, 15);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (16, STR_TO_DATE('6/19/2021', '%m/%d/%Y'), STR_TO_DATE('11/16/2022', '%m/%d/%Y'), 'DONE', 46, 28, 16);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (17, STR_TO_DATE('6/1/2021', '%m/%d/%Y'), STR_TO_DATE('4/19/2022', '%m/%d/%Y'), 'WAITING', 46, 20, 17);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (18, STR_TO_DATE('1/28/2022', '%m/%d/%Y'), STR_TO_DATE('4/24/2022', '%m/%d/%Y'), 'WAITING', 47, 44, 18);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (19, STR_TO_DATE('8/24/2021', '%m/%d/%Y'), STR_TO_DATE('5/16/2022', '%m/%d/%Y'), 'WAITING', 50, 16, 19);
    INSERT INTO task (id, createTime, workingTime, status, backofficerId, workerId, routeId)
    VALUES (20, STR_TO_DATE('10/13/2021', '%m/%d/%Y'), STR_TO_DATE('10/20/2022', '%m/%d/%Y'), 'DONE', 47, 3, 20);


    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (1, '0781-7066', 'TRUCK', 'BROKEN', 11.68, 11.75, 24.41);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (2, '0904-6216', 'TROLLER', 'BROKEN', 18.24, 9.96, 22.64);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (3, '62584-639', 'TROLLER', 'GOOD', 19.74, 13.42, 18.82);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (4, '21695-126', 'TRUCK', 'GOOD', 14.69, 6.46, 25.54);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (5, '54868-6262', 'TRUCK', 'BROKEN', 16.13, 6.06, 29.52);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (6, '76077-400', 'TROLLER', 'BROKEN', 19.96, 5.15, 21.49);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (7, '67457-292', 'TROLLER', 'GOOD', 18.12, 7.4, 27.42);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (8, '0054-0264', 'TROLLER', 'BROKEN', 14.37, 12.02, 20.55);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (9, '57520-0438', 'TRUCK', 'BROKEN', 18.97, 8.94, 26.67);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (10, '44183-880', 'TROLLER', 'GOOD', 10.25, 5.98, 26.9);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (11, '16590-214', 'TROLLER', 'GOOD', 10.44, 6.43, 21.43);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (12, '49348-224', 'TRUCK', 'BROKEN', 14.17, 8.7, 18.24);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (13, '0135-0241', 'TRUCK', 'GOOD', 12.74, 12.5, 28.33);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (14, '36800-050', 'TROLLER', 'GOOD', 17.25, 14.68, 18.67);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (15, '0187-5140', 'TRUCK', 'BROKEN', 11.99, 9.66, 18.07);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (16, '57955-7024', 'TROLLER', 'BROKEN', 16.49, 10.52, 20.75);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (17, '43269-711', 'TROLLER', 'GOOD', 14.59, 7.82, 20.37);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (18, '0615-5548', 'TROLLER', 'BROKEN', 12.33, 10.66, 17.3);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (19, '0113-0306', 'TROLLER', 'GOOD', 14.08, 13.2, 28.02);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (20, '13107-077', 'TRUCK', 'GOOD', 12.94, 11.89, 20.74);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (21, '0378-4492', 'TRUCK', 'GOOD', 16.82, 7.31, 20.36);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (22, '58118-1064', 'TROLLER', 'BROKEN', 15.89, 11.35, 23.27);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (23, '68428-058', 'TRUCK', 'BROKEN', 12.85, 5.42, 25.14);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (24, '0003-0857', 'TRUCK', 'BROKEN', 13.86, 8.15, 25.92);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (26, '35356-056', 'TRUCK', 'GOOD', 10.24, 13.13, 21.94);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (27, '24987-436', 'TROLLER', 'BROKEN', 14.57, 12.47, 19.3);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (28, '61957-1042', 'TROLLER', 'GOOD', 14.55, 5.18, 19.45);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (29, '16729-023', 'TROLLER', 'GOOD', 15.83, 7.26, 19.88);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (31, '66336-094', 'TROLLER', 'GOOD', 14.23, 14.45, 19.3);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (32, '66975-351', 'TROLLER', 'GOOD', 16.33, 5.61, 25.2);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (33, '64942-1286', 'TROLLER', 'GOOD', 16.27, 9.43, 15.41);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (34, '0268-0871', 'TROLLER', 'BROKEN', 18.05, 8.01, 22.89);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (35, '0143-9682', 'TROLLER', 'BROKEN', 10.5, 10.81, 28.44);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (37, '54738-903', 'TROLLER', 'BROKEN', 11.51, 13.47, 26.41);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (38, '50021-144', 'TRUCK', 'BROKEN', 15.8, 5.63, 17.32);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (39, '49349-980', 'TROLLER', 'BROKEN', 11.28, 5.31, 19.08);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (41, '50452-221', 'TROLLER', 'GOOD', 14.18, 5.44, 28.2);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (42, '10481-3005', 'TRUCK', 'BROKEN', 17.26, 11.99, 20.61);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (43, '52272-001', 'TROLLER', 'BROKEN', 10.01, 13.73, 26.03);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (44, '65003-008', 'TROLLER', 'GOOD', 18.9, 5.15, 26.67);
    INSERT INTO vehicle (id, carNumber, type, status, weight, fuelConsumption, capacity)
    VALUES (45, '29500-9083', 'TROLLER', 'BROKEN', 14.08, 9.09, 29.11);


    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (1, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (2, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (3, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (4, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (5, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (6, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (7, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (8, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (9, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (10, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (11, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (12, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (13, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (14, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (15, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (16, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (17, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (18, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (19, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (20, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (21, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (22, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (23, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (24, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (25, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (26, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (27, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (28, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (29, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (30, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (31, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (32, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (33, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (34, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (35, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (36, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (37, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (38, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (39, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (40, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (41, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (42, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (43, FALSE, TRUE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (44, TRUE, FALSE);
    INSERT INTO worker (id, fJanitor, fCollector)
    VALUES (45, TRUE, TRUE);


    ###### add constraint #######
    ALTER TABLE worker
        ADD CONSTRAINT workerHasAccount FOREIGN KEY (id) REFERENCES account (id) ON DELETE CASCADE;
    ALTER TABLE backofficer
        ADD CONSTRAINT backofficerHasAccount FOREIGN KEY (id) REFERENCES account (id) ON DELETE CASCADE;

    ALTER TABLE task
        ADD CONSTRAINT taskDoneBy FOREIGN KEY (workerId) REFERENCES worker (id) ON DELETE SET NULL;
    ALTER TABLE task
        ADD CONSTRAINT taskCreateBy FOREIGN KEY (backofficerId) REFERENCES backofficer (id) ON DELETE SET NULL;
    ALTER TABLE task
        ADD CONSTRAINT taskHasRoute FOREIGN KEY (routeId) REFERENCES route (id) ON DELETE SET NULL;

    ALTER TABLE vehicle
        ADD CONSTRAINT vehicleManageBy FOREIGN KEY (backofficerId) REFERENCES backofficer (id) ON DELETE SET NULL;

    ALTER TABLE manage
        ADD CONSTRAINT manager FOREIGN KEY (backofficerId) REFERENCES backofficer (id) ON DELETE CASCADE;
    ALTER TABLE manage
        ADD CONSTRAINT managee FOREIGN KEY (workerId) REFERENCES worker (id) ON DELETE CASCADE;

    ALTER TABLE road
        ADD CONSTRAINT roadBelongToRoute FOREIGN KEY (routeId) REFERENCES route (id) ON DELETE CASCADE ;

    ALTER TABLE route
        ADD CONSTRAINT routeUseVehicle FOREIGN KEY (vehicleId) REFERENCES vehicle (id) ON DELETE SET NULL;

    ALTER TABLE mcpInRoute
        ADD CONSTRAINT FOREIGN KEY (routeId) REFERENCES route (id) ON DELETE CASCADE;
    ALTER TABLE mcpInRoute
        ADD CONSTRAINT FOREIGN KEY (mcpId) REFERENCES mcp (id);


    DELIMITER $$
    CREATE OR REPLACE FUNCTION isAccountExit(inputId INT) RETURNS BOOLEAN
        DETERMINISTIC
    BEGIN
        RETURN (EXISTS(SELECT id FROM account WHERE id = inputId));
    END;
    $$
    DELIMITER ;

    CREATE OR REPLACE PROCEDURE getTaskByWorker(IN userId INT)
    BEGIN
        IF NOT EXISTS(SELECT id FROM worker WHERE id = userId) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid id';
        END IF;

        START TRANSACTION;
        SELECT T.id,
               T.createTime,
               T.workingTime,
               T.status,
               T.acceptTime,
               T.doneTime,
               T.routeId,
               BO.name AS createBy,
               WO.name AS doneBy
        FROM task T,
         account BO,
         account WO
    WHERE T.backofficerId = BO.id
      AND WO.id = T.workerId
      AND T.workerId = userId;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE insertTask(IN workingTime DATE, IN status VARCHAR(10), IN backofficerId INT,
                                       IN workerId INT, IN routeId INT)
BEGIN
    IF (workingTime IS NULL || LENGTH(workingTime) = 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'working time is empty';
    END IF;
    IF (STRCMP(status, 'WAITING') != 0 && STRCMP(status, 'DOING') != 0 && STRCMP(status, 'DONE') != 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid status value';
    END IF;
    IF NOT EXISTS(SELECT id FROM backofficer WHERE id = backofficerId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid back officer id';
    END IF;
    IF NOT EXISTS(SELECT id FROM worker WHERE id = workerId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid worker id';
    END IF;
    IF NOT EXISTS(SELECT id FROM route WHERE id = routeId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid route id';
    END IF;

    START TRANSACTION;
    INSERT INTO task(createTime, workingTime, status, acceptTime, doneTime, backofficerId, workerId,
                     routeId) VALUE (CURDATE(), workingTime, status, NULL, NULL, backofficerId, workerId, routeId);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE updateTaskAcceptTime(IN acceptTime VARCHAR(20), IN taskId INT)
BEGIN
    IF NOT EXISTS(SELECT id FROM task WHERE id = taskId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid id';
    END IF;
    IF (acceptTime IS NULL || LENGTH(acceptTime) = 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'accept time is empty';
    END IF;

    START TRANSACTION;
    UPDATE task SET acceptTime = acceptTime WHERE id = taskId;
    COMMIT ;
END;

CREATE OR REPLACE PROCEDURE updateTaskDoneTime(IN doneTime VARCHAR(20), IN taskId INT)
BEGIN
    IF NOT EXISTS(SELECT id FROM task WHERE id = taskId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid id';
    END IF;
    IF (doneTime IS NULL || LENGTH(doneTime) = 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'done time is empty';
    END IF;

    START TRANSACTION;
    UPDATE task SET doneTime = doneTime WHERE id = taskId;
    COMMIT ;
END;

CREATE OR REPLACE PROCEDURE appendRoadToRoute(IN roadId INT, IN routeId INT)
BEGIN
    IF NOT EXISTS(SELECT * FROM road WHERE id = roadId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = _utf8 'invalid road id';
    END IF;
END;
