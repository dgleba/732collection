
_____________


2020-12-30

Status. I didn't use this.



_____________


This app:

role_minimum 

mini    20  minimum
read    250
creat   350
edit    450 main table
edit    550 lookup tables



_____________

RBAC simple

dg_role_ability


Link to spreadsheet indicating roles:
https://docs.google.com/spreadsheets/d/1h_JcMPiqUf-CSU_WShsOsS4NSQu3pichzl8hwxnGz0s/edit?usp=sharing

copy of it..


id	role	spacer	role_ability	spacer2	commonly_used	spacer3	description	Detail_for_this_app	Detail_for_contact_app
1	minimal	~	10	~	a	~	no access [new user will get 10 by default]		
2	login	~	150	~		~	user can login		
4	read	~	250	~	a	~	future		
6	create	~	350	~	a	~	can create row in some tables		
9	edit some	~	450	~	a	~	can edit some tables (typical regular normal user for this app)		contact
11	edit more	~	550	~	a	~	can edit supporting lookup tables (staff, back office)		contact, country, 
14	delete	~	650	~	a	~	can delete rows in some tables		
15	future	~	750	~		~			
18	admin	~	999	~	must	~	can do everything	all	all
19	note01	~	9911	~		~	'================== spacer ===================		
20	note02	~	9921	~		~	Title:  Simple role based access control RBAC, authorization		
21	note03	~	9931	~		~	David Gleba		
22	note04	~	9941	~		~	Version:  2020-12-30 - r10		
23	note05	~	9951	~		~			
24	note06	~	9961	~		~	Simple role strategy. Not comprehensive. It is not designed for all situations.		
25	note07	~	9971	~		~	Assending roles. Higher role_num has all lower permissions.		
26	note08	~	9981	~		~	Assign route a role_minumum required to use the route/view		
27	note09	~	9991	~		~	Check each request to see if current_user has role_ability greater or equal to role_minimum		
28	note10	~	10001	~		~	If route/view has no dg_role_abilty check, then is it open to all who login?.		
29	note11	~	10011	~		~			
30	note12	~	10021	~		~	Each route must have a role_minumum variable of 20 to prevent unauthorized access		
31	note13	~	10031	~		~	Role_ability is numbered 150,200, etc so that a role can be inserted at 160, for example, if the need arises.		
32	note14	~	10041	~		~			
33	note15	~	10051	~		~	This google sheet:  https://docs.google.com/spreadsheets/d/1h_JcMPiqUf-CSU_WShsOsS4NSQu3pichzl8hwxnGz0s/edit?usp=sharing		

_____________


