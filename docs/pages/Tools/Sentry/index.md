---
title: 'Sentry'
order: 3
---

# Sentry

# Table of Contents
1. [Scoping my component](#scoping)
2. [Where can I find my errors ?](#findErrors)
3. [What can I do with Sentry ?](#whatToDo)
4. [The Context in Sentry](#context)
5. [Ajax Error Report](#ajax)
6. [Form Error Report](#form)
7. [What's more ?](#next)

---

# How to use Sentry ?

## Scoping my component
<a name="scoping"></a>

Sentry is brought and initialised by lmfr-site. You don't need to install anything. If lmfr-site is called in your page, then Sentry will watch it.   
But, if you want to filter the errors with your component name, you have to scope it with this few code lines to put in your component's JS script :  

```javascript
lm.sentry.configureScope(function(scope) {
  scope.setTag("kobi.composant", "myComponentName");
});
```
---

## Where can I find my errors ?
<a name="findErrors"></a>

Sentry's errors are captured and put in the LM-CDP project, that can be find in the [application Sentry](https://sentry.io/organizations/adeo-0b).  
If you have scoped your component, you can now filter errors with the tag value of your kobi.composant.

---

## What can I do with Sentry ?  
<a name="whatToDo"></a>

### Catch a specific exception
The object Sentry is set as a global variable, so you can call it in your code.  
If you want to catch a specific error and send it to Sentry, you can use this method :

```javascript
lm.sentry.captureException(myException);
```

### Using a try/catch
With the method above, you can send a specific error to Sentry. So, this method can be used with a try/catch :  

```javascript
try {
  // my function
} catch (err) {
  lm.sentry.captureException(err);
}
```  

### Sending a message
Sometimes you just want to send a message to Sentry, like some specific issue for exemple. So, you can just use this method :

```javascript
lm.sentry.captureMessage('Something went wrong');
``` 

### Leveling my event
If you think that some of your components are not fondamentals, you can set different levels of error with this line of code :

```javascript
Sentry.configureScope(function(scope) {
  scope.setLevel('warning');
});
``` 
  
There are five levels of severity (from the least severe to the most severe) :
* debug
* info
* warning
* error
* fatal

---

## The context in Sentry
<a name="context"></a>

It is possible to add more informations with the event in order to better understand what caused the error. When configuring your Sentry, remember to contextualize as much information as possible to best describe the error.

For exemple, if the user is logged to his account, you can add this informations to your events like this :

```javascript
const userMail = myModule.user.mail;
const userName = myModule.user.userName;
const userNumber = myModule.user.numberId;

Sentry.configureScope(function(scope) {
  scope.setUser({"email": userMail, "username": userName, "id": userNumber});
});
```  
  
You can add more informations about your event in Sentry, like the store name for example. In order to add extra information that will be displayed in Sentry report, you can use this method :

```javascript
const storeName = myModule.store.name;

Sentry.configureScope(function(scope) {
  scope.setExtra({"Store name", storeName});
});
```
Remember that Sentry is working with a system of key/value. When you are setting a tag or a context, you always have to indicate the key in first place then you can add your value for this key.

---

## Ajax Error Report
<a name="ajax"></a>

 If you're using Ajax Request in your component, there is a simple way to survey if your call is doing well.
 To do so, you can just use the ```lm.sentry.captureException``` method in your error callback like this :

```javascript
lm.fetch({
  url: submitUrl,
  method: 'POST',
  headers: {
    'Accept': 'application/json, text/plain, */*'
  },
  credentials: "same-origin",
  body: formData,
  success: data => {
    // my success function
  },
  error: data => {
    lm.sentry.captureException(data);
  }
});
```

---

## Form Error Report
<a name="form"></a>

Context in Sentry is a really useful functionality because it allows you to add a lot of information with your error report.
When you're using forms in your page don't forget to get the informations about it and to add it in the context with the method ```setExtra()```.

For example, you can parse your form informations in JSON object and add it to your Sentry report like this :

```javascript
const myFormInfos = {name: "John", age: 31, city: "New York"};
const myJSON = JSON.stringify(myObj);

lm.sentry.configureScope(function(scope) {
  scope.setTag("kobi.composant", "myComponent");
  scope.setExtra("myForm", myJSON);
});
```

With this configuration, you can see your JSON object in your Sentry report in the "Additional Data" part.

---

## What's more ?
<a name="next"></a>
If you want, you can check this two Sentry's documentations if you want to go deeper with it :  
* https://docs.sentry.io/
* https://develop.sentry.dev/