USE quizdb;

INSERT INTO user (Name, Email, Password)
VALUES
	('Shawn', 's@s.com', '1234'),
	('Jack', 'j@j.com','4321'),
	('Angelina', 'a@a.com','3281')
;

INSERT INTO quiztype (Name, Description)
VALUES
	('JSP', 'JavaServer Pages')
;

INSERT INTO question (Fk_QuizTypeId_Question, Description)
VALUES
	(1, 'Is it possible to override the JSP lifecycle methods? If yes, which of the methods can be overridden?'),
	(1, 'How to include static files in a JSP?'),
	(1, 'What type of error(s) can a JSP code encounter?'),
	(1, 'Distinguish between JSP Scriptlet and JSP Declaration. Which of the following is NOT correct?'),
	(1, 'Given implicit objects that we can directly use on the JSP page, which definition is NOT correct?'),
	(1, 'JSP uses the following literals except?'),
	(1, 'All are JSP scripting elements except?'),
	(1, 'The JSP Bean development uses the following tags except?'),
	(1, 'The use of scripting elements in JSP is discouraged, which one is NOT a reason?'),
	(1, 'In JSTL tags, which has a wrong definition?'),

	(1, 'What is the correct sequence for the JSP lifecycle phases?'),
	(1, 'What are the two different types of comments in JSP?'),
	(1, 'In Client-Side Validation, which of the following is NOT correct?'),
	(1, 'In Server-Side Validation, which of the following is NOT correct?'),
	(1, 'Which of the following is NOT an advantage in JSP custom tag?'),
	(1, 'Which of the JSP runtime exceptions handling is NOT correct?'),
	(1, 'How is JSP used in the MVC model? Find the wrong statement'),
	(1, 'Differentiate between JavaBeans and taglib directives. Which statement is wrong?'),
	(1, 'In the auto-refresh implementation, which statement is correct?'),
	(1, 'The use of scripting elements in JSP is discouraged, which one is NOT a reason?'),
	(1, 'Differentiate between hiding comment and output comment. Find the wrong statement.')
;

