var teacherModule = angular.module('evidyaUI', ['ngAnimate']);

//this service is used to pass data between pages by storing it in the sessionStorage
teacherModule.service('teacherDataService', function($window){
	var teacherID = 50050;
	
	var setID = function(newID){
		teacherID = newID;
		
		 $window.sessionStorage.setItem('teacherID', teacherID);
	};
	
	var getID = function(){
		
		return $window.sessionStorage.getItem('teacherID');;
	};
	
	return {
		setID: setID,
		getID: getID
    };
});

//This is the controller for teacher account creation page
teacherModule.controller('teacherAccountController', function ( $scope,$http, $window, teacherDataService) {
	
	//on init fetch states
	 $scope.init = function () {
     	
     	$scope.pill = 1;
     	$http({
             method  : 'GET',
             url     : 'http://localhost:8012/getStates',
           
             headers : {'Content-Type': 'application/json; charset=utf-8'} 
            })
             .then(function(data) {
               if (data.errors) {
                 // Showing errors.
                 $scope.errorName = data.errors.name;
                 $scope.errorUserName = data.errors.username;
                 $scope.errorEmail = data.errors.email;
               } else {
                 $scope.States = data.data;
               }
             });
     };

     //called for teacher account creation to the database.
     
	$scope.RegisterAccount = function(TeacherData) {
//		alert('in reg function');

		var dataToSend = 
        {
				"teacherFirstName" : $scope.TeacherData.firstName,
				"teacherLastName" : $scope.TeacherData.lastName,
				"teacherEmail" : $scope.TeacherData.email,
				"teacherPhone" : $scope.TeacherData.phone,
				"teacherLocation" : $scope.TeacherData.State,
				"teacherIsElementary" : $scope.TeacherData.SchoolType.Elem,
				"teacherIsMiddle" : $scope.TeacherData.SchoolType.Secondary,
				"teacherIsHigh" : $scope.TeacherData.SchoolType.Highschool,
				"teacherStatus" : 'Active',
				"teacherPassword" : $scope.TeacherData.password
            };
		
		
    	
		//validate the data and formulate post object as understood by Teacher service.
        $http({
          method  : 'POST',
          url     : 'http://localhost:8012/saveTeacherAccount',
          data    : dataToSend, 
          headers : {'Content-Type': 'application/json; charset=utf-8'} 
         })
          .success(function(data) {
        	  alert('success');
//            if (data.errors) {
//              // Showing errors.
//              $scope.errorName = data.errors.name;
//              $scope.errorUserName = data.errors.username;
//              $scope.errorEmail = data.errors.email;
//            } else {
            	$scope.$watch(teacherDataService.setID(data));
    			
            	$window.location.href = "http://" + $window.location.host + "/EVidyaUI/app/components/teacherRegistration/TeacherRegistration.html";
            //}
          });
        };

       
//        function to handle Save & Exit click
        $scope.TeacherRegStep1Save = function(TeacherData) {
    		alert('in reg Step1 save function');
            };
////        Function to handle Skip click
           
            $scope.TeacherRegStep1Skip = function() {
        		alert('in reg Step1 Skip function');
                };
});   



//this is the controller for Teacher REgistration page (Tabbed page)
teacherModule.controller('teacherRegController', function ( $scope,$http, $window, teacherDataService) {
		
	//on init fetch grades and master subjects
		$scope.init = function () {
     	
     	$scope.pill = 1;
     	$scope.teacherID = teacherDataService.getID();
     	$scope.selected = {
     			grades : []
     	};
     	//get the grades list for this ID
     	var callPrmise = $http({
            method  : 'GET',
            url     : 'http://localhost:8012/getGrades?teacherID=' +  teacherDataService.getID(),
          
            headers : {'Content-Type': 'application/json; charset=utf-8'} 
           });
     	
     	callPrmise.then(function(data) {
              if (data.errors) {
                // Showing errors.
                $scope.errorName = data.errors.name;
                $scope.errorUserName = data.errors.username;
                $scope.errorEmail = data.errors.email;
              } else {
                $scope.grades = data.data;
                alert(data.data)
              }
            });
     	
     	//get the master subjects TBD
     	
     };
     
     $scope.SaveSubjects = function(grades) {
// 		alert('in save subjects function , grades ' + $scope.selected.grades);
 		for (grade in $scope.selected.grades)
 			{
 				if(grade.checked)
 					{
 					alert(grade);
 					}
 			}
 		
         };
		});


