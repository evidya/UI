var taskManagerModule = angular.module('evidyaUI', ['ngAnimate']);

taskManagerModule.controller('teacherController', function ($scope,$http) {
	


	$scope.Register = function(TeacherData) {
		alert('in reg function');
//		alert($scope.TeacherData.firstName);
//		alert($scope.TeacherData.lastName);
//		alert($scope.TeacherData.email);
//		alert($scope.TeacherData.phone);
//		alert($scope.TeacherData.State);
//		alert($scope.TeacherData.SchoolType.Elem);
//		alert($scope.TeacherData.SchoolType.Secondary);
//		alert( $scope.TeacherData.SchoolType.Highschool);
//		alert( $scope.TeacherData.password);
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
            if (data.errors) {
              // Showing errors.
              $scope.errorName = data.errors.name;
              $scope.errorUserName = data.errors.username;
              $scope.errorEmail = data.errors.email;
            } else {
            	$scope.teacherID = data.data;
            	$scope.pill = 2;
            	angular.element('#pill2').trigger('click');
            }
          });
        };

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
//        function to handle Save & Exit click
        $scope.TeacherRegStep1Save = function(TeacherData) {
    		alert('in reg Step1 save function');
    		
    		
            };
////        Function to handle Skip click
//            
            $scope.TeacherRegStep1Skip = function() {
        		alert('in reg Step1 Skip function');
        		
        		
                };
});   