INSERT INTO choice (Fk_QuestionId_Choice, IsAnswer, Description)
VALUES
	(1, 1, 'jspInit() and jspDestroy()'),
	(1, 0, 'jspInit() and jspService()'),
	(1, 0, 'jspDestroy() only'),
	(1, 0, 'jspService() and jspDestroy()'),

	(2, 0, 'Static pages can be included in a JSP using the page directive'),
	(2, 0, 'Static pages can be included in a JSP using the include action directive'),
	(2, 0, 'Static pages can be included in a JSP using the include taglib directive'),
	(2, 1, 'Static pages can be included in a JSP using the include directive'),

	(3, 0, 'Checked exceptions only'),
	(3, 1, 'Checked exceptions, Runtime exceptions, and Errors'),
	(3, 0, 'Runtime exceptions only'),
	(3, 0, 'Errors only'),

	(4, 0, 'JSP Scriptlet: It can only declare variables and not methods'),
	(4, 0, 'JSP Scriptlet: It is placed inside _jspService( ) method'),
	(4, 1, 'JSP Declaration: It can declare only methods and not variables'),
	(4, 0, 'JSP Declaration: It is placed outside _jspService( ) method'),

	(5, 0, 'out : is the PrintWriter object used to send output to the client'),
	(5, 0, 'session : is the HttpSession object associated with the request'),
	(5, 0, 'page : simply a synonym for this, and is used to call the methods defined by the translated servlet class'),
	(5, 1, 'exception : allows the error data to be accessed by designated JSP'),

	(6, 0, 'Boolean − true and false'),
	(6, 1, 'Double - floating point'),
	(6, 0, 'String − with single and double quotes'),
	(6, 0, 'Integer − as in Java'),

	(7, 0, 'Boolean − true and false'),
	(7, 1, 'Double - floating point'),
	(7, 0, 'String − with single and double quotes'),
	(7, 0, 'Integer − as in Java'),

	(8, 0, 'jsp:useBean - The jsp:useBean action tag is used to locate or instantiate a bean class'),
	(8, 1, 'jsp:setBean - The jsp:setBean action tag is set a new bean class'),
	(8, 0, 'jsp:setProperty - The jsp:setProperty action tag sets a property value or values in a bean using the setter method'),
	(8, 0, 'jsp:getProperty - The jsp:getProperty action tag returns the value of the property'),

	(9, 0, 'JSP pages are used for view purposes'),
	(9, 0, 'all the business logic should be in servlet or model'),
	(9, 0, 'We should pass parameters to the JSP page through attributes'),
	(9, 1, 'then use them to create the HTML request in the JSP page'),

	(10, 1, 'Main Tags: Provides support for iteration, conditional logic, catch the exception, URL, forward or redirect response, and more'),
	(10, 0, 'Formatting and Localization Tags: Provided for the formatting of Dates, Numbers, and i18n support through resource bundles and locales'),
	(10, 0, 'SQL Tags: Provide support for interaction with relational databases such as Oracle, MySql, and more'),
	(10, 0, 'XML Tags: Used to work with XML documents such as parsing XML, transforming XML data and XPath expression evaluation'),

	(11, 0, 'Complilation, Translation, ClassLoading, Instatiation, Initialization, Request Processing, Destroy'),
	(11, 1, 'Translation, Complilation, ClassLoading, Instatiation, Initialization, Request Processing, Destroy'),
	(11, 0, 'Translation, Complilation, ClassLoading, Initialization, Instatiation, Request Processing, Destroy'),
	(11, 0, 'Translation, Complilation, , Instatiation, Initialization, ClassLoading, Request Processing, Destroy'),

	(12, 1, 'HTML Comments and JSP Comments'),
	(12, 0, 'HTML Comments and CSS Comments'),
	(12, 0, 'CSS Comments and JSP Comments'),
	(12, 0, 'JSP Comments and Servlet Comments'),

	(13, 0, 'Happens in the browser'),
	(13, 1, 'Requies a network trip to the server'),
	(13, 0, 'Instantaneous feedback may be provider'),
	(13, 0, 'Credit card information is a typical example of JavaScript client-side validation'),

	(14, 0, 'Happens in the server'),
	(14, 0, 'client is supposed to wait for a response from the server before displaying any success or error message to the user'),
	(14, 1, 'In the case of validation failure, no extra network trip is needed to resend the form to fill out the form with the correct data by the client.'),
	(14, 0, 'the server can’t execute its validation until it’s received an HTTP request'),

	(15, 0, 'It eliminates the need for the scriptlet tag'),
	(15, 0, 'Separation of business logic from the JSP page'),
	(15, 0, 'Reusability of the JSP page'),
	(15, 1, 'Deployment Descriptor Configuration for TLD'),

	(16, 0, 'By errorPage attribute of page directive'),
	(16, 0, 'By isErrorPage attribute of page directive'),
	(16, 0, 'By <error-page> element in web.xml file'),
	(16, 1, 'By <is-error-page> element in web.xml file'),

	(17, 1, 'JSP is used for controller in the Model View Controller pattern'),
	(17, 0, 'it means it plays the role of the view.'),
	(17, 0, 'The controller calls the model and the business classes, which in turn get the data'),
	(17, 0, 'and this data is then presented to the JSP for rendering on to the client'),

	(18, 0, 'JavaBeans and taglib were introduced for reusability'),
	(18, 0, 'JavaBeans are good for storing information and state'),
	(18, 0, 'Taglibs are for generating presentation elements'),
	(18, 1, 'Use action tags to implement actions and JavaBeans to present information'),

	(19, 0, 'public static void setIntHeader(String header, int header value)'),
	(19, 0, 'public void setIntHeader(Boolean header, int header value)'),
	(19, 1, 'public void setIntHeader(String header, int header value)'),
	(19, 0, 'public void setIntHeader(Char header, int header value)'),

	(20, 0, 'The JSP comment is called hide comment'),
	(20, 0, 'the HTML comment is called the output comment'),
	(20, 0, 'JSP comment will not be shown in the case if a user views the source of the page'),
	(20, 1, 'HTML comments will also not be displayed')
;

INSERT INTO quiztype (Name, Description)
VALUES
	('Servlet', 'Java Servlet')
;

