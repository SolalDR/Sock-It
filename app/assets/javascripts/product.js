switchPic = {
  pics: {
    main:document.getElementById("main-pic"),
    min:document.getElementsByClassName("min-pic")
  },
  initImageClick:function(el){
    el.addEventListener("click", function(){
      var currentUrlMain = switchPic.pics.main.src;
      var thatUrl = this.src;
      switchPic.pics.main.src = thatUrl;
      this.src = currentUrlMain;
    }, false)
  },
  initEvents:function(){
    for(i=0; i<switchPic.pics.min.length; i++) {
      switchPic.initImageClick(switchPic.pics.min[i]);
    }
  },
  init:function(){
    switchPic.pics.main = document.getElementById("main-pic");
    if(switchPic.pics.main && switchPic.pics.min) {
      switchPic.initEvents();
    }
  }
}

window.onload = function(){
  switchPic.init();

}

//les images
  //image principale
  //image miniature

//switchPic
  //On inverse les url
    //On stocke les url
    //On inverse


//Evenement de click
//Récupérer les images
