# Revenue Collection API

This is an API for effective revenue collection

## Important Notes

1. All amounts are in Pesewas (GHP)

## API Documentation

### Authorization

To authorize requests like managing `timesheets` the *Employee* needs to provide their API Key. You can pass the API key as a Bearer Token in the request's header

`Authorization: Bearer API_KEY`  

### Manage Timesheets (Employees)  
An employee can manage their timesheets

#### Add timesheet

`POST` /timesheets

* **Request Params**  
   `id 			= [integer]`  
   `company 	= [string]`  
   `date 		= [date Eg: 2021-01-29]`  
   `start_time 	= [time Eg: 09:00]`  
   `end_time 	= [time Eg: 14:00]`  

* **Sample Response** `200`  
   `{
   		id: 1,  
   		employee_id: 1,  
   		company: "Company LTD",  
   		date: "2021-01-29",  
   		start_time: "09:00",  
   		end_time: "14:00"  
   	}`

* **Sample Response** `404`
   `"Not Found"`

* **Sample Response** `401`
   `"Not Authenticated"`


#### View all

`GET` /timesheets

* **Sample Response** `200`
   `[
   		{  
   			id: 1,  
   			employee_id: 1,  
   			company: "Company LTD",  
   			date: "2021-01-29",  
   			start_time: "09:00",  
   			end_time: "14:00"  
   		}  
   	]`

* **Sample Response** `404`
   `"Not Found"`

* **Sample Response** `401`
   `"Not Authenticated"`


#### View single timesheet

`GET` /timesheets/:id

* Request Params
	`id=[integer]`

* **Sample Response** `200`
   `{
   		id: 1,  
   		employee_id: 1,  
   		company: "Company LTD",  
   		date: "2021-01-29",  
   		start_time: "09:00",  
   		end_time: "14:00"  
   	}`

* **Sample Response** `404`
   `"Not Found"`

* **Sample Response** `401`
   `"Not Authenticated"`


#### Update a timesheet

`PATCH` /timesheets/:id

* **URL Parameters**  
   `id	= [integer]`

* **Request Params**  

   See [Add Timesheet Request](#add-timesheet) for other request params  

* **Sample Response**  

   See [Add Timesheet Request](#add-timesheet) for other request params  


#### Delete a timesheet

`PATCH` /timesheets/:id

* **URL Parameters**  
   `id	= [integer]`

* **Request Params**  

   See [Add Timesheet Request](#add-timesheet) for other request params  

* **Sample Response**  

   See [Add Timesheet Request](#add-timesheet) for other request params  



### Generate Invoice for a Company   
Generate an invoice for a particular company using the following APIs


#### Generate Invoice

`GET` /invoices/:company-name

* **URL Parameters**  
	
	`company-name=[string]`
 

* **Sample Response** `200`  
   `{
   		company: "Company LTD",  
   		total: 20000,
   		items: [
   			{
   				employee_id: 1,
				employee_name: "David",
				number_of_hours: 10,
				unit_price: 2000,
				cost: 20000
   			}
   		] 
   	}`