INSERT INTO question (Fk_QuizTypeId_Question, Description)
VALUES
	(2, 'What are the functions of Servlet container? Find the incorrect one.'),
	(2, 'What is a servlet container? Find the wrong statement.'),
	(2, 'What is a session? Find the wrong statement.'),
	(2, 'When you are done with session data of a user, you have several options. Which of the following is NOT correct?'),
	(2, 'There are three ways to maintain session between web client and web server, which of the following is NOT correct?'),
	(2, 'Servlet context contains servlet view of Web application in which servlet will be running. By using the context, ... except?'),
	(2, 'What is the difference between Servlet Request and Servlet Context when calling a Request Dispatcher?'),
	(2, 'A servlet can be loaded when? Find the wrong statement.'),
	(2, 'Which interface should be implemented by all servlets?'),
	(2, 'What is the correct life cycle sequence of Servlet?'),

	(2, 'What are the important functions of filters? Find the wrong statement.'),
	(2, 'What is the difference between JSP and Servlets?'),
	(2, 'What is called Scriptlet?'),
	(2, 'What is the difference between Server and Container? Which of the following is NOT correct?'),
	(2, 'What is the difference between ServletConfig and ServletContext? Which definition is NOT correct?'),
	(2, 'What is the difference between Servlets and applets?'),
	(2, 'What is HttpServlet and how it is different from GenericServlet? Find the wrong statement.'),
	(2, 'What is called Servlet mapping? Find the wrong statement.'),
	(2, 'What are all the advantages of Servlet over CGI? Find the wrong statement.'),
	(2, 'What are the uses of servlets? Find the wrong statement.')
;

