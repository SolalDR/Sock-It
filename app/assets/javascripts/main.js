


function getXhrObject(){
  // ### Construction de l’objet XMLHttpRequest selon le type de navigateur
  if(window.XMLHttpRequest){
    return new XMLHttpRequest();
  }	else if(window.ActiveXObject) {
    return new ActiveXObject("Microsoft.XMLHTTP");
  } else {
    // XMLHttpRequest non supporté par le navigateur
    console.log("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
    return;
  }
}

// Envoie la XHR
function callScript (scriptName, object, method="POST", args=null, isJsonEncode = true){
	var xhr_object = getXhrObject();
	xhr_object.open(method, scriptName, true);

	//  Définition du comportement à adopter sur le changement d’état de l’objet XMLHttpRequest
	xhr_object.onreadystatechange = function() {
	  if(this.readyState === 4 && this.status === 200) {
      var jsonContent = JSON.parse(xhr_object.responseText);
      productToCart.updateCart(jsonContent);
    }
		return xhr_object.readyState;
	}
	xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr_object.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
  if(isJsonEncode){
    xhr_object.send("json="+JSON.stringify(args));
  } else {
    var str = "";
    for(arg in args){
      str+=arg+"="+args[arg]+"&"
    }
    str = str.replace(/&$/, "&isXHR=1");
    // console.log(str);

    xhr_object.send(str);
  }
}



productToCart = {
  button : {},
  product : {},

  display:function(){
    if(productToCart.popin.className.match("hidden")){
      productToCart.popin.className = productToCart.popin.className.replace("hidden", "visible");
    } else if(!productToCart.popin.className.match("visible")) {
      productToCart.popin.className += " visible";
    }
  },

  hide:function(){
    if(productToCart.popin.className.match("visible")){
      productToCart.popin.className = productToCart.popin.className.replace("visible", "hidden");
    } else if(!productToCart.popin.className.match("hidden")) {
      productToCart.popin.className += " hidden";
    }
  },

  send:function(el){
    callScript(el.href, productToCart, "GET");
  },

  updateEl:function(el){
    productToCart.product.title.innerHTML = el.getAttribute("data-title");
    productToCart.product.img.src = el.getAttribute("data-url");
  },

  updateCart:function(json){
    productToCart.total.innerHTML = json.total.fractional/100;
    productToCart.amountArticle.innerHTML = json.items;
    productToCart.headerTotal.innerHTML = json.total.fractional/100;

    productToCart.display();
  },


  linkEventClick:function(el){
    console.log(el);
    el.addEventListener("click", function(e){
      e.preventDefault();
      productToCart.send(this);
      productToCart.updateEl(this);
      return false;
    }, false)
  },

  initEvents:function(){
    for(i=0; i<productToCart.els.length; i++){
      productToCart.linkEventClick(productToCart.els[i]);
      console.log(productToCart.els[i]);
    }
    productToCart.button.close.addEventListener("click", function(){
      productToCart.hide();
    }, false)
  },

  init:function(){
    productToCart.els = document.getElementsByClassName("add-product-to-cart");
    if(productToCart.els.length){
      productToCart.popin = document.getElementById("popinCart");
      productToCart.button.close = document.getElementById("close-popin");
      productToCart.amountArticle = document.getElementById("amount-popin-cart");
      productToCart.total = document.getElementById("total-popin-cart");
      productToCart.product.title = document.getElementById("product-popin-title");
      productToCart.product.img = document.getElementById("product-popin-img");
      productToCart.headerTotal = document.getElementById("header-total-count");
      productToCart.initEvents();
    }
  }
}


accountManage = {
  initEvents:function(){
    var self = this;
    this.button.addEventListener("click", function(){
      if(self.container.className.match("small")){
          self.container.className = self.container.className.replace("small", "big");
      } else {
        self.container.className = self.container.className.replace("big", "small");
      }
    }, false)
  },
  init:function(){
    this.button = document.getElementById("button-account");
    this.container = document.getElementById("account_nav");
    this.initEvents()
  }
}
accountManage.init();

window.addEventListener("load", function(){
  productToCart.init();
}, false)
