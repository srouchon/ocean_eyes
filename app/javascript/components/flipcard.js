const flipcard = () => {
  $(".flip-card").click(function() {
    console.log(flipcard);
    $(".flip-card").toggleClass("flip-rotate");
  });
};

export{flipcard};