INSERT INTO choice (Fk_QuestionId_Choice, IsAnswer, Description)
VALUES
	(21, 0, 'Lifecycle management'),
	(21, 0, 'Communication support'),
	(21, 0, 'Multithreading support'),
	(21, 1, 'Implicit security'),

	(22, 0, 'part of Web server that provides network services depends on request and response are sent'),
	(22, 0, 'contains and manages servlets through their life cycle'),
	(22, 0, 'client/user can request a static WebPages from the server'),
	(22, 1, 'client/user can request a dynamic WebPages from the server'),

	(23, 0, 'A session is an object which is used by a servlet'),
	(23, 0, 'is used to track user interaction with a web application across multiple HTTP requests'),
	(23, 1, 'is used to track user interaction with a web application across multiple HTTP responses'),
	(23, 0, 'maintain session between web client and web server'),

	(24, 0, 'Remove a particular attribute − You can call public void removeAttribute(String name) method to delete the value associated with a particular key'),
	(24, 0, 'Setting Session timeout − You can call public void setMaxInactiveInterval(int interval) method to set the timeout for a session individually'),
	(24, 0, 'Log the user out − The servers that support servlets 2.4, you can call logout to log the client out of the Web server and invalidate all sessions belonging to all the users'),
	(24, 1, 'web.xml Configuration − If you are using Maven, apart from the above mentioned methods, you can configure session time out in web.xml file as follows'),

	(25, 0, 'Hidden Form Fields - A web server can send a hidden HTML form field along with a unique session ID'),
	(25, 0, 'Cookies - A webserver can assign a unique session ID as a cookie to each web client and for subsequent requests from the client they can be recognized using the received cookie'),
	(25, 0, 'URL Rewriting - You can append some extra data on the end of each URL that identifies the session, and the server can associate that session identifier with data it has stored about that session.'),
	(25, 1, 'Caching - storing copies of files in a cache, or temporary storage location, so that they can be accessed more quickly'),

	(26, 0, 'Log events'),
	(26, 1, 'Get and Retrieve attributes'),
	(26, 0, 'Set and Store attributes'),
	(26, 0, 'Obtain URL references to resources'),

	(27, 1, 'Relative URL can be called when Servlet Request is used and Relative URL is not used when using Servlet Context'),
	(27, 0, 'Relative URL can be called when Servlet Request is not used and Relative URL is used when using Servlet Context'),
	(27, 0, 'Relative URL can be called when Servlet Request is used and Relative URL is not used when using Servlet Mapping'),
	(27, 0, 'Relative URL can be called when Servlet Request is not used and Relative URL is used when using Servlet Mapping'),

	(28, 0, 'First request is made'),
	(28, 0, 'Auto loading and Server starts up'),
	(28, 0, 'There is a single instance that answers all requests concurrently which  saves memory'),
	(28, 1, 'Administrator automatically loads'),

	(29, 1, 'Servlet interface should be implemented by all servlets'),
	(29, 0, 'Functional interface should be implemented by all servlets.'),
	(29, 0, 'Runnable interface should be implemented by all servlets.'),
	(29, 0, 'Controller interface should be implemented by all servlets.'),

	(30, 0, 'Initialized, Loaded, Destroy, Unloaded'),
	(30, 1, 'Loaded, Initialized, Destroy, Unloaded'),
	(30, 0, 'Loaded, Initialized, Unloaded, Destroy'),
	(30, 0, 'Initialized, Loaded, Unloaded, Destroy'),

	(31, 0, 'Security check'),
	(31, 0, 'Modifying the request or response'),
	(31, 1, 'Data collection'),
	(31, 0, 'Logging and auditing'),

	(32, 0, 'JSP supports HTTP protocol'),
	(32, 0, 'JSP mainly used for presentation'),
	(32, 0, 'servlet can support any protocol'),
	(32, 1, 'servlet can support only HTML protocol'),

	(33, 1, 'A scriptlet contains any language statements, variables, expressions that can be valid in the page scripting language.'),
	(33, 0, 'A scriptlet contains any language statements, variables, expressions that can be invalidated in the page scripting language.'),
	(33, 0, 'A scriptlet contains any language statements, variables, expressions that can be valid in the servlet scripting language.'),
	(33, 0, 'A scriptlet contains any language statements, variables, expressions that can be invalidated in the pservletage scripting language.'),

	(34, 0, 'Containers hold set of objects. A server can provide service to the client and it contains one or more containers such as EJBs container.'),
	(34, 0, 'Containers hold set of objects. A server can provide service to the client and it contains one or more containers such as Servlet container.'),
	(34, 1, 'Containers hold set of objects. A server can provide service to the client and it contains one or more containers such as Java container.'),
	(34, 0, 'Containers hold set of objects. A server can provide service to the client and it contains one or more containers such as JSP container.'),

	(35, 0, 'ServletConfig provides information about configuration of a servlet which is defined inside the web.xml file'),
	(35, 0, 'ServletConfig is a specific object for each servlet.'),
	(35, 0, 'ServletContext is an application specific object and it is shared by all servlet.'),
	(35, 1, 'ServletContext belongs to one application in multiple JVMs.'),

	(36, 1, 'Servlets are used for server side config and it keeps on server. But, Applets are used for client side coding and it runs on client browsers.'),
	(36, 0, 'Servlets are used for client side config and it keeps on client. But, Applets are used for server side coding and it runs on servers.'),
	(36, 0, 'Servlets are used for server side config and it keeps on client. But, Applets are used for client side coding and it runs on servers.'),
	(36, 0, 'Servlets are used for client side config and it keeps on server. But, Applets are used for server side coding and it runs on client browsers.'),

	(37, 1, 'HttpServlet implements from GenericServlet'),
	(37, 0, 'HttpServlet inherits the properties of Genericservlet'),
	(37, 0, 'HttpServlet defines a HTTP protocol servlet'),
	(37, 0, 'GenericServlet defines a generic, protocol-independent servlet'),

	(38, 0, 'Servlet mapping maps URL patterns with the servlets.'),
	(38, 1, 'If there is a response from the server, servlet container decides on which application it needs to map.'),
	(38, 0, 'It is located in WEB-INF directory of the web application.'),
	(38, 0, 'servlet-mapping has two child tags, url-pattern and servlet-name'),

	(39, 0, 'Cannot be run in an individual process'),
	(39, 0, 'Servlet stays in the memory while requests'),
	(39, 0, 'For every CGI request, you must load and start a CGI program'),
	(39, 1, 'web.xml performance gains'),

	(40, 0, 'Servlets are used to process and store data submitted by HTML form.'),
	(40, 1, 'Servlets are used to process and store static content.'),
	(40, 0, 'Servlets are used to handle multiple request concurrently.'),
	(40, 0, 'Servlets are used to manage state information on top of stateless HTTP.')
;

