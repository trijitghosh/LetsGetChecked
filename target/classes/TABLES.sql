CREATE TABLE DimAccount(
	AccountKey int PRIMARY KEY,
	ParentAccountKey int NULL,
	AccountCodeAlternateKey int NULL,
	ParentAccountCodeAlternateKey int NULL,
	AccountDescription varchar(50) NULL,
	AccountType varchar(50) NULL,
	Operator varchar(50) NULL,
	CustomMembers varchar(300) NULL,
	ValueType varchar(50) NULL,
	CustomMemberOptions varchar(200) NULL
);


CREATE TABLE DimCurrency(
	CurrencyKey int PRIMARY KEY,
	CurrencyAlternateKey CHAR(3) NOT NULL,
	CurrencyName varchar(50) NOT NULL
);


CREATE TABLE DimCustomer(
	CustomerKey int PRIMARY KEY,
	GeographyKey int NULL,
	CustomerAlternateKey varchar(15) NOT NULL,
	Title varchar(8) NULL,
	FirstName varchar(50) NULL,
	MiddleName varchar(50) NULL,
	LastName varchar(50) NULL,
	NameStyle BOOLEAN NULL,
	BirthDate date NULL,
	MaritalStatus CHAR(1) NULL,
	Suffix varchar(10) NULL,
	Gender varchar(1) NULL,
	EmailAddress varchar(50) NULL,
	YearlyIncome DECIMAL(19,4) NULL,
	TotalChildren tinyint NULL,
	NumberChildrenAtHome tinyint NULL,
	EnglishEducation varchar(40) NULL,
	SpanishEducation varchar(40) NULL,
	FrenchEducation varchar(40) NULL,
	EnglishOccupation varchar(100) NULL,
	SpanishOccupation varchar(100) NULL,
	FrenchOccupation varchar(100) NULL,
	HouseOwnerFlag CHAR(1) NULL,
	NumberCarsOwned tinyint NULL,
	AddressLine1 varchar(120) NULL,
	AddressLine2 varchar(120) NULL,
	Phone varchar(20) NULL,
	DateFirstPurchase date NULL,
	CommuteDistance varchar(15) NULL
);


CREATE TABLE DimDate(
	DateKey int NOT NULL,
	FullDateAlternateKey date NOT NULL,
	DayNumberOfWeek tinyint NOT NULL,
	EnglishDayNameOfWeek varchar(10) NOT NULL,
	SpanishDayNameOfWeek varchar(10) NOT NULL,
	FrenchDayNameOfWeek varchar(10) NOT NULL,
	DayNumberOfMonth tinyint NOT NULL,
	DayNumberOfYear smallint NOT NULL,
	WeekNumberOfYear tinyint NOT NULL,
	EnglishMonthName varchar(10) NOT NULL,
	SpanishMonthName varchar(10) NOT NULL,
	FrenchMonthName varchar(10) NOT NULL,
	MonthNumberOfYear tinyint NOT NULL,
	CalendarQuarter tinyint NOT NULL,
	CalendarYear smallint NOT NULL,
	CalendarSemester tinyint NOT NULL,
	FiscalQuarter tinyint NOT NULL,
	FiscalYear smallint NOT NULL,
	FiscalSemester tinyint NOT NULL
);


CREATE TABLE DimDepartmentGroup(
	DepartmentGroupKey int PRIMARY KEY,
	ParentDepartmentGroupKey int NULL,
	DepartmentGroupName varchar(50) NULL
);


CREATE TABLE DimEmployee(
	EmployeeKey int PRIMARY KEY,
	ParentEmployeeKey int NULL,
	EmployeeNationalIDAlternateKey varchar(15) NULL,
	ParentEmployeeNationalIDAlternateKey varchar(15) NULL,
	SalesTerritoryKey int NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	MiddleName varchar(50) NULL,
	NameStyle BOOLEAN NOT NULL,
	Title varchar(50) NULL,
	HireDate date NULL,
	BirthDate date NULL,
	LoginID varchar(256) NULL,
	EmailAddress varchar(50) NULL,
	Phone varchar(25) NULL,
	MaritalStatus CHAR(1) NULL,
	EmergencyContactName varchar(50) NULL,
	EmergencyContactPhone varchar(25) NULL,
	SalariedFlag BOOLEAN NULL,
	Gender CHAR(1) NULL,
	PayFrequency tinyint NULL,
	BaseRate DECIMAL(19,4) NULL,
	VacationHours smallint NULL,
	SickLeaveHours smallint NULL,
	CurrentFlag BOOLEAN NOT NULL,
	SalesPersonFlag BOOLEAN NOT NULL,
	DepartmentName varchar(50) NULL,
	StartDate date NULL,
	EndDate date NULL,
	Status varchar(50) NULL,
	EmployeePhoto varbinary NULL
);


