smart-speech-therapist-for-stammer: Application Using JSP,Java,HTML5,Javascript, Mobile & JAX-RS Technologies 
=========================================================================================================
Author: Yasas De Silva

This supports various RESTFul end points which also includes JSONP support for cross domain requests.

MemberService End Points
------------------------


* Request type: GET
* Return type: JSON
* Response example:

```javascript
[{"id":1,"name":"Yasas De Silva","email":"myasas@gmail.com","phoneNumber":"0713399773"},{"id":0,"name":"Yasas De Silva","email":"myasas@gmail.com","phoneNumber":"0713399773"}]
```



* Request type: POST
* Request type: JSON
* Return type: JSON
* Request example:

```JavaScript
[{"name":"Jane Smith","email":"jane.smith@mailinator.com","phoneNumber":"4160000000"}]

* Response example:
 * Success: 200 OK
 * Validation error: Collection of `<field name>:<error msg>` for each error

```JavaScript
{"phoneNumber":"10-12 Numbers","email":"Invalid format"}
```

* Request type: GET
* Return type: JSON
* Response example:

```javascript
{"id":0,"name":"John Smith","email":"john.smith@mailinator.com","phoneNumber":"2125551212"}
```