INSERT INTO quiztype (Name, Description)
VALUES
	('Hibernate', 'Java Hibernate')
;

INSERT INTO question (Fk_QuizTypeId_Question, Description)
VALUES
	(3, 'What’s Hibernate? Find the incorrect statement.'),
	(3, 'What’s the usage of Configuration Interface in hibernate? Find the incorrect statement.'),
	(3, 'What are the benefits of using Hibernate template? Find the incorrect statement.'),
	(3, 'What are the two types of collections in hibernate?'),
	(3, 'What’s the difference between session.save() and session.saveOrUpdate() methods in hibernate? Which definition is NOT correct?'),
	(3, 'What the benefits are of hibernate over JDBC? Find the incorrect statement.'),
	(3, 'How can we reduce database write action times in Hibernate? Find the incorrect statement.'),
	(3, 'What’s the usage of callback interfaces in hibernate?'),
	(3, 'The four ORM levels in hibernate, which definition is NOT correct?'),
	(3, 'What the two methods are of hibernate configuration?'),

	(3, 'Hibernate provides following four ways to fetch objects from database. Find the incorrect one.'),
	(3, 'What are different ways to disable hibernate second level cache? Find the incorrect one.'),
	(3, 'Object identification can be done in hibernate in following three ways. Find the incorrect one.'),
	(3, 'What different fetching strategies are of hibernate? Which of the following is NOT correct?'),
	(3, 'What’s the difference between load() and get() method in hibernate? which statement is NOT correct?'),
	(3, 'Hibernate has following three inheritance models. Find the incorrect one.'),
	(3, 'How can we map the classes as immutable?'),
	(3, 'What’s general hibernate flow using RDBMS?'),
	(3, 'What are derived properties in hibernate?'),
	(3, 'What’s difference between managed associations and hibernate associations?')
;