CREATE TABLE DimGeography(
	GeographyKey int PRIMARY KEY,
	City varchar(30) NULL,
	StateProvinceCode varchar(3) NULL,
	StateProvinceName varchar(50) NULL,
	CountryRegionCode varchar(3) NULL,
	EnglishCountryRegionName varchar(50) NULL,
	SpanishCountryRegionName varchar(50) NULL,
	FrenchCountryRegionName varchar(50) NULL,
	PostalCode varchar(15) NULL,
	SalesTerritoryKey int NULL,
	IpAddressLocator varchar(15) NULL
);


CREATE TABLE DimOrganization(
	OrganizationKey int PRIMARY KEY,
	ParentOrganizationKey int NULL,
	PercentageOfOwnership varchar(16) NULL,
	OrganizationName varchar(50) NULL,
	CurrencyKey int NULL
);


CREATE TABLE DimProduct(
	ProductKey int PRIMARY KEY,
	ProductAlternateKey varchar(25) NULL,
	ProductSubcateryKey int NULL,
	WeightUnitMeasureCode CHAR(3) NULL,
	SizeUnitMeasureCode CHAR(3) NULL,
	EnglishProductName varchar(50) NOT NULL,
	SpanishProductName varchar(50) NOT NULL,
	FrenchProductName varchar(50) NOT NULL,
	StandardCost DECIMAL(19,4) NULL,
	FinishedodsFlag BOOLEAN NOT NULL,
	Color varchar(15) NOT NULL,
	SafetyStockLevel smallint NULL,
	ReorderPoint smallint NULL,
	ListPrice DECIMAL(19,4) NULL,
	Size varchar(50) NULL,
	SizeRange varchar(50) NULL,
	Weight float NULL,
	DaysToManufacture int NULL,
	ProductLine CHAR(2) NULL,
	DealerPrice DECIMAL(19,4) NULL,
	Class CHAR(2) NULL,
	Style CHAR(2) NULL,
	ModelName varchar(50) NULL,
	LargePhoto varbinary NULL,
	EnglishDescription varchar(400) NULL,
	FrenchDescription varchar(400) NULL,
	ChineseDescription varchar(400) NULL,
	ArabicDescription varchar(400) NULL,
	HebrewDescription varchar(400) NULL,
	ThaiDescription varchar(400) NULL,
	GermanDescription varchar(400) NULL,
	JapaneseDescription varchar(400) NULL,
	TurkishDescription varchar(400) NULL,
	StartDate datetime NULL,
	EndDate datetime NULL,
	Status varchar(7) NULL
);


CREATE TABLE DimProductCategory(
	ProductCateryKey int PRIMARY KEY,
	ProductCateryAlternateKey int NULL,
	EnglishProductCateryName varchar(50) NOT NULL,
	SpanishProductCateryName varchar(50) NOT NULL,
	FrenchProductCateryName varchar(50) NOT NULL
);


CREATE TABLE DimProductSubcategory(
	ProductSubcateryKey int PRIMARY KEY,
	ProductSubcateryAlternateKey int NULL,
	EnglishProductSubcateryName varchar(50) NOT NULL,
	SpanishProductSubcateryName varchar(50) NOT NULL,
	FrenchProductSubcateryName varchar(50) NOT NULL,
	ProductCategoryKey int NULL
);


CREATE TABLE DimPromotion(
	PromotionKey int PRIMARY KEY,
	PromotionAlternateKey int NULL,
	EnglishPromotionName varchar(255) NULL,
	SpanishPromotionName varchar(255) NULL,
	FrenchPromotionName varchar(255) NULL,
	DiscountPct float NULL,
	EnglishPromotionType varchar(50) NULL,
	SpanishPromotionType varchar(50) NULL,
	FrenchPromotionType varchar(50) NULL,
	EnglishPromotionCatery varchar(50) NULL,
	SpanishPromotionCatery varchar(50) NULL,
	FrenchPromotionCatery varchar(50) NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NULL,
	MinQty int NULL,
	MaxQty int NULL
);


