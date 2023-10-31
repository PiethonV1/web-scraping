CREATE TABLE Company(
Ticker VARCHAR (15),
Company_Name VARCHAR (50),
PRIMARY KEY (Ticker)
);

INSERT INTO Company VALUES
("GOOGL", "ALPHABET InC Class A"),
("FB", "Meta Platforms Inc");


/* Weak entity, depend on Strong entity: Company
It doesn't not have PRIMARY KEY*/
CREATE TABLE Stock(
Ticker VARCHAR (15),
_date DATE,
Open_Price DECIMAL(6,2),
High DECIMAL(6,2),
Low DECIMAL(6,2),
Close_price DECIMAL(6,2),
Adj_Close DECIMAL(6,2),
Volume INT,
FOREIGN KEY (Ticker) REFERENCES Company(Ticker)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Stock VALUES
(),
();


CREATE TABLE User(
MemberID INT UNSIGNED AUTO_INCREMENT,
UserName VARCHAR(20) NOT NULL,
Email_Addr VARCHAR(100) CHECK (Email_Addr IN ('abcdefghijiklmno', 'ABCDEF','~!@#$%_^&*()')),
Account_Passwd VARCHAR(50) CHECK (Email_Addr IN ('abcdefghijiklmno', 'ABCDEF','~!@#$%_^&*()')),
PRIMARY KEY(MemberID)
);


INSERT INTO User VALUES
(),
();



/* many-to-many relationship*/
CREATE TABLE USER_SELECT_COMPANY( 
Ticker VARCHAR (15),
MemberID INT UNSIGNED AUTO_INCREMENT,
Quantity SMALLINT AUTO_INCREMENT,
FOREIGN KEY (Ticker) REFERENCES Company(Ticker)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (MemberID) REFERENCES User(MemberID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO USER_SELECT_COMPANY VALUES
(),
();




/* Tentative attributions */
CREATE TABLE Forecast(
Interested_date DATE,
Ticker ARCHAR (15),
Trend DECIMAL(6,4),
yhat_lower DECIMAL(8,4),
yhat_upper DECIMAL(8,4),
trend_upper DECIMAL(10,4),
Addictive_terms DECIMAL(5,4),
PRIMARY KEY (Interested_date),
FOREIGN KEY (Ticker) REFERENCES Company(Ticker)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Forecast VALUES
(),
();


/* many-to-many relationship*/
CREATE TABLE User_Has_Forecast(
Interested_date DATE,
MemberID INT UNSIGNED AUTO_INCREMENT,
FOREIGN KEY (MemberID) REFERENCES User(MemberID)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (Interested_date) REFERENCES Forecast(Interested_date)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO User_Has_Forecast VALUES
(),
();