INSERT INTO choice (Fk_QuestionId_Choice, IsAnswer, Description)
VALUES
	(41, 1, 'allows an efficient Object Relational mapping using configuration files in JSON format'),
	(41, 0, 'takes care of the mapping from Java classes to database tables (and from Java data types to SQL data types)'),
	(41, 0, 'provides data query and retrieval facilities'),
	(41, 0, 'after java objects mapping to database tables, database is used and handled using Java objects without writing complex database queries'),

	(42, 0, 'Configuration interface of hibernate framework is used to configure hibernate.'),
	(42, 0, 'Configuration interface of hibernate framework is used to bootstrap hibernate'),
	(42, 0, 'Mapping documents of hibernate are located using this interface'),
	(42, 1, 'Relational documents of hibernate are located using this interface'),

	(43, 0, 'Session closing is automated'),
	(43, 0, 'Interaction with hibernate session is simplified'),
	(43, 0, 'Exception handling is automated'),
	(43, 1, 'Errors are handled automatically'),

	(44, 1, 'Sorted Collection and Order Collection'),
	(44, 0, 'Unsorted Collection and Order Collection'),
	(44, 0, 'Sorted Collection and Unordered Collection'),
	(44, 0, 'Unsorted Collection and Unordered Collection'),

	(45, 0, 'Sessionsave() method saves a record only'),
	(45, 0, 'if record from Sessionsave() is unique with respect to its primary key and will fail to insert if primary key already exists in the table'),
	(45, 1, 'saveOrUpdate() method inserts a new record'),
	(45, 0, 'record from saveOrUpdate() : if primary key is unique and will update an existing record if primary key exists in the table already'),

	(46, 0, 'Hibernate can be used seamlessly with any type of database as its database independent'),
	(46, 0, 'JDBC, developer has to write database specific queries.'),
	(46, 0, 'Using hibernate, developer doesn’t need to be an expert of writing complex queries as HQL simplifies query writing process'),
	(46, 1, 'In case of hibernate, there is still a need to create connection pools'),

	(47, 0, 'Hibernate provides dirty checking feature'),
	(47, 0, 'dirty checking feature can be used to reduce database write times'),
	(47, 0, 'Dirty checking feature updates only those fields which require a change while keeps others unchanged'),
	(47, 1, 'dirty checking feature can also be used to reduce database read times'),

	(48, 1, 'are useful in receiving event notifications from objects.'),
	(48, 0, 'used to retrieve entities through criteria object composition'),
	(48, 0, 'enable viewing SQL on the console'),
	(48, 0, 'useful to get hibernate statistics'),

	(49, 0, 'Pure Relational - The entire application, including the user interface, is designed around the relational model and SQL-based relational operations'),
	(49, 1, 'Light Object Mapping - The entities are represented as classes that are mapped automatically to the relational tables'),
	(49, 0, 'Medium Object Mapping - The application is designed around an object model. The SQL code is generated at build time'),
	(49, 0, 'Full Object Mapping - Full object mapping supports sophisticated object modeling: composition, inheritance, polymorphism and persistence'),

	(50, 0, 'JSON based configuration and programmatic configuration'),
	(50, 1, 'XML based configuration and programmatic configuration'),
	(50, 0, 'SQL based configuration and programmatic configuration'),
	(50, 0, 'Class based configuration and programmatic configuration'),

	(51, 0, 'Using HCL'),
	(51, 0, 'Using identifier'),
	(51, 0, 'Using Criteria API'),
	(51, 1, 'Using Standard SQL'),

	(52, 1, 'By setting use_first_level_cache as true'),
	(52, 0, 'By setting use_second_level_cache as false'),
	(52, 0, 'By using CACHEMODE.IGNORE'),
	(52, 0, 'Using cache provider as org.hibernate.cache.NoCacheProvider'),

	(53, 0, 'Using Object Identity: Using == operator'),
	(53, 0, 'Using Object Equality: Using equals() method'),
	(53, 1, 'Using Object HashCode: Using hashcode() method'),
	(53, 0, 'Using database identity: Relational database objects can be identified if they represent same row'),

	(54, 1, 'Inner Join Fetching'),
	(54, 0, 'Batch Fetching'),
	(54, 0, 'Select Fetching'),
	(54, 0, 'Sub-select Fetching'),

	(55, 0, 'Load() methods results in an exception if the required records isn’t found in the database'),
	(55, 0, 'get() method returns null when records against the id isn’t found in the database'),
	(55, 1, 'use get() method only when we are sure about existence of database for a table'),
	(55, 0, 'use Load() method only when we are sure about existence of records against an id'),

	(56, 0, 'Tables Per Concrete Class'),
	(56, 0, 'Table per class hierarchy'),
	(56, 1, 'Table per super-class'),
	(56, 0, 'Table per sub-class'),

	(57, 0, 'we can make the class as immutable if we don’t want an application to update objects'),
	(57, 0, 'we can make the class as immutable if we don’t want an application to delete objects'),
	(57, 1, 'we can make the class as immutable if we don’t want an application to retrieve objects'),
	(57, 0, 'we can make the class as immutable by setting mutable=false'),

	(58, 1, 'load config file and create config object, use config object and create sessionFactory object, get one session, create HQL query, execute HQL query'),
	(58, 0, 'load config file and create config object, use config object and create cookieFactory object, get one cookie, create HQL query, execute HQL query'),
	(58, 0, 'load config file and create config object, use config object and create localStorageFactory object, get one localStorage, create HQL query, execute HQL query'),
	(58, 0, 'load config file and create config object, use config object and create cacheFactory object, get one cache, create HQL query, execute HQL query'),

	(59, 0, 'are properties mapped to any columns of a database table. Such properties are calculated at runtime by evaluation of any expressions.'),
	(59, 0, 'are properties mapped to any columns of a database table. Such properties are calculated at compile by evaluation of any expressions.'),
	(59, 1, 'are properties not mapped to any columns of a database table. Such properties are calculated at runtime by evaluation of any expressions.'),
	(59, 0, 'are properties not mapped to any columns of a database table. Such properties are calculated at compile by evaluation of any expressions.'),

	(60, 0, 'Managed associations relate to container management persistence and are unidirectional while hibernate associations are bidirectional.'),
	(60, 0, 'Managed associations relate to container management persistence and are unidirectional while hibernate associations are tridirectional.'),
	(60, 0, 'Managed associations relate to container management persistence and are bi-directional while hibernate associations are tridirectional.'),
	(60, 1, 'Managed associations relate to container management persistence and are bi-directional while hibernate associations are unidirectional.')
;