CREATE TABLE DimReseller(
	ResellerKey int PRIMARY KEY,
	GeographyKey int NULL,
	ResellerAlternateKey varchar(15) NULL,
	Phone varchar(25) NULL,
	BusinessType varchar(20) NOT NULL,
	ResellerName varchar(50) NOT NULL,
	NumberEmployees int NULL,
	OrderFrequency char(1) NULL,
	OrderMonth tinyint NULL,
	FirstOrderYear int NULL,
	LastOrderYear int NULL,
	ProductLine varchar(50) NULL,
	AddressLine1 varchar(60) NULL,
	AddressLine2 varchar(60) NULL,
	AnnualSales DECIMAL(19,4) NULL,
	BankName varchar(50) NULL,
	MinPaymentType tinyint NULL,
	MinPaymentAmount DECIMAL(19,4) NULL,
	AnnualRevenue DECIMAL(19,4) NULL,
	YearOpened int NULL
);


CREATE TABLE DimSalesReason(
	SalesReasonKey int PRIMARY KEY,
	SalesReasonAlternateKey int NOT NULL,
	SalesReasonName varchar(50) NOT NULL,
	SalesReasonReasonType varchar(50) NOT NULL
);


CREATE TABLE DimSalesTerritory(
	SalesTerritoryKey int PRIMARY KEY,
	SalesTerritoryAlternateKey int NULL,
	SalesTerritoryRegion varchar(50) NOT NULL,
	SalesTerritoryCountry varchar(50) NOT NULL,
	SalesTerritoryGroup varchar(50) NULL,
	SalesTerritoryImage varbinary NULL
);


CREATE TABLE DimScenario(
	ScenarioKey int PRIMARY KEY,
	ScenarioName varchar(50) NULL
);


CREATE TABLE FactAdditionalInternationalProductDescription(
	ProductKey int NOT NULL,
	CultureName varchar(50) NOT NULL,
	ProductDescription varchar(8000) NOT NULL
);


CREATE TABLE FactCallCenter(
	FactCallCenterID int PRIMARY KEY,
	DateKey int NOT NULL,
	WageType varchar(15) NOT NULL,
	Shift varchar(20) NOT NULL,
	LevelOneOperators smallint NOT NULL,
	LevelTwoOperators smallint NOT NULL,
	TotalOperators smallint NOT NULL,
	Calls int NOT NULL,
	AutomaticResponses int NOT NULL,
	Orders int NOT NULL,
	IssuesRaised smallint NOT NULL,
	AverageTimePerIssue smallint NOT NULL,
	ServiceGrade float NOT NULL,
	Date datetime NULL
);


CREATE TABLE FactCurrencyRate(
	CurrencyKey int NOT NULL,
	DateKey int NOT NULL,
	AverageRate float NOT NULL,
	EndOfDayRate float NOT NULL,
	Date datetime NULL
);


CREATE TABLE FactFinance(
	FinanceKey int PRIMARY KEY,
	DateKey int NOT NULL,
	OrganizationKey int NOT NULL,
	DepartmentGroupKey int NOT NULL,
	ScenarioKey int NOT NULL,
	AccountKey int NOT NULL,
	Amount float NOT NULL,
	Date datetime NULL
);


CREATE TABLE FactInternetSales(
	ProductKey int NOT NULL,
	OrderDateKey int NOT NULL,
	DueDateKey int NOT NULL,
	ShipDateKey int NOT NULL,
	CustomerKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	SalesTerritoryKey int NOT NULL,
	SalesOrderNumber varchar(20) NOT NULL,
	SalesOrderLineNumber tinyint NOT NULL,
	RevisionNumber tinyint NOT NULL,
	OrderQuantity smallint NOT NULL,
	UnitPrice DECIMAL(19,4) NOT NULL,
	ExtendedAmount DECIMAL(19,4) NOT NULL,
	UnitPriceDiscountPct float NOT NULL,
	DiscountAmount float NOT NULL,
	ProductStandardCost DECIMAL(19,4) NOT NULL,
	TotalProductCost DECIMAL(19,4) NOT NULL,
	SalesAmount DECIMAL(19,4) NOT NULL,
	TaxAmt DECIMAL(19,4) NOT NULL,
	Freight DECIMAL(19,4) NOT NULL,
	CarrierTrackingNumber varchar(25) NULL,
	CustomerPONumber varchar(25) NULL,
	OrderDate datetime NULL,
	DueDate datetime NULL,
	ShipDate datetime NULL
);


