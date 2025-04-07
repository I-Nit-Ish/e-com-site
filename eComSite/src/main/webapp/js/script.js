

//alert("testing");

function add_to_cart(pid, pname, price){
	
	let cart=localStorage.getItem("cart");
	if(cart==null){
		//no cart yet
		let products=[]; //use?
		let product={productId:pid, productName:pname, productQuantity:1, productPrice:price}
		products.push(product);
		//console.log(product)
		//console.log(products)
		localStorage.setItem("cart",JSON.stringify(products))
		//console.log(localStorage)
		console.log("product is added for the first time")
		showToast("Item is added to cart")
	}else{
		//cart is already present
	
		let pcart=JSON.parse(cart); // array?
		
		let oldProduct=pcart.find((item)=>item.productId==pid) //callback func?
		
		if(oldProduct){
			// inc quantity
			oldProduct.productQuantity=oldProduct.productQuantity+1
			pcart.map((item)=>{
				if(item.productId==oldProduct.productId){
					item.productQuantity=oldProduct.productQuantity;
				}
			})
			
			localStorage.setItem("cart",JSON.stringify(pcart))
			console.log("product quantity increased")
			showToast(oldProduct.productName+" quantity increased to "+oldProduct.productQuantity)
		}else{
			//add product
			let product={productId:pid, productName:pname, productQuantity:1, productPrice:price} //executing but pid, pname & price not changing
			pcart.push(product);
			//console.log(product)
			//console.log(pcart);
			//inseart first product added, add new product instead of adding replaced, product quantity showing 101 but not updaitng pid, 
			//if adding first product only then quantity inc like 1-2-3
			//pname & price, quantity inc only when trying to add same product   
			 //only one item added at time & only tht increases
			localStorage.setItem("cart",JSON.stringify(pcart));
			//console.log(localStorage)
			//instead of just checking local storage, check localstorage.cart
			console.log("product is added")
			showToast("product is added to cart")
		}
		
	}
	
	updateCart()
	
}

//update cart 

function updateCart(){
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null||cart.length==0){
		console.log("Cart is empty!!")
		//Jquery
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any items</h3>");
		$(".checkout-btn").addClass('disabled');
	}else{
		//there is some in cart to show
		console.log("hello")
		//$(".cart-body").html("<h3>Cart does have items! :)</h3>");
		$(".cart-items").html(`(${cart.length})`);
		//$(".checkout-btn").addClass('enabled');
		$(".checkout-btn").removeClass('disabled');
		//$(".checkout-btn").attr('disabled', false);
		console.log(cart)
		
		let table=`<table class='table'>
					<thead class='thead-light'>
						<tr> 
							<th>Item Name</th>
							<th>Price</th>
							<th></th>
							<th>Quantity</th>
							<th></th>
							<th>Total price</th>
							<th>action</th>
						</tr>
					</thead>
					`;
					let totalPrice=0;
					 cart.map((item)=>{
				 		table+=`<tr>
							<tr>
								<td>${item.productName}</td>
								<td>${item.productPrice}</td>
								<td onclick='decProductQuantity(${item.productId})'><button>-</button></td>
								<td>${item.productQuantity}</td>
								<td onclick='incProductQuantity(${item.productId})'><button>+</button></td>
								<td>${item.productQuantity*item.productPrice}</td>
								<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>remove</button> </td>
							</tr>`
							
							totalPrice+=item.productPrice*item.productQuantity;
				 	})
					table=table+`
						<tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price:${totalPrice} </td></tr>
					
					</table>`
					$(".cart-body").html(table);
					//$(".checkout-btn").removeClass('disabled');
	}
	
}
//updateCart()
$(document).ready(function(){
	updateCart()
})

function deleteItemFromCart(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
	showToast("item is removed from cart")
}

//make button to inc dec product quantity

function incProductQuantity(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let oldProduct=cart.find((item)=>item.productId==pid)
	oldProduct.productQuantity=oldProduct.productQuantity+1;
	  cart.map((item)=>{
					if(item.productId==oldProduct.productId){
						item.productQuantity=oldProduct.productQuantity;
					}
				})
				
				localStorage.setItem("cart",JSON.stringify(cart))
				console.log("product quantity increased")
				updateCart();
} 

function decProductQuantity(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let oldProduct=cart.find((item)=>item.productId==pid)
	
	if(oldProduct.productQuantity==1){
		//console.log("product qauntity"+oldProduct.productQuantity);
		deleteItemFromCart(pid);
		//updateCart();
	}else{
	oldProduct.productQuantity=oldProduct.productQuantity-1;
	  cart.map((item)=>{
					if(item.productId==oldProduct.productId){
						item.productQuantity=oldProduct.productQuantity;
					}
				})
				
				localStorage.setItem("cart",JSON.stringify(cart))
				console.log("product quantity decreased")
				updateCart();}
} 
//print quantity of a perticular pid in console
//onclick call add to cart func with same pid? for -?
//which + sign referring to which pid?
//if after clicking - multiple times it reaches to 0 then delete

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
	},2000);
}

//"showToast('Hello this is button text')"

function goToCheckout(){
	window.location="checkout.jsp"
}

