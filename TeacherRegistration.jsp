<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="evidyaUI">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Registration</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href='./css/style.css' rel="stylesheet" type="text/css"></link>
<link href='./css/css/font-awesome.css' rel="stylesheet" type="text/css"></link>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

<script data-require="angular.js@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular.js"></script>
  <script data-require="angular-animate@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular-animate.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/teacherController.js"></script>
</head>
<body>

<div ng-controller="teacherController" class="container-fluid" >
               <h2 class="page-title">Teacher Registration</h2>
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		 <ul class="nav nav-pills ">
   			 <li class="active"><a data-toggle="pill" href="#home">Basic info</a></li>
    		<li><a data-toggle="pill" href="#menu1">Subject</a></li>
   			 <li><a data-toggle="pill" href="#menu2">Availability</a></li>
  		</ul>
  
 	 <div class="tab-content">
    	<div id="home" class="tab-pane fade in active" >
    	<br>
     	<form  name="f1" ng-submit="Register(TeacherData)"  role="form" novalidate>
               <div class="row form-group">
					<label for="cFirstname" class="control-label col-md-2">First Name : </label>
                    <div class="col-md-3">
						<input class="form-control input-sm" type="text" ng-model="TeacherData.firstName" id="cFirstname" name="cFirstname" ng-class="Submitted?'ng-dirty':''" ng-required autofocus />
					</div>
				
					<label for="cLastname" class="control-label col-md-2">Last Name : </label>
					<div class="col-md-3">
                    	<input class="form-control input-sm" type="text" ng-model="TeacherData.lastName" id="cLastName" name="cLastName" ng-class="Submitted?'ng-dirty':''" ng-required autofocus />
					</div>
                </div>
                <div class="row form-group">
                	<label for="cEmail" class="control-label col-md-2">Email: </label>
					<div class="col-md-3">
						<input class="form-control input-sm" type="email" ng-model="TeacherData.email" id="cEmail" name="cEmail" ng-class="Submitted?'ng-dirty':''" ng-required autofocus />
                   <p ng-show="f1.cEmail.$invalid && !f1.cEmail.$pristine" class="help-block">Enter a valid email.</p>
                    </div>
                
					<label for="cPhone" class="control-label col-md-2">Phone : </label>
					<div class="col-md-3">
						<input class="form-control input-sm" type="text" ng-model="TeacherData.phone" id="cPhone" name="cPhone" ng-class="Submitted?'ng-dirty':''" ng-required autofocus />
					</div>
				</div>
                       
                       <div class="row form-group">
                            <label for="cLocation" class="control-label col-md-2">Location: </label>
                           <div class="col-md-3">
 
					      	<select class="form-control input-sm" id="cLocation" ng-model="TeacherData.State" ng-required>
						        <option>FL</option>
						        <option>GA</option>
						        <option>NC</option>
						      </select>
                              
                            </div>
                            </div>
                           <div class="row form-group">
 							<label class="col-md-2">School Type : </label>
                                <label class="checkbox-inline col-md-2"><input class="form-control input-sm" type="checkbox"  name="cSchoolType" ng-true-value="1" ng-false-value="0" value="Elem" ng-model="TeacherData.SchoolType.Elem">Elementary</label>
								<label class="checkbox-inline col-md-2"><input class="form-control input-sm" type="checkbox"  name="cSchoolType"  ng-true-value="1" ng-false-value="0" value="Secondary" ng-model="TeacherData.SchoolType.Secondary">Secondary</label>
								<label class="checkbox-inline col-md-2"><input class="form-control input-sm" type="checkbox"  name="cSchoolType"  ng-true-value="1" ng-false-value="0" value="High" ng-model="TeacherData.SchoolType.Highschool">HighSchool</label>
                            
                        </div>
                        
                         <div class="row form-group">
                            <label for="cPassword" class="control-label col-md-2">Password: </label>
                           	<div class="col-md-3">
 
                                <input class="form-control input-sm" type="password" ng-model="TeacherData.password" 
                                id="cPassword" name="cPassword" ng-class="Submitted?'ng-dirty':''" ng-required autofocus ng-minlength="8" ng-pattern="/(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z])/"/>
                               <span ng-show="f1.cPassword.$error.required && f1.cPassword.$dirty">required</span>
   <span ng-show="!f1.cPassword.$error.required && (f1.cPassword.$error.minlength) && f1.cPassword.$dirty">Passwords must be greater than 8 </span>
   <span ng-show="!f1.cPassword.$error.required && !f1.cPassword.$error.minlength && !f1.cPassword.$error.maxlength && f1.cPassword.$error.pattern && f1.cPassword.$dirty">Must contain one lower &amp; uppercase letter, and one non-alpha character (a number or a symbol.)</span>
                            </div>
 								<label for="cRePassword" class="control-label col-md-2">Reenter Password : </label>
                           
                            	<div class="col-md-3">
                               	 <input class="form-control input-sm" type="password" ng-model="TeacherData.repassword" id="cRePassword" name="cRePassword" ng-class="Submitted?'ng-dirty':''" ng-required autofocus />
                              <span ng-show="!f1.cRePassword.$error.required && f1.cRePassword.$error.noMatch && f1.cPassword.$dirty">Passwords do not match.</span>
                           		 </div>
                          
                        	</div>
                     <div class="row" form-group>   
                     <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-warning" ng-disabled="f1.$invalid || f1.cFirstname.$pristine || f1.cLastName.$pristine || f1.cEmail.$pristine || f1.cPhone.$pristine || f1.cLocation.$pristine || f1.cPassword.$pristine || f1..$pristine || f1..$pristine || f1..$pristine || f1.cRePassword.$pristine ">Next</button>
                     <button type="button" class="btn btn-warning" ng-click="TeacherRegStep1Save(TeacherData)" ng-disabled="f1.$invalid || f1.cFirstname.$pristine || f1.cLastName.$pristine || f1.cEmail.$pristine || f1.cPhone.$pristine || f1.cLocation.$pristine || f1.cPassword.$pristine || f1..$pristine || f1..$pristine || f1..$pristine || f1.cRePassword.$pristine ">Save &amp; Exit</button>
                     <button type="button" class="btn btn-warning" ng-click="TeacherRegStep1Skip()" ng-disabled="f1.$invalid || f1.cFirstname.$pristine || f1.cLastName.$pristine || f1.cEmail.$pristine || f1.cPhone.$pristine || f1.cLocation.$pristine || f1.cPassword.$pristine || f1..$pristine || f1..$pristine || f1..$pristine || f1.cRePassword.$pristine ">Skip</button>
    				</div>
    				</div>
                </form>
                <br>
                <form novalidate name="f2" ng-submit="Login()">
                 	
                    <table ng-show="!IsLogedIn">
                 	<tr>
                            <td>Already a registered User ? </td>
                            <td>
                                <input type="submit" value="Login" class="btn btn-success" />
                            </td>
                        </tr>
                        </table>
                        </form>
   		 </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Subjects</h3>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Availability</h3>
    </div>
 
  </div>
     </div>
     <div class="col-md-2">
     </div>           
	</div>

</body>
</html>