CREATE TABLE FactInternetSalesReason(
	SalesOrderNumber varchar(20) NOT NULL,
	SalesOrderLineNumber tinyint NOT NULL,
	SalesReasonKey int NOT NULL
);


CREATE TABLE FactProductInventory(
	ProductKey int NOT NULL,
	DateKey int NOT NULL,
	MovementDate date NOT NULL,
	UnitCost DECIMAL(19,4) NOT NULL,
	UnitsIn int NOT NULL,
	UnitsOut int NOT NULL,
	UnitsBalance int NOT NULL
);


CREATE TABLE FactResellerSales(
	ProductKey int NOT NULL,
	OrderDateKey int NOT NULL,
	DueDateKey int NOT NULL,
	ShipDateKey int NOT NULL,
	ResellerKey int NOT NULL,
	EmployeeKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	SalesTerritoryKey int NOT NULL,
	SalesOrderNumber varchar(20) NOT NULL,
	SalesOrderLineNumber tinyint NOT NULL,
	RevisionNumber tinyint NULL,
	OrderQuantity smallint NULL,
	UnitPrice DECIMAL(19,4) NULL,
	ExtendedAmount DECIMAL(19,4) NULL,
	UnitPriceDiscountPct float NULL,
	DiscountAmount float NULL,
	ProductStandardCost DECIMAL(19,4) NULL,
	TotalProductCost DECIMAL(19,4) NULL,
	SalesAmount DECIMAL(19,4) NULL,
	TaxAmt DECIMAL(19,4) NULL,
	Freight DECIMAL(19,4) NULL,
	CarrierTrackingNumber varchar(25) NULL,
	CustomerPONumber varchar(25) NULL,
	OrderDate datetime NULL,
	DueDate datetime NULL,
	ShipDate datetime NULL
);


CREATE TABLE FactSalesQuota(
	SalesQuotaKey int PRIMARY KEY,
	EmployeeKey int NOT NULL,
	DateKey int NOT NULL,
	CalendarYear smallint NOT NULL,
	CalendarQuarter tinyint NOT NULL,
	SalesAmountQuota DECIMAL(19,4) NOT NULL,
	Date datetime NULL
);


CREATE TABLE FactSurveyResponse(
	SurveyResponseKey int PRIMARY KEY,
	DateKey int NOT NULL,
	CustomerKey int NOT NULL,
	ProductCateryKey int NOT NULL,
	EnglishProductCateryName varchar(50) NOT NULL,
	ProductSubcateryKey int NOT NULL,
	EnglishProductSubcateryName varchar(50) NOT NULL,
	Date datetime NULL
);


CREATE TABLE NewFactCurrencyRate(
	AverageRate real NULL,
	CurrencyID varchar(3) NULL,
	CurrencyDate date NULL,
	EndOfDayRate real NULL,
	CurrencyKey int NULL,
	DateKey int NULL
);


CREATE TABLE ProspectiveBuyer(
	ProspectiveBuyerKey int PRIMARY KEY,
	ProspectAlternateKey varchar(15) NULL,
	FirstName varchar(50) NULL,
	MiddleName varchar(50) NULL,
	LastName varchar(50) NULL,
	BirthDate datetime NULL,
	MaritalStatus CHAR(1) NULL,
	Gender varchar(1) NULL,
	EmailAddress varchar(50) NULL,
	YearlyIncome DECIMAL(19,4) NULL,
	TotalChildren tinyint NULL,
	NumberChildrenAtHome tinyint NULL,
	Education varchar(40) NULL,
	Occupation varchar(100) NULL,
	HouseOwnerFlag CHAR(1) NULL,
	NumberCarsOwned tinyint NULL,
	AddressLine1 varchar(120) NULL,
	AddressLine2 varchar(120) NULL,
	City varchar(30) NULL,
	StateProvinceCode varchar(3) NULL,
	PostalCode varchar(15) NULL,
	Phone varchar(20) NULL,
	Salutation varchar(8) NULL,
	Unknown int NULL
);