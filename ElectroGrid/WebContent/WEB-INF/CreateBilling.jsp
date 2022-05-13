<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create billing</title>
<style>
	.form-group{
		margin-top:8px
	}
	form{
		margin-top:16px
	}
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class = "container" >
	<h1>Create a new bill</h1>
	<form id = "form" >
		<div class = "form-group" >
			<label  >Customer</label>
			<input id = "customer" class = "form-control" type = "text" required />
		</div>
		<div class = "form-group" >
			<label  >Units</label>
			<input id = "units" class = "form-control" type = "number" required />
		</div>
		<div class = "form-group" >
			<label  >Amount</label>
			<input id = "amount" class = "form-control" type = "number" required />
		</div>
		<button class="btn btn-primary" type="submit" style ="margin-top:8px" >Create bill</button>
	</form>
	</div>
	<script>
	$(document).ready(function(){
		$("#form").on("submit",function(e){
			e.preventDefault();
			var customerName = $("#customer").val();
			var units = $("#units").val();
			var amount = $("#amount").val();
			
			var data = {customerName,units,amount};
			
			$.ajax({
				url: '/ElectroGrid/BillingService/Billings',
				method: "POST",
				data,
				success: function(data){
					console.log(data);
				},
				error: function(error){
					console.log(error)
				}
			});
			console.log(data);
			alert("submitted");
		});
	});
	</script>
</body>
</html>