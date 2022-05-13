<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billings</title>
<style>
	.form-group{
		margin-top:8px
	}
	form{
		margin-top:16px
	}
</style>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class = "container" >
	<div style="display: flex;flex-direction:row;justify-content: space-between;align-items:center" >
	<h1>Billings</h1>
	<button class = "btn btn-primary" >+ Create bill</button>
	</div>
	<table id = "table" class = "table" ></table>
	</div>
	<script>
	$(document).ready(function(){	
		
		function fetchBillings(){			
			$.ajax({
				url: '/ElectroGrid/BillingService/Billings',
				method: "GET",
				success: function(data){
					$("#table").html(data);
					$(".delete").on('click',function(){
						
						var deleteId = $(this).attr("deleteId");
						$.ajax({
							url: '/ElectroGrid/BillingService/Billings',
							method: "DELETE",
							data:JSON.stringify({ id: deleteId }),
						    contentType: "application/json",
						    dataType: "text",
							success: function(res){
								alert(res);
								fetchBillings();
							},
							error: function(error){
								console.error(error);
							},
						});
					});
					$(".update").on('click',function(){
						
						var id = $(this).attr("billingId");
						var customerName = $(this).attr("customerName");
						var units = $(this).attr("units");
						var amount = $(this).attr("amount");

						window.location.href = "/ElectroGrid/UpdateBilling?id="+id+"&customerName="+customerName+"&units="+units+"&amount="+amount;
						
					});
				},
				error: function(error){
					console.log(error)
				}
			});
		}
		
		fetchBillings();

		
	});
	</script>
</body>
</html>